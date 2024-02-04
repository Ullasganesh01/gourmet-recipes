<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <li class="nav-item">
              <a class="nav-link" href="userHome">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="userProfile">MY RECIPES</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="addRecipe">ADD RECIPE</a>
            </li>
          </ul>
          <div class="user_option">
            <div class="dropdown text-end">
              <a href="#" class="d-block text-decoration-none dropdown-toggle" data-bs-toggle="dropdown"
                aria-expanded="false">
                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle" /><span>
                  <p class="d-inline">&nbsp;&nbsp;${user.getFirstName()}</p>
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

  <!-- backend messages -->
  <div class="backend-msg">
    <c:if test="${not empty errorMsg}">
      <div class="alert alert-danger alert-dismissible fade show mb-0 mx-auto mt-3 width-fit-content" role="alert">
        <p class="mb-0">${errorMsg}</p>
        <button type="button" class="btn-close py-3" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    </c:if>
    <c:if test="${not empty successMsg}">
      <div class="alert alert-info alert-dismissible fade show mb-0 mx-auto mt-3 width-fit-content" role="alert">
        <p class="mb-0">${successMsg}</p>
        <button type="button" class="btn-close py-3" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    </c:if>
  </div>
  <!-- end of backend messages -->

  <!-- registration form body-->
  <div class="form-body">
    <div class="container form-container card border-warning">
      <div class="title">ADD RECIPE</div>
      <form action="addRecipe" method="post">
        <!-- Recipe Name -->
        <div class="row mt-3">
          <div class="col-md-6">
            <label for="recipeName" class="form-label">Recipe Name</label>
            <div style="display: -webkit-inline-box">
              <input type="text" class="form-control me-4" id="recipeName" name="recipeName" required />
              <div class="form-check food-type me-4 mt-1">
                <input class="form-check-input" type="radio" name="foodType" id="vegRadio" value="VEG" checked />
                <label class="form-check-label" for="vegRadio"> VEG </label>
              </div>

              <div class="form-check food-type mt-1">
                <input class="form-check-input" type="radio" name="foodType" id="nonVegRadio" value="NONVEG" />
                <label class="form-check-label" for="nonVegRadio">
                  NON-VEG
                </label>
              </div>
            </div>

            <input type="text" class="form-control d-none" id="addedBy" name="addedBy" value="${userId}" />
          </div>
        </div>

        <div class="row mt-3">
          <div class="col-md-4">
            <label for="cuisine" class="form-label">Cuisine</label>
            <select class="form-select" id="cuisine" name="cuisine">
              <option value="INDIAN" selected>INDIAN</option>
              <option value="CHINESE">CHINESE</option>
              <option value="JAPANESE">JAPANESE</option>
              <option value="ITALIAN">ITALIAN</option>
              <option value="MEXICAN">MEXICAN</option>
              <option value="THAI">THAI</option>
              <option value="AMERICAN">AMERICAN</option>
            </select>
          </div>
          <div class="col-md-4">
            <label for="foodCategory" class="form-label">Food Category</label>
            <select class="form-select" id="foodCategory" name="foodCategory">
              <option value="APPETIZERS" selected>APPETIZERS</option>
              <option value="BEVERAGES">BEVERAGES</option>
              <option value="SOUPS">SOUPS</option>
              <option value="SALADS">SALADS</option>
              <option value="MAINCOURSE">MAINCOURSE</option>
              <option value="BREADS">BREADS</option>
              <option value="DESSERTS">DESSERTS</option>
              <option value="STARTERS">STARTERS</option>
            </select>
          </div>
          <div class="col-md-4">
            <label for="mealType" class="form-label">Meal Type</label>
            <select class="form-select" id="mealType" name="mealType">
              <option value="BREAKFAST" selected>BREAKFAST</option>
              <option value="LUNCH">LUNCH</option>
              <option value="SNACKS">SNACKS</option>
              <option value="DINNER">DINNER</option>
            </select>
          </div>
        </div>

        <!-- Ingredients -->
        <div class="row mt-3">
          <div class="col-md-6">
            <label for="noOfIngredients" class="form-label">No. of Ingredients</label>
            <input type="number" class="form-control" id="noOfIngredients" name="noOfIngredients"
              onchange="generateIngredientFields()" />
            <div id="ingredientsContainer"></div>
          </div>
          <div class="col-md-6">
            <label for="noOfSteps" class="form-label">No. of Steps</label>
            <input type="number" class="form-control" id="noOfSteps" name="noOfSteps" onchange="generateStepFields()" />
            <div id="stepsContainer"></div>
          </div>
        </div>

        <!-- Serves, Prep Time, No. of Ingredients, Ingredients -->
        <div class="row mt-3">
          <div class="col-md-4">
            <label for="serves" class="form-label">Serves</label>
            <input type="number" class="form-control" id="serves" name="serves" />
          </div>

          <div class="col-md-4">
            <label for="prepTime" class="form-label">Prep Time (minutes)</label>
            <input type="number" class="form-control" id="prepTime" name="prepTime" />
          </div>

          <div class="col-md-3 ms-3">
            <label for="">Publish</label>
            <div class="d-flex mt-3">
              <div class="form-check food-type me-4">
                <input class="form-check-input" type="radio" name="posted" id="postYesRadio" value="true" checked />
                <label class="form-check-label" for="postYesRadio">
                  Yes
                </label>
              </div>

              <div class="form-check food-type">
                <input class="form-check-input" type="radio" name="posted" id="postNoRadio" value="false" />
                <label class="form-check-label" for="postNoRadio"> No </label>
              </div>
            </div>
          </div>
        </div>

        <!-- Submit Button -->
        <div class="row-cols-2 mt-3">
          <button type="submit" class="btn btn-primary mt-3">ADD</button>
        </div>
      </form>
    </div>
  </div>
  <!-- end of registration -->

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

  <script src="./resources/js/add-recipe.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script> -->
  <script src="./resources/cdn/popper.min.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> -->
  <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>

  <!-- <script src="https://kit.fontawesome.com/a6a9382d23.js" crossorigin="anonymous"></script> -->
  <script src="./resources/cdn/font-awesome-kit.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->

  <!-- <script src="./resources/js/registration.js"></script> -->
</body>

</html>