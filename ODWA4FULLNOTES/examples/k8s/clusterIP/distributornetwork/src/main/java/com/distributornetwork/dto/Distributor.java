package com.distributornetwork.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder(builderMethodName = "of")
public class Distributor {
    private String distributorCode;
    private String businessName;
    private String proprietorName;
    private String contactNo;
    private String emailAddress;
}
