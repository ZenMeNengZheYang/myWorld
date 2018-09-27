package com.world.repository;

import com.world.bean.SysUser;
import com.world.repository.Interface.repository;

public interface SysUserRepository extends repository<SysUser> {
	
	SysUser findByUsername(String userName);

}
