package com.rs.service;

import com.rs.dto.DistributorDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.HashMap;
import java.util.Map;

@Service
public class DistributorService {
    @Autowired
    private RestTemplate restTemplate;

    @Value("${distributor.host}")
    private String distributorHost;
    @Value("${distributor.port}")
    private String distributorPort;

    public DistributorDto getDistributor(String distributorCode) {
        DistributorDto dto = null;

        String endPointUri = "http://" + distributorHost + ":" + distributorPort + "/distributor/{distributorCode}";
        Map<String, Object> uriVariables = new HashMap<>();
        uriVariables.put("distributorCode", distributorCode);

        String url = UriComponentsBuilder.fromUriString(endPointUri).uriVariables(uriVariables).build().toString();
        dto = restTemplate.getForEntity(url, DistributorDto.class).getBody();

        return dto;
    }

}
