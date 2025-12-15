package com.mall.shop.servlet.admin;

import com.mall.shop.bean.PageBean;
import com.mall.shop.bean.Address;

import com.mall.shop.dao.AddressDao;

import com.mall.shop.dao.impl.AddressDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 * 收货地址servlet
 * Servlet implementation class addressServlet
 */
@WebServlet("/jsp/admin/AddressManageServlet")
public class AddressManageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String CATALOGLIST_PATH = "addressManage/addressList.jsp";
    private static final String CATALOGADD_PATH = "addressManage/addressAdd.jsp";


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doPost(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "list":
                addressList(request, response);
                break;
            case "add":
                addressAdd(request, response);
                break;
            case "del":
                addressDel(request, response);
                break;
            case "batDel":
                addressBatDel(request, response);
                break;

            case "edit":
                addressEdit(request, response);
                break;
            case "update":
                addressUpdate(request, response);
                break;
        }
    }


    private void addressBatDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ids = request.getParameter("ids");
        AddressDao addressDao = new AddressDaoImpl();

        if (addressDao.addressBatDelById(ids)) {
            request.setAttribute("addressMessage", "收货地址已批量删除");

        } else {
            request.setAttribute("addressMessage", "收货地址删除失败");
        }
        //收货地址删除成功失败都跳转到收货地址列表页面
        addressList(request, response);//通过servlet中listAddress跳到收货地址列表

    }

    private void addressDel(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressId = Integer.parseInt(request.getParameter("id"));

        AddressDao addressDao = new AddressDaoImpl();

        if (addressDao.addressDel(addressId)) {
            request.setAttribute("addressMessage", "该收货地址已删除");
        } else {
            request.setAttribute("addressMessage", "该收货地址删除失败");
        }

        addressList(request, response);
    }

    private void addressAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Address address = new Address(
                request.getParameter("phone"),
                request.getParameter("address"),
                request.getParameter("name"),
                Integer.parseInt(request.getParameter("userId"))
        );


        AddressDao addressDao = new AddressDaoImpl();
        if (addressDao.addressAdd(address)) {
            request.setAttribute("addressMessage", "增加收货地址成功");
            addressList(request, response);
        } else {
            request.setAttribute("addressMessage", "增加收货地址失败");
            request.getRequestDispatcher(CATALOGADD_PATH).forward(request, response);
        }

    }

    //获取收货地址列表
    private void addressList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int curPage = 1;
        String page = request.getParameter("page");
        if (page != null) {
            curPage = Integer.parseInt(page);
        }
        int maxSize = 10;
        AddressDao addressDao = new AddressDaoImpl();

        PageBean pb = new PageBean(curPage, maxSize, addressDao.addressReadCount());

        request.setAttribute("pageBean", pb);

        request.setAttribute("addressList", addressDao.addressList(pb));
        request.getRequestDispatcher(CATALOGLIST_PATH).forward(request, response);
    }


    private void addressEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从请求参数中获取收货地址id
        int id = Integer.parseInt(request.getParameter("id"));
        AddressDao addressDao = new AddressDaoImpl();
        Address address = addressDao.findAddressById(id);
        request.setAttribute("addressInfo", address);
        request.getRequestDispatcher("/jsp/admin/addressManage/addressEdit.jsp").forward(request, response);
    }

    //自定义显示详情的方法


    private void addressUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取前端页面input标签中的内容，构造新的Address对象，更新数据库表中的收货地址信息
        Address address = new Address(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("phone"),
                request.getParameter("address"),
                request.getParameter("name"),
                Integer.parseInt( request.getParameter("userId"))
                );
        //往数据库中更新该收货地址信息
        AddressDaoImpl addressDao = new AddressDaoImpl();
        if (addressDao.addressUpdate(address)) {
            //提示收货地址更新成功
            request.setAttribute("addressMessage", "更新收货地址成功！");
            //再次返回addressList页面
            addressList(request, response);
        } else {
            //提示收货地址更新失败
            request.setAttribute("addressMessage", "更新收货地址失败！");
            request.getRequestDispatcher("/jsp/admin/addressManage/addressEdit.jsp").forward(request, response);
        }
    }


}


