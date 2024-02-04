function filterSelection(category) {
  var items = document.querySelectorAll(".myfilter");

  items.forEach(function (item) {
    var categories = item.classList;

    if (category === "all" || categories.contains(category)) {
      item.style.display = "block";
    } else {
      item.style.display = "none";
    }
  });
}

document.addEventListener("DOMContentLoaded", function () {
  // Get all filter menu items
  var filterItems = document.querySelectorAll(".filters_menu li");

  // Add click event listener to each filter item
  filterItems.forEach(function (item) {
    item.addEventListener("click", function () {
      // Remove active class from all items
      filterItems.forEach(function (el) {
        el.classList.remove("active");
      });

      // Add active class to the clicked item
      item.classList.add("active");
    });

    // Add hover event listener to each filter item
    item.addEventListener("mouseover", function () {
      // Add hover class on mouseover
      item.classList.add("hover");
    });

    item.addEventListener("mouseout", function () {
      // Remove hover class on mouseout
      item.classList.remove("hover");
    });
  });
});

// var reviewsCarousel = new bootstrap.Carousel(
//   document.getElementById("reviewsCarousel"),
//   {
//     interval: 2000, // Disable auto sliding
//   }
// );

// // nice select
// $(document).ready(function () {
//   $("select").niceSelect();
// });

// // client section owl carousel
// $(".client_owl-carousel").owlCarousel({
//   loop: true,
//   margin: 0,
//   dots: false,
//   nav: true,
//   // navText: [],
//   autoplay: true,
//   autoplayHoverPause: true,
//   navText: [
//     '<i class="fa fa-angle-left" aria-hidden="true"></i>',
//     '<i class="fa fa-angle-right" aria-hidden="true"></i>',
//   ],
//   responsive: {
//     0: {
//       items: 1,
//     },
//     768: {
//       items: 2,
//     },
//     1000: {
//       items: 2,
//     },
//   },
// });

// Ensure jQuery is loaded before Bootstrap JavaScript
$(document).ready(function () {
  // nice select
  $("select").niceSelect();

  // client section owl carousel
  $(".client_owl-carousel").owlCarousel({
    loop: true,
    margin: 0,
    dots: false,
    nav: true,
    navText: [
      '<i class="fa fa-angle-left" aria-hidden="true"></i>',
      '<i class="fa fa-angle-right" aria-hidden="true"></i>',
    ],
    autoplay: true,
    autoplayHoverPause: true,
    responsive: {
      0: {
        items: 1,
      },
      768: {
        items: 2,
      },
      1000: {
        items: 2,
      },
    },
  });

  // Initialize Bootstrap 4 carousel
  $("#reviewsCarousel").carousel({
    interval: 2000, // Disable auto sliding
  });
});

