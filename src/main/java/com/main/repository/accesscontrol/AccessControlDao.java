package com.main.repository.accesscontrol;


import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
@Transactional
public class AccessControlDao {

    @PersistenceContext
    private EntityManager manager;

    public static final String ACCESSCONTROLQUERY="SELECT fd.FormDetailId,fm.FormModuleId, fm.FormModuleName, fm.ModuleUrl, fd.FormName, fd.FormUrl FROM form_role_access fra, form_detail fd, form_module fm  WHERE fra.isActive=1 AND fd.isActive=1 AND fm.isActive=1 AND fra.FormDetailId=fd.FormDetailId AND fd.FormModuleId=fm.FormModuleId AND fra.LoginType=:userType ";
    public List<Object[]> getAccessControlDto(String userType){
        try {
            Query query = manager.createNativeQuery(ACCESSCONTROLQUERY);
            query.setParameter("userType", userType);
            List<Object[]> list =(List<Object[]>)query.getResultList();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }
}
