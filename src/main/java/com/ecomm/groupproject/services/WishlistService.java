package com.ecomm.groupproject.services;

import com.ecomm.groupproject.models.Wishlist;
import com.ecomm.groupproject.repositories.WishlistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishlistService {
    @Autowired
    private WishlistRepository wishlistRepository;

    // GET THIS WISHLIST by ___
    public Wishlist getWishlistById(Long id) { // Update the method signature here
        return wishlistRepository.findById(id).orElse(null);
    }
    public Wishlist getWishlistByUserId(Long id) {
        return wishlistRepository.findByUserId(id);
    }

}