package com.main.configs.security;

import com.main.dto.AccessControlDto;
import com.main.model.CrmUser;
import com.main.model.LoginStamping;
import com.main.service.AccessControlService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.net.InetAddress;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class LoginController {

    private static final Logger logger = LogManager.getLogger(LoginController.class);

    @Autowired
    private CrmService crmService;

    @Autowired
    private AccessControlService accessControlService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, @RequestParam(value = "error", required = false) String error,
                        @RequestParam(value = "logout", required = false) String logout,
                        @RequestParam(value = "session", required = false) String session,
                        HttpServletRequest req, HttpSession ses, HttpServletResponse response) {
        logger.info(new Date() + " Inside login ");

        if (error != null && error.equalsIgnoreCase("1")) {
            model.addAttribute("error", "Your username or password is invalid.");
        }

        if (logout != null && logout.equalsIgnoreCase("1")) {
            model.addAttribute("message", "You have been logged out successfully.");
        }

        if (logout != null && logout.equalsIgnoreCase("1")) {
            model.addAttribute("message", "You have been logged out successfully.");
        }

        String success = req.getParameter("success");
        if (success == null) {
            Map md = model.asMap();
            success = (String) md.get("success");
        }
        if (success != null) {
            model.addAttribute("success", success);
        }
        return "static/login";
    }


    @RequestMapping(value = {"/sessionExpired", "/invalidSession"}, method = RequestMethod.GET)
    public String sessionExpired(Model model, HttpServletRequest req, HttpSession ses) {
        logger.info(new Date() + "Inside sessionExpired ");
        return "SessionExp";
    }

    @RequestMapping(value = {"/accessdenied"}, method = RequestMethod.GET)
    public String accessdenied(Model model, HttpServletRequest req, HttpSession ses) {

        return "accessdenied";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model, HttpServletRequest req, HttpSession ses) throws Exception {
        logger.info(new Date() + " Login By " + req.getUserPrincipal().getName());
        try {
            CrmUser login = crmService.findUserByEmail(req.getUserPrincipal().getName());
            ses.setAttribute("UserType", login.getRole());
            ses.setAttribute("userId",login.getUserId());
            ses.setAttribute("user",login);
            List<AccessControlDto> accessControlDto = accessControlService.getAccessControlDto(login.getRole());
            ses.setAttribute("UrlList", accessControlDto );
            ses.setAttribute("ModulesList", accessControlService.getModulesForUserType(accessControlDto));
            String IpAddress="Not Available";
            try{
                IpAddress = req.getRemoteAddr();
                if("0:0:0:0:0:0:0:1".equalsIgnoreCase(IpAddress))
                {
                    InetAddress ip = InetAddress.getLocalHost();
                    IpAddress= ip.getHostAddress();
                }
            }
            catch(Exception e)
            {
                IpAddress="Not Available";
                e.printStackTrace();
            }
            LoginStamping stamping = LoginStamping.builder()
                    .userId(login.getUserId())
                    .loginDateTime(LocalDateTime.now())
                    .IpAddress(IpAddress)
                    .build();
            crmService.LoginStampingInsert(stamping);

//            if(login.getRole().equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())){
//                return "redirect:/Dashboard.htm";
//            }
            return "redirect:/Dashboard.htm";
        } catch (Exception e) {
            logger.error(new Date() + " Login Issue Occured When Login By " + req.getUserPrincipal().getName(), e);
            e.printStackTrace();
            return "static/error";
        }
    }

//    @RequestMapping("/error")
//    public String handleError(HttpServletRequest req) {
//        Object status = req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
//        if (status != null) {
//            Integer statusCode = Integer.valueOf(status.toString());
//
//            if (statusCode == HttpStatus.NOT_FOUND.value()) {
//                req.setAttribute("ErrorMsg", "Error 404");
//            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
//                req.setAttribute("ErrorMsg", "Error 500");
//            } else {
//                req.setAttribute("ErrorMsg", "Error 500");
//            }
//        }
//        return "static/Error";
//    }

}
