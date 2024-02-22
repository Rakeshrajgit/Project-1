package com.main.service;

import java.util.UUID;


public class LeadIdGenerator {
	
	
//	  public static String generateLeadId() {
//	        // Use UUID to generate a unique ID
//	        String uuid = UUID.randomUUID().toString();
//	        
//	        // Extract the last 9 characters from the UUID
//	        String leadIdSuffix = uuid.substring(uuid.length() - 9);
//	        
//	        // Ensure the lead ID starts with "LE" and ends with "01"
//	        String leadId = "LE" + leadIdSuffix + "01";
//	        
//	        return leadId;
//	    }
	  
	  
	 public static String generateLeadId() {
	        // Use UUID to generate a unique ID
	        String uuid = UUID.randomUUID().toString();
	        
	        // Extract the last 3 characters from the UUID
	        String leadIdSuffix = uuid.substring(uuid.length() - 3);
	        
	        // Ensure the lead ID has a length of 5, including the prefix "LE"
	        String leadId = "LE" + leadIdSuffix;
	        
	        return leadId;
	    }
	 
	 
	 
//	 private String generateUserId(){
//	        String userIdPrefix="LE";
//	       
//	        long userNo= LeadRepo.(userIdPrefix+"%");
//	        String userId=userIdPrefix+"-"+(userNo+1);
//	        return userId;
//	    }

}
