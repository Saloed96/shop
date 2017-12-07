package edu.karazin.shop.web;

import edu.karazin.shop.model.Product;
import edu.karazin.shop.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("product")
public class ProductEditController {

    private static final Logger log = LoggerFactory.getLogger(ProductEditController.class);

    private final ProductService productService;

    public ProductEditController(@Autowired ProductService productService) {
        this.productService = productService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String newProduct(Model model) {
        log.info("Render form for new product");

        model.addAttribute("product", new Product(null, "", ""));
        return "product-edit";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/edit/{id}")
    public String editProduct(Model model, @PathVariable("id") Long productId) {
        log.info("Edit product");

        Product p = productService.getProduct(productId);
        if (p == null) {
            throw new NotFoundException();
        }

        model.addAttribute("product", p);
        return "product-edit";
    }


    @RequestMapping(method = RequestMethod.GET, value = "/delete/{id}")
    public String deleteProduct(Model model, @PathVariable("id") Long productId) {
        log.info("Delete product");
        productService.removeProduct(productId);
        return "redirect:/products";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String addProduct(Model model, Product product) {
        log.info("Add product");
        productService.addProduct(product);
        return "redirect:/products";
    }

    @RequestMapping(method = RequestMethod.POST, path = "/edit/{id}")
    public String updateProduct(Model model, Product product) {
        log.info("Update product");
        productService.updateProduct(product);
        return "redirect:/products";
    }
}
