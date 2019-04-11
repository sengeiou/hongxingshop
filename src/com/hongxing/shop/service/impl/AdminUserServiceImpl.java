package com.hongxing.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongxing.shop.mapper.AdminUserMapper;
import com.hongxing.shop.mapper.UserMapper;
import com.hongxing.shop.pojo.AdminUser;
import com.hongxing.shop.pojo.AdminUserExample;
import com.hongxing.shop.service.AdminUserService;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	  @Autowired
	    AdminUserMapper adminuserMapper;

	    @Override
	    public void add(AdminUser u) {
	        adminuserMapper.insert(u);
	    }

	    @Override
	    public void delete(int id) {
	        adminuserMapper.deleteByPrimaryKey(id);
	    }

	    @Override
	    public void update(AdminUser u) {
	        adminuserMapper.updateByPrimaryKeySelective(u);
	    }

	    @Override
	    public AdminUser get(int id) {
	        return adminuserMapper.selectByPrimaryKey(id);
	    }

	    public List<AdminUser> list(){
	        AdminUserExample example =new AdminUserExample();
	        example.setOrderByClause("id desc");
	        return adminuserMapper.selectByExample(example);

	    }

	    @Override
	    public boolean isExist(String aname) {
	        AdminUserExample example =new AdminUserExample();
	        example.createCriteria().andaNameEqualTo(aname);
	        List<AdminUser> result= adminuserMapper.selectByExample(example);
	        if(!result.isEmpty())
	            return true;
	        return false;

	    }

	    @Override
	    public AdminUser findAdminUser(String aname, String apassword) {
	    	AdminUserExample example =new AdminUserExample();
	        example.createCriteria().andaNameEqualTo(aname).andaPasswordEqualTo(apassword);
	        List<AdminUser> result= adminuserMapper.selectByExample(example);
	        if(result.isEmpty())
	            return null;
	        return result.get(0);
	    }


}