package com.main.repository;

import com.main.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

public interface CustomerRepo extends JpaRepository<Customer, Integer> {
    Customer findByCustomerId(String customerId);
    List<Customer> findByUserId(String userId);
    List<Customer> findByCustomerIdIsNull();

    @Query("SELECT COUNT(*) FROM Customer ")
    long findCountOfCustomer();

    @Query(value = "CALL customer_list_open (:userId,:fromDate,:toDate,:customerStatusCode)", nativeQuery = true)
    List<Customer> findByCustomerOpen(@Param("userId") String userId, @Param("fromDate") LocalDate fromDate, @Param("toDate") LocalDate toDate, @Param("customerStatusCode") String customerStatusCode);

    @Query(value = "CALL customer_list_close (:userId,:fromDate,:toDate,:customerStatusCode)", nativeQuery = true)
    List<Customer> findByCustomerClosed(@Param("userId") String userId, @Param("fromDate") LocalDate fromDate, @Param("toDate") LocalDate toDate, @Param("customerStatusCode") String customerStatusCode);


}
