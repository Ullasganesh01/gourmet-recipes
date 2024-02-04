package com.xworkz.food_recipe.service.impl;

import com.xworkz.food_recipe.repository.FoodRecipeRepository;
import com.xworkz.food_recipe.service.FoodRecipeRestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FoodRecipeRestServiceImpl implements FoodRecipeRestService {
    @Autowired
    private FoodRecipeRepository repository;

    @Override
    public boolean checkEmail(String email) {
        if (email!=null && !email.isEmpty()){
            List<String> userEmails =  repository.fetchAllUserEmails();
            if (userEmails!=null && !userEmails.isEmpty()){
                for (String emails : userEmails){
                    if (emails.equals(email)){
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override
    public boolean checkContactNo(long contactNo) {
        if (contactNo>1000000000){
            List<Long> userContactList =  repository.fetchAllUserContactNo();
            if (userContactList!=null && !userContactList.isEmpty()){
                for (Long contacts : userContactList){
                    if (contacts.equals(contactNo)){
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override
    public boolean checkEmailExcept(String email, int id) {
        if (email!=null && !email.isEmpty()){
            List<String> userEmails =  repository.fetchUserEmailsExcept(id);
            if (userEmails!=null && !userEmails.isEmpty()){
                for (String emails : userEmails){
                    if (emails.equals(email)){
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override
    public boolean checkContactNoExcept(long contactNo, int id) {
        if (contactNo>1000000000){
            List<Long> userContactList =  repository.fetchUserContactNoExcept(id);
            if (userContactList!=null && !userContactList.isEmpty()){
                for (Long contacts : userContactList){
                    if (contacts.equals(contactNo)){
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
