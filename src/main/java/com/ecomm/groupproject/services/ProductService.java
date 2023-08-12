package com.ecomm.groupproject.services;

import com.ecomm.groupproject.models.Category;
import com.ecomm.groupproject.models.Product;
import com.ecomm.groupproject.repositories.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;


    public void addCategory(Product product, Category category){
        List<Category> categories= (List<Category>) product.getCategory();
        categories.add(category);
        productRepository.save(product);
    }

    public Product create(Product product){
        return productRepository.save(product);
    }
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    // these 2 are the same
    public List<Product> getByCategory(Category category){
        return productRepository.findByCategory(category);
    }
    public List<Product> getByCategoryName(Category category){
        return productRepository.findByCategory(category);
    }
    //
    public Product getProductById(Long id){
        return this.productRepository.findById(id).orElse(null);
    }
    public void deleteProduct(Long id){
        productRepository.deleteById(id);
    }
    public Product find(Long id){
        return productRepository.findById(id).orElse(null);
    }
    public void update(Product product) {
        productRepository.save(product);
    }

}