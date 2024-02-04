<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Food Recipe</title>

  <!-- Bootstrap CSS -->

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53.min.css" />

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-50-beta.min.css" />

  <!-- <link rel="stylesheet" href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53-docs.css" />

  <link rel="stylesheet" href="./resources/css/font-awesome.min.css" />
  <link rel="stylesheet" href="./resources/css/bootstrap.css" />
  <link rel="stylesheet" href="./resources/css/responsive.css" />
  <link rel="stylesheet" href="./resources/css/user-registration.css" />
  <link rel="stylesheet" href="./resources/css/login.css" />
</head>

<body>
  <!-- Header -->
  <header class="header_section">
    <div class="container-fluid">
      <nav class="navbar navbar-expand-lg custom_nav-container">
        <a class="navbar-brand" href="index">
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
            <!-- <li class="nav-item">
              <a class="nav-link" href="index">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index">RECIPES</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">ADD RECIPE</a>
            </li> -->
          </ul>
          <div class="user_option">
            <a href="login" class="btn btn-outline-warning"> Sign In </a>
            <a href="registerUser" class="btn btn-warning active">
              Sign Up
            </a>
          </div>
        </div>
      </nav>
    </div>
  </header>
  <!-- end of header" -->

  <!-- login section -->
  <div class="login-section mt-5">
    <aside class="col-sm-4">
      <div class="card border-warning">
        <article class="card-body">
          <div class="logo">
            <img class="mb-4" src="./resources/images/xworkz-logo.png" alt="" height="50" />
          </div>

          <h4 class="card-title mb-4 mt-1">ENTER OTP</h4>
          <form action="verifyOTP" method="post">
            <div class="mb-3">
              <label for="otp" class="form-label">Enter 4 digit OTP</label>
              <input type="text" class="form-control" id="otp" placeholder="****" name="otp" />
            </div>
            <div class="mb-3 login-btn-div">
              <button type="submit" class="btn btn-danger btn-block">
                VERIFY
              </button>
            </div>
          </form>
        </article>
      </div>
    </aside>

    <div class="backend-msg">
      <h4>${OTP}</h4>
    </div>
  </div>
  <!-- end of login section -->

  <!-- footer section -->
  <footer class="footer_section" style="top: 23vh">
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
</body>

</html>