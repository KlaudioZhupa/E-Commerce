package com.ecomm.groupproject.services;

import com.ecomm.groupproject.models.ShippingDetails;
import com.ecomm.groupproject.repositories.ShippingDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShippingDetailsService {
    @Autowired
    private ShippingDetailsRepository shippingDetailsRepository;
    public ShippingDetails saveShippingDetails(ShippingDetails shippingDetails) {
        return shippingDetailsRepository.save(shippingDetails);
    }

}

