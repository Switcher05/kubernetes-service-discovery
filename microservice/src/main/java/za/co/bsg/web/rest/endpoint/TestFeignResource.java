package za.co.bsg.web.rest.endpoint;

import com.codahale.metrics.annotation.Timed;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import za.co.bsg.feign.uaa.UserService;

/**
 * REST controller for Testing Feign Call in Microservice Architecture
 */

@RestController
@RequestMapping("/api")
public class TestFeignResource {

    private final Logger log = LoggerFactory.getLogger(TestFeignResource.class);

    private final UserService userService;

    public TestFeignResource(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(path = "/test")
    @Timed
    public ResponseEntity<String> test() {
        log.debug("START & END :: test");
        return ResponseEntity.ok(userService.getLoggedInUserByUsername("admin").toString());
    }
}
