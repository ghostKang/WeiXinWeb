package com.weixin.service;

import com.weixin.dao.DaoSupport;
import com.weixin.model.Customer;
import com.weixin.model.Winner;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("submitService")
public class SubmitService {

    @Resource(name = "daoSupport")
    public DaoSupport dao;

    public void addCustomer(Customer customer) throws Exception {
        dao.save("com.CustomerMapper.addCustomer",customer);
    }

    public void addWinner(Winner winner) throws Exception {
        dao.save("com.CustomerMapper.addWinner",winner);
    }

    public Integer selectAllWinner() throws Exception {
        return (Integer) dao.findForObject("com.CustomerMapper.selectAllWinner",null);
    }

    public Integer selectMorningWinnerByDateAndHour(String today) throws Exception {
        return (Integer) dao.findForObject("com.CustomerMapper.selectMorningWinnerByDateAndHour",today);
    }

    public Integer selectNoonWinnerByDateAndHour(String today) throws Exception {
        return (Integer) dao.findForObject("com.CustomerMapper.selectNoonWinnerByDateAndHour",today);
    }

    public Integer selectAfternoonWinnerByDateAndHour(String today) throws Exception {
        return (Integer) dao.findForObject("com.CustomerMapper.selectAfternoonWinnerByDateAndHour",today);
    }

    public Customer selectCustomerByPhone(String phone) throws Exception {
        return (Customer) dao.findForObject("com.CustomerMapper.selectCustomerByPhone",phone);
    }

    public Winner selectWinnerByPhone(String phone) throws Exception {
        return (Winner) dao.findForObject("com.CustomerMapper.selectWinnerByPhone",phone);
    }

    public void updateCustomerByPhone(Customer customer) throws Exception {
        dao.update("com.CustomerMapper.updateCustomerByPhone",customer);
    }
}
