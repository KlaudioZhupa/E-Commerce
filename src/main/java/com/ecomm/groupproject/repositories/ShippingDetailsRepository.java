package com.ecomm.groupproject.repositories;

import com.ecomm.groupproject.models.ShippingDetails;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ShippingDetailsRepository extends CrudRepository<ShippingDetails, Long> {

}
