package com.xworkz.food_recipe.dto;

import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "recipe_steps")
@NamedQueries({
        @NamedQuery(name = "deleteStepsOnRecipeUpdateByRecipeId",query = "delete from RecipeStepsDto dto where dto.recipe.recipeId =: recipeId")
})
public class RecipeStepsDto {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "steps_id")
    private int stepsId;

    @Column(name = "step_no")
    private int stepNo;

    @Column(name = "description")
    private String stepDescription;

    @ManyToOne
    @JoinColumn(name = "recipe_id")
    private RecipeDto recipe;

    @Override
    public String toString() {
        return "RecipeStepsDto{" +
                "stepsId=" + stepsId +
                ", stepNo=" + stepNo +
                ", stepDescription='" + stepDescription + '\'' +
                '}';
    }
}
