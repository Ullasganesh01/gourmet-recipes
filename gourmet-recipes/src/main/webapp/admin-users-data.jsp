<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Users Data</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="./resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />


    <link rel="stylesheet" href="./resources/css/font-awesome.min.css" />
    <!-- Template Main CSS File -->
    <link href="./resources/assets/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="./resources/css/admin-users-data.css" />
    <link rel="stylesheet" href="./resources/css/button_styles.css" />
</head>

<body>
    <!-- ======= Header ======= -->

    <header id="header" class="header fixed-top d-flex align-items-center header_section">
        <div class="d-flex align-items-center justify-content-between">
            <i class="bi bi-list toggle-sidebar-btn"></i>
        </div>

        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg custom_nav-container">
                <a class="navbar-brand" href="adminHome">
                    <span>
                        <img src="./resources/images/xworkz-logo.png" alt="Food Recipe Logo" />
                    </span>
                    <h2>The Gourmet</h2>
                </a>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="adminHome">Home</a>
                        </li>
                    </ul>

                    <div class="user_option">
                        <div class="dropdown text-end">
                            <a href="#" class="d-block text-decoration-none dropdown-toggle" data-bs-toggle="dropdown"
                                aria-expanded="false">
                                <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32"
                                    class="rounded-circle" /><span>
                                    <p style="display: inline">
                                        &nbsp;&nbsp;${user.getFirstName()}
                                    </p>
                                </span>
                            </a>
                            <ul class="dropdown-menu text-small">
                                <li class="dropdown-header">
                                    <h6>GOURMET</h6>
                                    <span>Admin</span>
                                </li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="adminProfile">
                                        <i class="bi bi-person"></i>
                                        <span>My Profile</span>
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="adminProfile">
                                        <i class="bi bi-gear"></i>
                                        <span>Account Settings</span>
                                    </a>
                                </li>
                                <li>
                                    <hr class="dropdown-divider" />
                                </li>

                                <li>
                                    <a class="dropdown-item d-flex align-items-center" href="logout">
                                        <i class="bi bi-box-arrow-right"></i>
                                        <span>Sign Out</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!--End Header-->

    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">
        <ul class="sidebar-nav" id="sidebar-nav">
            <li class="nav-item">
                <a class="nav-link" href="adminHome">
                    <i class="bi bi-grid"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <!-- End Dashboard Nav -->

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-menu-button-wide"></i><span>Recipes</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="components-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="#">
                            <i class="bi bi-circle"></i><span>Recipes</span>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- End Components Nav -->

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-journal-text"></i><span>Users</span><i class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="forms-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="adminUsersData">
                            <i class="bi bi-circle"></i><span>Users</span>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- End Forms Nav -->

            <li class="nav-item">
                <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                    <i class="bi bi-layout-text-window-reverse"></i><span>Reviews</span><i
                        class="bi bi-chevron-down ms-auto"></i>
                </a>
                <ul id="tables-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
                    <li>
                        <a href="#">
                            <i class="bi bi-circle"></i><span>Reviews</span>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- End Tables Nav -->

            <li class="nav-heading">Admin Info</li>

            <li class="nav-item">
                <a class="nav-link collapsed" href="adminProfile">
                    <i class="bi bi-person"></i>
                    <span>Profile</span>
                </a>
            </li>
            <!-- End Profile Page Nav -->

            <li class="nav-item">
                <a class="nav-link collapsed" href="logout">
                    <i class="bi bi-box-arrow-in-right"></i>
                    <span>Logout</span>
                </a>
            </li>
            <!-- End Login Page Nav -->
        </ul>
    </aside>
    <!-- End Sidebar-->

    <main id="main" class="main">
        <div class="pagetitle">
            <h1>
                Data Tables
                <span style="display: inline">
                    <form action="filterUsers" method="post" class="d-flex mysearchform" style="justify-content: flex-end">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                            style="width: fit-content" name="filter" />
                        <button class="btn btn-outline-info" type="submit">Search</button>
                    </form>
                </span>
            </h1>

            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="adminHome">Home</a></li>
                    <li class="breadcrumb-item">Users</li>
                    <li class="breadcrumb-item active">Data</li>
                </ol>
            </nav>
        </div>
        <!-- End Page Title -->

        <section class="section">
            <table class="table table-striped">
                <thead class="table-success">
                    <tr class="bg-danger">
                        <th scope="col">
                            User ID
                            <span class="sort-icons"><a href="sortUsers?sortBy=userIdAsc"><i
                                        class="fa-solid fa-sort-up"></i></a>
                                <a href="sortUsers?sortBy=userIdDesc"><i class="fa-solid fa-sort-down"></i></a></span>
                        </th>
                        <th scope="col">
                            First Name
                            <span class="sort-icons"><a href="sortUsers?sortBy=firstNameAsc"><i
                                        class="fa-solid fa-sort-up"></i></a>
                                <a href="sortUsers?sortBy=firstNameDesc"><i class="fa-solid fa-sort-down"></i></a></span>
                        </th>
                        <th scope="col">
                            Last Name
                            <span class="sort-icons"><a href="sortUsers?sortBy=lastNameAsc"><i
                                        class="fa-solid fa-sort-up"></i></a>
                                <a href="sortUsers?sortBy=lastNameDesc"><i class="fa-solid fa-sort-down"></i></a></span>
                        </th>
                        <th scope="col">
                            Email
                            <span class="sort-icons"><a href="sortUsers?sortBy=emailAsc"><i
                                        class="fa-solid fa-sort-up"></i></a>
                                <a href="sortUsers?sortBy=emailDesc"><i class="fa-solid fa-sort-down"></i></a></span>
                        </th>
                        <th scope="col">
                            Contact No
                            <span class="sort-icons"><a href="sortUsers?sortBy=contactNoAsc"><i
                                        class="fa-solid fa-sort-up"></i></a>
                                <a href="sortUsers?sortBy=contactNoDesc"><i
                                        class="fa-solid fa-sort-down"></i></a></span>
                        </th>
                        <th scope="col">
                            Alternative Contact No
                            <span class="sort-icons"><a href="sortUsers?sortBy=altNoAsc"><i
                                        class="fa-solid fa-sort-up"></i></a>
                                <a href="sortUsers?sortBy=altNoDesc"><i
                                        class="fa-solid fa-sort-down"></i></a></span>
                        </th>
                        <th scope="col">
                            Gender
                            <span class="sort-icons"><a href="sortUsers?sortBy=genderAsc"><i
                                        class="fa-solid fa-sort-up"></i></a>
                                <a href="sortUsers?sortBy=genderDesc"><i class="fa-solid fa-sort-down"></i></a></span>
                        </th>
                        <th scope="col">
                            Address
                            <span class="sort-icons"><a href="sortUsers?sortBy=addressAsc"><i
                                        class="fa-solid fa-sort-up"></i></a>
                                <a href="sortUsers?sortBy=addressDesc"><i class="fa-solid fa-sort-down"></i></a></span>
                        </th>
                        <th scope="col" colspan="3" style="text-align: center">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${ users }">
                    <tr>
                        <th scope="row">${user.getId()}</th>
                        <td>${user.getFirstName()}</td>
                        <td>${user.getLastName()}</td>
                        <td>${user.getEmail()}</td>
                        <td>${user.getContactNo()}</td>
                        <td>${user.getAlternativeNumber()}</td>
                        <td>${user.getGender()}</td>
                        <td>${user.getAddress()}</td>
                        <td>
                            <button id="viewTickets">
                                <a href="getUserTicketsById?userId=${user.getId()}">View Recipes</a>
                            </button>
                            <br /><button id="updatebtn">
                                <a href="getUserById?userId=${user.getId()}">Update</a>
                            </button>
                            <br /><button id="deletebtn">
                                <a href="removeUser?userId=${user.getId()}">Delete</a>
                            </button>
                        </td>
                        <!-- <td><button id="updatebtn"><a href="getUserById?userId=${user.getId()}">Update</a></button></td>
                            <td><button id="deletebtn"><a href="removeUser?userId=${user.getId()}">Delete</a></button></td> -->
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </main>
    <!-- End #main -->

    <div class="below-footer container-fluid bg-primary"></div>
    <!-- ======= Footer ======= -->
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
    <!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->

    <script src="./resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- <script src="assets/vendor/simple-datatables/simple-datatables.js"></script> -->

    <!-- Template Main JS File -->
    <script src="./resources/assets/js/main.js"></script>

    <!-- <script src="https://kit.fontawesome.com/a6a9382d23.js" crossorigin="anonymous"></script> -->
    <script src="./resources/cdn/font-awesome-kit.js"></script>
    
</body>

</html>