package com.world.repository.Interface;

import java.io.Serializable;

import org.springframework.data.repository.NoRepositoryBean;

@NoRepositoryBean
public interface repository<T> extends JpaRepository<T, Serializable>, CrudRepository<T, Serializable>,PagingAndSortingRepository<T, Serializable> {

}
