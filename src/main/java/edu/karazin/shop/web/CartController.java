package edu.karazin.shop.web;

import edu.karazin.shop.service.CartStore;
import edu.karazin.shop.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("cart")
public class CartController {

    private static final Logger log = LoggerFactory.getLogger(CartController.class);

    private final ProductService productService;

    private final CartStore cartStore;

    public CartController(@Autowired ProductService productService, @Autowired CartStore cartStore) {
        this.productService = productService;
        this.cartStore = cartStore;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("products", cartStore.getProducts());
        return cartStore.getProducts().isEmpty() ? "redirect:/products" : "cart-list";
    }

    @RequestMapping(method = RequestMethod.GET, params = "add")
    public String addProduct(@RequestParam("prodId") Long prodId, Model model) {
        log.info("addProduct :" + model);
        cartStore.addProduct(productService.getProduct(prodId));
        return list(model);
    }

    @RequestMapping(method = RequestMethod.GET, params = "delete")
    public String removeProduct(@RequestParam("prodId") Long prodId, Model model) {
        log.info("Remove product " + prodId + " from cart " + model);
        cartStore.removeProduct(productService.getProduct(prodId));
//        return cartStore.getProducts().isEmpty()
        return list(model);
    }
}