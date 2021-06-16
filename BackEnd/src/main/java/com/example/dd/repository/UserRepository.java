package com.example.dd.repository;

import com.example.dd.entity.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends MongoRepository<User, String> {
    User findUserByUserName(String userName);
    User findUserByUserNameAndPassword(String userName, String password);
}
