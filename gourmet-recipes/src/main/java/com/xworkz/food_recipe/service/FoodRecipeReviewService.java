package com.xworkz.food_recipe.service;

import com.xworkz.food_recipe.dto.RecipeReviewDto;

import java.util.List;

public interface FoodRecipeReviewService {
    boolean validateAndSaveReview(RecipeReviewDto dto);
    List<RecipeReviewDto> validateAndGetAllReviews();
    List<RecipeReviewDto> validateAndGetAllReviewsOnRecipeId(int recipeId);

    int getAverageRatings(List<RecipeReviewDto> reviewList);
    int getTotalReviews(List<RecipeReviewDto> reviewList);
}
