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