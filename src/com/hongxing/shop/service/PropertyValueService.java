package com.hongxing.shop.service;

import com.hongxing.shop.pojo.Product;
import com.hongxing.shop.pojo.PropertyValue;

import java.util.List;

public interface PropertyValueService {
    void init(Product p);
    void update(PropertyValue pv);

    PropertyValue get(int ptid, int pid);
    List<PropertyValue> list(int pid);
}