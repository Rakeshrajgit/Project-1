package com.main.repository;

import com.main.model.LeadsInfoUpdates;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LeadsInfoUpdatesRepo extends JpaRepository<LeadsInfoUpdates,Long> {
    List<LeadsInfoUpdates> findByLeadId(String leadId);
}
