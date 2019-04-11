package com.hongxing.shop.service;
 
import java.util.List;

import com.hongxing.shop.pojo.AdminUser;

public interface AdminUserService {
    void add(AdminUser c);
    void delete(int id);
    void update(AdminUser c);
    AdminUser get(int id);
    List<AdminUser> list();
    boolean isExist(String aname);

    AdminUser findAdminUser(String aname, String apassword);
}