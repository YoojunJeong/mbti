package net.genieworks.api.control;

import com.google.gson.Gson;
import net.genieworks.api.service.DemoService;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
public class DemoControl {

	@Autowired
	private DemoService demoService;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/demo/{demo_id}", method=RequestMethod.GET)
	public Object demo(   HttpServletRequest        request
                        , @PathVariable String      demo_id
                        , @RequestBody(required = false)  JSONObject  body    ) throws Exception {

		String ipAddress = request.getHeader("X-FORWARDED-FOR");

		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
        }

        logger.info("#==============================================");
        logger.info("# API URL : /{version}/demo/{demo_id} - POST");
        logger.debug("## Connected IP : " + ipAddress );
        logger.info("## API PathVariable Value");
        logger.info("=== work_id : " + demo_id);
        logger.info("## API RequestBody");
//        logger.info("=== " + body.toString());

        JSONObject t = demoService.demoService();

        Gson gson = new Gson();
        return gson.toJson(t);

	}

	
}//end of class
