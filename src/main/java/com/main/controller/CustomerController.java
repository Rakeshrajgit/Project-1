package com.main.controller;

import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.model.Customer;
import com.main.service.CrmUserService;
import com.main.service.CustomerService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CrmUserService crmUserService;

    @GetMapping("/WC")
    public String welcome() {
        return "Welcome to Customer";
    }

    @GetMapping("/register")
    public ModelAndView m1() {
        return new ModelAndView("customer/CustomerReg");
    }

    @PostMapping("/insertCustomer")
    public ModelAndView m2(HttpServletRequest req) {
        ModelAndView mv = new ModelAndView("Success");
        String fname = req.getParameter("fname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        Customer c = new Customer(email, fname, phone);
//        cr.save(c);
        return mv;
    }

    @GetMapping("CustomerList.htm")
    public String getCustomers(HttpServletRequest req, HttpSession ses) throws Exception {
        try {
            String userType = (String) ses.getAttribute("UserType");
            String userId = (String) ses.getAttribute("userId");
            List<Customer> customerList = new ArrayList<>();
            List<CrmUser> agents = new ArrayList<>();
            System.out.println(ses.getClass().getName());
            if(userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())
                    || userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())) {
                userId = req.getParameter("userId");
                if(userId==null) {
                    customerList = customerService.getAllCustomer();
                }else if(userId.equalsIgnoreCase("UnAssigned")){
                    customerList = customerService.getCustomersIfAgentIdIsNull();
                }else {
                    customerList = customerService.getCustomersByAgentId(userId);
                }
                agents = crmUserService.getUsersByRole(UserTypes.ROLE_AGENT.toString());
            }else{
                agents.add(crmUserService.getUsersByUserId(userId));
                customerList= customerService.getAllCustomer();
            }

            req.setAttribute("Agents", agents );
            req.setAttribute("CustomerList", customerList);
            req.setAttribute("userType", userType);
            return "customer/CustomerList";
        } catch (Exception e) {
            e.printStackTrace();
            return "static/error";
        }
    }

    @GetMapping("RedirectCustomerDetailsView.htm")
    public String RedirectCustomerDetailsView(HttpServletRequest req, HttpSession ses) {
        try {
            CrmUser user = (CrmUser) ses.getAttribute("UserData");
            Long appNo = Long.parseLong(req.getParameter("appNo"));
            customerService.punchLeadViewerInfo(user.getUserId(), appNo);
            ses.setAttribute("appNo", appNo);
            return "redirect:/CustomerDetailsView.htm";
        } catch (Exception e) {
            log.error(e.getMessage());
            return "static/error";
        }
    }

    @GetMapping("CustomerDetailsView.htm")
    public String CustomerDetailsView(HttpServletRequest req, HttpSession ses) {
        try {
            String userType = (String) ses.getAttribute("UserType");
            CrmUser user = (CrmUser) ses.getAttribute("UserData");
            Long appNo = null;
            String appNoString = req.getParameter("appNo");
            if (appNoString == null) {
                appNo = (Long) ses.getAttribute("appNo");
            } else {
                appNo = Long.parseLong(appNoString);
            }
            Customer customer = customerService.getCustomerByAppNo(appNo);
            if (customer != null) {
                req.setAttribute("CustomerDetails", customer);
                return "customer/CustomerDetailsView";
            } else {
                throw new Exception("Failed to fetch Customer Info");
            }
        } catch (Exception e) {
            log.error(e.getMessage());
            return "static/error";
        }
    }
}
