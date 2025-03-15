package com.hinckley.sailor.api;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthCheckApiController {

	@GetMapping(value = "/readiness.htm", produces = { MediaType.TEXT_PLAIN_VALUE })
	@ResponseBody
	public ResponseEntity<String> readinessCheck() {
		return ResponseEntity.ok("Up");
	}

	@GetMapping(value = "/liveness.htm", produces = { MediaType.TEXT_PLAIN_VALUE })
	@ResponseBody
	public ResponseEntity<String> livenessCheck() {
		return ResponseEntity.ok("Up");
	}

}
