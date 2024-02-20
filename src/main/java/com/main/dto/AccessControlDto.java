package com.main.dto;

import lombok.AllArgsConstructor;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class AccessControlDto {
    private Long FormDetailId;
    private Long FormModuleId;
    private String FormModuleName;
    private String ModuleUrl;
    private String FormName;
    private String FormUrl;
}
