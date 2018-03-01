package com.weixin.controller;

import com.weixin.model.Customer;
import com.weixin.model.Winner;
import com.weixin.service.SubmitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Controller
@RequestMapping("/submitController")
public class SubmitController {

    SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
    Calendar ca = Calendar.getInstance();

    @Resource
    private SubmitService submitService;

    //注册
    @RequestMapping("/addCustomer")
    public void addCustomer (HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            Customer checkCustomer = submitService.selectCustomerByPhone(request.getParameter("phone"));
            if (checkCustomer == null) {
                Customer customer = new Customer();
                customer.setName(request.getParameter("name"));
                customer.setPhone(request.getParameter("phone"));
                customer.setStoreId(Integer.parseInt(request.getParameter("store")));
                customer.setState(0);
                customer.setIsWin(0);
                customer.setRewardId(0);
                submitService.addCustomer(customer);
                response.getWriter().print("true");
            } else {
                response.getWriter().print("checkFailed");
            }
        } catch (Exception e) {
            response.getWriter().print("false");
            e.printStackTrace();
        }
    }

    //第五页输入手机号后检查手机号状态
    @RequestMapping("/checkDrawPhone")
    public void checkDrawPhone (HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            Customer customer = submitService.selectCustomerByPhone(request.getParameter("phone"));
            if (customer != null) {
                if (customer.getState() == 0) {
                    response.getWriter().print("startDraw");
                } else if (customer.getState() == 1) {
                    response.getWriter().print("alreadyDraw");
                }
            } else {
                response.getWriter().print("pleaseRegister");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //更改抽奖状态
    @RequestMapping("/changeState")
    public void changeState (HttpServletRequest request,HttpServletResponse response) {
        try {
            Customer customer = submitService.selectCustomerByPhone(request.getParameter("phone"));
            customer.setState(1);
            submitService.updateCustomerByPhone(customer);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //更改中奖信息，并将中奖人信息存入中奖者表
    @RequestMapping("/changeWinMessage")
    public void changeWinMessage (HttpServletRequest request,HttpServletResponse response) throws Exception {
        try {
            int r = (int)(Math.random()*100);
            String code = "";
            Winner winner = new Winner();
            Customer customer = submitService.selectCustomerByPhone(request.getParameter("phone"));
            //中奖状态设置为1
            customer.setIsWin(1);
            //奖品编号（99%概率为3等奖,1%概率为2等奖）
            if (r >0 && r <= 10) {
                customer.setRewardId(2);
            } else {
                customer.setRewardId(1);
            }
            //获取中奖者id
            winner.setCustomerId(customer.getId());
            //奖品编号
            if (r >0 && r <= 10) {
                code = "RWD"+((int)(Math.random()*1000000))+"LVB";
            } else {
                code = "RWD"+((int)(Math.random()*1000000))+"LVC";
            }
            winner.setRewardCode(code);
            //获取中奖日期
            winner.setWinDate(sdf.format(new Date()));

            submitService.updateCustomerByPhone(customer);
            submitService.addWinner(winner);
            response.getWriter().print(code);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //获取当前抽中总数量
    @RequestMapping("/getCz")
    public void getCz (HttpServletRequest request,HttpServletResponse response) throws Exception {
        try {
            String cz = submitService.selectAllWinner().toString();
            response.getWriter().print(cz);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //获取奖品编号
    @RequestMapping("/selectRewardCode")
    public void selectRewardCode (HttpServletRequest request,HttpServletResponse response) throws Exception {
        try {
            Winner winner = submitService.selectWinnerByPhone(request.getParameter("phone"));
            response.getWriter().print(winner.getRewardCode());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
