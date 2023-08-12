package com.ecomm.groupproject.repositories;

import com.ecomm.groupproject.models.WishlistItem;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface WishlistItemRepository extends CrudRepository<WishlistItem, Long> {
    List<WishlistItem> findAll();
    Optional<WishlistItem> findById(Long id);
    List<WishlistItem> findByWishlistId(Long id);
    WishlistItem findByProductId(Long productId);
}