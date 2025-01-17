package com.vanlang.doancuoiki.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vanlang.doancuoiki.domain.Cart;
import com.vanlang.doancuoiki.domain.CartDetail;
import com.vanlang.doancuoiki.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    boolean existsByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProduct(Cart cart, Product product);
}
