package com.qyl.controller.admin;

import com.qyl.service.admin.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * projectName:  e-commerce
 * packageName: com.qyl.controller.admin
 * date: 2020-11-08 18:33
 * copyright(c) 2020 南晓18卓工 邱依良
 * @author 邱依良
 */
@Controller
@RequestMapping("/adminUser")
public class AdminUserController extends BaseController{
    private final AdminUserService adminUserService;

    @Autowired
    public AdminUserController(AdminUserService adminUserService) {
        this.adminUserService = adminUserService;
    }


    @RequestMapping("/userInfo")
    public String userInfo(Model model,@RequestParam(value = "pageCur",defaultValue = "1") Integer pageCur){
        return adminUserService.userInfo(model,pageCur);
    }
    @RequestMapping("/deleteuserManager")
    public String deleteuserManager(Integer id,Model model){
        return adminUserService.deleteuserManager(id,model);
    }


}