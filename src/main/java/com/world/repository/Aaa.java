package com.world.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

@Repository
public class Aaa {
	
	@PersistenceContext
    EntityManager em;
	
	@SuppressWarnings("unchecked")
	public String insertDataReturnKeyByGetNextVal(String seqName) throws Exception {  
		Session session = em.unwrap(org.hibernate.Session.class);
	    String vsql = "select " + seqName + ".nextval val from dual";
		List<Object> list = session.createSQLQuery(vsql).list();
	    return list.get(0).toString();
	}  

}
