//= require jquery.rating
//= require spree/frontend
//= require spree/frontend/spree_auth

// Navigating to a page with ratings via TurboLinks shows the radio buttons
$(document).on('page:load', function () {
  $('input[type=radio].star').rating();
});
