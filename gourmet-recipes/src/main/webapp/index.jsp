<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="Food Recipe" />
  <meta name="description" content="Find Food Recipes" />
  <meta name="author" content="Ullas G" />
  <link rel="shortcut icon" href="./resources/images/icon-logo.png" type="" />

  <title>The Gourmet</title>

  <link rel="stylesheet" type="text/css" href="./resources/css/bootstrap.css" />

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53.min.css" />

  <!-- <link rel="stylesheet" href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-53-docs.css" />

  <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/bootstrap-50-beta.min.css" />

  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/font-awesome-47.min.css" />

  <!-- <link rel="stylesheet" type="text/css"
    href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" /> -->
  <link rel="stylesheet" href="./resources/cdn/owl.carousel.min.css" />

  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css"
    integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ=="
    crossorigin="anonymous" /> -->
  <link rel="stylesheet" href="./resources/cdn/nice-select.min.css" />

  <link rel="stylesheet" href="./resources/css/font-awesome.min.css" />
  <link rel="stylesheet" href="./resources/css/style.css" />
  <link rel="stylesheet" href="./resources/css/responsive.css" />
</head>

<body>
  <!--Top Page-->
  <div class="hero_area">
    <!--Header Section-->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="#">
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
                <a class="nav-link" href="index">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#topRecipes">RECIPES</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="login">ADD RECIPE</a>
              </li>
            </ul>
            <div class="user_option">
              <a href="login" class="btn btn-outline-warning"> Sign In </a>
              <a href="registerUser" class="btn btn-warning"> Sign Up </a>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- End  of Header Section -->

    <!-- slider section -->
    <section class="slider_section">
      <div id="customCarousel1" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <div class="bg-box">
              <img src="./resources/images/home-food-9.jpg" alt="" />
            </div>
            <div class="container">
              <div class="row">
                <div class="col-md-7 col-lg-6">
                  <div class="detail-box food-9">
                    <h1>Fast Food Restaurant</h1>
                    <p>
                      Doloremque, itaque aperiam facilis rerum, commodi,
                      temporibus sapiente ad mollitia laborum quam quisquam
                      esse error unde. Tempora ex doloremque, labore, sunt
                      repellat dolore, iste magni quos nihil ducimus libero
                      ipsam.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="bg-box">
              <img src="./resources/images/home-food-8.jpg" alt="" />
            </div>
            <div class="container">
              <div class="row">
                <div class="col-md-7 col-lg-6">
                  <div class="detail-box food-8">
                    <h1>Fast Food Restaurant</h1>
                    <p>
                      Doloremque, itaque aperiam facilis rerum, commodi,
                      temporibus sapiente ad <br />
                      mollitia laborum quam quisquam esse error unde. Tempora
                      ex doloremque,<br />
                      labore, sunt repellat dolore, iste magni quos nihil
                      ducimus libero ipsam.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="bg-box">
              <img src="./resources/images/home-food-7.jpg" alt="" />
            </div>
            <div class="container">
              <div class="row">
                <div class="col-md-7 col-lg-6">
                  <div class="detail-box food-7">
                    <h1>Fast Food Restaurant</h1>
                    <p>
                      Doloremque, itaque aperiam facilis rerum, commodi,
                      temporibus sapiente ad mollitia laborum quam quisquam
                      esse error unde. Tempora ex doloremque, labore, sunt
                      repellat dolore, iste magni quos nihil ducimus libero
                      ipsam.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <div class="bg-box">
              <img src="./resources/images/home-food-3.jpg" alt="" />
            </div>
            <div class="container">
              <div class="row">
                <div class="col-md-7 col-lg-6">
                  <div class="detail-box food-3">
                    <h1>Fast Food Restaurant</h1>
                    <p>
                      Doloremque, itaque aperiam facilis rerum, commodi,
                      temporibus sapiente ad mollitia laborum quam quisquam
                      esse error unde. Tempora ex doloremque, labore, sunt
                      repellat dolore, iste magni quos nihil ducimus libero
                      ipsam.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <ol class="carousel-indicators">
            <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
            <li data-target="#customCarousel1" data-slide-to="1"></li>
            <li data-target="#customCarousel1" data-slide-to="2"></li>
            <li data-target="#customCarousel1" data-slide-to="3"></li>
          </ol>
        </div>
      </div>
    </section>
    <!-- End Slider section -->
  </div>
  <!--End of Top Page-->

  <!-- Top Recipes section -->
  <section class="food_section layout_padding-bottom" id="topRecipes">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>Top Recipes</h2>
      </div>
      <ul class="filters_menu mb-5">
        <li class="active">
          <a data-filter="all" onclick="filterSelection('all')"> All </a>
        </li>
        <li>
          <a data-filter="burger" onclick="filterSelection('burger')">Burger</a>
        </li>
        <li>
          <a data-filter="pizza" onclick="filterSelection('pizza')">Pizza</a>
        </li>
        <li>
          <a data-filter="pasta" onclick="filterSelection('pasta')">Pasta</a>
        </li>
        <li>
          <a data-filter="fries" onclick="filterSelection('fries')">Fries</a>
        </li>
      </ul>

      <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">
        <div class="col-12 col-sm-6 col-lg-4 pb-3 mb-3 myfilter pizza">
          <div class="single-best-receipe-area mb-30">
            <img src="./resources/images/home-food-1.jpg" alt="" />
            <div class="receipe-content pt-3 pb-3">
              <a href="receipe-post.html">
                <h5>Pizza</h5>
              </a>
              <button type="button" class="btn btn-outline-warning">
                <a href="">View Recipe</a>
              </button>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4 pb-3 mb-3 myfilter burger">
          <div class="single-best-receipe-area mb-30">
            <img src="./resources/images/home-food-1.jpg" alt="" />
            <div class="receipe-content pt-3 pb-3">
              <a href="receipe-post.html">
                <h5>Burger</h5>
              </a>
              <button type="button" class="btn btn-outline-warning">
                <a href="">View Recipe</a>
              </button>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4 pb-3 mb-3 myfilter pasta">
          <div class="single-best-receipe-area mb-30">
            <img src="./resources/images/home-food-1.jpg" alt="" />
            <div class="receipe-content pt-3 pb-3">
              <a href="receipe-post.html">
                <h5>Pasta</h5>
              </a>
              <button type="button" class="btn btn-outline-warning">
                <a href="">View Recipe</a>
              </button>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4 pb-3 mb-3 myfilter fries">
          <div class="single-best-receipe-area mb-30">
            <img src="./resources/images/home-food-1.jpg" alt="" />
            <div class="receipe-content pt-3 pb-3">
              <a href="receipe-post.html">
                <h5>Fries</h5>
              </a>
              <button type="button" class="btn btn-outline-warning">
                <a href="">View Recipe</a>
              </button>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4 pb-3 mb-3 myfilter burger">
          <div class="single-best-receipe-area mb-30">
            <img src="./resources/images/home-food-1.jpg" alt="" />
            <div class="receipe-content pt-3 pb-3">
              <a href="receipe-post.html">
                <h5>Burger</h5>
              </a>
              <button type="button" class="btn btn-outline-warning">
                <a href="">View Recipe</a>
              </button>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4 pb-3 mb-3 myfilter fries">
          <div class="single-best-receipe-area mb-30">
            <img src="./resources/images/home-food-1.jpg" alt="" />
            <div class="receipe-content pt-3 pb-3">
              <a href="receipe-post.html">
                <h5>Fries</h5>
              </a>
              <button type="button" class="btn btn-outline-warning">
                <a href="">View Recipe</a>
              </button>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4 pb-3 mb-3 myfilter pasta">
          <div class="single-best-receipe-area mb-30">
            <img src="./resources/images/home-food-1.jpg" alt="" />
            <div class="receipe-content pt-3 pb-3">
              <a href="receipe-post.html">
                <h5>Pasta</h5>
              </a>
              <button type="button" class="btn btn-outline-warning">
                <a href="">View Recipe</a>
              </button>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4 pb-3 mb-3 myfilter fries">
          <div class="single-best-receipe-area mb-30">
            <img src="./resources/images/home-food-1.jpg" alt="" />
            <div class="receipe-content pt-3 pb-3">
              <a href="receipe-post.html">
                <h5>Fries</h5>
              </a>
              <button type="button" class="btn btn-outline-warning">
                <a href="">View Recipe</a>
              </button>
            </div>
          </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4 pb-3 mb-3 myfilter burger">
          <div class="single-best-receipe-area mb-30">
            <img src="./resources/images/home-food-1.jpg" alt="" />
            <div class="receipe-content pt-3 pb-3">
              <a href="receipe-post.html">
                <h5>Burger</h5>
              </a>
              <button type="button" class="btn btn-outline-warning">
                <a href="">View Recipe</a>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="btn-box">
        <a href="login"> View More </a>
      </div>
    </div>
  </section>
  <!-- End of Top Recipes section -->

  <!-- review section -->
  <div class="card myReviews">
    <div class="container">
      <h2 class="text-center mb-4">Food Reviews</h2>

      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            
            <div class="row">

              <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                    <div class="single-small-receipe-area d-flex mb-0">
                      <div class="receipe-thumb">
                        <img src="./resources/images/home-food-1.jpg" alt="" />
                      </div>
                      <div class="receipe-content">
                        <span>January 04, 2018</span>
                        <a href="receipe-post.html">
                          <h5>Homemade italian pasta</h5>
                        </a>
                        <div class="ratings">
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>
                        <p>2 Comments</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                    <div class="single-small-receipe-area d-flex mb-0">
                      <div class="receipe-thumb">
                        <img src="./resources/images/home-food-1.jpg" alt="" />
                      </div>
                      <div class="receipe-content">
                        <span>January 04, 2018</span>
                        <a href="receipe-post.html">
                          <h5>Homemade italian pasta</h5>
                        </a>
                        <div class="ratings">
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>
                        <p>2 Comments</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                    <div class="single-small-receipe-area d-flex mb-0">
                      <div class="receipe-thumb">
                        <img src="./resources/images/home-food-1.jpg" alt="" />
                      </div>
                      <div class="receipe-content">
                        <span>January 04, 2018</span>
                        <a href="receipe-post.html">
                          <h5>Homemade italian pasta</h5>
                        </a>
                        <div class="ratings">
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>
                        <p>2 Comments</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="carousel-item">
            <div class="row">
              <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                    <div class="single-small-receipe-area d-flex mb-0">
                      <div class="receipe-thumb">
                        <img src="./resources/images/home-food-1.jpg" alt="" />
                      </div>
                      <div class="receipe-content">
                        <span>January 04, 2018</span>
                        <a href="receipe-post.html">
                          <h5>Homemade italian pasta</h5>
                        </a>
                        <div class="ratings">
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>
                        <p>2 Comments</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                    <div class="single-small-receipe-area d-flex mb-0">
                      <div class="receipe-thumb">
                        <img src="./resources/images/home-food-1.jpg" alt="" />
                      </div>
                      <div class="receipe-content">
                        <span>January 04, 2018</span>
                        <a href="receipe-post.html">
                          <h5>Homemade italian pasta</h5>
                        </a>
                        <div class="ratings">
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>
                        <p>2 Comments</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                    <div class="single-small-receipe-area d-flex mb-0">
                      <div class="receipe-thumb">
                        <img src="./resources/images/home-food-1.jpg" alt="" />
                      </div>
                      <div class="receipe-content">
                        <span>January 04, 2018</span>
                        <a href="receipe-post.html">
                          <h5>Homemade italian pasta</h5>
                        </a>
                        <div class="ratings">
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>
                        <p>2 Comments</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="carousel-item">
            <div class="row">
              <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                    <div class="single-small-receipe-area d-flex mb-0">
                      <div class="receipe-thumb">
                        <img src="./resources/images/home-food-1.jpg" alt="" />
                      </div>
                      <div class="receipe-content">
                        <span>January 04, 2018</span>
                        <a href="receipe-post.html">
                          <h5>Homemade italian pasta</h5>
                        </a>
                        <div class="ratings">
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>
                        <p>2 Comments</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                    <div class="single-small-receipe-area d-flex mb-0">
                      <div class="receipe-thumb">
                        <img src="./resources/images/home-food-1.jpg" alt="" />
                      </div>
                      <div class="receipe-content">
                        <span>January 04, 2018</span>
                        <a href="receipe-post.html">
                          <h5>Homemade italian pasta</h5>
                        </a>
                        <div class="ratings">
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>
                        <p>2 Comments</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-4">
                <div class="card">
                  <div class="card-body">
                    <div class="single-small-receipe-area d-flex mb-0">
                      <div class="receipe-thumb">
                        <img src="./resources/images/home-food-1.jpg" alt="" />
                      </div>
                      <div class="receipe-content">
                        <span>January 04, 2018</span>
                        <a href="receipe-post.html">
                          <h5>Homemade italian pasta</h5>
                        </a>
                        <div class="ratings">
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star" aria-hidden="true"></i>
                          <i class="fa fa-star-o" aria-hidden="true"></i>
                        </div>
                        <p>2 Comments</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
            aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"
            class="" aria-current="true"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"
            class=""></button>
        </div>
      </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
      data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
      data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <!-- </div> -->
  <!-- </div> -->

  <!-- end of review section -->

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
  <!-- end footer section -->

  <script src="./resources/cdn/jquery-3.4.1.min.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->
  <script src="./resources/cdn/bootstrap-53.bundle.min.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script> -->

  <script src="./resources/js/bootstrap.js"></script>

  <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script> -->
  <script src="./resources/cdn/popper.min.js"></script>

  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script> -->
  <script src="./resources/cdn/jquery.nice-select.min.js"></script>

  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script> -->
  <script src="./resources/cdn/owl.carousel.min.js"></script>

  <script src="./resources/js/custom.js"></script>
</body>

</html>