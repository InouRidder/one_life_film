//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require components
//= require custom
//= require jquery-1.12.4.min
//= modernizr-2.6.2.min
//= require plugins


$(window).load(function(){
  var id = $(".active-classer").attr('id')
  $(".manu-wrapper ul li" + "#" + id).addClass('active')
});
