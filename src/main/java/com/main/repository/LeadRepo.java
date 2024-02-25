package com.main.repository;

import com.main.model.Customer;
import com.main.model.LeadForm;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface LeadRepo extends JpaRepository<LeadForm, Long> {

    @Query("SELECT COUNT(*) FROM LeadForm WHERE leadId LIKE :leadId")
    long findCountOfLeadIdLike(@Param("leadId") String leadId);

    @Query(value = "CALL lead_list_open (:userId,:fromDate,:toDate,:LeadFormStatusCode)", nativeQuery = true)
    List<LeadForm> findByLeadFormOpen(@Param("userId") String userId, @Param("fromDate") LocalDate fromDate, @Param("toDate") LocalDate toDate, @Param("LeadFormStatusCode") String LeadFormStatusCode);

    @Query(value = "CALL lead_list_close (:userId,:fromDate,:toDate,:LeadFormStatusCode)", nativeQuery = true)
    List<LeadForm> findByLeadFormClosed(@Param("userId") String userId, @Param("fromDate") LocalDate fromDate, @Param("toDate") LocalDate toDate, @Param("LeadFormStatusCode") String LeadFormStatusCode);


    LeadForm findByLeadId(String leadId);

}
