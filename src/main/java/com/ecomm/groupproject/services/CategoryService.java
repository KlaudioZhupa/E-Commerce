package com.ecomm.groupproject.services;

import com.ecomm.groupproject.models.Category;
import com.ecomm.groupproject.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    public Category create(Category newCategory, BindingResult result){
        if (categoryRepository.findByName(newCategory.getName()).isPresent()) {
            result.rejectValue("name", "CategoryExists", "Category already exists");
        }
        return categoryRepository.save(newCategory);
    }

    public Category findById(Long id){
        return this.categoryRepository.findById(id).orElse(null);
    }
    public List<Category> getAll(){
        return (List<Category>) categoryRepository.findAll();
    }
    public void deleteCategory(Long id){
        categoryRepository.deleteById(id);
    }
    public Category getByName(String name){
        return this.categoryRepository.findByName(name).orElse(null);
    }

}