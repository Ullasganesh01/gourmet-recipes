<!-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.Month" %> -->

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Recipe Details</title>

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53.min.css" />

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-50-beta.min.css" />

  <!-- <link rel="stylesheet" href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53-docs.css" />

  <link rel="stylesheet" href="./resources/css/font-awesome.min.css" />
  <link rel="stylesheet" href="./resources/css/bootstrap.css" />
  <link rel="stylesheet" href="./resources/css/responsive.css" />
  <link rel="stylesheet" href="./resources/css/user-home.css" />
  <link rel="stylesheet" href="./resources/css/recipe-detail-view.css" />
  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> -->
</head>

<body>
  <%! 
    public String printDateInformation(LocalDateTime date) { 
      LocalDateTime currentDate=date; 
      int day=currentDate.getDayOfMonth(); 
      Month month=currentDate.getMonth(); 
      int year=currentDate.getYear(); 
      String myDate=day + " " + month + ", " + year; return myDate; 
    } 
    
  %>
  <c:set var="myDate" value="${recipe.getUpdatedOn()}" />
  <% String formatedDate=printDateInformation((LocalDateTime)pageContext.getAttribute("myDate")); %>

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
            <li class="nav-item">
              <a class="nav-link" href="addRecipe">ADD RECIPE</a>
            </li>
          </ul>
          <div class="user_option">
            <div class="dropdown text-end">
              <a href="#" class="d-block text-decoration-none dropdown-toggle" data-bs-toggle="dropdown"
                aria-expanded="false">
                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle" /><span>
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

  <!-- recipe section -->
  <div class="mb-4 recipe-container">
    <div class="container card border-warning mt-4 d-flex">
      <div class="row">
        <div class="col-md-12 px-0">
          <img src="./resources/images/home-food-3.jpg" alt="Recipe Image" class="img-fluid" />
        </div>
      </div>
      <div>
        <div class="row mt-3">
          <div class="col">
            <h4>${recipe.getRecipeName()}</h4>
            <div class="recipe-sub-info">
              <div class="d-flex justify-content-between">
                <div class="d-inline-flex">
                  <p class="me-3">
                    <strong><i class="fa-solid fa-user-tie"></i></strong>
                    ${recipe.getPostedBy()}
                  </p>
                  <p class="me-3">
                    <strong><i class="fa-regular fa-calendar-check clr-firebrick"></i></strong>
                    <%= formatedDate %>
                  </p>
                </div>
                <div class="d-inline-flex">
                  <c:if test="${recipe.averageRatings >= 1}">
                    <p class="me-3">
                      <strong>Ratings:
                        <c:forEach var="i" begin="0" end="${recipe.averageRatings - 1}">
                          <i class="fa-solid fa-star clr-gold"></i>
                        </c:forEach>
                      </strong>
                    </p>
                  </c:if>
                  <c:if test="${recipe.getTotalReviews() >= 1}">
                    <p>
                      <strong><i class="fa-solid fa-comment clr-midnight-blue"></i></strong>
                      ${recipe.getTotalReviews()} Reviews
                    </p>
                  </c:if>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-1 recipe-info-row">
        <div class="col-md-6 recipe-info-col recipe-info-align-center">
          <p>
            <strong><i class="fa-solid fa-hourglass-start"></i> Prep Time:</strong>
            ${recipe.getPrepTime()} minutes
          </p>
          <p>
            <strong>Serves:</strong>
            <c:forEach var="i" begin="0" end="${recipe.serves - 1}">
              <i class="fa-solid fa-user"></i>
            </c:forEach>
          </p>
          <p>
            <strong><i class="fa-solid fa-location-crosshairs me-1"></i>Total
              Ingredients:</strong>
            ${recipe.getNoOfIngredients()}
          </p>
          <p>
            <strong><i class="fa-solid fa-location-crosshairs me-1"></i>Total
              Steps:</strong>
            ${recipe.getNoOfSteps()}
          </p>
        </div>
        <div class="col-md-6 ps-3 recipe-info-align-center">
          <p>
            <c:if test="${recipe.getFoodType() == 'VEG'}">
              <strong><i class="fa-solid fa-square-check clr-green"></i></strong>
            </c:if>
            <c:if test="${recipe.getFoodType() == 'NONVEG'}">
              <strong><i class="fa-solid fa-square-check clr-red"></i></strong>
            </c:if>
            ${recipe.getFoodType()}
          </p>
          <p>
            <strong><i class="fa-solid fa-utensils"></i> Cuisine:</strong>
            ${recipe.getCuisine()}
          </p>
          <p>
            <strong><i class="fa-solid fa-list"></i> Category:</strong>
            ${recipe.getFoodCategory()}
          </p>
          <p>
            <strong><i class="fa-solid fa-bell"></i> Best For:</strong>
            ${recipe.getMealType()}
          </p>
        </div>
      </div>
      <div class="row recipe-info-row">
        <div class="col-md-6 recipe-info-col">
          <div class="m-auto width-fit-content">

            <div class="m-auto width-fit-content">
              <div class="recipe-ingredients-steps-title">
                <i class="fa-brands fa-java fa-xl me-1 clr-black"></i>
                <h5 class="ms-2">Ingredients:</h5>
              </div>
            </div>

            <ul class="ps-0 text-center width-fit-content li-type-none">
              <c:forEach var="ingredient" items="${recipe.ingredients}">
                <li>
                  <i class="fa-solid fa-bolt fa-sm clr-gold"></i>&nbsp;
                  ${ingredient.getIngredientQuantity()} &nbsp; : &nbsp;
                  ${ingredient.getIngredientName()}
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
        <div class="col-md-6">
          <div class="text-center">
            <div class="recipe-ingredients-steps-title">
              <i class="fa-brands fa-java fa-xl me-1 clr-black"></i>
              <h5 class="ms-2">Steps:</h5>
            </div>
          </div>

          <ul class="ps-0 m-auto pl-2vw li-type-none width-fit-content">
            <c:forEach var="step" items="${recipe.recipeSteps}">
              <li>
                <i class="fa-solid fa-bolt fa-sm me-1 clr-gold"></i>
                ${step.getStepDescription()}
              </li>
            </c:forEach>
          </ul>
        </div>
      </div>
      <div class="row recipe-info-row">
        <div class="text-center">
          <c:if test="${recipe.getAddedBy() == user.getId()}">
            <a href="getRecipeForUpdate?recipeId=${recipe.getRecipeId()}" class="btn btn-warning m-1"
              type="button">Update</a>
            <button class="btn btn-danger m-1" type="button" data-bs-toggle="modal" data-bs-target="#removeModal">
              Remove
            </button>
          </c:if>

          <c:if test="${recipe.getAddedBy() != user.getId()}">
            <a href="rateRecipe?recipeId=${recipe.getRecipeId()}" class="btn btn-warning m-1" type="button">Rate</a>
          </c:if>

          <button type="button" onclick="displayReviews()" class="btn btn-dark m-1">
            View Reviews
          </button>
        </div>
      </div>

      <!-- Modal -->
      <div class="modal fade" id="removeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-body">
              Are you sure you want to remove this Recipe?
            </div>
            <div class="text-center pb-3">
              <a href="removeRecipe?recipeId=${recipe.getRecipeId()}" type="button" class="btn btn-danger">Yes</a>

              <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- end of modal -->

      <!-- review section  -->
      <div class="rev-main-container">
        <c:if test="${not empty reviewList}">
          <div class="review-container recipe-info-row" id="review-sec" style="display: none;">
            <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-smooth-scroll="true"
              class="scrollspy-example height-fit-content" tabindex="0">

              <c:forEach var="review" items="${reviewList}" varStatus="loop">

                <c:if test="${loop.index % 2 == 0}">
                  <div id="list-item-${loop.index / 2 + 1}" class="myReviews row mx-0 mb-4">
                </c:if>

                  <div class="col-md-4 review-cols">
                    <div class="card border-warning">
                      <div class="card-body">
                        <div class="single-small-receipe-area d-flex mb-0">
                          <div class="receipe-thumb">
                            <h6>
                              <i class="fa-solid fa-user-tie me-2"></i>${review.getReviewBy()}
                            </h6>
                          </div>
                          <div class="receipe-content">
                            <span>
                              <c:out value="${review.getReviewedOn()}" />
                            </span>
                            <a href="#">
                              <h5 class="mt-2">
                                <c:out value="${review.getReview()}" />
                              </h5>
                            </a>
                            <div class="ratings">
                              <c:forEach begin="1" end="${review.getRatings()}">
                                <i class="fa fa-star" aria-hidden="true"></i>
                              </c:forEach>
                              <c:forEach begin="${review.getRatings() + 1}" end="5">
                                <i class="fa fa-star-o" aria-hidden="true"></i>
                              </c:forEach>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                <c:if test="${loop.index % 2 != 0 or loop.last}">
                  </div>
                </c:if>

              </c:forEach>
            </div>
          </div>
        </c:if>
      </div>
    </div>
  </div>

  <!-- end of recipe section -->

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
    function displayReviews() {
      let revSec = document.getElementById("review-sec");
      revSec.style.display = "block";
    }
  </script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script> -->
  <script src="./resources/cdn/popper.min.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> -->
  <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>

  <!-- <script src="https://kit.fontawesome.com/a6a9382d23.js" crossorigin="anonymous"></script> -->
  <script src="./resources/cdn/font-awesome-kit.js"></script>

  <script src="./resources/cdn/jquery-3.6.0.min.js"></script>
</body>

</html>