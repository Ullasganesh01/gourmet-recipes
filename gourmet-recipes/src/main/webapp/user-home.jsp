<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Food Recipe</title>

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53.min.css">

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-50-beta.min.css">

  <!-- <link rel="stylesheet" href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53-docs.css">

  <link rel="stylesheet" href="./resources/css/font-awesome.min.css" />
  <link rel="stylesheet" href="./resources/css/bootstrap.css" />
  <link rel="stylesheet" href="./resources/css/responsive.css" />
  <link rel="stylesheet" href="./resources/css/user-home.css" />
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> -->
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
            <form action="filterRecipe" method="get" id="filterForm" class="mb-0">
              <input class="form-control border-warning border-2 rounded-pill" placeholder="Type to search..."
                style="width: 11vw !important;" name="filterName" onblur="submitForm()">
            </form>
            <div class="dropdown text-end">
              <a href="#" class="d-block text-decoration-none dropdown-toggle" data-bs-toggle="dropdown"
                aria-expanded="false">

                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle" />
                <span>
                  <p class="d-inline">
                    &nbsp;&nbsp;${user.getFirstName()}
                  </p>
                </span>
              </a>
              <ul class="dropdown-menu text-small">
                <li>
                  <a class="dropdown-item" href="userDetails">View Profile</a>
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
  <!-- end of header" -->

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

  <!-- user home body -->
  <div class="user-home-section container-fluid py-1 mt-5">

    <main>
      <div class="row row-cols-1 row-cols-md-3 mb-0 text-center">
        <div class="col">
          <div class="card mb-4 rounded-3 shadow-sm border-warning border-3">
            <div class="card-header py-3">
              <h4 class="my-0 fw-normal">Found A New<br> Recipe</h4>
            </div>
            <div class="card-body">
              <h5 class="fw-light mb-4">Drop Here</h5>
              <a href="addRecipe">
                <button type="button" class="w-100 btn btn-lg btn-outline-warning">
                  ADD RECIPES
                </button>
              </a>

            </div>
          </div>
        </div>
        <div class="col">
          <div class="card mb-4 rounded-3 shadow-sm border-warning border-3">
            <div class="card-header py-3">
              <h4 class="my-0 fw-normal">Wanna Have A Look <br> At Your Recipes</h4>
            </div>
            <div class="card-body">
              <h5 class="fw-light mb-4">Find Here</h5>
              <a href="userProfile">
                <button type="button" class="w-100 btn btn-lg btn-outline-warning">
                  MY RECIPES
                </button>
              </a>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card mb-4 rounded-3 shadow-sm border-warning border-3">
            <div class="card-header py-3">
              <h4 class="my-0 fw-normal">Wanna Rate <br> Other Recipes</h4>
            </div>
            <div class="card-body">
              <h5 class="fw-light mb-4">Share Your Thoughts</h5>
              <a href="#">
                <button type="button" class="w-100 btn btn-lg btn-outline-warning">
                  RATE RECIPES
                </button>
              </a>
            </div>
          </div>
        </div>
      </div>
    </main>

    <header>
      <div class="pricing-header p-3 pb-md-4 mx-auto mt-0 text-center">
        <h1 class="display-4 fw-normal text-body-emphasis">Recipes</h1>
      </div>
    </header>

  </div>
  <!-- end of user home body -->


  <!-- Top Recipes section -->
  <section class="food_section layout_padding-bottom mt-0" id="topRecipes">
    <div class="container">
      <ul class="filters_menu mb-5 mt-0">
        <li class="active">
          <a data-filter="all" onclick="filterSelection('all')"> All </a>
        </li>
        <li>
          <a data-filter="VEG" onclick="filterSelection('VEG')">Veg</a>
        </li>
        <li>
          <a data-filter="NONVEG" onclick="filterSelection('NONVEG')">Non Veg</a>
        </li>
      </ul>

      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">

        <c:forEach var="recipe" items="${ recipeList }">

          <c:if test="${recipe.getFoodType() == 'VEG'}">
            <div class="card border-success border-2 m-3 px-0 myfilter ${recipe.getFoodType()}" style="max-width: 22vw;">
          </c:if>
          <c:if test="${recipe.getFoodType() == 'NONVEG'}">
            <div class="card border-danger border-2 m-3 px-0 myfilter ${recipe.getFoodType()}" style="max-width: 22vw;">
          </c:if>

          <img src="./resources/images/home-food-1.jpg" class="card-img-top" alt="Recipe Image">
          <div class="card-body ">
            <c:if test="${recipe.getFoodType() == 'VEG'}">
              <h5 class="card-title text-success">${recipe.getRecipeName()}</h5>
            </c:if>
            <c:if test="${recipe.getFoodType() == 'NONVEG'}">
              <h5 class="card-title text-danger">${recipe.getRecipeName()}</h5>
            </c:if>
            <div class="d-flex justify-content-between align-items-baseline">
              <p class="me-3 mb-0">
                <strong><i class="fa-solid fa-user-tie"></i></strong>
                ${recipe.getPostedBy()}
              </p>
              <c:if test="${recipe.averageRatings >= 1}">
                <p class="me-3 mb-0">
                  <c:forEach var="i" begin="0" end="${recipe.averageRatings - 1}">
                    <i class="fa-solid fa-star clr-gold"></i>
                  </c:forEach>
                </p>
              </c:if>
            </div>
          </div>
          <ul class="list-group list-group-flush border-bottom-0">
            <li class="list-group-item d-flex justify-content-between">
              <div>
                <strong>Prep Time:</strong>
                <i class="fa-solid fa-stopwatch"></i> ${recipe.getPrepTime()}
              </div>
              <div>
                <strong>Serves: </strong>
                <c:forEach var="i" begin="0" end="${recipe.getServes() - 1}">
                  <i class="fa-solid fa-user"></i>
                </c:forEach>
              </div>
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <div>
                <strong><i class="fa-brands fa-java fa-xl me-2 clr-black"></i>Ingredients:</strong>
                ${recipe.getNoOfIngredients()}
              </div>
              <div>
                <strong><i class="fa-solid fa-bolt fa-sm me-2 clr-black"></i>Steps:</strong>
                ${recipe.getNoOfSteps()}
              </div>
            </li>
          </ul>
          <br>
          <div class="d-flex justify-content-around align-items-baseline">

            <form action="likeRecipe" method="post" class="col-5">
              <input class="d-none" type="text" name="recipeId"  value="${recipe.getRecipeId()}">
              <input class="d-none" type="text" name="likedBy" value="${user.getId()}">
              <input class="d-none" type="text" name="liked">
                         
              <c:set var="isPresent" value="false" />
              
              <c:forEach var="likes" items="${recipe.recipeLikes}">
                <c:if test="${likes.likedBy == userId}">
                  <c:set var="isPresent" value="true" />
                </c:if>
              </c:forEach>
              
              <c:choose>
                <c:when test="${empty recipe.recipeLikes }">
                  <button style="border: none;background-color: white;" onclick="submitLikeForm(this.form,true)"><i
                      class="fa-regular fa-heart fa-xl"></i></button>
                </c:when>
                <c:otherwise>
                  <c:choose>
                    <c:when test="${isPresent}">
                      <c:forEach var="likes" items="${ recipe.recipeLikes }">
       
                          <c:if test="${likes.likedBy == userId}">
                            <c:if test="${likes.liked == true}">
                              <button style="border: none;background-color: white;" onclick="submitLikeForm(this.form,false)"><i
                                class="fa-solid fa-heart fa-xl" style="color: orangered;"></i></button>
                            </c:if>
                            <c:if test="${likes.liked == false}">
                              <button style="border: none;background-color: white;" onclick="submitLikeForm(this.form,true)"><i
                                class="fa-regular fa-heart fa-xl"></i></button>
                            </c:if>
                          </c:if>
                    
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <button style="border: none;background-color: white;" onclick="submitLikeForm(this.form,true)"><i
                          class="fa-regular fa-heart fa-xl"></i></button>
                    </c:otherwise>
                  </c:choose>
                </c:otherwise>
              </c:choose>

              <!-- <button type="submit" style="display: none;">Submit</button> -->
              <p class="d-inline width-fit-content">${recipe.getTotalLikes()} Likes</p>
            </form>

            <a href="getRecipeById?recipeId=${recipe.getRecipeId()}" class="card-link btn btn-primary col-4 ms-0 mb-3">View Recipe</a>
          </div>
      </div>
      </c:forEach>
    </div>
    </div>
  </section>

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
    function submitForm() {
      var formElement = document.getElementById('filterForm');
      formElement.submit();
    }

    function submitLikeForm(formElement,isLiked){
      var likedEle = formElement.elements.liked;
      likedEle.value = isLiked;
      formElement.submit();
    }

  </script>

  <script src="./resources/js/filter-recipe.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script> -->
  <script src="./resources/cdn/popper.min.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> -->
  <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>

  <!-- <script src="https://kit.fontawesome.com/a6a9382d23.js" crossorigin="anonymous"></script> -->
  <script src="./resources/cdn/font-awesome-kit.js"></script>

  <script src="./resources/cdn/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
</body>

</html>