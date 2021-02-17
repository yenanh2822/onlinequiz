/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.cart;

/**
 *
 * @author AnhHY
 */
public class CartDTO {

    private Integer productID;
    private String productName;
    private Float price;
    private Integer count;
    private Integer quantity;

    public CartDTO() {
    }

    public CartDTO(Integer productID, String productName, Float price, Integer count, Integer quantity) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.count = count;
        this.quantity = quantity;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    

    public Integer getProductID() {
        return productID;
    }

    public void setProductID(Integer productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
    
    
}
