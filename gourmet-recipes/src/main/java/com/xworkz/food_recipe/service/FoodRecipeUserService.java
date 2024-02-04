package com.xworkz.food_recipe.service;

import com.xworkz.food_recipe.dto.UserDto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface FoodRecipeUserService {
    Map<String,Integer> passwordCountMap = new HashMap<>();

    boolean validateAndRegisterUserAudit(UserDto dto);
    boolean validateAndLoginUser(String loginId,String password);
    UserDto validateAndFetchUserByLoginId(String loginId);
    boolean validateAndUpdateUser(UserDto userDto);
    UserDto validateAndFetchUserById(int id);
    boolean validateAndDeleteUserById(int id);
    List<UserDto> validateAndFetchAllUsers();

    List<UserDto> validateAndFilterUsers(String filter);
    List<UserDto> validateAndSortUsers(String sortBy,List<UserDto> usersList);

    Integer addPasswordCountToMap(String loginId,Integer count);
    Integer getPasswordCountByLoginId(String loginId);
    boolean removeCountOnLogin(String loginId);

    String encryptPassword(String password);
    String decryptPassword(String password);
}
