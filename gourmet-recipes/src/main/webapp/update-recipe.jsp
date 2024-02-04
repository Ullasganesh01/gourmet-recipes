<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Food Recipe</title>
  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53.min.css" />

  <!-- <link rel="stylesheet" href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53-docs.css" />

  <link rel="stylesheet" href="./resources/css/font-awesome.min.css" />
  <link rel="stylesheet" href="./resources/css/add-recipe.css" />
</head>

<body>
  <!-- Header -->
  <header class="header_section">
    <div class="container-fluid">
      <nav class="navbar navbar-expand-lg custom_nav-container">
        <a class="navbar-brand" href="userHome">
          <span>
            <img src="./resources/images/xworkz-logo.png" alt="Food Recipe Logo" />
          </span>
          <h2>The Gourmet</h2>
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class=""> </span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto">
            <li class="nav-item active">
              <a class="nav-link" href="userHome">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="userProfile">MY RECIPES</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="addRecipe">ADD RECIPE</a>
            </li>
          </ul>
          <div class="user_option">
            <div class="dropdown text-end">
              <a href="#" class="d-block text-decoration-none dropdown-toggle" data-bs-toggle="dropdown"
                aria-expanded="false">
                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle" /><span>
                  <p style="display: inline">
                    &nbsp;&nbsp;${user.getFirstName()}
                  </p>
                </span>
              </a>
              <ul class="dropdown-menu text-small">
                <li>
                  <a class="dropdown-item" href="getUser">View Profile</a>
                </li>
                <li>
                  <hr class="dropdown-divider" />
                </li>
                <li><a class="dropdown-item" href="logout">Sign out</a></li>
              </ul>
            </div>
          </div>
        </div>
      </nav>
    </div>
  </header>
  <!-- end of header -->

  <!-- modal -->
  <div class="modal fade" id="updateRecipeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body text-center">
          Are you sure you want to update the recipe?
        </div>
        <div class="text-center pb-3">
          <button type="button" class="btn btn-danger" id="confirmButton">Yes</button>

          <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
            Close
          </button>
        </div>
      </div>
    </div>
  </div>
  <!-- end of modal -->

  <!-- registration form body-->
  <div class="form-body">
    <div class="container form-container card border-warning">
      <div class="title">UPDATE RECIPE</div>
      <form action="updateRecipe" method="post" id="recipeForm">
        <!-- Recipe Name -->
        <div class="row mt-3">
          <div class="col-md-6">
            <label for="recipeName" class="form-label">Recipe Name</label>
            <div style="display: -webkit-inline-box">

              <input type="text" name="addedBy" value="${recipe.getAddedBy()}" style="display: none;">
              <input type="text" name="postedBy" value="${recipe.getPostedBy()}" style="display: none;">
              <input type="text" name="recipeId" value="${recipe.getRecipeId()}" style="display: none;">
              <input type="text" name="averageRatings" value="${recipe.getAverageRatings()}" style="display: none;">
              <input type="text" name="totalReviews" value="${recipe.getTotalReviews()}" style="display: none;">


              <input type="text" class="form-control me-4" id="recipeName" name="recipeName"
                value="${recipe.getRecipeName()}" required />

              <c:set var="fType" value="${recipe.getFoodType()}" />
              <div class="form-check food-type me-4 mt-1">
                <input class="form-check-input" type="radio" name="foodType" id="vegRadio" value="VEG" <c:if
                  test="${fn:contains(fType, 'VEG')}"> checked </c:if> />
                <label class="form-check-label" for="vegRadio"> VEG </label>
              </div>

              <div class="form-check food-type mt-1">
                <input class="form-check-input" type="radio" name="foodType" id="nonVegRadio" value="NONVEG" <c:if
                  test="${fn:contains(fType, 'NONVEG')}"> checked </c:if> />
                <label class="form-check-label" for="nonVegRadio">
                  NON-VEG
                </label>
              </div>
            </div>

            <input type="text" class="form-control" id="addedBy" name="addedBy" value="${userId}"
              style="display: none" />
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-md-4">
            <c:set var="cuisineType" value="${recipe.getCuisine()}" />
            <label for="cuisine" class="form-label">Cuisine</label>
            <select class="form-select" id="cuisine" name="cuisine">
              <option value="INDIAN" <c:if test="${fn:contains(cuisineType, 'INDIAN')}">
                selected </c:if> > INDIAN</option>
              <option value="CHINESE" <c:if test="${fn:contains(cuisineType, 'CHINESE')}">
                selected </c:if> > CHINESE</option>
              <option value="JAPANESE" <c:if test="${fn:contains(cuisineType, 'JAPANESE')}">
                selected </c:if> > JAPANESE</option>
              <option value="ITALIAN" <c:if test="${fn:contains(cuisineType, 'ITALIAN')}">
                selected </c:if>> ITALIAN</option>
              <option value="MEXICAN" <c:if test="${fn:contains(cuisineType, 'MEXICAN')}">
                selected </c:if> > MEXICAN</option>
              <option value="THAI" <c:if test="${fn:contains(cuisineType, 'THAI')}">
                selected </c:if> > THAI</option>
              <option value="AMERICAN" <c:if test="${fn:contains(cuisineType, 'AMERICAN')}">
                selected </c:if> > AMERICAN</option>
            </select>
          </div>
          <div class="col-md-4">
            <c:set var="foodcategory" value="${recipe.getFoodCategory()}" />
            <label for="foodCategory" class="form-label">Food Category</label>
            <select class="form-select" id="foodCategory" name="foodCategory">
              <option value="APPETIZERS" <c:if test="${fn:contains(foodcategory, 'APPETIZERS')}">
                selected </c:if> > APPETIZERS</option>
              <option value="BEVERAGES" <c:if test="${fn:contains(foodcategory, 'BEVERAGES')}">
                selected </c:if> > BEVERAGES</option>
              <option value="SOUPS" <c:if test="${fn:contains(foodcategory, 'SOUPS')}">
                selected </c:if> > SOUPS</option>
              <option value="SALADS" <c:if test="${fn:contains(foodcategory, 'SALADS')}">
                selected </c:if> > SALADS</option>
              <option value="MAINCOURSE" <c:if test="${fn:contains(foodcategory, 'MAINCOURSE')}">
                selected </c:if> > MAINCOURSE</option>
              <option value="BREADS" <c:if test="${fn:contains(foodcategory, 'BREADS')}">
                selected </c:if> > BREADS</option>
              <option value="DESSERTS" <c:if test="${fn:contains(foodcategory, 'DESSERTS')}">
                selected </c:if> > DESSERTS</option>
              <option value="STARTERS" <c:if test="${fn:contains(foodcategory, 'STARTERS')}">
                selected </c:if> > STARTERS</option>
            </select>
          </div>
          <div class="col-md-4">
            <c:set var="mealType" value="${recipe.getMealType()}" />
            <label for="mealType" class="form-label">Meal Type</label>
            <select class="form-select" id="mealType" name="mealType">
              <option value="BREAKFAST" <c:if test="${fn:contains(mealType, 'BREAKFAST')}">
                selected </c:if> > BREAKFAST</option>
              <option value="LUNCH" <c:if test="${fn:contains(mealType, 'LUNCH')}">
                selected </c:if> > LUNCH</option>
              <option value="SNACKS" <c:if test="${fn:contains(mealType, 'SNACKS')}">
                selected </c:if> > SNACKS</option>
              <option value="DINNER" <c:if test="${fn:contains(mealType, 'DINNER')}">
                selected </c:if> > DINNER</option>
            </select>
          </div>
        </div>

        <!-- Ingredients -->
        <div class="row mt-3">
          <div class="col-md-6">
            <label for="noOfIngredients" class="form-label">No. of Ingredients</label>
            <input type="number" class="form-control" id="noOfIngredients" name="noOfIngredients"
              value="${recipe.getNoOfIngredients()}" onchange="generateIngredientFields()" />
            <div id="ingredientsContainer">
              <c:forEach var="ingredient" items="${recipe.getIngredients()}" varStatus="status">
                <div class="mb-3" style="display: flex;">
                  <div class="col-md-3">
                    <label class="form-label">Quantity</label>
                    <input type="text" class="form-control" name="ingredients[${status.index}].ingredientQuantity"
                      value="${ingredient.getIngredientQuantity()}" />
                  </div>
                  <div class="col-md-8" style="margin-left: 20px;">
                    <label class="form-label">Ingredient Name</label>
                    <input type="text" class="form-control" name="ingredients[${status.index}].ingredientName"
                      value="${ingredient.getIngredientName()}" />
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <div class="col-md-6">
            <label for="noOfSteps" class="form-label">No. of Steps</label>
            <input type="number" class="form-control" id="noOfSteps" name="noOfSteps" value="${recipe.getNoOfSteps()}"
              onchange="generateStepFields()" />
            <div id="stepsContainer">
              <c:forEach var="steps" items="${recipe.getRecipeSteps()}" varStatus="status">
                <div class="mb-3" style="display: flex;">
                  <div class="col-md-3">
                    <label class="form-label">Quantity</label>
                    <input type="text" class="form-control" name="recipeSteps[${status.index}].stepNo"
                      value="${steps.getStepNo()}" />
                  </div>
                  <div class="col-md-8" style="margin-left: 20px;">
                    <label class="form-label">Ingredient Name</label>
                    <input type="text" class="form-control" name="recipeSteps[${status.index}].stepDescription"
                      value="${steps.getStepDescription()}" />
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>

        <!-- Serves, Prep Time, No. of Ingredients, Ingredients -->
        <div class="row mt-3">
          <div class="col-md-4">
            <label for="serves" class="form-label">Serves</label>
            <input type="number" class="form-control" id="serves" name="serves" value="${recipe.getServes()}" />
          </div>

          <div class="col-md-4">
            <label for="prepTime" class="form-label">Prep Time (minutes)</label>
            <input type="number" class="form-control" id="prepTime" name="prepTime" value="${recipe.getPrepTime()}" />
          </div>

          <div class="col-md-3 ms-3">
            <label for="">Publish</label>
            <div class="d-flex mt-3">
              <div class="form-check food-type me-4">
                <c:set var="isPosted" value="${recipe.isPosted()}" />
                <input class="form-check-input" type="radio" name="posted" id="postYesRadio" value="true" <c:if
                  test="${fn:contains(isPosted, 'true')}"> checked </c:if> />
                <label class="form-check-label" for="postYesRadio">
                  Yes
                </label>
              </div>

              <div class="form-check food-type">
                <input class="form-check-input" type="radio" name="posted" id="postNoRadio" value="false" <c:if
                  test="${fn:contains(isPosted, 'false')}"> checked </c:if> />
                <label class="form-check-label" for="postNoRadio"> No </label>
              </div>
            </div>
          </div>
        </div>

        <!-- Submit Button -->
        <div class="row-cols-2 mt-3">
          <button class="btn btn-primary mt-3" type="button" onclick="showUpdateModal()">UPDATE</button>
        </div>
      </form>
    </div>
  </div>
  <!-- end of registration -->

  <div>
    <h4>${addRecipeMsg}</h4>
  </div>

  <!-- footer section -->
  <footer class="footer_section">
    <div class="container-fluid">
      <p>&copy;&nbsp;Ullas G,&nbsp;Software Developer</p>
      <div class="footer_social">
        <a href="">
          <i class="fa fa-facebook" aria-hidden="true"></i>
        </a>
        <a href="">
          <i class="fa fa-twitter" aria-hidden="true"></i>
        </a>
        <a href="">
          <i class="fa fa-linkedin" aria-hidden="true"></i>
        </a>
        <a href="">
          <i class="fa fa-instagram" aria-hidden="true"></i>
        </a>
        <a href="">
          <i class="fa fa-pinterest" aria-hidden="true"></i>
        </a>
      </div>
    </div>
  </footer>
  <!-- end of footer -->

  <script>
    function showUpdateModal() {
      var updateModal = new bootstrap.Modal(document.getElementById('updateRecipeModal'));
      updateModal.show();

      document.getElementById('confirmButton').addEventListener('click', function () {
        document.getElementById('recipeForm').submit();
      });
    }
  </script>
  <script src="./resources/js/add-recipe.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script> -->
  <script src="./resources/cdn/popper.min.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> -->
  <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>

  <!-- <script src="https://kit.fontawesome.com/a6a9382d23.js" crossorigin="anonymous"></script> -->
  <script src="./resources/cdn/font-awesome-kit.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->
</body>

</html>