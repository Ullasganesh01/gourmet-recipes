package com.xworkz.food_recipe.service.impl;

import com.xworkz.food_recipe.constants.SortUsers;
import com.xworkz.food_recipe.dto.AuditDto;
import com.xworkz.food_recipe.dto.UserDto;
import com.xworkz.food_recipe.repository.FoodRecipeRepository;
import com.xworkz.food_recipe.service.FoodRecipeUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Base64;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FoodRecipeUserServiceImpl implements FoodRecipeUserService {

    @Autowired
    private FoodRecipeRepository repository;

    private boolean validateUser(UserDto dto){
        if (dto!=null){
            if (!dto.getFirstName().isEmpty() && !dto.getLastName().isEmpty() && !dto.getEmail().isEmpty()
                    && dto.getContactNo()>1000000000 && dto.getAlternativeNumber()>1000000000
                    && dto.getGender()!=null && !dto.getAddress().isEmpty() && !dto.getPassword().isEmpty()
                    && !dto.getGender().name().isEmpty()){
                return true;
            }
        }
        return false;
    }

    private boolean validateAudit(AuditDto dto){
        if (dto!=null){
            if (!dto.getCreatedBy().isEmpty() && dto.getCreatedOn()!=null &&
                    !dto.getUpdatedBy().isEmpty() && dto.getUpdatedOn()!=null){
                return true;
            }
        }
        return false;
    }


    @Override
    public boolean validateAndRegisterUserAudit(UserDto userDto){
        if (userDto!=null){
            userDto.setPassword(encryptPassword(userDto.getPassword()));
            if (validateUser(userDto)){
                AuditDto auditDto = new AuditDto();
                auditDto.setUserDto(userDto);
                auditDto.setCreatedBy(userDto.getEmail());
                auditDto.setCreatedOn(LocalDateTime.now());
                auditDto.setUpdatedBy(userDto.getEmail());
                auditDto.setUpdatedOn(LocalDateTime.now());
                if (validateAudit(auditDto)){
                    return repository.registerUserAudit(auditDto);
                }
            }

        }
        return false;
    }

    @Override
    public boolean validateAndLoginUser(String loginId,String password) {
        if (loginId!=null && !loginId.isEmpty()){
            UserDto dto = repository.getUserByLoginId(loginId);
            if (!password.isEmpty() && decryptPassword(dto.getPassword()).equals(password)){
                return true;
            }
        }
        return false;
    }

    @Override
    public UserDto validateAndFetchUserByLoginId(String loginId) {
        if (loginId!=null && !loginId.isEmpty()){
            UserDto dto = repository.getUserByLoginId(loginId);
            dto.setPassword(decryptPassword(dto.getPassword()));
            return dto;
        }
        return null;
    }

    @Override
    public boolean validateAndUpdateUser(UserDto userDto){
        if (validateUser(userDto)){
            userDto.setPassword(encryptPassword(userDto.getPassword()));
            AuditDto auditDto = repository.getAuditByUserId(userDto.getId());
            auditDto.setUserDto(userDto);
            auditDto.setUpdatedBy(userDto.getEmail());
            auditDto.setUpdatedOn(LocalDateTime.now());
            if (validateAudit(auditDto)){
                return repository.updateAuditOnUpdateUser(auditDto);
            }
        }
        return false;
    }

    @Override
    public UserDto validateAndFetchUserById(int id) {
        if (id>0){
            UserDto dto = repository.getUserById(id);
            dto.setPassword(decryptPassword(dto.getPassword()));
            if (validateUser(dto)){
                return dto;
            }
        }
        return null;
    }

    @Override
    public boolean validateAndDeleteUserById(int id) {
        if (id>0){
            return repository.deleteAuditOnDeleteUser(id);
        }
        return false;
    }

    @Override
    public List<UserDto> validateAndFetchAllUsers() {
        List<UserDto> users = repository.fetchAllUsers();
        if (users!=null){
            return users;
        }
        return null;
    }

    private boolean sortUsersContainsSortBy(String sortBy){
        for (SortUsers order : SortUsers.values()){
            if (order.name().equals(sortBy)){
                return true;
            }
        }
        return false;
    }

    @Override
    public List<UserDto> validateAndFilterUsers(String filter) {
        if (!filter.isEmpty()){
            List<UserDto> filtererdList = repository.filterUsers(filter);
            if (filtererdList!=null && !filtererdList.isEmpty()){
                return filtererdList;
            }
        }
        return repository.fetchAllUsers();
    }

    @Override
    public List<UserDto> validateAndSortUsers(String sortBy, List<UserDto> usersList) {
        if (sortBy!=null && !sortBy.isEmpty()){
            sortBy = sortBy.toUpperCase();
            if (sortUsersContainsSortBy(sortBy)){
                SortUsers sortOrder = SortUsers.valueOf(sortBy);
                switch (sortOrder){
                    case USERIDASC:return usersList.stream().sorted(Comparator.comparing(UserDto::getId)).collect(Collectors.toList());
                    case USERIDDESC:return usersList.stream().sorted(Comparator.comparing(UserDto::getId).reversed()).collect(Collectors.toList());
                    case FIRSTNAMEASC: return usersList.stream().sorted(Comparator.comparing(UserDto::getFirstName)).collect(Collectors.toList());
                    case FIRSTNAMEDESC: return usersList.stream().sorted(Comparator.comparing(UserDto::getFirstName).reversed()).collect(Collectors.toList());
                    case LASTNAMEASC: return usersList.stream().sorted(Comparator.comparing(UserDto::getLastName)).collect(Collectors.toList());
                    case LASTNAMEDESC: return usersList.stream().sorted(Comparator.comparing(UserDto::getLastName).reversed()).collect(Collectors.toList());
                    case EMAILASC:return usersList.stream().sorted(Comparator.comparing(UserDto::getEmail)).collect(Collectors.toList());
                    case EMAILDESC:return usersList.stream().sorted(Comparator.comparing(UserDto::getEmail).reversed()).collect(Collectors.toList());
                    case CONTACTNOASC:return usersList.stream().sorted(Comparator.comparing(UserDto::getContactNo)).collect(Collectors.toList());
                    case CONTACTNODESC:return usersList.stream().sorted(Comparator.comparing(UserDto::getContactNo).reversed()).collect(Collectors.toList());
                    case ALTNOASC:return usersList.stream().sorted(Comparator.comparing(UserDto::getAlternativeNumber)).collect(Collectors.toList());
                    case ALTNODESC:return usersList.stream().sorted(Comparator.comparing(UserDto::getAlternativeNumber).reversed()).collect(Collectors.toList());
                    case GENDERASC:return usersList.stream().sorted(Comparator.comparing(UserDto::getGender)).collect(Collectors.toList());
                    case GENDERDESC:return usersList.stream().sorted(Comparator.comparing(UserDto::getGender).reversed()).collect(Collectors.toList());
                    case ADDRESSASC:return usersList.stream().sorted(Comparator.comparing(UserDto::getAddress)).collect(Collectors.toList());
                    case ADDRESSDESC:return usersList.stream().sorted(Comparator.comparing(UserDto::getAddress).reversed()).collect(Collectors.toList());
                    default: return usersList;
                }
            }
        }
        return usersList;
    }

    @Override
    public Integer addPasswordCountToMap(String loginId, Integer count) {
        if (loginId!=null && !loginId.isEmpty()){
            passwordCountMap.put(loginId,count);
            return getPasswordCountByLoginId(loginId);
        }
        return 0;
    }

    @Override
    public Integer getPasswordCountByLoginId(String loginId) {
        if (loginId!=null && !loginId.isEmpty()){
            if (passwordCountMap.containsKey(loginId)){
                return passwordCountMap.get(loginId);
            }
        }
        return 0;
    }

    public boolean removeCountOnLogin(String loginId){
        if (loginId!=null && !loginId.isEmpty()){
            if (passwordCountMap.containsKey(loginId)){
                passwordCountMap.remove(loginId);
                return true;
            }
        }
        return false;
    }

    @Override
    public String encryptPassword(String password) {
        return Base64.getEncoder().encodeToString(password.getBytes());
    }

    @Override
    public String decryptPassword(String password) {
        return new String(Base64.getDecoder().decode(password));
    }
}
