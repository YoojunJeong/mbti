package net.genieworks.api.control;

import net.genieworks.api.service.DemoService;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@RestController
public class DemoControl {

    @Qualifier("demoService")
	@Autowired
	private DemoService demoService;
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/demo/{demo_id}", method=RequestMethod.POST)
	public Object adid(@RequestHeader Map<String, String> header
            , @PathVariable String demo_id
            , @RequestBody JSONObject body, HttpServletResponse response, HttpServletRequest request) throws Exception {

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
        logger.info("=== " + body.toString());
        JSONObject t = demoService.demoService();

        return t;

	}

	
}//end of class
