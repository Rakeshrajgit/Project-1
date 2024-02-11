package com.main.configs.security;

import com.main.utils.MyDateTimeUtils;
import org.springframework.stereotype.Service;
import java.text.SimpleDateFormat;

@Service
public class CrmService {

    SimpleDateFormat rdf= MyDateTimeUtils.getRegularDateFormat();
    SimpleDateFormat sdf= MyDateTimeUtils.getSqlDateFormat();
    SimpleDateFormat sdtf= MyDateTimeUtils.getSqlDateAndTimeFormat();
}
