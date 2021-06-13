package com.example.dd.repository;

import com.example.dd.entity.Restaurant;
import com.example.dd.entity.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RestaurantRepository extends MongoRepository<Restaurant, String> {
}
