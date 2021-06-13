package com.example.dd.services;

import com.example.dd.entity.User;
import com.example.dd.models.UserModel;
import com.example.dd.models.UserValidationModel;
import com.example.dd.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public UserModel RegisterNeUser(UserModel user) {

        User userObject = new User();
        userObject.setUserID(user.getUserID());
        userObject.setUserName(user.getUserName());
        userObject.setPassword(user.getPassword());
        userObject.setFirstName(user.getFirstName());
        userObject.setLastName(user.getLastName());
        userObject.setPhoneNumber(user.getPhoneNumber());

        try{
            userObject = userRepository.save(userObject);
        }catch (Exception ex){
            System.out.println("New User Exception " + ex);
            throw ex;
        }

        UserModel userReturnModel = new UserModel();
        userReturnModel.setUserID(userObject.getUserID());
        userReturnModel.setUserName(userObject.getUserName());
        userReturnModel.setPassword(userObject.getPassword());
        userReturnModel.setFirstName(userObject.getFirstName());
        userReturnModel.setLastName(userObject.getLastName());
        userReturnModel.setPhoneNumber(userObject.getPhoneNumber());

        return  userReturnModel;
    };

    public Optional<User> GetUserDetailsByUserID(String UserID){

        Optional<User> userObject = Optional.of(new User());

        try{
            userObject = userRepository.findById(UserID);
        }catch (Exception ex){
            System.out.println("Get User Exception " + ex);
            throw ex;
        }

        return  userObject;
    }

    public Optional<User> GetUserDetailsByUserName(String UserName){

        Optional<User> userObject = Optional.of(new User());

        try{
            userObject = Optional.ofNullable(userRepository.findUserByUserName(UserName));
        }catch (Exception ex){
            System.out.println("Get User Exception " + ex);
            throw ex;
        }
        return  userObject;
    }

    public boolean IsValidUser(UserValidationModel validationModel) {
        Optional<User> userObject = Optional.of(new User());

        try {
            userObject = Optional.ofNullable(userRepository.findUserByUserNameAndPassword(validationModel.getUserName().toString(), validationModel.getPassword().toString()));
        } catch (Exception ex) {
            System.out.println("Valid User Exception " + ex);
            throw ex;
        }

        if (userObject.isEmpty()) {
            return false;
        }
        return true;
    }

}
