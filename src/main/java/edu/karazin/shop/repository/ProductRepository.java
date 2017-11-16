package edu.karazin.shop.repository;

import edu.karazin.shop.model.Product;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

public interface ProductRepository extends CrudRepository<Product, Long> {

    Iterable<Product> getAllByTitle(String title);
//
//    Iterable<Product> getAllByTitleAndBalanceOrderByBalance(String title, int balance);

}
