package com.xworkz.food_recipe.service;

import com.xworkz.food_recipe.dto.RecipeDto;
import com.xworkz.food_recipe.dto.RecipeLikesDto;

import java.util.List;

public interface FoodRecipeRecipeService {
    boolean validateAndAddRecipe(RecipeDto dto);

    RecipeDto validateAndFetchRecipe(int id);
    List<RecipeDto> validateAndFetchAllRecipes();
    List<RecipeDto> validateAndFetchRecipeByUserId(int userId);
    List<RecipeDto> validateFetchRecipeByName(String recipeName);

    boolean validateAndUpdateAvgRatingsAndTotalReviews(int recipeId,int avgRatings,int totalReviews);
    boolean validateAndUpdateRecipe(RecipeDto dto);
    boolean validateAndUpdateLikesCount(int recipeId);
    boolean validateAndUpdateLikes(int recipeId, RecipeLikesDto likesDto);
    int getLikesCount(RecipeDto recipeDto);

    boolean validateAndRemoveRecipe(int id);

    List<RecipeDto> filterRecipeOnPublished(List<RecipeDto> recipeList);
    List<RecipeDto> sortRecipeOnRecentlyUpdated(List<RecipeDto> recipeList);
    List<RecipeDto> filterRecipesByName(List<RecipeDto> recipes, String filterName);
    List<RecipeDto> filterRecipes(String filter);
    List<RecipeDto> filterRecipeByUserId(List<RecipeDto> recipeList,int userId);


}
