package com.xworkz.food_recipe.service.impl;

import com.xworkz.food_recipe.dto.RecipeReviewDto;
import com.xworkz.food_recipe.repository.FoodRecipeRepository;
import com.xworkz.food_recipe.service.FoodRecipeReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FoodRecipeReviewServiceImpl implements FoodRecipeReviewService {

    @Autowired
    private FoodRecipeRepository repository;

    private boolean validateReview(RecipeReviewDto dto){
        if (dto.getRatings()>0 && dto.getReviewerId()>0 && !dto.getReviewBy().isEmpty()){
            return true;
        }
        return false;
    }
    @Override
    public boolean validateAndSaveReview(RecipeReviewDto dto) {
        if (validateReview(dto)){
            LocalDate date = LocalDate.now();
            String month = date.getMonth()+"";
            String myDate = date.getDayOfMonth() + " " + month.substring(0,3) + "," + date.getYear();
            dto.setReviewedOn(myDate);
            return repository.saveReview(dto);
        }
        return false;
    }

    @Override
    public List<RecipeReviewDto> validateAndGetAllReviews() {
        List<RecipeReviewDto> reviewList = repository.getAllReviews();
        if (reviewList!=null && !reviewList.isEmpty()){
            return reviewList;
        }
        return null;
    }

    @Override
    public List<RecipeReviewDto> validateAndGetAllReviewsOnRecipeId(int recipeId) {
        if (recipeId>0){
            List<RecipeReviewDto> reviewList = repository.getAllReviewsOnRecipeId(recipeId);
            if (reviewList!=null && !reviewList.isEmpty()){
                return reviewList;
            }
        }
        return null;
    }

    @Override
    public int getAverageRatings(List<RecipeReviewDto> reviewList){
        List<Integer> ratingList = reviewList.stream().map(RecipeReviewDto::getRatings).collect(Collectors.toList());
        double avg = ratingList.stream().collect(Collectors.averagingInt(Integer::intValue));
        return (int) Math.round(avg);
    }

    @Override
    public int getTotalReviews(List<RecipeReviewDto> reviewList){
        return (int) reviewList.stream().count();
    }
}
