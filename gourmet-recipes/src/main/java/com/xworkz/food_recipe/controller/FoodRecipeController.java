package com.xworkz.food_recipe.controller;

import com.xworkz.food_recipe.dto.RecipeDto;
import com.xworkz.food_recipe.dto.RecipeLikesDto;
import com.xworkz.food_recipe.dto.RecipeReviewDto;
import com.xworkz.food_recipe.dto.UserDto;
import com.xworkz.food_recipe.service.*;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsFileUploadSupport;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/")
public class FoodRecipeController {

/* ------------------------------------ required objects ----------------------------------- */

    private static final Logger logger = Logger.getLogger(FoodRecipeController.class);

    @Autowired
    private FoodRecipeService service;

    @Autowired
    private FoodRecipeMailService mailService;

    @Autowired
    private FoodRecipeUserService userService;

    @Autowired
    private FoodRecipeRecipeService recipeService;

    @Autowired
    private FoodRecipeOTPService otpService;

    @Autowired
    private FoodRecipeReviewService reviewService;


/* ----------------------------------------- get pages ------------------------------------ */

    @GetMapping("index")
    public String renderIndexPage(){return "index";}

    @GetMapping("registerUser")
    public String renderRegistrationPage() {
        return "user-registration";
    }

    @GetMapping("login")
    public String renderLoginPage(){
        return "login";
    }

    /* user pages */

