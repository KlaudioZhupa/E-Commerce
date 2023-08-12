package com.ecomm.groupproject.controllers;

import com.ecomm.groupproject.models.*;
import com.ecomm.groupproject.services.*;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;


    @GetMapping("/home")
    public String dashboard(HttpSession session, Model model) {
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null) {
            return "redirect:/";
        }
        User loggedInUser=userService.findUserById(loggedInUserId);
        model.addAttribute("user",loggedInUser);
        model.addAttribute("categories", categoryService.getAll());
        model.addAttribute("orders", orderService.getAll());
        return "viewOrders.jsp";
    }

    @GetMapping("/newCat")
    public String addCategory(@ModelAttribute("newCategory") Category newCategory, HttpSession session, Model model) {
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null) {
            return "redirect:/";
        }
        model.addAttribute("category", categoryService.getAll());
        return "newCategory.jsp";
    }

    @PostMapping("/newCategory")
    public String createCategory(@Valid@ModelAttribute("newCategory") Category newCategory, BindingResult result, Model model) {
        Category category=categoryService.create(newCategory,result);
        if (result.hasErrors()) {
            return "newCategory.jsp";
        }
        return "redirect:/admin/newCat";
    }

    @GetMapping("/newP")
    public String addCategory(@ModelAttribute("newProduct") Product newProduct, HttpSession session, Model model) {
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null) {
            return "redirect:/";
        }
        model.addAttribute("category", categoryService.getAll());
        return "newProduct.jsp";
    }
    @PostMapping("/newProduct")
    public String createProduct(@Valid@ModelAttribute("newProduct") Product newProduct, BindingResult result, @RequestParam Long categoryId, Model model) {
        if (result.hasErrors()) {
            return "newProduct.jsp";
        }
        Category category = categoryService.findById(categoryId);
        newProduct.setCategory(category);
        productService.create(newProduct);
        return "redirect:/admin/home";
    }

    @GetMapping("/category/{id}")
    public String getByCategory(@PathVariable("id")Long id, Model model, HttpSession session){
        Long loggedInUserId = (Long) session.getAttribute("loggedInUserId");
        if (loggedInUserId == null) {
            return "redirect:/";
        }
        Category category=categoryService.findById(id);
        model.addAttribute("products", productService.getByCategory(category));
        model.addAttribute("category", categoryService.getAll());
        return "viewByCategory.jsp";
    }

    @DeleteMapping("/{id}/delete")
    public String delete(@PathVariable("id")Long id, HttpSession session){
        productService.deleteProduct(id);
        return "redirect:/admin/home";
    }

    @DeleteMapping("/{id}/deleteCat")
    public String deleteCat(@PathVariable("id")Long id, HttpSession session){
        categoryService.deleteCategory(id);
        return "redirect:/admin/newCat";
    }

    @GetMapping("/{id}/edit")
    public String editProduct(@PathVariable("id") Long id, HttpSession session, Model model) {
        if (session.getAttribute("loggedInUserId") == null) {
            return "redirect:/";
        }
        Product editProduct = productService.find(id);
        model.addAttribute("category", categoryService.getAll());
        model.addAttribute("editProduct", editProduct);
        return "editP.jsp";
    }

    @PostMapping("/edit/{id}")
    public String edit(@Valid @ModelAttribute("editProduct") Product editProduct, BindingResult result, @PathVariable("id") Long id) {
        if (result.hasErrors()) {
            return "editP.jsp";
        } else {
            Product existingProduct=productService.find(id);
            Category category = categoryService.findById(editProduct.getCategory().getId());
            existingProduct.setProductName(editProduct.getProductName());
            existingProduct.setBrand(editProduct.getBrand());
            existingProduct.setColor(editProduct.getColor());
            existingProduct.setDescription(editProduct.getDescription());
            existingProduct.setPrice(editProduct.getPrice());
            existingProduct.setQuantity(editProduct.getQuantity());
            existingProduct.setImage(editProduct.getImage());
            existingProduct.setCategory(category);
            productService.update(existingProduct);
            return "redirect:/admin/home";
        }
    }

    @GetMapping("/orderDetails/{id}")
    public String orderDetails(@PathVariable("id") Long id, Model model,HttpSession session){
        if (session.getAttribute("loggedInUserId") == null) {
            return "redirect:/";
        }
        Order order=orderService.findById(id);
        model.addAttribute("order", order);
        model.addAttribute("categories", categoryService.getAll());
        return "viewOrderDetails.jsp";
    }

}