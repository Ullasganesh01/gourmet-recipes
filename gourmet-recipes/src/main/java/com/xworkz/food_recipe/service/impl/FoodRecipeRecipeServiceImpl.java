package com.xworkz.food_recipe.service.impl;

import com.xworkz.food_recipe.dto.*;
import com.xworkz.food_recipe.repository.FoodRecipeRepository;
import com.xworkz.food_recipe.service.FoodRecipeRecipeService;
import com.xworkz.food_recipe.service.FoodRecipeUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FoodRecipeRecipeServiceImpl implements FoodRecipeRecipeService {

    @Autowired
    private FoodRecipeRepository repository;

    @Autowired
    private FoodRecipeUserService userService;

    @Override
    public boolean validateAndAddRecipe(RecipeDto dto) {
        if (dto!=null){
            List<IngredientsDto> ingredientsList = new ArrayList<>();
            for (IngredientsDto ingredient : dto.getIngredients()) {
                ingredient.setRecipe(dto);
                ingredientsList.add(ingredient);
            }
            dto.setIngredients(ingredientsList);

            List<RecipeStepsDto> recipeStepsList = new ArrayList<>();
            for (RecipeStepsDto step : dto.getRecipeSteps()) {
                step.setRecipe(dto);
                recipeStepsList.add(step);
            }
            dto.setRecipeSteps(recipeStepsList);

            UserDto userDto = userService.validateAndFetchUserById(dto.getAddedBy());

            dto.setPostedBy(userDto.getFirstName()+" "+userDto.getLastName());
            dto.setUpdatedOn(LocalDateTime.now());
            return repository.addRecipe(dto);
        }
        return false;
    }

    @Override
    public RecipeDto validateAndFetchRecipe(int id) {
        if (id>0){
            RecipeDto dto = repository.fetchRecipeById(id);
            if (dto!=null){
                return dto;
            }
        }
        return null;
    }

    @Override
    public List<RecipeDto> validateAndFetchAllRecipes() {
        List<RecipeDto> recipeList = repository.fetchAllRecipes();
        if (recipeList!=null){
            return recipeList;
        }
        return null;
    }

    @Override
    public List<RecipeDto> validateAndFetchRecipeByUserId(int userId) {
        if (userId>0){
            List<RecipeDto> recipeList = repository.fetchRecipesByUserId(userId);
            if (recipeList!=null){
                return recipeList;
            }
        }
        return null;
    }

    @Override
    public List<RecipeDto> validateFetchRecipeByName(String recipeName) {
        if (recipeName!=null&&!recipeName.isEmpty()){
            List<RecipeDto> recipeList = repository.fetchRecipeByRecipeName(recipeName);
            if (recipeList!=null){
                return recipeList;
            }
        }
        return null;
    }

    @Override
    public boolean validateAndUpdateAvgRatingsAndTotalReviews(int recipeId, int avgRatings, int totalReviews) {
        if (recipeId>0){
            return repository.updateAvgRatingsAndTotalReviews(recipeId,avgRatings,totalReviews);
        }
        return false;
    }

    @Override
    public boolean validateAndUpdateRecipe(RecipeDto dto) {
        if (dto!=null){
            List<IngredientsDto> ingredientsList = new ArrayList<>();
            for (IngredientsDto ingredient : dto.getIngredients()) {
                ingredient.setRecipe(dto);
                ingredientsList.add(ingredient);
            }
            dto.setIngredients(ingredientsList);

            List<RecipeStepsDto> recipeStepsList = new ArrayList<>();
            for (RecipeStepsDto step : dto.getRecipeSteps()) {
                step.setRecipe(dto);
                recipeStepsList.add(step);
            }
            dto.setRecipeSteps(recipeStepsList);

            if (repository.deleteIngOnRecipeUpdateByRecipeId(dto.getRecipeId()) && repository.deleteStepsOnRecipeUpdateByRecipeId(dto.getRecipeId())){
                dto.setUpdatedOn(LocalDateTime.now());
            }
            return repository.updateRecipe(dto);

        }
        return false;
    }

    @Override
    public boolean validateAndUpdateLikesCount(int recipeId) {
        if (recipeId>0){
            RecipeDto dto = repository.fetchRecipeById(recipeId);
            int likes = getLikesCount(dto);
            if (likes>=0){
                return repository.updateRecipeLikes(recipeId,likes);
            }
        }
        return false;
    }

    @Override
    public boolean validateAndUpdateLikes(int recipeId, RecipeLikesDto likesDto){
        if (recipeId>0 && likesDto!=null){
            return repository.updateLikes(recipeId,likesDto);
        }
        return false;
    }

    @Override
    public boolean validateAndRemoveRecipe(int id) {
        if (id>0){
            return repository.removeRecipe(id);
        }
        return false;
    }

    @Override
    public List<RecipeDto> filterRecipeOnPublished(List<RecipeDto> recipeList){
        return recipeList.stream().filter(recipe -> recipe.isPosted()==true).collect(Collectors.toList());
    }

    @Override
    public List<RecipeDto> sortRecipeOnRecentlyUpdated(List<RecipeDto> recipeList){
        return recipeList.stream().sorted(Comparator.comparing(RecipeDto::getUpdatedOn).reversed()).collect(Collectors.toList());
    }

    @Override
    public List<RecipeDto> filterRecipesByName(List<RecipeDto> recipes, String filterName) {
        return recipes.stream()
                .filter(recipe -> recipe.getRecipeName().contains(filterName))
                .collect(Collectors.toList());
    }

    @Override
    public List<RecipeDto> filterRecipes(String filter) {
        if (!filter.isEmpty()){
            return repository.filterRecipes(filter);
        }
        return validateAndFetchAllRecipes();
    }

    @Override
    public List<RecipeDto> filterRecipeByUserId(List<RecipeDto> recipeList,int userId){
        if (!recipeList.isEmpty()){
            return recipeList.stream().filter(recipe -> recipe.getAddedBy() == userId).collect(Collectors.toList());
        }
        return validateAndFetchRecipeByUserId(userId);
    }

    @Override
    public int getLikesCount(RecipeDto recipeDto){
        List<RecipeLikesDto> likesList = recipeDto.getRecipeLikes();
        likesList = likesList.stream().filter(recipe -> recipe.isLiked() == true).collect(Collectors.toList());
        return (int)likesList.stream().count();
    }
}
