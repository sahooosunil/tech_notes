package com.distributornetwork.repositories;

import com.distributornetwork.entities.Distributor;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Component
public class DistributorRepository {
    public List<Distributor> findByDistributorCode(String distributorCode) {
        Distributor distributor = new Distributor();
        distributor.setDistributorCode(distributorCode);
        distributor.setDistributorUniqueNo(93);
        distributor.setDistributorBusinessName("TSeries enterprise");
        distributor.setOwnerName("Ane");
        distributor.setContactNo("9389389334");
        distributor.setEmailAddress("ane@gmail.com");

        return Arrays.asList(distributor);
    }
}
