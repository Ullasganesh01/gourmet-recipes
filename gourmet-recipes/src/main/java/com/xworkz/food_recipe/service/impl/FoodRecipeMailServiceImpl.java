package com.xworkz.food_recipe.service.impl;

import com.xworkz.food_recipe.configuration.MailConfiguration;
import com.xworkz.food_recipe.dto.UserDto;
import com.xworkz.food_recipe.service.FoodRecipeMailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class FoodRecipeMailServiceImpl implements FoodRecipeMailService {
    @Autowired
    public MailConfiguration mailConfiguration;

    @Override
    public boolean sendMailOnSignUp(UserDto dto) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(dto.getEmail());
            message.setSubject("Registration Successful");
            message.setText("User Name : " + dto.getFirstName().toUpperCase() + " " + dto.getLastName().toUpperCase() + " ! \n Thank You For Joining Us...");
            mailConfiguration.mailConfig().send(message);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean sendMailOnLogin(UserDto dto){
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(dto.getEmail());
            message.setSubject("Login Successful");
            message.setText("User Name : " + dto.getFirstName().toUpperCase() + " " + dto.getLastName().toUpperCase() + " !");
            mailConfiguration.mailConfig().send(message);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean sendOtpInMailToChangePassword(UserDto dto,String otp) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(dto.getEmail());
            message.setSubject("Request For Change For Password");
            message.setText("User Name : " + dto.getFirstName().toUpperCase() + " \n OTP : " + otp);
            mailConfiguration.mailConfig().send(message);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
