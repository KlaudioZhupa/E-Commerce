package com.ecomm.groupproject.services;

import com.ecomm.groupproject.models.Order;
import com.ecomm.groupproject.models.Product;
import com.ecomm.groupproject.repositories.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;
    public List<Order> getAll(){
        return orderRepository.findAll();
    }
    public Order findById(Long id){
        return orderRepository.findById(id).orElse(null);
    }

    public Order save(Order order){
        return orderRepository.save(order);
    }
}
