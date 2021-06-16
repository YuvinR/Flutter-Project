package com.example.dd.models;

public class RestaurantModel {
    private String id;
    private String restaurantName;
    private String rate;
    private String location;
    private String phoneNumber;

    public String getRestaurantId() {
        return id;
    }

    public void setRestaurantId(String restaurantId) {
        this.id = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
