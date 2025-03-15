package com.rs.api;

import com.rs.dto.DistributorDto;
import com.rs.service.DistributorService;
import lombok.AllArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/store")
@AllArgsConstructor
public class RetailStoreApiController {
    private final DistributorService distributorService;

    @GetMapping(value = "/{distributorCode}/distributor", produces = {MediaType.APPLICATION_JSON_VALUE})
    public DistributorDto getDistributor(@PathVariable("distributorCode") String distributorCode) {
        return distributorService.getDistributor(distributorCode);
    }
}
