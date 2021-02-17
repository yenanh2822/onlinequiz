/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.cart;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author AnhHY
 */
public class CartObj {

    private List<CartDTO> items;
    private Float totalAmount;

    public CartObj() {
        items = new ArrayList<>();
    }

    public CartObj(List<CartDTO> items, Float totalAmount) {
        this.items = items;
        this.totalAmount = totalAmount;
    }

    public List<CartDTO> getItems() {
        return items;
    }

    public void setItems(List<CartDTO> items) {
        this.items = items;
    }

    public Double getTotalAmount() {
        Double total = 0D;
        for (CartDTO item : this.items) {
            total += item.getPrice() * item.getCount();
        }
        return total;
    }

    public void setTotalAmount(Float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public void addNewItem(CartDTO dto) {
        this.items.add(dto);
    }

    public void deleteItem(Integer productID) {
        for (CartDTO cartDTO : items) {
            if (cartDTO.getProductID().equals(productID)) {
                items.remove(cartDTO);
                break;
            }
        }
    }

    public void increaseItem(Integer productID) {
        for (CartDTO cartDTO : items) {
            if (cartDTO.getProductID().equals(productID)) {
                cartDTO.setCount(cartDTO.getCount() +  1);
                break;
            }
        }
    }

    public void decreaseItem(Integer productID) {
        for (CartDTO cartDTO : items) {
            if (cartDTO.getProductID().equals(productID)) {
                cartDTO.setCount(cartDTO.getCount() - 1);
                if(cartDTO.getCount() == 0){
                    deleteItem(productID);
                }
                break;
            }
        }
    }
}
