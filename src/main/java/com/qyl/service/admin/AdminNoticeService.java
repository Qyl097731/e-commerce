package com.qyl.service.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qyl.dao.AdminNoticeDao;
import com.qyl.instance.Goods;
import com.qyl.instance.Notice;
import com.qyl.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * projectName:  e-commerce
 * packageName: com.qyl.service.admin
 * date: 2020-12-04 13:25
 * copyright(c) 2020 南晓18卓工 邱依良
 *
 * @author 邱依良
 */
@Service
public class AdminNoticeService {
    private final String deleteNotice = "deleteNotice";

    private final AdminNoticeDao adminNoticeDao;
    @Autowired
    public AdminNoticeService(AdminNoticeDao adminNoticeDao) {
        this.adminNoticeDao = adminNoticeDao;
    }

    public String selectNotices(Model model, Integer pageCur, String act) {
        /*
        * @Description: 查找公告 按照act返回不同界面
        * @Param: [model, pageCur, act]
        * @return: java.lang.String
        * @Author: Mr.Qiu
        * @Date: 2020/12/15
        */
        PageHelper.startPage(pageCur, 20);
        ArrayList<Notice> allNotices = adminNoticeDao.selectNotices();
        PageInfo<Notice> info = new PageInfo<>(allNotices, 5);
        int[] nums = info.getNavigatepageNums();
        long total = info.getTotal();
        model.addAttribute("nums", nums);
        model.addAttribute("allNotices", allNotices);
        model.addAttribute("total", total);
        model.addAttribute("info", info);
        if (deleteNotice.equals(act)) {
            return "admin/deleteSelectNotice";
        } else {
            return "admin/selectNotice";
        }
    }

    public String deleteNotice(Integer[] ids, Model model) {
        /*
        * @Description: 批量删除公告 返回删除界面
        * @Param: [ids, model]
        * @return: java.lang.String
        * @Author: Mr.Qiu
        * @Date: 2020/12/15
        */
        ArrayList<Integer> list = new ArrayList<>(Arrays.asList(ids));
        adminNoticeDao.deleteNotice(list);
        model.addAttribute("msg", "成功删除商品");
        return "forward:/adminNotice/selectNotices?act=deleteSelect";
    }

    public String deleteANotice(Integer id, Model model) {
        /*
        * @Description: 删除一个公告
        * @Param: [id, model]
        * @return: java.lang.String
        * @Author: Mr.Qiu
        * @Date: 2020/12/15
        */
        adminNoticeDao.deleteANotice(id);
        return "forward:/adminNotice/selectNotices?act=deleteSelect";
    }

    public String addNotice(Notice notice, HttpServletRequest request) {
        /*
        * @Description: 增加公告
        * @Param: [notice, request]
        * @return: java.lang.String
        * @Author: Mr.Qiu
        * @Date: 2020/12/15
        */
        String newFileName = "";
        String fileName = notice.getLogos().getOriginalFilename();
        if (fileName.length() > 0) {
            String realPath = request.getServletContext().getRealPath("logos");
            //实现文件上传
            String fileType = fileName.substring(fileName.lastIndexOf("."));
            //防止文件名崇明
            newFileName = MyUtil.getStringID() + fileType;
            notice.setNpicture(newFileName);
            File targetFile = new File(realPath, newFileName);
            if (!targetFile.exists()) {
                targetFile.mkdirs();
            }
            try {
                notice.getLogos().transferTo(targetFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //保存到数据库
        if (adminNoticeDao.addNotice(notice) > 0) {
            //转发到查询的controller
            return "forward:/adminNotice/selectNotices";
        } else {
            return "admin/addNotice";
        }
    }
}