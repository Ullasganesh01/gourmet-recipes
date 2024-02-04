package com.xworkz.food_recipe.repository.impl;

import com.xworkz.food_recipe.dto.*;
import com.xworkz.food_recipe.repository.FoodRecipeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class FoodRecipeRepositoryImpl implements FoodRecipeRepository {

    @Autowired
    public EntityManagerFactory entityManagerFactory;

    /*--------------------------------------------  user methods -----------------------------  */
    @Override
    public boolean registerUser(UserDto dto) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(dto);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public UserDto getUserByEmail(String email) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            return (UserDto) em.createNamedQuery("fetchUserByEmail").setParameter("email",email).getSingleResult();
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public boolean registerUserAudit(AuditDto dto) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(dto);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public UserDto getUserByLoginId(String loginId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            return (UserDto) em.createNamedQuery("fetchUserByLoginID").setParameter("loginId",loginId).getSingleResult();
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public UserDto getUserById(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
           return em.find(UserDto.class,id);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public boolean updateUser(UserDto dto) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(dto);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public AuditDto getAuditByUserId(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            return em.find(AuditDto.class,id);
        }catch (Exception e){
            return null;
        }
    }

    @Override
    public boolean updateAuditOnUpdateUser(AuditDto dto) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(dto);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean deleteAuditOnDeleteUser(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        AuditDto dto = em.find(AuditDto.class,id);
        try {
            em.getTransaction().begin();
            em.remove(dto);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public List fetchAllUsers() {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("fetchAllUsers").getResultList();
    }

    @Override
    public List fetchAllUserEmails() {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("fetchAllUserEmails").getResultList();
    }

    @Override
    public List fetchAllUserContactNo() {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("fetchAllUserContactNo").getResultList();
    }

    @Override
    public List fetchUserEmailsExcept(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("fetchUserEmailsExcept").setParameter("id",id).getResultList();
    }

    @Override
    public List fetchUserContactNoExcept(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("fetchUserContactNoExcept").setParameter("id",id).getResultList();
    }

    @Override
    public List filterUsers(String filter) {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("filterUsers").setParameter("filter",filter).getResultList();
    }

    /* -----------------------------------recipe methods-------------------------------------------- */

    @Override
    public boolean addRecipe(RecipeDto dto) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(dto);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean removeRecipe(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        RecipeDto dto = em.find(RecipeDto.class,id);
        try {
            em.getTransaction().begin();
            em.remove(dto);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean updateRecipe(RecipeDto dto) {
        EntityManager em = entityManagerFactory.createEntityManager();
//        RecipeDto existingDto = em.find(RecipeDto.class,dto.getRecipeId());
/*
        existingDto.setRecipeName(dto.getRecipeName());
        existingDto.setServes(dto.getServes());
        existingDto.setPrepTime(dto.getPrepTime());
        existingDto.setNoOfIngredients(dto.getNoOfIngredients());
        existingDto.setIngredients(dto.getIngredients());
        existingDto.setNoOfSteps(dto.getNoOfSteps());
        existingDto.setRecipeSteps(dto.getRecipeSteps());
        existingDto.setUpdatedOn(dto.getUpdatedOn());
        existingDto.setAddedBy(dto.getAddedBy());
        existingDto.setPostedBy(dto.getPostedBy());
        existingDto.setFoodType(dto.getFoodType());
        existingDto.setCuisine(dto.getCuisine());
        existingDto.setFoodCategory(dto.getFoodCategory());
        existingDto.setMealType(dto.getMealType());
        existingDto.setPosted(dto.isPosted());
        existingDto.setAverageRatings(dto.getAverageRatings());
        existingDto.setTotalReviews(dto.getTotalReviews());
*/

        try {
            em.getTransaction().begin();
            em.merge(dto);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean deleteIngOnRecipeUpdateByRecipeId(int recipeId){
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            em.createNamedQuery("deleteIngOnRecipeUpdateByRecipeId").setParameter("recipeId",recipeId).executeUpdate();
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean deleteStepsOnRecipeUpdateByRecipeId(int recipeId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            em.createNamedQuery("deleteStepsOnRecipeUpdateByRecipeId").setParameter("recipeId",recipeId).executeUpdate();
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public RecipeDto fetchRecipeById(int id) {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.find(RecipeDto.class,id);
    }

    @Override
    public List fetchRecipesByUserId(int userId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("fetchRecipeByUserId").setParameter("userId",userId).getResultList();
    }

    @Override
    public List fetchAllRecipes() {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("fetchAllRecipes").getResultList();
    }

    @Override
    public List filterRecipes(String filter) {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("filterRecipes").setParameter("filter",filter).getResultList();
    }

    /* ----------------------------------------- review methods ------------------------------------------*/
    @Override
    public boolean saveReview(RecipeReviewDto dto) {
        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(dto);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public List getAllReviews() {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("getAllReviews").getResultList();
    }

    @Override
    public List getAllReviewsOnRecipeId(int recipeId) {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("getAllReviewsOnRecipeId").setParameter("recipeId",recipeId).getResultList();
    }

    @Override
    public boolean updateAvgRatingsAndTotalReviews(int recipeId, int avgRatings, int totalReviews) {
        EntityManager em = entityManagerFactory.createEntityManager();
        RecipeDto dto = em.find(RecipeDto.class,recipeId);
        try {
            em.getTransaction().begin();
            dto.setAverageRatings(avgRatings);
            dto.setTotalReviews(totalReviews);
            em.getTransaction().commit();
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @Override
    public boolean updateRecipeLikes(int recipeId, int likes) {
        EntityManager em = entityManagerFactory.createEntityManager();
        RecipeDto dto = em.find(RecipeDto.class,recipeId);
        em.getTransaction().begin();
        dto.setTotalLikes(likes);
        em.getTransaction().commit();
        return true;
    }


    @Override
    public List fetchRecipeByRecipeName(String recipeName) {
        EntityManager em = entityManagerFactory.createEntityManager();
        return em.createNamedQuery("fetchRecipeByName").setParameter("recipeName",recipeName).getResultList();
    }

    public RecipeLikesDto fetchLikesDtoByUserIdAndRecipeId(int userId,int recipeId){
        EntityManager em = entityManagerFactory.createEntityManager();
        return (RecipeLikesDto) em.createNamedQuery("getLikeByUserIdAndRecipeId").setParameter("userId",userId).setParameter("recipeId",recipeId).getSingleResult();
    }

    @Override
    public boolean updateLikes(int recipeId,RecipeLikesDto likesDto){
        EntityManager em = entityManagerFactory.createEntityManager();

//        System.out.println("Submitted Like : " + likesDto);
//        try{
            em.getTransaction().begin();
            try {
                RecipeLikesDto existingLikesDto = fetchLikesDtoByUserIdAndRecipeId(likesDto.getLikedBy(),recipeId);
//                System.out.println("Fetched Likes Dto : " + existingLikesDto);
                if (existingLikesDto!=null){
                    existingLikesDto =  em.find(RecipeLikesDto.class,existingLikesDto.getLikeId());
                    existingLikesDto.setLiked(likesDto.isLiked());
//                    System.out.println("Setting boolean inside : "+existingLikesDto);
                }
            }catch (Exception e){
                RecipeDto recipeDto = em.find(RecipeDto.class,recipeId);
                List<RecipeLikesDto> likesList =  recipeDto.getRecipeLikes();
//                System.out.println("Likes List: "+likesList);
                likesDto.setRecipe(recipeDto);
                likesList.add(likesDto);
//                System.out.println("Likes List after adding : "+likesList);
                recipeDto.setRecipeLikes(likesList);
            }
            em.getTransaction().commit();
            return true;
//        }catch (Exception e){
//            return false;
//        }
    }


}
