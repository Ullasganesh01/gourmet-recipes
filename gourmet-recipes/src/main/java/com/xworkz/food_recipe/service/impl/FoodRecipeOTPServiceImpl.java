package com.xworkz.food_recipe.service.impl;

import com.xworkz.food_recipe.service.FoodRecipeOTPService;
import org.springframework.stereotype.Service;

@Service
public class FoodRecipeOTPServiceImpl implements FoodRecipeOTPService {

    @Override
    public String generateOTP() {
        int randomPin = (int)(Math.random()*9000)+1000;
        return String.valueOf(randomPin);
    }

    @Override
    public boolean verifyOTP(String otp,int id) {
        if (otp!=null && !otp.isEmpty() && id>0){
            if(otpMap.containsKey(id)){
                if(otpMap.get(id).equals(otp)){
                    otpMap.remove(id);
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    public boolean addOtpTOMap(String otp,int id) {
        if (otp!=null && !otp.isEmpty() && id>0){
            otpMap.put(id,otp);
            if (otpMap.containsKey(id)){
                return true;
            }
        }
        return false;
    }
}
