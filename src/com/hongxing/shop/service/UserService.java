package com.hongxing.shop.service;
 
import java.util.List;

import com.hongxing.shop.pojo.User;

public interface UserService {
    void add(User c);
    void delete(int id);
    void update(User c);
    User get(int id);
    List<User> list();
    boolean isExist(String name);

    User get(String name, String password);
}