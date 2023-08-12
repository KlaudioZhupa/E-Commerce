package com.ecomm.groupproject.repositories;

import com.ecomm.groupproject.models.Category;
import com.ecomm.groupproject.models.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
    List<Product> findAll();
    List<Product> findByCategory(Category category);
}

