package com.xworkz.food_recipe.service;

import com.xworkz.food_recipe.dto.UserDto;

public interface FoodRecipeMailService {
    boolean sendMailOnSignUp(UserDto dto);
    boolean sendMailOnLogin(UserDto dto);
    boolean sendOtpInMailToChangePassword(UserDto dto,String otp);
}
