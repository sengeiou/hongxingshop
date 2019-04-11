package com.hongxing.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hongxing.shop.pojo.AdminUser;
import com.hongxing.shop.pojo.Property;
import com.hongxing.shop.service.AdminUserService;
import com.hongxing.shop.util.Page;


@Controller
@RequestMapping("")
public class AdminUserController {
    @Autowired
   AdminUserService adminuserService;
    
    @RequestMapping("admin_loginadmin")
 	public String tologinadmin() {
 	    return "admin/loginadmin";
 	}
  
 
    @RequestMapping("admin_admin_list")
    public String list(Model model, Page page){
        PageHelper.offsetPage(page.getStart(),page.getCount());

        List<AdminUser> us= adminuserService.list();

        int total = (int) new PageInfo<>(us).getTotal();
        page.setTotal(total);

        model.addAttribute("us", us);
        model.addAttribute("page", page);

        return "admin/listAdmin";
    }
    
    @RequestMapping("admin_Admin_add")
    public String add(Model model, AdminUser p) {
        adminuserService.add(p);
        return "redirect:admin_admin_list?id="+p.getId();
    }
    @RequestMapping("admin_Admin_delete")
    public String delete(int id) {
        AdminUser p = adminuserService.get(id);
        adminuserService.delete(id);
        return "redirect:admin_admin_list?id="+p.getId();
    }


}
