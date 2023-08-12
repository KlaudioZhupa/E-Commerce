package com.ecomm.groupproject.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Username is required!")
    @Size(min = 3, max = 30, message = "Username must be between 3 and 30 characters")
    private String username;

    @NotEmpty(message = "Firstname is required!")
    @Size(min = 3, max = 30, message = "Firstname must be between 3 and 30 characters")
    private String firstname;

    @NotEmpty(message = "Lastname is required!")
    @Size(min = 3, max = 30, message = "Lastname must be between 3 and 30 characters")
    private String lastname;

    @NotEmpty(message = "Email is required!")
    @Email(message = "Please enter a valid email!")
    private String email;


    @NotEmpty(message = "Password is required!")
    @Size(min = 8, max = 128, message = "Password must be between 8 and 128 characters")
    private String password;

    @Transient
    @NotEmpty(message = "Confirm Password is required!")
    @Size(min = 8, max = 128, message = "Confirm Password must be between 8 and 128 characters")
    private String confirm;

    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="role_id")
    private Role role;

    @Column(updatable=false)
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Order> orders;

    @OneToOne(mappedBy="user", fetch = FetchType.LAZY)
    private ShoppingCart shoppingCart;

    @OneToOne(mappedBy="user", fetch = FetchType.LAZY)
    private Wishlist wishlist;

    @OneToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="shipping_id")
    private ShippingDetails shippingDetails;

}