    @GetMapping("userHome")
    public String renderUserHomePage(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto user = (UserDto) session.getAttribute("user");
        if (userId!=null && userId>0 && user!=null && user.getId()==userId){
            return getAllRecipes(session,model);
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("updateUser")
    public String renderUpdateUserPage(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto user = (UserDto) session.getAttribute("user");
        if (userId!=null && userId>0 && user!=null && user.getId()==userId){
            return "update-user";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("userProfile")
    public String renderUserProfilePage(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto user = (UserDto) session.getAttribute("user");
        if (userId!=null && userId>0 && user!=null && user.getId()==userId){
            return getAllRecipesByUserId(session,model);
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("userDetails")
    public String renderUserDetailsPage(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto user = (UserDto) session.getAttribute("user");
        if (userId!=null && userId>0 && user!=null && user.getId()==userId){
            return "user-details";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    /* recipe pages */

    @GetMapping("addRecipe")
    public String renderAddRecipePage(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto user = (UserDto) session.getAttribute("user");
        if (userId!=null && userId>0 && user!=null && user.getId()==userId){
            return "add-recipe";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("viewRecipe")
    public String renderRecipeDetailViewPage(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto user = (UserDto) session.getAttribute("user");
        if (userId!=null && userId>0 && user!=null && user.getId()==userId){
            return "recipe-detail-view";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("rateRecipe")
    public String renderRateRecipePage(@RequestParam int recipeId, HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto user = (UserDto) session.getAttribute("user");
        if (userId!=null && userId>0 && recipeId>0 && user!=null && user.getId()==userId){
            model.addAttribute("recipeId",recipeId);
            return "rate-recipe";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    /* admin pages */

//    @GetMapping("adminHome")
//    public String renderAdminHomePage(HttpSession session,Model model){
//        if (getAdmin().getId()==(Integer) session.getAttribute("userId")){
//            return "admin-home";
//        }
//        model.addAttribute("IllegalMsg","Illegal Access");
//        return "error";
//    }
//
//    @GetMapping("adminProfile")
//    public String renderAdminProfilePage(HttpSession session,Model model){
//        if (getAdmin().getId()==(Integer) session.getAttribute("userId")){
//            return "admin-profile";
//        }
//        model.addAttribute("IllegalMsg","Illegal Access");
//        return "error";
//    }
//
//    @GetMapping("adminUsersData")
//    public String renderAdminUsersDataPage(HttpSession session,Model model){
//        if (getAdmin().getId()==(Integer) session.getAttribute("userId")){
//            List<UserDto> usersList = userService.validateAndFetchAllUsers();
//            if (usersList!=null){
////                model.addAttribute("users",usersList);
//                session.setAttribute("users",usersList);
//                return "admin-users-data";
//            }
//        }
//        model.addAttribute("IllegalMsg","Illegal Access");
//        return "error";
//    }

    /* other services */

    @GetMapping("logout")
    public String logout(HttpSession session,Model model){
        session.invalidate();
        model.addAttribute("successMsg","Logout Successful");
        return "login";
    }

    @GetMapping("validateEmail")
    public String validateEmail(){
        return "validate-email";
    }

/* ---------------------------------------------------- users mapping ----------------------------------------------------- */

    @PostMapping(value = "registerUser")
    public String registerUser(@ModelAttribute @Valid UserDto userDto, /*@RequestParam("profilePic") CommonsMultipartFile profilePic,*/BindingResult errors, Model model) throws IOException {
        if (errors.hasErrors()){
            List<ObjectError> errorList = errors.getAllErrors();
            model.addAttribute("errorList",errorList);
            return "error";
        }
        if (userService.validateAndRegisterUserAudit(userDto)){
//            if (mailService.sendMailOnSignUp(userDto)){
                model.addAttribute("successMsg","Registration Successful \n Login To Continue..");
                return "login";
//            }
        }
        model.addAttribute("errorMsg","Could not register user. Try Again!!");
        return "user-registration";
    }


    public UserDto getAdmin(){
        return userService.validateAndFetchUserByLoginId("admin");
    }


    @PostMapping("userLogin")
    public String loginUser(@RequestParam String loginId, @RequestParam String password, Model model, HttpSession session){
        if (userService.validateAndLoginUser(loginId,password)){
            UserDto dto = userService.validateAndFetchUserByLoginId(loginId);
            userService.removeCountOnLogin(loginId);
            if (dto!=null){
                /*UserDto adminDto = getAdmin();
                if (dto.getFirstName().equals(adminDto.getFirstName())){
                    session.setAttribute("userId",adminDto.getId());
                    session.setAttribute("user",adminDto);
                    return "admin-home";
                }*/
//                if (mailService.sendMailOnLogin(dto)){
                    session.setAttribute("userId",dto.getId());
                    session.setAttribute("user",dto);

//                    if(logger.isDebugEnabled()){
//                        logger.debug("login is executed!");
//                    }

                if(logger.isInfoEnabled()){
                    logger.info("User Logged In : " + loginId);
                }
                    return getAllRecipes(session,model);
//                }
            }
        }
        if (userService.getPasswordCountByLoginId(loginId)<3){
            userService.addPasswordCountToMap(loginId,userService.getPasswordCountByLoginId(loginId)+1);

//            logger.error("Error message", new Exception("Invalid Credentials"));
            if(logger.isInfoEnabled()){
                logger.info("User Invalid Credentials : " + loginId);
            }

            model.addAttribute("errorMsg","Invalid Credentials");
            return "login";
        }else {
            model.addAttribute("errorMsg","Account Blocked \n Please verify Email to continue..");
            return "validate-email";
        }
    }

    @GetMapping("getUser")
    public String getUser(HttpSession session,Model model){
        Integer userId = (Integer)session.getAttribute("userId");
        UserDto dto = (UserDto) session.getAttribute("user");
        if (userId!=null && userId==dto.getId()){
            return "update-user";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @PostMapping("updateUser")
    public String updateUser(@Valid UserDto dto,BindingResult errors,Model model,HttpSession session){
        if (errors.hasErrors()){
            List<ObjectError> errorList = errors.getAllErrors();
            model.addAttribute("errorList",errorList);
            return "error";
        }
        Integer userId = (Integer)session.getAttribute("userId");
        UserDto sessionDto = (UserDto) session.getAttribute("user");
        if (userId!=null && sessionDto.getId()==userId){
            if (userService.validateAndUpdateUser(dto)){
                UserDto updatedUser = userService.validateAndFetchUserById(userId);
                session.setAttribute("user",updatedUser);
                model.addAttribute("successMsg","Updated Successful");
                return renderUserDetailsPage(session,model);
            }
            model.addAttribute("errorMsg","Update Un-Successful");
            return "update-user";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("deleteUser")
    public String deleteUser(Model model,HttpSession session){
        Integer userId = (Integer)session.getAttribute("userId");
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userId!=null &&  userId==userDto.getId()){
            if(userService.validateAndDeleteUserById(userId)){
                model.addAttribute("successMsg","Account Deleted successfully");
                return logout(session,model);
            }
            model.addAttribute("errorMsg","Couldn't delete the account. \nTry Again Later!!");
            return "user-details";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    /* admin methods */

    /*@PostMapping("filterUsers")
    public String filterUsers(@RequestParam String filter,HttpSession session,Model model){
        if (getAdmin().getId()==(Integer) session.getAttribute("userId")){
            List<UserDto> filteredList = userService.validateAndFilterUsers(filter);
            session.setAttribute("users",filteredList);
            return "admin-users-data";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("sortUsers")
    public String sortUsers(@RequestParam String sortBy,Model model,HttpSession httpSession){
        if (sortBy!=null && !sortBy.isEmpty()){
            List<UserDto> unsortedList = (List<UserDto>) httpSession.getAttribute("users");
            List sortedList = userService.validateAndSortUsers(sortBy,unsortedList);
            if (sortedList!=null && !sortedList.isEmpty()){
                model.addAttribute("users",sortedList);
                return "admin-users-data";
            }
        }
        model.addAttribute("errorMsg","Sort Value is null");
        return "error";
    }*/

/* --------------------------------------- recipe mapping --------------------------------- */

    @PostMapping("addRecipe")
    public String addRecipe(@Valid @ModelAttribute RecipeDto dto,HttpSession session,Model model){

        UserDto userDto = (UserDto) session.getAttribute("user");
        Integer userId = (Integer)session.getAttribute("userId");
        if (userId!=null &&  userId==userDto.getId() && userDto.getId() == dto.getAddedBy()){

            if(recipeService.validateAndAddRecipe(dto)){
                model.addAttribute("successMsg","Recipe added successful");
                return getAllRecipes(session,model);
            }
            model.addAttribute("errorMsg","Adding Recipe Unsuccessful");
            return "redirect:/addRecipe";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }


    @GetMapping("getAllRecipes")
    public String getAllRecipes(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userId!=null &&  userId==userDto.getId()){
            List<RecipeDto> recipeList = recipeService.validateAndFetchAllRecipes();
            if (recipeList!=null && !recipeList.isEmpty()){
                recipeList = recipeService.filterRecipeOnPublished(recipeList);
                recipeList = recipeService.sortRecipeOnRecentlyUpdated(recipeList);
                model.addAttribute("recipeList",recipeList);
                return "user-home";
            }
            model.addAttribute("errorMsg","No recipes Found");
            return "user-home";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("getAllRecipesByUserId")
    public String getAllRecipesByUserId(HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userId!=null &&  userId==userDto.getId()){
            List<RecipeDto> recipeList = recipeService.validateAndFetchRecipeByUserId(userId);
            if (recipeList!=null && !recipeList.isEmpty()){
                recipeList = recipeService.sortRecipeOnRecentlyUpdated(recipeList);
                model.addAttribute("recipeList",recipeList);
                return "user-profile";
            }
            model.addAttribute("errorMsg","No recipes Found");
            return "user-profile";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("getRecipeById")
    public String getRecipeById(@RequestParam int recipeId,HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userId!=null &&  userId==userDto.getId()){
            RecipeDto dto = recipeService.validateAndFetchRecipe(recipeId);
            if (dto!=null){
                List<RecipeReviewDto> reviewList = reviewService.validateAndGetAllReviewsOnRecipeId(recipeId);
                model.addAttribute("reviewList",reviewList);
                model.addAttribute("recipe",dto);
                return "recipe-detail-view";
            }
            model.addAttribute("errorMsg","No recipes Found");
            return "user-home";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("getRecipeForUpdate")
    public String getRecipeByIdForUpdate(@RequestParam int recipeId, HttpSession session, Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userId!=null &&  userId==userDto.getId()){
            RecipeDto dto = recipeService.validateAndFetchRecipe(recipeId);
            if (dto!=null){
                model.addAttribute("recipe",dto);
                return "update-recipe";
            }
            model.addAttribute("errorMsg","No recipes Found");
            return "user-home";
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @PostMapping("updateRecipe")
    public String updateRecipe(@ModelAttribute RecipeDto dto,HttpSession session,Model model){
//        System.out.println("Updated Recipe: " + dto);
        Integer userId = (Integer)session.getAttribute("userId");
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userId!=null &&  userId==userDto.getId() && userDto.getId() == dto.getAddedBy()){
            if(recipeService.validateAndUpdateRecipe(dto)){
                model.addAttribute("successMsg","Recipe updated successfully");
                return getRecipeById(dto.getRecipeId(),session,model);
            }
            model.addAttribute("errorMsg","Couldn't update Recipe");
            return getRecipeById(dto.getRecipeId(),session,model);
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("removeRecipe")
    public String removeRecipe(@RequestParam int recipeId, HttpSession session,Model model){
        UserDto userDto = (UserDto) session.getAttribute("user");
        Integer userId = (Integer)session.getAttribute("userId");
        if (userId!=null &&  userId==userDto.getId() && recipeId>0){
            if (recipeService.validateAndRemoveRecipe(recipeId)){
                model.addAttribute("successMsg","Recipe has been removed");
                return getAllRecipesByUserId(session,model);
            }
            model.addAttribute("errorMsg","Couldn't delete Recipe");
            return getRecipeById(recipeId,session,model);
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("filterRecipe")
    public String filterRecipes(@RequestParam String filterName, HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userId!=null &&  userId==userDto.getId()){
            if (!filterName.isEmpty()){
                List<RecipeDto> recipeList = recipeService.filterRecipes(filterName);
                if (!recipeList.isEmpty()){
                    recipeList = recipeService.filterRecipeOnPublished(recipeList);
                    model.addAttribute("recipeList",recipeList);
                    return "user-home";
                }
                String msg = "No results found for: "+filterName;
                model.addAttribute("errorMsg",msg);
            }
            return getAllRecipes(session,model);
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

    @GetMapping("filterUserRecipes")
    public String filterUserRecipes(@RequestParam String filterName, HttpSession session,Model model){
        Integer userId = (Integer) session.getAttribute("userId");
        UserDto userDto = (UserDto) session.getAttribute("user");
        if (userId!=null &&  userId==userDto.getId()){
            if (!filterName.isEmpty()){
                List<RecipeDto> recipeList = recipeService.filterRecipes(filterName);
                recipeList = recipeService.filterRecipeByUserId(recipeList,userId);
                if (!recipeList.isEmpty()){
                    model.addAttribute("recipeList",recipeList);
                    return "user-profile";
                }
                String msg = "No results found for: "+filterName;
                model.addAttribute("errorMsg",msg);
            }
            return getAllRecipesByUserId(session,model);
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }


    @PostMapping("rateRecipe")
    public String rateRecipe(@ModelAttribute RecipeReviewDto dto,HttpSession session,Model model){
        UserDto userDto = (UserDto) session.getAttribute("user");
        Integer userId = (Integer)session.getAttribute("userId");
        if (userId!=null &&  userId==userDto.getId() && userDto.getId() == dto.getReviewerId()){
            if (reviewService.validateAndSaveReview(dto)){
                List<RecipeReviewDto> reviewList =  reviewService.validateAndGetAllReviewsOnRecipeId(dto.getRecipeId());
                if (!reviewList.isEmpty()){
                    int avgRatings = reviewService.getAverageRatings(reviewList);
                    int totalReviews = reviewService.getTotalReviews(reviewList);
                    recipeService.validateAndUpdateAvgRatingsAndTotalReviews(dto.getRecipeId(),avgRatings,totalReviews);
                }
                model.addAttribute("successMsg","Thanks for the review");
                return getRecipeById(dto.getRecipeId(),session,model);
            }
            model.addAttribute("errorMsg","Review was not added!");
            return getRecipeById(dto.getRecipeId(),session,model);
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }


    @PostMapping("likeRecipe")
    public String likeRecipe(@ModelAttribute RecipeLikesDto dto,@RequestParam int recipeId, HttpSession session,Model model){
        UserDto userDto = (UserDto) session.getAttribute("user");
        Integer userId = (Integer)session.getAttribute("userId");
        if (userId!=null &&  userId==userDto.getId() && userDto.getId() == dto.getLikedBy()){
          if (recipeService.validateAndUpdateLikes(recipeId,dto)){
              if(recipeService.validateAndUpdateLikesCount(recipeId)){
                  model.addAttribute("successMsg","You liked the recipe!");
                  return getAllRecipes(session,model);
              }
              model.addAttribute("errorMsg","couldn't update the likes count");
              return getAllRecipes(session,model);
          }
          model.addAttribute("errorMsg","Couldn't like the recipe");
          return getAllRecipes(session,model);
        }
        model.addAttribute("IllegalMsg","Illegal Access");
        return "error";
    }

/* ------------------------------------------- OTP Mapping  -------------------------------------------- */

    @PostMapping("validateLoginId")
    public String validateLoginId(@RequestParam String loginId,Model model,HttpSession session){
        if (loginId!=null){
            UserDto dto = userService.validateAndFetchUserByLoginId(loginId);
            if (dto!=null){
                if (dto.getEmail().equals(loginId)||dto.getFirstName().equals(loginId)){
                    session.setAttribute("currentUser",dto);
                    return displayOTP(model,session);
                }
            }
        }
        model.addAttribute("errorMsg","Invalid Login ID");
        return "validate-email";
    }

    private String displayOTP(Model model,HttpSession session){
        String otp = otpService.generateOTP();
        UserDto dto = (UserDto) session.getAttribute("currentUser");
        int currentId = dto.getId();
        if (otpService.addOtpTOMap(otp,currentId)){
            session.setAttribute("OTP",otp);
//            if(mailService.sendOtpInMailToChangePassword(dto,otp)){
                return "verify-otp";
//            }
        }
        model.addAttribute("errorMsg","Something Went wrong");
        logout(session,model);
        return "validate-email";
    }

    @PostMapping("verifyOTP")
    public String verifyOTP(@RequestParam String otp,Model model,HttpSession session){
        UserDto dto = (UserDto) session.getAttribute("currentUser");
        int currentId = dto.getId();
        if (otpService.verifyOTP(otp,currentId)){
            model.addAttribute("successMsg","OTP IS VERIFIED");
            return "change-password";
        }
        model.addAttribute("errorMsg","Invalid OTP / OTP mismatch");
        logout(session,model);
        return "validate-email";
    }

    @PostMapping("changePassword")
    public String changePassword(@RequestParam int uid,@RequestParam String password,Model model,HttpSession session){
        UserDto dto  = (UserDto) session.getAttribute("currentUser");
        if (dto.getId() == uid){
            dto.setPassword(password);
            if(userService.validateAndUpdateUser(dto)){
                model.addAttribute("successMsg","Password has been changed.\nLogin to continue");
                logout(session,model);
                return "login";
            }
        }
        model.addAttribute("errorMsg","Could Not change Password");
        logout(session,model);
        return "error";
    }
}
