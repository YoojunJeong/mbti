package net.genieworks.api.config;

import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.genieworks.api.Const;
import net.genieworks.util.MessageUtil;
import net.genieworks.util.S3FileUploadUtil;
import org.apache.http.impl.client.HttpClientBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.http.client.BufferingClientHttpRequestFactory;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.http.converter.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.converter.support.AllEncompassingFormHttpMessageConverter;
import org.springframework.http.converter.xml.Jaxb2RootElementHttpMessageConverter;
import org.springframework.http.converter.xml.SourceHttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.servlet.Filter;
import javax.xml.transform.Source;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

//@EnableWebMvc
@Configuration
public class WebMvcConfiguration {
	
    private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private Environment env;
	
	@Bean
    public ObjectMapper objectMapper() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(Const.DATE_FORMAT);
        
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.setDateFormat(simpleDateFormat);
        
        //@JsonIgnore를 제외함
        objectMapper.disable(MapperFeature.USE_GETTERS_AS_SETTERS);
        
        return objectMapper;
    }
	
	
	@Bean
    public WebMvcConfigurer corsConfigurer() {

	    return new WebMvcConfigurerAdapter() {
            
            private Logger logger = LoggerFactory.getLogger(getClass());
            
// TODO scyun             
// 빈 배열 혹은 빈 객체의 경우 전달하고 싶지 않은데 잘 동작하지 않는다.
// 찾아보고 싶으나 이거에 너무 시간을 들일 수 없어 일단 넘어가고..
// 나중에 찾아보자 
//            @Override
//            public void extendMessageConverters(List<HttpMessageConverter<?>> converters) 
//            {
//                for(HttpMessageConverter<?> converter: converters) {
//                    if(converter instanceof MappingJackson2HttpMessageConverter) {
//                        ObjectMapper mapper = ((MappingJackson2HttpMessageConverter)converter).getObjectMapper();
//                        mapper.setSerializationInclusion(Include.NON_EMPTY);
//                    }
//                }
//            } 

            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins(Const.ASTERISK)
                        .allowedMethods(Const.ASTERISK)
                        .allowedHeaders(Const.ASTERISK)
                        .maxAge(3600) ;
            }
        };
    }

    @Bean
    public HttpMessageConverter<String> responseBodyConverter() {
        return new StringHttpMessageConverter(Charset.forName("UTF-8"));
    }
	
 //월주차, 제휴사, 핫스팟, 주차장, 모니터링, 기타, 지역 발렛파킹, 호텔발렛쿠폰 관리
    @Bean
    public Filter characterEncodingFilter() {
        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        return characterEncodingFilter;
    }
   
    @Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("classpath:messages/messages-properties");		
		messageSource.setDefaultEncoding("UTF-8");
		return messageSource;
	}	
    
    @Bean("messageSourceAccessor")
    public MessageSourceAccessor messageSourceAccessor() 
    {
        return new MessageSourceAccessor(messageSource());
    }
    
    @Bean("messageUtil")
    public MessageUtil messageUtil() {
        return new MessageUtil(messageSourceAccessor());
    }
    
    @Bean("s3UploadUtil")
    public S3FileUploadUtil s3UploadUtil() {
        String accessKey = env.getProperty("aws.s3.accessKey");
        String secretKey = env.getProperty("aws.s3.secretKey");
        String s3StaticDomain = env.getProperty("aws.s3.domain");
        return new S3FileUploadUtil(accessKey, secretKey, s3StaticDomain);
    }

    @Bean(name="bufferingClientHttpRequestFactory")
    public ClientHttpRequestFactory bufferingClientHttpRequestFactory() {

        HttpClientBuilder builder = HttpClientBuilder.create();

        HttpComponentsClientHttpRequestFactory requestFactory = new HttpComponentsClientHttpRequestFactory(builder.build());
        requestFactory.setConnectTimeout(10000);
        requestFactory.setReadTimeout(10000);
        BufferingClientHttpRequestFactory bufferingClientHttpRequestFactory = new BufferingClientHttpRequestFactory(requestFactory);

        return  bufferingClientHttpRequestFactory;
    }

    
    @Bean
    public RestTemplate restTemplate() {
        
    		// 하단에 정의된 메세지 컨버터들은 스프링부트에 기본적으로 생성되는 컨버터들을 사용하지 않는다.
    		// RestTemplate 에서 사용하는 컨버터에서만 사용되는 추가 설정이 Bixby Client와의 데이터 교환에 영향을 주지  
    		// 않게 하기 위해 RestTemplate 에서 사용하는 설정은 완전히 분리한다. 
        MediaType mediaType = MediaType.parseMediaType("text/html;charset=utf-8");
		HttpMessageConverter<?> byteArrayHttpMessageConverter 			= new ByteArrayHttpMessageConverter();
		HttpMessageConverter<?> formHttpMessageConverter 					= new FormHttpMessageConverter();
		HttpMessageConverter<?> resourceHttpMessageConverter 				= new ResourceHttpMessageConverter();
		HttpMessageConverter<?> sourceHttpMessageConverter 				= new SourceHttpMessageConverter<Source>();
		HttpMessageConverter<?> allEncompassingFormHttpMessageConverter 	= new AllEncompassingFormHttpMessageConverter();

		
		// 신비운에서 XML, JSON 로 데이터 전달해줄 때 응답 컨텐트 타입이 text/html 로 내려옴
		// 마샬링, 언마샬링 시 text/html 컨텐츠로 처리할 수 있도록 하기 위해 supportMediaType 추가.
		HttpMessageConverter<?> jaxb2RootElementMessageConverter 			= new Jaxb2RootElementHttpMessageConverter();
		List<MediaType> jaxbSupportMediaTypes = new ArrayList<>();
		jaxbSupportMediaTypes.addAll(jaxb2RootElementMessageConverter.getSupportedMediaTypes());
		jaxbSupportMediaTypes.add(mediaType);
		((AbstractHttpMessageConverter<?>)jaxb2RootElementMessageConverter).setSupportedMediaTypes(jaxbSupportMediaTypes);

		HttpMessageConverter<?> mappingJackson2HttpMessageConverter 		= new MappingJackson2HttpMessageConverter();
		List<MediaType> jacksonSupportMediaTypes = new ArrayList<>();
		jacksonSupportMediaTypes.addAll(mappingJackson2HttpMessageConverter.getSupportedMediaTypes());
		jacksonSupportMediaTypes.add(mediaType);
		jacksonSupportMediaTypes.add(MediaType.APPLICATION_JSON_UTF8);
		((AbstractHttpMessageConverter<?>)mappingJackson2HttpMessageConverter).setSupportedMediaTypes(jacksonSupportMediaTypes);
        
		// RestTemplate 에서 사용할 메세지 컨버터들을 List 에 담는다.
        List<HttpMessageConverter<?>> converters = new ArrayList<>();
		converters.add(byteArrayHttpMessageConverter);			
		converters.add(formHttpMessageConverter);	 					
		converters.add(responseBodyConverter());	 					
		converters.add(resourceHttpMessageConverter);	 				
		converters.add(sourceHttpMessageConverter);	 					
		converters.add(allEncompassingFormHttpMessageConverter);	 
		converters.add(jaxb2RootElementMessageConverter);	 			
		converters.add(mappingJackson2HttpMessageConverter);	 		
		
        // RestTemplate 인스턴스를 생성한다. 
        RestTemplate restTemplate = new RestTemplate(bufferingClientHttpRequestFactory());
        
        // 기본으로 설정되는 메세지컨버터들을 다 지우고 
        restTemplate.getMessageConverters().clear();
        // 위에서 생성한 메세지 컨버터들을 추가한다.
        restTemplate.getMessageConverters().addAll(converters);
        
//		// RestTemplate 로 데이터 교환시 발생하는 Request, Response 등의 로깅을 담당할
//		// Interceptor 를 추가한다..
//        List<ClientHttpRequestInterceptor> interceptors = new ArrayList<ClientHttpRequestInterceptor>();
//        interceptors.add(new HttpLoggingRequestInterceptor());
//        restTemplate.setInterceptors(interceptors);

        return restTemplate;
    
    }

}//end of class
