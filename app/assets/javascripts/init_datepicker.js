document.addEventListener('turbolinks:load', function() {
  $('.datepicker').datepicker({
     format: 'dd/mm/yyyy',
      startDate: '-3d'
    // <-- you can pass options here! Get them on the demo page by playing with settings
  });
  $('.datepicker2').datepicker({
     format: 'dd/mm/yyyy',
      startDate: '-2y'
    // <-- you can pass options here! Get them on the demo page by playing with settings
  });
});
