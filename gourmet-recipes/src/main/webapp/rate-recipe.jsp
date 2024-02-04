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
  <link rel="stylesheet" href="./resources/css/rate-recipe.css" />
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
              <a class="nav-link" href="getAllRecipesByUserId?userId=${userId}">MY RECIPES</a>
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

  <!-- login section -->
  <div class="login-section mt-2">
    <aside class="col-sm-4">
      <div class="card border-warning">
        <article class="card-body">
          <h4 class="card-title mb-4 mt-1">RATE RECIPE</h4>

          <div class="ms-5">
            <form id="ratingForm" action="rateRecipe" method="post" onsubmit="return validateRating()">
              <input type="text" id="reviewerId" name="reviewerId" value="${user.getId()}"
                style="display: none" />
              <input type="text" id="recipeId" name="recipeId" value="${recipeId}" style="display: none" />
              <input type="text" id="reviewBy" name="reviewBy" value="${user.getFirstName()} ${user.getLastName()}" style="display: none" />
              <div class="d-flex">
                <div>
                  <label id="rating-label" for="rating" class="form-label">Rating :</label>
                  <input type="hidden" name="ratings" id="rating" value="0" />
                  <span id="rating-error" class="mb-3"></span>
                </div>
                <div class="mt-2">
                  <span class="rating-stars" onclick="setRating(1)"><i class="fa-solid fa-star"></i></span>
                  <span class="rating-stars" onclick="setRating(2)"><i class="fa-solid fa-star"></i></span>
                  <span class="rating-stars" onclick="setRating(3)"><i class="fa-solid fa-star"></i></span>
                  <span class="rating-stars" onclick="setRating(4)"><i class="fa-solid fa-star"></i></span>
                  <span class="rating-stars" onclick="setRating(5)"><i class="fa-solid fa-star"></i></span>
                </div>
              </div>

              <div class="mb-3">
                <label id="comments-label" for="exampleFormControlTextarea1" class="form-label">Comments :</label>
                <textarea name="review" class="form-control" id="exampleFormControlTextarea1"
                  placeholder="share your experience" rows="2" style="width: 20vw"></textarea>
              </div>
              <div class="text-center ms-0" style="margin-right: 3vw">
                <button type="submit" class="btn btn-primary mt-3">
                  Submit
                </button>
              </div>
            </form>
          </div>
        </article>
      </div>
    </aside>

    <div class="backend-msg">
      <!-- <h4>${reviewErr}</h4> -->
    </div>
  </div>
  <!-- end of login section -->

  <!-- footer section -->
  <footer class="footer_section" style="margin-top: 26.6vh">
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

  <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script> -->
  <script src="./resources/cdn/popper.min.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> -->
  <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>

  <!-- <script src="https://kit.fontawesome.com/a6a9382d23.js" crossorigin="anonymous"></script> -->
  <script src="./resources/cdn/font-awesome-kit.js"></script>
  <script src="./resources/js/rate-recipe.js"></script>
</body>

</html>