package com.xworkz.food_recipe.repository;

import com.xworkz.food_recipe.dto.*;

import java.util.List;

public interface FoodRecipeRepository {
    boolean registerUser(UserDto dto);
    boolean registerUserAudit(AuditDto dto);

    UserDto getUserByEmail(String email);
    UserDto getUserByLoginId(String loginId);
    UserDto getUserById(int id);
    AuditDto getAuditByUserId(int id);

    boolean updateUser(UserDto dto);
    boolean updateAuditOnUpdateUser(AuditDto dto);

    boolean deleteAuditOnDeleteUser(int id);

    List<UserDto> fetchAllUsers();
    List<String> fetchAllUserEmails();
    List<Long> fetchAllUserContactNo();
    List<String> fetchUserEmailsExcept(int id);
    List<Long> fetchUserContactNoExcept(int id);

    List<UserDto> filterUsers(String filter);

    boolean addRecipe(RecipeDto dto);
    boolean removeRecipe(int id);
    boolean updateRecipe(RecipeDto dto);

    RecipeDto fetchRecipeById(int id);
    List<RecipeDto> fetchRecipesByUserId(int userId);
    List<RecipeDto> fetchRecipeByRecipeName(String recipeName);

    List<RecipeDto> fetchAllRecipes();
    List<RecipeDto> filterRecipes(String filter);

    boolean deleteIngOnRecipeUpdateByRecipeId(int recipeId);
    boolean deleteStepsOnRecipeUpdateByRecipeId(int recipeId);

    boolean saveReview(RecipeReviewDto dto);
    List<RecipeReviewDto> getAllReviews();
    List<RecipeReviewDto> getAllReviewsOnRecipeId(int recipeId);

    boolean updateAvgRatingsAndTotalReviews(int recipeId, int avgRatings, int totalReviews);
    boolean updateRecipeLikes(int recipeId,int likes);

    boolean updateLikes(int recipeId,RecipeLikesDto likesDto);
}
