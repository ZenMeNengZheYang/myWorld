package com.world.repository.Interface;

import java.io.Serializable;

import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.QueryByExampleExecutor;

@NoRepositoryBean
public interface JpaRepository<T, ID extends Serializable> 
	extends PagingAndSortingRepository<T, ID>, QueryByExampleExecutor<T> {
	
}
