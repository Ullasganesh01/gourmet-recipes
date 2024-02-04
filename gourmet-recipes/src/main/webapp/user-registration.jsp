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
  <link rel="stylesheet" href="./resources/css/user-registration.css" />
</head>

<body>
  <!-- Header -->
  <header class="header_section">
    <div class="container">
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
            <li class="nav-item">
              <a class="nav-link" href="index">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index">RECIPES</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">ADD RECIPE</a>
            </li>
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
      <div class="title">User Sign Up</div>
      <div class="content">
        <form action="registerUser" method="post" onsubmit="return validateForm()">
          <div class="user-details">
            <div class="input-box">
              <span class="details">First Name</span>
              <input type="text" placeholder="Enter your first name" id="firstName" name="firstName"
                onblur="validateFName()" />
              <br /><span id="fname-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Last Name</span>
              <input type="text" placeholder="Enter your last name" id="lastName" name="lastName"
                onblur="validateLName()" />
              <br /><span id="lname-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Email</span>
              <input type="email" placeholder="Enter your email" id="email" name="email" onblur="validateEmail()" />
              <br /><span id="email-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Contact Number</span>
              <input type="tel" placeholder="Enter your Contact number" id="contactNo" name="contactNo"
                onblur="validateContactNo()" />
              <br /><span id="contact-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Alternative Contact Number</span>
              <input type="tel" placeholder="Enter Alternative Contact number" id="alternativeNumber"
                name="alternativeNumber" onblur="validateAlternativeContactNo()" />
              <br /><span id="alt-contact-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Address</span>
              <input type="text" placeholder="Enter your address" id="address" name="address"
                onblur="validateAddress()" />
              <br /><span id="address-error" class="error"></span>
            </div>
            <div class="gender-details">
              <input type="radio" name="gender" id="dot-1" value="MALE" checked />
              <input type="radio" name="gender" id="dot-2" value="FEMALE" />
              <span class="gender-title">Gender</span>
              <div class="category">
                <label for="dot-1">
                  <span class="dot one"></span>
                  <span class="gender">Male</span>
                </label>
                <label for="dot-2" style="margin-left: 10px">
                  <span class="dot two"></span>
                  <span class="gender">Female</span>
                </label>
              </div>
            </div>
            <div class="input-box" style="visibility: hidden">
              <span class="details">Profile Picture:</span>
              <input type="file" placeholder="Uplooad your profile pic" id="profilePic" name="profilePic"
                accept="image/*" />
              <br /><span id="profile-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Password</span>
              <input type="password" placeholder="Enter your password" id="password" name="password"
                onblur="validatePassword()" />
              <br /><span id="password-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Confirm Password</span>
              <input type="password" placeholder="Confirm your password" id="confirmPwd" name="confirmPwd"
                onblur="validateConfirmPassword()" />
              <br /><span id="cpassword-error" class="error"></span>
            </div>
          </div>
          <div class="button">
            <input type="submit" value="Sign Up" />
          </div>
          <p class="text-center">
            Already Have an account? <a href="login">Sign In</a>
          </p>
        </form>
      </div>
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

  <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script> -->
  <script src="./resources/cdn/popper.min.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> -->
  <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>

  <!-- <script src="https://kit.fontawesome.com/a6a9382d23.js" crossorigin="anonymous"></script> -->
  <script src="./resources/cdn/font-awesome-kit.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->

  <script src="./resources/js/registration.js"></script>
</body>

</html>