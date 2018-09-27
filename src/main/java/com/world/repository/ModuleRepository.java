package com.world.repository;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.world.bean.Module;
import com.world.repository.Interface.repository;

public interface ModuleRepository extends repository<Module> {
	
	@Query(value="SELECT m.id,m.higher_up,m.module_class,m.module_url,m.name,m.rank"
			+ " FROM module m WHERE m.higher_up = :id", nativeQuery=true)
	List<Module> findByHigherUp(@Param("id") int id);
	
	@Query(value="SELECT m.id,m.higher_up,m.module_class,m.module_url,m.name,m.rank"
			+ " FROM module m WHERE m.module_class = 1", nativeQuery=true)
	List<Module> findTopModuleClass();
	
}
