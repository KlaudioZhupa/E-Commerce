package com.ecomm.groupproject.controllers;

import com.ecomm.groupproject.models.Order;
import com.ecomm.groupproject.services.OrderService;
import org.springframework.ui.Model;
import com.ecomm.groupproject.models.ChargeRequest;
import com.ecomm.groupproject.services.StripeService;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import lombok.extern.java.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.naming.AuthenticationException;

@Log
@Controller
public class ChargeController {

    @Autowired
    StripeService paymentsService;
    @Autowired
    private OrderService orderService;

    @PostMapping("/charge")
    public String charge(
            @RequestParam(name = "amount") double amount,
            @RequestParam(name = "stripeToken") String stripeToken,
            Model model) {
        ChargeRequest chargeRequest = new ChargeRequest();
        chargeRequest.setDescription("Example charge");
        chargeRequest.setCurrency(ChargeRequest.Currency.EUR);
        chargeRequest.setAmount((int) (amount * 100)); // Convert amount to cents
        chargeRequest.setStripeToken(stripeToken);

        try {
            Charge charge = paymentsService.charge(chargeRequest);
            model.addAttribute("id", charge.getId());
            model.addAttribute("status", charge.getStatus());
            model.addAttribute("chargeId", charge.getId());
            model.addAttribute("balance_transaction", charge.getBalanceTransaction());



            // Create an Order instance
            Order order = new Order();
            order.setTotalAmount(amount);
            // ... set other relevant attributes

            // Save the order to your database
            orderService.save(order);
            return "result.jsp";
        } catch (StripeException e) {
            model.addAttribute("error", e.getMessage());
            return "result.jsp";
        } catch (AuthenticationException e) {
            throw new RuntimeException(e);
        }
    }

    @ExceptionHandler(StripeException.class)
    public String handleError(Model model, StripeException ex) {
        model.addAttribute("error", ex.getMessage());
        return "result.jsp";
    }
}
