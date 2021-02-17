/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhhy.dto;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author AnhHY
 */
public class OrderDTO implements Serializable {

    private int id;
    private int userId;
    private Date orderDate;
    private String notes;
    private String phone;
    private String email;
    private String address;
    private Float total;
    private int status;
    private List<OrderDetailDTO> orderDetailDTOs;

    public OrderDTO() {
    }

    public OrderDTO(int id, int userId, Date orderDate, String notes, String phone, String email, String address, Float total, int status) {
        this.id = id;
        this.userId = userId;
        this.orderDate = orderDate;
        this.notes = notes;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.total = total;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Float getTotal() {
        return total;
    }

    public void setTotal(Float total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<OrderDetailDTO> getOrderDetailDTOs() {
        return orderDetailDTOs;
    }

    public void setOrderDetailDTOs(List<OrderDetailDTO> orderDetailDTOs) {
        this.orderDetailDTOs = orderDetailDTOs;
    }
}
