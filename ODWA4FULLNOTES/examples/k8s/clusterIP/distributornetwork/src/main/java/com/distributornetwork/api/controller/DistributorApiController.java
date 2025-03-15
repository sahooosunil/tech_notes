package com.distributornetwork.api.controller;

import com.distributornetwork.dto.Distributor;
import com.distributornetwork.exception.NotFoundException;
import com.distributornetwork.service.DistributorService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.MediaType;
import org.springframework.http.ProblemDetail;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/distributor")
@Slf4j
public class DistributorApiController {
    private final DistributorService distributorService;


    @GetMapping(value = "/{distributorCode}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public Distributor getDistributor(@PathVariable("distributorCode") String distributorCode, HttpServletRequest httpServletRequest) {
        httpServletRequest.getHeaderNames().asIterator().forEachRemaining(hn -> {
            System.out.println(hn + ":" + httpServletRequest.getHeader(hn));
        });
        log.info("recieved request for fetching distributor of code:{}", distributorCode);
        return distributorService.findDistributorByDistributorCode(distributorCode);
    }


    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity<String> handleNotFoundException(NotFoundException e) {
        return ResponseEntity.of(ProblemDetail.forStatusAndDetail(HttpStatusCode.valueOf(404), "distributor not found")).build();
    }
}
