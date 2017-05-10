//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require components
//= require custom
//= require jquery-1.12.4.min
//= modernizr-2.6.2.min
//= require plugins


// $('#datetimepicker').datetimepicker();

$(window).load(function(){
  var id = $(".active-classer").attr('id')
  $(".manu-wrapper ul li" + "#" + id).addClass('active')

  // if (window.innerWidth <= 416) {
  //   $('#home-background').atrr('style' , "background-image: url('https://farm9.staticflickr.com/8441/28616172163_b4ab4459f1_k.jpg')");
  // }
  // else {
  //   $('#home-background').attr("data-property" , "{videoURL:'https://www.youtube.com/watch?v=4pSzhZ76GdM&index=3&list=PLD33E5618740295DF'}");
  // }
});

