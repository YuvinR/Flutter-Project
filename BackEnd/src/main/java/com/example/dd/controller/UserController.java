package com.example.dd.controller;

import com.example.dd.entity.User;
import com.example.dd.models.UserModel;
import com.example.dd.services.UserService;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin("*")
@RequestMapping("/")
public class UserController {

    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "user", method = RequestMethod.POST)
    public User RegisterNewUser(@RequestBody UserModel user){
        return userService.RegisterNeUser(user);
    }
}
