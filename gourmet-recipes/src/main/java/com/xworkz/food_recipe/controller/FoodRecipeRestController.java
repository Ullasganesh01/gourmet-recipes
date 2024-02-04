package com.xworkz.food_recipe.controller;

import com.xworkz.food_recipe.dto.RecipeLikesDto;
import com.xworkz.food_recipe.service.FoodRecipeRestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/rest/")
public class FoodRecipeRestController {

    @Autowired
    public FoodRecipeRestService restService;

    @GetMapping("checkEmail")
    public String checkEmail(@RequestParam String userEmail){
        if(restService.checkEmail(userEmail)){
            return "true";
        }
        return "false";
    }

    @GetMapping("checkContactNo")
    public String checkContactNo(@RequestParam Long contactNo){
        if (restService.checkContactNo(contactNo)){
            return "true";
        }
        return "false";
    }

    @GetMapping("checkEmailExcept")
    public String checkEmailExcept(@RequestParam String userEmail,@RequestParam int userId){
        if(restService.checkEmailExcept(userEmail,userId)){
            return "true";
        }
        return "false";
    }

    @GetMapping("checkContactNoExcept")
    public String checkContactNoExcept(@RequestParam Long contactNo,@RequestParam int userId){
        if(restService.checkContactNoExcept(contactNo,userId)){
            return "true";
        }
        return "false";
    }

}
