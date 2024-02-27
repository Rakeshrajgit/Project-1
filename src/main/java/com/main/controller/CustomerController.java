package com.main.controller;

import com.main.CrmException;
import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.model.Customer;
import com.main.model.CustomerStateTransactions;
import com.main.model.LeadForm;
import com.main.service.CrmUserService;
import com.main.service.CustomerService;
import com.main.service.LeadService;
import com.main.utils.MyDateTimeUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CrmUserService crmUserService;

    @Autowired
    private LeadService leadService;

    @RequestMapping("CustomerList.htm")
    public String getCustomers(HttpServletRequest req, HttpSession ses) throws Exception {
        try {
            String userType = (String) ses.getAttribute("UserType");
            List<Customer> customerList = new ArrayList<>();
            List<CrmUser> agents = new ArrayList<>();

            String start = req.getParameter("customer_added_from");
            String end = req.getParameter("customer_added_to");
            LocalDate startDate = LocalDate.now().minusMonths(1);
            LocalDate endDate = LocalDate.now();
            if(start!=null){
                startDate = LocalDate.parse(MyDateTimeUtils.regularToSqlDate(start));
                endDate = LocalDate.parse(MyDateTimeUtils.regularToSqlDate(end));
            }

            String customerStatusCode = req.getParameter("customer_status_code");
            if(customerStatusCode==null){
                customerStatusCode = "0";
            }


            String userId ="0";
            if (userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())) {
                if (req.getParameter("userId")!=null) {
                    userId = req.getParameter("userId");
                }
                agents = crmUserService.getUsersByRole(UserTypes.ROLE_AGENT.toString());
            }
            else {
                userId = (String) ses.getAttribute("userId");
                agents.add(crmUserService.getUsersByUserId(userId));
            }
            customerList = customerService.getCustomerOpen(userId,startDate,endDate,customerStatusCode);
            req.setAttribute("customerStatusList",customerService.getAllCustomerStatus());
            req.setAttribute("Agents", agents);
            req.setAttribute("CustomerList", customerList);
            req.setAttribute("userType", userType);

            req.setAttribute("fromDate", startDate.toString());
            req.setAttribute("endDate", endDate.toString());
            req.setAttribute("agentId", userId );
            req.setAttribute("customerStatusCode", customerStatusCode);
            return "customer/CustomerList";
        } catch (Exception e) {
            e.printStackTrace();
            return "static/error";
        }
    }

    @GetMapping("RedirectCustomerDetailsView.htm")
    public String RedirectCustomerDetailsView(HttpServletRequest req, HttpSession ses) {
        try {
            String userId = (String) ses.getAttribute("userId");
            String customerId = req.getParameter("customerId");
            customerService.punchCustomerViewerInfo(userId, customerId);
            ses.setAttribute("customerId", customerId);
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
            String customerId = req.getParameter("customerId");;
            if (customerId == null) {
                customerId = (String) ses.getAttribute("customerId");
            }
            Customer customer = customerService.getCustomerByCustomerId(customerId);
            if (customer != null) {
                req.setAttribute("CustomerDetails", customer);
                req.setAttribute("CustomerTransactions",customerService.getCustomerTransactions(customer.getCustomerId()));
                req.setAttribute("CustomerTransactionStates",customerService.getAllCustomerStatus());
                req.setAttribute("CustomerPayments",customerService.getCustomerPayments(customer.getCustomerId()));
                return "customer/CustomerDetailsView";
            } else {
                throw new CrmException("Failed to fetch Customer Info");
            }
        } catch (Exception e) {
            log.error(e.getMessage());
            return "static/error";
        }
    }

    @PostMapping("UpdateAgentForCustomer.htm")
    public @ResponseBody String updateAgentForCustomer(HttpServletRequest req, HttpSession ses) {
        try {
            String customerId = req.getParameter("appNo");
            String agentId = req.getParameter("agentId");
            customerService.updateAgentForCustomer(customerId, agentId);
            return "Agent assigned successfully !";
        } catch (Exception e) {
            log.error(e.getMessage());
            return "Agent assignment unsuccessful !";
        }
    }

    @RequestMapping({"CustomerAdd.htm","CustomerEdit.htm"})
    public String customerAdd(HttpServletRequest req, HttpSession ses) {
        try {

            String customerId = req.getParameter("customer_id");
            Customer customer  = customerService.getCustomerByCustomerId(customerId);

            String lead_to_customer = req.getParameter("lead_to_customer");
            if(lead_to_customer!=null){
                LeadForm lead = leadService.getLeadByLeadId(lead_to_customer);
                req.setAttribute("lead",lead);
            }


            req.setAttribute("customer",customer);
            return "customer/CustomerAdd";
        } catch (Exception e) {
            log.error(e.getMessage());
            return "static/Error";
        }
    }

    @PostMapping({"CustomerAddSubmit.htm","CustomerEditSubmit.htm"})
    public String customerAddEditSubmit(HttpServletRequest req, HttpSession ses, RedirectAttributes redir) {
        try {

            String customer_name = req.getParameter("customer_name");
            String customer_email = req.getParameter("customer_email");
            String customer_phone = req.getParameter("customer_phone");
            String customer_gender = req.getParameter("customer_gender");
            String customer_dob = req.getParameter("customer_dob");
            String customer_address = req.getParameter("customer_address");
            String customer_proof1 = req.getParameter("customer_proof1");
            String customer_proof2 = req.getParameter("customer_proof2");
            String customer_open_cibil = req.getParameter("customer_open_cibil");
            String customer_cibil_open_date = req.getParameter("customer_cibil_open_date");
            String customer_close_cibil = req.getParameter("customer_close_cibil");
            String customer_cibil_close_date = req.getParameter("customer_cibil_close_date");
            String customer_id = req.getParameter("customer_id");
            String lead_id = req.getParameter("lead_id");


            String assign_self = req.getParameter("assign_self");
            String userId = null;
            if(assign_self!=null && assign_self.equalsIgnoreCase("yes")) {
                userId = (String) ses.getAttribute("userId");
            }

            Customer customer = Customer.builder()
                    .fullName(customer_name)
                    .email(customer_email)
                    .phoneNo(Long.parseLong(customer_phone))
                    .gender(customer_gender)
                    .dob(LocalDate.parse(MyDateTimeUtils.regularToSqlDate(customer_dob)))
                    .address(customer_address)
                    .idProof1(customer_proof1)
                    .idProof2(customer_proof2)
                    .openCibilScore(customer_open_cibil.equalsIgnoreCase("")? null:Integer.parseInt(customer_open_cibil))
                    .openDate((customer_cibil_open_date==null || customer_open_cibil.equalsIgnoreCase(""))?null:LocalDate.parse(MyDateTimeUtils.regularToSqlDate(customer_cibil_open_date)))
                    .closeCibilScore(customer_close_cibil.equalsIgnoreCase("")?null:Integer.parseInt(customer_close_cibil))
                    .closeDate((customer_cibil_close_date==null || customer_close_cibil.equalsIgnoreCase(""))?null: LocalDate.parse(MyDateTimeUtils.regularToSqlDate(customer_cibil_close_date)))
                    .customerId(customer_id)
                    .userId(userId)
                    .isActive(1)
                    .build();
            customer = customerService.customerAddEdit(customer,lead_id);

            if (customer != null) {
                redir.addAttribute("successMessage", "Customer action Successfully");
            } else {
                redir.addAttribute("failureMessage", "Customer action Unsuccessful");
            }

            return "redirect:/CustomerList.htm";
        } catch (Exception e) {
            e.printStackTrace();
            redir.addAttribute("failureMessage", "Customer action Unsuccessful");
            return  "redirect:/CustomerList.htm";
        }
    }

    @PostMapping("UpdateCustomerStatus.htm")
    public String UpdateCustomerStatus(HttpServletRequest req, HttpSession ses,RedirectAttributes redir) {
        try {
            String userId = (String) ses.getAttribute("userId");
            String customer_id = req.getParameter("modal_customer_id");
            String agent_remarks = req.getParameter("modal_status_remarks");
            String customer_status_code = req.getParameter("customer_new_status");
            String full_payment_amount  = req.getParameter("full_payment_amount");

            CustomerStateTransactions transaction = CustomerStateTransactions.builder()
                    .actionBy(userId)
                    .customerId(customer_id)
                    .remarks(agent_remarks)
                    .customerStatusCodeTo(customer_status_code)
                    .build();

            long result = customerService.updateCustomerStatusCode(transaction,full_payment_amount);

            if (result !=0) {
                redir.addAttribute("successMessage", "Customer State Updated Successfully");
            } else {
                redir.addAttribute("failureMessage", "Customer State Update Unsuccessful");
            }
        }catch (CrmException e){
            redir.addAttribute("failureMessage", e.getMessage());
        }catch (Exception e) {
            log.error(e.getMessage());
            redir.addAttribute("failureMessage", "Customer action Unsuccessful");

        }
        return "redirect:/CustomerList.htm";
    }


    @RequestMapping("CustomerListClosed.htm")
    public String customerListClosed(HttpServletRequest req, HttpSession ses) throws Exception {
        try {
            String userType = (String) ses.getAttribute("UserType");
            List<Customer> customerList = new ArrayList<>();
            List<CrmUser> agents = new ArrayList<>();

            String start = req.getParameter("customer_added_from");
            String end = req.getParameter("customer_added_to");
            LocalDate startDate = LocalDate.now().minusMonths(1);
            LocalDate endDate = LocalDate.now();
            if(start!=null){
                startDate = LocalDate.parse(MyDateTimeUtils.regularToSqlDate(start));
                endDate = LocalDate.parse(MyDateTimeUtils.regularToSqlDate(end));
            }

            String customerStatusCode = req.getParameter("customer_status_code");
            if(customerStatusCode==null){
                customerStatusCode = "0";
            }


            String userId ="0";
            if (userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())) {
                if (req.getParameter("userId")!=null) {
                    userId = req.getParameter("userId");
                }

                agents = crmUserService.getUsersByRole(UserTypes.ROLE_AGENT.toString());
            }
            else {
                userId = (String) ses.getAttribute("userId");
                agents.add(crmUserService.getUsersByUserId(userId));
            }
            System.out.println(userId+"   "+startDate+"   "+endDate+"   "+customerStatusCode);
            customerList = customerService.getCustomerClosed(userId,startDate,endDate,customerStatusCode);
            req.setAttribute("customerStatusList",customerService.getAllCustomerStatus());
            req.setAttribute("Agents", agents);
            req.setAttribute("CustomerList", customerList);
            req.setAttribute("userType", userType);

            req.setAttribute("fromDate", startDate.toString());
            req.setAttribute("endDate", endDate.toString());
            req.setAttribute("agentId", userId );
            req.setAttribute("customerStatusCode", customerStatusCode);
            return "customer/CustomerListClosed";
        } catch (Exception e) {
            e.printStackTrace();
            return "static/error";
        }
    }

}
