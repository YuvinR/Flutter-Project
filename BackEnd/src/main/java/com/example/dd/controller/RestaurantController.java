package com.example.dd.controller;

import com.example.dd.entity.Restaurant;
import com.example.dd.models.RestaurantModel;
import com.example.dd.services.RestaurantService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/")
public class RestaurantController {

    private RestaurantService restaurantService;

    public RestaurantController(RestaurantService restaurantService) {
        this.restaurantService = restaurantService;
    }

    @RequestMapping(value = "newRestaurant", method = RequestMethod.POST)
    public RestaurantModel RegisterNewRestaurant(@RequestBody RestaurantModel restaurantModel){
        return restaurantService.RegisterNewRestaurant(restaurantModel);
    }

    @RequestMapping(value = "getAllRestaurants", method = RequestMethod.GET)
    public List<Restaurant> GetAllRestaurants(){
        return restaurantService.GetAllRestaurants();
    }
}
