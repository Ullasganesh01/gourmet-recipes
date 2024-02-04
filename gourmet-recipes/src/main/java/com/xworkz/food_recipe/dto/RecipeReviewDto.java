package com.xworkz.food_recipe.dto;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Data
@Entity
@Table(name = "recipe_reviews")
@NamedQueries({
        @NamedQuery(name = "getAllReviews",query = "from RecipeReviewDto dto"),
        @NamedQuery(name = "getAllReviewsOnRecipeId",query = "from RecipeReviewDto dto where dto.recipeId =: recipeId")
})
public class RecipeReviewDto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "review_id")
    private int reviewId;

    @NotNull
    @Min(value = 1)
    @Max(value = 5)
    private int ratings;

    private String review;

    @NotNull
    private int recipeId;

    @NotNull
    private String reviewBy;

    @NotNull
    private int reviewerId;

    @NotNull
    private String reviewedOn;
}
