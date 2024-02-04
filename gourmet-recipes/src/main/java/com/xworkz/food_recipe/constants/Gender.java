package com.xworkz.food_recipe.constants;

public enum Gender {
    MALE,FEMALE;

    @Override
    public String toString() {
        return name().toUpperCase();
    }
}
