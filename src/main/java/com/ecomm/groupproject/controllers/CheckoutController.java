package com.ecomm.groupproject.controllers;

import org.springframework.ui.Model;
import com.ecomm.groupproject.models.ChargeRequest;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




    @Controller
    public class CheckoutController {

        @Value("${STRIPE_PUBLIC_KEY}")
        private String stripePublicKey;

        // Other properties and constructor

        @RequestMapping("/checkout")
        public String checkout(Model model) {
            model.addAttribute("amount", 50 * 100); // in cents
            model.addAttribute("stripePublicKey", stripePublicKey);
            model.addAttribute("currency", ChargeRequest.Currency.EUR);
            return "checkout.jsp";
        }
    }