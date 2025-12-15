package com.mall.shop.dao;

import com.mall.shop.bean.PageBean;
import com.mall.shop.bean.Orders;
import java.util.List;

public interface OrdersDao {
	//订单分页列表
    List<Orders> ordersList(PageBean pb);

    List<Orders> myordersList(int userId,PageBean pb);
	//订单列表
    List<Orders> ordersAll();
    //统计总数
    long ordersReadCount();
    long myordersReadCount(int userId);
    //订单删除
    boolean ordersDel(int ordersId);
    //订单批量删除
    boolean ordersBatDelById(String ids);
    //查找订单名称
    boolean findOrdersByName(String ordersName);
    Orders findOrdersById(int id);
    //增加订单
    boolean ordersAdd(Orders orders);
    //修改订单
    boolean ordersUpdate(Orders orders);

}
