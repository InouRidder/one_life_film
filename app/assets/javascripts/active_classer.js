document.addEventListener('DOMContentLoaded', function() {
  var id = $(".active-classer").attr('id')
  $(".manu-wrapper ul li" + "#" + id).addClass('active')
});
