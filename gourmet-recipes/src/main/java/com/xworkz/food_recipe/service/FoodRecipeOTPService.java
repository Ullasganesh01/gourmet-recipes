package com.xworkz.food_recipe.service;

import java.util.HashMap;
import java.util.Map;

public interface FoodRecipeOTPService {
    Map<Integer,String> otpMap = new HashMap<>();
    String generateOTP();
    boolean verifyOTP(String otp,int id);
    boolean addOtpTOMap(String otp,int id);
}
