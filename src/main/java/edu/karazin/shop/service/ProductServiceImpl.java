package edu.karazin.shop.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import edu.karazin.shop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.karazin.shop.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

//	private final ProductDao dao;

	@Autowired
	private ProductRepository repo;

	public ProductServiceImpl(@Autowired ProductRepository dao) {
		this.repo = dao;
	}

	@Override
	public Product getProduct(Long id) {
		return repo.findOne(id);
	}

	@Override
	public List<Product> searchProducts(String searchText) {
	    List<Product> products = new ArrayList<>();
		if (searchText == null || searchText.trim().isEmpty()) {
            repo.findAll().forEach(products::add);
            return products;
		}
        repo.getAllByTitle(searchText).forEach(products::add);
		return products;
	}

	@Override
	@Transactional
	public Long addProduct(Product prod) {
		return repo.save(prod).getId();
	}

	@Override
	@Transactional
	public void updateProduct(Product prod) {
        repo.save(prod);
	}

	@Override
	@Transactional
	public void removeProduct(Long id) {
        repo.delete(id);
	}
}
