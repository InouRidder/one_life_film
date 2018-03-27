function timePicking(id) {
  const timePickers = document.querySelectorAll('.time-picker-element-' + id);
  let timeInput = document.getElementById('time-input-' + id );
  function setTime(currentHour, currentMinute){
    currentMinute = currentMinute.toString()
    if (currentMinute.length === 1) {
      currentMinute = "0" + currentMinute
    }
    timeInput.value = currentHour.toString() + ":" + currentMinute.toString()
  }

  timePickers.forEach(function(picker) {
    picker.addEventListener('click', function(event){
      event.preventDefault();
      let currentValue = timeInput.value.split(":");

      let currentHour = parseInt(currentValue[0]);
      let currentMinute = parseInt(currentValue[1]);
      let type = picker.getAttribute('data-time-type');
      let direction = picker.getAttribute('data-time-direction');

      if (type === 'hour') {
        direction === 'up' ? currentHour++ : currentHour--
      }
      else {
        direction === 'up' ? currentMinute++ : currentMinute--
      }

      if (currentHour >= 24){
        currentHour = 0
      }
      else if (currentHour < 0 ){
        currentHour = 24
      }
      if (currentMinute >= 61 ){
        currentMinute = 0
      }
      else if (currentMinute < 0) {
        currentMinute = 60
      }

      setTime(currentHour, currentMinute)
    })
  })
}

timePicking("")
