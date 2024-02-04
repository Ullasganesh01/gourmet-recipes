package com.xworkz.food_recipe.dto;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "recipe_likes",uniqueConstraints = {
        @UniqueConstraint(columnNames = {"liked_by", "recipe_id"})
})
@NamedQueries({
        @NamedQuery(name = "getLikeByUserIdAndRecipeId",query = "from RecipeLikesDto dto where dto.likedBy=:userId and dto.recipe.recipeId=:recipeId")
})
public class RecipeLikesDto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "like_id")
    private int likeId;

//    @NotNull
//    @Column(name = "recipe_id")
//    private int recipeId;

    @ManyToOne
    @JoinColumn(name = "recipe_id")
    private RecipeDto recipe;

    @NotNull
    private boolean liked;

    @NotNull
    @Column(name = "liked_by")
    private int likedBy;


    @Override
    public String toString() {
        return "RecipeLikesDto{" +
                "likeId=" + likeId +
                ", liked=" + liked +
                ", likedBy=" + likedBy +
                '}';
    }
}
