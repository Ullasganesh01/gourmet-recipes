<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
  <title>User Information</title>
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53.min.css" />
  <link rel="stylesheet" href="./resources/css/font-awesome.min.css" />
  <link rel="stylesheet" href="./resources/css/bootstrap.css" />
  <link rel="stylesheet" href="./resources/css/responsive.css" />
  <link rel="stylesheet" href="./resources/css/user-home.css" />
  <link rel="stylesheet" href="./resources/css/user-details.css" />
</head>

<body>
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
                  <p class="d-inline">&nbsp;&nbsp;${user.getFirstName()}</p>
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

  <!-- user details section -->
  <div class="container mt-5">
    <h3 class="mt-5 text-center">User Information</h3>

    <div class="row mt-4">
      <div class="col-md-6 mx-auto">
        <div class="card user-card border-warning">
          <!-- <img src="./resources/images/home-food-1.jpg" alt="Profile Picture" class="card-img-top"> -->
          <div class="card-body text-center">
            <p class="card-text">
              <strong>Full Name:</strong>${user.getFirstName()}
              ${user.getLastName()}
            </p>
            <p class="card-text">
              <strong>Email:</strong> ${user.getEmail()}
            </p>
            <p class="card-text">
              <strong>Contact Number:</strong> ${user.getContactNo()}
            </p>
            <p class="card-text">
              <strong>Alternative Number:</strong>
              ${user.getAlternativeNumber()}
            </p>
            <p class="card-text">
              <strong>Gender:</strong> ${user.getGender()}
            </p>
            <p class="card-text">
              <strong>Address:</strong> ${user.getAddress()}
            </p>
            <div class="text-center">
              <a class="btn btn-outline-warning" href="getUser" role="button">Update Details</a>

              <!-- Button trigger modal -->
              <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                Delete Account
              </button>

              <!-- Modal -->
              <div class="modal fade" id="deleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
                aria-labelledby="deleteModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-body">
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
              <!-- end of modal -->

              <a class="btn btn-outline-primary" href="userProfile" role="button">Back</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end of user details section -->

  <!-- footer section -->
  <footer class="footer_section" style="margin-top: 14.4vh">
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

  <script src="./resources/cdn/popper.min.js"></script>
  <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>
  <script src="./resources/cdn/font-awesome-kit.js"></script>
  <script src="./resources/cdn/jquery-3.6.0.min.js"></script>
</body>

</html>