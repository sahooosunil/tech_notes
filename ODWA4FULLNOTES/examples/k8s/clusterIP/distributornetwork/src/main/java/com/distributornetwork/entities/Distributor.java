package com.distributornetwork.entities;

import lombok.Data;

@Data
public class Distributor {
    private int distributorUniqueNo;
    private String distributorCode;
    private String distributorBusinessName;
    private String ownerName;
    private String contactNo;
    private String emailAddress;

}
