/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.dto;

import java.io.Serializable;

/**
 *
 * @author AnhHY
 */
public class OrderDetailDTO implements Serializable {

    private int id;
    private int productId;
    private int orderId;
    private int quantity;
    private String productName;
    private Float productPrice;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int productId, int quantity) {
        this.productId = productId;
        this.quantity = quantity;
    }

    public OrderDetailDTO(int id, int quantity, int orderId, String productName, Float productPrice) {
        this.id = id;
        this.quantity = quantity;
        this.productName = productName;
        this.productPrice = productPrice;
        this.orderId = orderId;
    }    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Float getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Float productPrice) {
        this.productPrice = productPrice;
    }

    
}
