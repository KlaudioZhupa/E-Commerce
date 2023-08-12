package com.ecomm.groupproject.repositories;

import com.ecomm.groupproject.models.Wishlist;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface WishlistRepository extends CrudRepository<Wishlist, Long> {
    List<Wishlist> findAll();
    Optional<Wishlist> findById(Long id);
    Wishlist findByUserId(Long userId);
}