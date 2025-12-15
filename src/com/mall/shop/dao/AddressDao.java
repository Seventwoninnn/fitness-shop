package com.mall.shop.dao;

import com.mall.shop.bean.PageBean;
import com.mall.shop.bean.Address;
import java.util.List;

public interface AddressDao {
	//收货地址分页列表
    List<Address> addressList(PageBean pb);
	//收货地址列表
    List<Address> addressAll();
    //统计总数
    long addressReadCount();
    //收货地址删除
    boolean addressDel(int addressId);
    //收货地址批量删除
    boolean addressBatDelById(String ids);
    //查找收货地址名称
    boolean findAddressByName(String addressName);
    Address findAddressById(int id);
    Address findAddressByUserId(int id);
    //增加收货地址
    boolean addressAdd(Address address);
    //修改收货地址
    boolean addressUpdate(Address address);

}
