package com.example.dd.repository;

import com.example.dd.entity.User;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface UserRepository extends MongoRepository<User, Integer> {
    User getUserBy(int userID);
}
