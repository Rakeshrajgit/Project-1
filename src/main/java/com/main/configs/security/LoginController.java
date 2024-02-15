package com.main.configs.security;

import java.util.Collection;
import java.util.Date;
import java.util.Map;

import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.repository.CrmUserRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class LoginController {

    private static final Logger logger = LogManager.getLogger(LoginController.class);
    @Autowired
    CrmUserRepository Repository;

    @Autowired
    CrmService service;

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
            boolean isContractEmp = false;
            Collection<SimpleGrantedAuthority> authorities = (Collection<SimpleGrantedAuthority>) SecurityContextHolder.getContext().getAuthentication().getAuthorities();
            CrmUser login = Repository.findByUserEmail(req.getUserPrincipal().getName());
            login.setPassword("");
            ses.setAttribute("UserData", login);
            ses.setAttribute("UserType", login.getRole());
            if(login.getRole().equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())){
                return "redirect:/Dashboard.htm";
            }
            return "redirect:/CustomerList.htm";
        } catch (Exception e) {
            logger.error(new Date() + " Login Issue Occured When Login By " + req.getUserPrincipal().getName(), e);
            e.printStackTrace();
            return "static/error";
        }

    }

}
