package net.genieworks.util;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * S3 파일업로드 유틸리티.
 * 참조 URL :  http://docs.aws.amazon.com/ko_kr/AmazonS3/latest/dev/ObjectOperations.html
 * TODO scyun
 * com.amazonaws.services.s3.model.AmazonS3Exception: The request signature we calculated does not match the signature you provided.
 * S3 업로드시 파일명 중복을 방지하기 위해 UUID 로 파일명 생성 후 metadata 를 변경하여 실제 다운로드시에는 원본 파일명으로 전달하려고 하였으나
 * "The request signature we calculated does not match the signature you provided." 에러가 발생하여 해당코드 주석처리함
 * @author yunhuihan
 *
 */
public class S3FileUploadUtil {

    // 동일한 Key 로 S3에 Object 가 존재할 경우 발생하는 IOException
    public static class ExistS3ObjectException extends IOException { }
    
    private Logger logger = LoggerFactory.getLogger(getClass());

    private String accessKey;
    private String secretKey;
    private String domain;
    private BasicAWSCredentials awsCredentials;
    private AWSStaticCredentialsProvider awsStaticCredentialsProvider;

    public S3FileUploadUtil( String accessKey, String secretKey, String domain) {
        this.accessKey = accessKey;
        this.secretKey = secretKey;
        this.domain    = domain;
        this.awsCredentials = new BasicAWSCredentials(accessKey , secretKey) ;
        this.awsStaticCredentialsProvider = new AWSStaticCredentialsProvider(awsCredentials);
    }

    /**
     *
     * @param file        업로드할 파일객체
     * @param bucketName  버킷명
     * @param relPath     upload Path
     * @param isOverwrite 덮어쓰기 (true일 경우 덮어씀.)
     * @return
     * @throws ExistS3ObjectException
     *          isOverwrite 가 false 인데 저장경로에 이미 객체가 존재할 경우 발생
     */
    public JSONObject upload(File file, String bucketName, String relPath, String fileName,  boolean isOverwrite) throws ExistS3ObjectException {
        logger.debug("#-- uploadSrcPath => {}, bucketName => {}, targetPath => {}, isOverwrite => {}"
                    , file.getAbsolutePath(), bucketName, relPath, isOverwrite);

        // 덮어쓰지 않을 때에만 S3에 해당 키 존재하는지 확인하기 위해 if 를 두개로 분리. 
        if ( !isOverwrite ) {
            AmazonS3Client s3Client = new AmazonS3Client(awsStaticCredentialsProvider);
            boolean isExistObject = s3Client.doesObjectExist(bucketName, relPath);

            if ( isExistObject ) {
                throw new ExistS3ObjectException();
            }
        }
        
        return doUpload(file, bucketName, relPath);
    }

    /**
     *
     * @param is
     * @param bucketName  버킷명
     * @param relPath     upload Path
     * @param isOverwrite 덮어쓰기 (true일 경우 덮어씀.)
     * @return
     * @throws ExistS3ObjectException
     *          isOverwrite 가 false 인데 저장경로에 이미 객체가 존재할 경우 발생
     */
    public JSONObject upload(InputStream is , String bucketName, String relPath, String fileName, boolean isOverwrite) throws ExistS3ObjectException {
        logger.debug("bucketName => {}, targetPath => {}, isOverwrite => {}"
                    , bucketName, relPath, isOverwrite);
        if ( !isOverwrite ) {
            AmazonS3Client s3Client = new AmazonS3Client(awsStaticCredentialsProvider);
            boolean isExistObject = s3Client.doesObjectExist(bucketName, relPath);

            if ( isExistObject ) {
                throw new ExistS3ObjectException();
            }
        }

        return doUpload(is, bucketName, relPath, fileName);
    }

    private JSONObject doUpload(File file, String bucketName, String relPath) {

        ObjectMetadata om = new ObjectMetadata() ;
        //om.setHeader("Content-disposition", "attachment; filename="+ RequestUtil.changeFileNameForDownload(file.getName()));

        PutObjectRequest por = new PutObjectRequest(bucketName, relPath, file);
        por.setMetadata(om);

        AmazonS3Client s3Client = new AmazonS3Client(awsStaticCredentialsProvider);
        s3Client.putObject(por);
        String uploadedResourceUrl = "//" + this.domain + "/" + relPath;

        JSONObject result = new JSONObject();
        result.put("path", uploadedResourceUrl);
        return result;
    }
    
    private JSONObject doUpload(InputStream is, String bucketName, String relPath, String fileName) {

        ObjectMetadata om = new ObjectMetadata() ;

        PutObjectRequest por = new PutObjectRequest(bucketName, relPath, is, om);

        AmazonS3Client s3Client = new AmazonS3Client(awsStaticCredentialsProvider);
        s3Client.putObject(por);
        String uploadedResourceUrl = "//" + this.domain + "/" + relPath;
        JSONObject result = new JSONObject();
        result.put("path", uploadedResourceUrl);
        return result;
    }
    
}
