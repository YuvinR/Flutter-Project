package com.example.dd.services;

import com.example.dd.entity.Restaurant;
import com.example.dd.entity.User;
import com.example.dd.models.RestaurantModel;
import com.example.dd.models.UserModel;
import com.example.dd.models.UserValidationModel;
import com.example.dd.repository.RestaurantRepository;
import com.example.dd.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class RestaurantService {

    @Autowired
    private RestaurantRepository restaurantRepository;

    public RestaurantModel RegisterNewRestaurant(RestaurantModel restaurantModel) {

        Restaurant restaurantObject = new Restaurant();
        restaurantObject.setRestaurantId(restaurantModel.getRestaurantId());
        restaurantObject.setRestaurantName(restaurantModel.getRestaurantName());
        restaurantObject.setLocation(restaurantModel.getLocation());
        restaurantObject.setRate(restaurantModel.getRate());
        restaurantObject.setPhoneNumber(restaurantModel.getPhoneNumber());

        try{
            restaurantObject = restaurantRepository.save(restaurantObject);
        }catch (Exception ex){
            System.out.println("New Restaurant Exception " + ex);
            throw ex;
        }

        RestaurantModel restaurantReturnModel = new RestaurantModel();
        restaurantReturnModel.setRestaurantId(restaurantObject.getRestaurantId());
        restaurantReturnModel.setRestaurantName(restaurantObject.getRestaurantName());
        restaurantReturnModel.setLocation(restaurantObject.getLocation());
        restaurantReturnModel.setRate(restaurantObject.getRate());
        restaurantReturnModel.setPhoneNumber(restaurantObject.getPhoneNumber());

        return  restaurantReturnModel;
    };

    public List<Restaurant> GetAllRestaurants() {

        List<Restaurant> restaurantList =new ArrayList<>();

        try {
            restaurantList = restaurantRepository.findAll();
        } catch (Exception ex) {
            System.out.println("Resturant Exception " + ex);
            throw ex;
        }

        return  restaurantList;
    }

}
