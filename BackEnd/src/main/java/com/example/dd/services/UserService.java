package com.example.dd.services;

import com.example.dd.entity.User;
import com.example.dd.models.UserModel;
import com.example.dd.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User RegisterNeUser(UserModel user) {

        User userObject = new User();
        userObject.setUserID(user.getUserID());
        userObject.setUserName(user.getUserName());

        return userRepository.save(userObject);

    }

}
