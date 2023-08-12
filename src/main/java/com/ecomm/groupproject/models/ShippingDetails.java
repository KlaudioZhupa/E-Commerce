package com.ecomm.groupproject.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "shipping_details")
public class ShippingDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "First name is required!")
    private String firstName;

    @NotBlank(message = "Last name is required!")
    private String lastName;

    @NotBlank(message = "Address 1 is required!")
    private String address1;

    private String address2;

    @NotBlank(message = "Country is required!")
    private String country;

    @NotBlank(message = "City is required!")
    private String city;

    @NotBlank(message = "Zip code is required!")
    private String zipCode;

    @NotBlank(message = "Phone number is required!")
    private String phoneNumber;

    @OneToOne(mappedBy="shippingDetails", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private User user;

}
