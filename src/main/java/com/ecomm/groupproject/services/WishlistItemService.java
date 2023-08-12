package com.ecomm.groupproject.services;

import com.ecomm.groupproject.models.WishlistItem;
import com.ecomm.groupproject.repositories.WishlistItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishlistItemService {
    @Autowired
    private WishlistItemRepository wishlistItemRepository;


    //get WishlistItems
    public List<WishlistItem> getAllWishlistItems() {
        return wishlistItemRepository.findAll();
    }
    public List<WishlistItem> getWishlistItemsByUserId(Long userId) {
        return wishlistItemRepository.findByWishlistId(userId);
    }
    public WishlistItem getWishlistItemByProductId(Long productId) {
        return wishlistItemRepository.findByProductId(productId);
    }

    //CREATE
    public WishlistItem addNewWishlistItem(WishlistItem wishlistItem) {
        return wishlistItemRepository.save(wishlistItem);
    }

    //DELETE
    public void deleteThisWishlistItem(Long id){
        wishlistItemRepository.deleteById(id);
    }

}