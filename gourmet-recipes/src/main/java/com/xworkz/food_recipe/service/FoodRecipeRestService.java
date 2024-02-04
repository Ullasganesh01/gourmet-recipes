package com.xworkz.food_recipe.service;

public interface FoodRecipeRestService {
    boolean checkEmail(String email);
    boolean checkContactNo(long contactNo);
    boolean checkEmailExcept(String email,int id);
    boolean checkContactNoExcept(long contactNo,int id);
}
