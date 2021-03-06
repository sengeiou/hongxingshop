package com.hongxing.shop.mapper;

import com.hongxing.shop.pojo.AdminUser;
import com.hongxing.shop.pojo.AdminUserExample;


import java.util.List;

public interface AdminUserMapper {
	int deleteByPrimaryKey(Integer id);

    int insert(AdminUser record);

    int insertSelective(AdminUser record);

    List<AdminUser> selectByExample(AdminUserExample example);

    AdminUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AdminUser record);

    int updateByPrimaryKey(AdminUser record);
}	
