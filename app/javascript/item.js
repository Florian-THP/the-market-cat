
document.addEventListener('turbolinks:load', function() {
    document.querySelectorAll('.order-info-line').forEach(function(element) {
      element.addEventListener('click', function() {
        toggleOrderItems(this);
      });
    });
  });
  
  function toggleOrderItems(element) {
    var orderItemsDiv = element.nextElementSibling; 
    if (orderItemsDiv.style.display === "none") {
      orderItemsDiv.style.display = "block";
    } else {
      orderItemsDiv.style.display = "none";
    }
  }
  