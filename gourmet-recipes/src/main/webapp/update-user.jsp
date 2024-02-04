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

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-50-beta.min.css" />

  <!-- <link rel="stylesheet" href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53-docs.css" />

  <link rel="stylesheet" href="./resources/css/font-awesome.min.css" />
  <link rel="stylesheet" href="./resources/css/bootstrap.css" />
  <link rel="stylesheet" href="./resources/css/responsive.css" />
  <link rel="stylesheet" href="./resources/css/user-registration.css" />
  <link rel="stylesheet" href="./resources/css/update-user.css" />
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
            <!-- <a href="userHome" class="btn btn-outline-warning"> BACK </a> -->
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
                  <a class="dropdown-item" href="getUser">Update Profile</a>
                </li>
                <li>
                  <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete Account</a>
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

  <!-- Modal -->
  <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body text-center">
          Are you sure you want to delete your account?
        </div>
        <div class="text-center pb-3">
          <a href="deleteUser" type="button" class="btn btn-danger">Yes</a>

          <button type="button" class="btn btn-warning" data-bs-dismiss="modal">
            Close
          </button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="updateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="updateModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-body text-center">
          Are you sure you want to update your account?
        </div>
        <div class="text-center pb-3">
          <button type="button" class="btn btn-danger" id="confirmButton">Yes</button>

          <button type="button" class="btn btn-warning" id="closeBtn" data-bs-dismiss="modal">
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
      <div class="title">Update User</div>
      <div class="content">
        <form action="updateUser" method="post" onsubmit="return validateForm()">
          <div class="user-details">
            <input type="text" id="userId" name="id" value="${user.getId()}" class="d-none" />
            <div class="input-box">
              <span class="details">First Name</span>
              <input type="text" placeholder="Enter your first name" id="firstName" name="firstName"
                value="${user.getFirstName()}" onblur="validateFName()" />
              <br /><span id="fname-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Last Name</span>
              <input type="text" placeholder="Enter your last name" id="lastName" name="lastName"
                value="${user.getLastName()}" onblur="validateLName()" />
              <br /><span id="lname-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Email</span>
              <input type="email" placeholder="Enter your email" id="email" name="email" value="${user.getEmail()}"
                onblur="validateEmail()" />
              <input type="email" placeholder="Enter your email" id="user-email" name="user-email"
                value="${user.getEmail()}" class="d-none" />
              <br /><span id="email-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Contact Number</span>
              <input type="tel" placeholder="Enter your Contact number" id="contactNo" name="contactNo"
                value="${user.getContactNo()}" onblur="validateContactNo()" />
              <input type="tel" placeholder="Enter your Contact number" id="user-contactNo" name="user-contactNo"
                value="${user.getContactNo()}" class="d-none" />
              <br /><span id="contact-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Alternative Contact Number</span>
              <input type="tel" placeholder="Enter Alternative Contact number" id="alternativeNumber"
                name="alternativeNumber" value="${user.getAlternativeNumber()}"
                onblur="validateAlternativeContactNo()" />
              <br /><span id="alt-contact-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Address</span>
              <input type="text" placeholder="Enter your address" id="address" name="address"
                value="${user.getAddress()}" onblur="validateAddress()" />
              <br /><span id="address-error" class="error"></span>
            </div>
            <div class="gender-details">
              <c:set var="gender" value="${user.getGender()}" />
              <input type="radio" name="gender" id="dot-1" value="MALE" <c:if test="${fn:contains(gender, 'MALE')}">
              checked </c:if>>
              <input type="radio" name="gender" id="dot-2" value="FEMALE" <c:if test="${fn:contains(gender, 'FEMALE')}">
              checked</c:if>>
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
                value="${user.getPassword()}" onblur="validatePassword()" />
              <br /><span id="password-error" class="error"></span>
            </div>
            <div class="input-box">
              <span class="details">Confirm Password</span>
              <input type="password" placeholder="Confirm your password" id="confirmPwd" name="confirmPwd"
                value="${user.getPassword()}" onblur="validateConfirmPassword()" />
              <br /><span id="cpassword-error" class="error"></span>
            </div>
          </div>
          <div class="button">
            <input type="submit" value="UPDATE" onclick="showUpdateModal()" />
          </div>
        </form>
      </div>
    </div>
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

  <!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script> -->
  <script src="./resources/cdn/popper.min.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script> -->
  <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>

  <!-- <script src="https://kit.fontawesome.com/a6a9382d23.js" crossorigin="anonymous"></script> -->
  <script src="./resources/cdn/font-awesome-kit.js"></script>

  <script src="./resources/js/update-user.js"></script>
</body>

</html>