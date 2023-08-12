package com.ecomm.groupproject.repositories;

import com.ecomm.groupproject.models.CartItem;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface CartItemRepository extends CrudRepository<CartItem, Long> {

    List<CartItem> findAll();
    Optional<CartItem> findById(Long id);
    CartItem findByProductId(Long id);
    List<CartItem> findByShoppingCartId(Long id);

}