package com.ecomm.groupproject.repositories;

import com.ecomm.groupproject.models.Category;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long> {

    Optional<Category> findByName(String name);
    Optional<Category> findCategoryByProductId(Long id);

}