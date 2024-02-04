package com.xworkz.food_recipe.dto;

import com.xworkz.food_recipe.constants.Cuisine;
import com.xworkz.food_recipe.constants.FoodCategory;
import com.xworkz.food_recipe.constants.FoodType;
import com.xworkz.food_recipe.constants.MealType;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

@Data
@Entity
@Table(name = "recipes")
@NamedQueries({
        @NamedQuery(name = "fetchAllRecipes",query = "from RecipeDto dto"),
        @NamedQuery(name = "fetchRecipeByUserId",query = "from RecipeDto dto where dto.addedBy=:userId"),
        @NamedQuery(name = "fetchRecipeByName",query = "from RecipeDto dto where dto.recipeName=:recipeName"),
        @NamedQuery(name = "filterRecipes",query = "from RecipeDto dto where dto.recipeName LIKE CONCAT('%',:filter,'%') OR dto.cuisine LIKE CONCAT('%',:filter,'%') OR dto.foodCategory LIKE CONCAT('%',:filter,'%') OR dto.mealType LIKE CONCAT('%',:filter,'%')")
})
public class RecipeDto implements Comparable<RecipeDto> {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int recipeId;

    @Column(name = "recipe_name")
    @NotNull
    private String recipeName;

    @Column(name = "serves")
    private int serves;

    @Column(name = "prep_time")
    private int prepTime;

    @Column(name = "total_ingredients")
    private int noOfIngredients;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "recipe")
    private List<IngredientsDto> ingredients;

    @Column(name = "total_steps")
    private int noOfSteps;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "recipe")
    private List<RecipeStepsDto> recipeSteps;

    @Column(name = "updated_on")
    private LocalDateTime updatedOn;

    @Column(name = "added_by")
    @NotNull
    private int addedBy;

    @Column(name = "posted_by")
    private String postedBy;

    @Column(name = "food_type")
    @Enumerated(EnumType.STRING)
    private FoodType foodType;

    @Column(name = "cuisine_type")
    @Enumerated(EnumType.STRING)
    private Cuisine cuisine;

    @Column(name = "food_category")
    @Enumerated(EnumType.STRING)
    private FoodCategory foodCategory;

    @Column(name = "meal_type")
    @Enumerated(EnumType.STRING)
    private MealType mealType;

    private boolean posted;

    @Column(name = "avg_ratings")
    private int averageRatings;

    @Column(name = "total_reviews")
    private int totalReviews;

    @Column(name = "total_likes")
    private int totalLikes;

    @OneToMany(cascade = CascadeType.ALL,mappedBy = "recipe")
    private List<RecipeLikesDto> recipeLikes;

    @Override
    public int compareTo(RecipeDto other) {
        return this.updatedOn.compareTo(other.updatedOn);
    }
}
