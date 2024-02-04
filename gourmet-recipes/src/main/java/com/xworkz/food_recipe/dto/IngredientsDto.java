package com.xworkz.food_recipe.dto;

import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "ingredients")
@NamedQueries({
        @NamedQuery(name = "deleteIngOnRecipeUpdateByRecipeId",query = "delete from IngredientsDto dto where dto.recipe.recipeId =: recipeId")
})
public class IngredientsDto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ingredient_id")
    private int ingredientId;

    @Column(name = "quantity")
    private String ingredientQuantity;

    @Column(name = "ingredient_name")
    private String ingredientName;

    @ManyToOne
    @JoinColumn(name = "recipe_id")
    private RecipeDto recipe;

    @Override
    public String toString() {
        return "IngredientsDto{" +
                "ingredientId=" + ingredientId +
                ", ingredientQuantity='" + ingredientQuantity + '\'' +
                ", ingredientName='" + ingredientName + '\'' +
                '}';
    }
}
