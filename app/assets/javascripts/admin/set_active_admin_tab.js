function setActiveTab() {
  var locationArray = window.location.href.split("/")
  var location = locationArray[locationArray.length - 1]
  if (location == 'admin') {
    location = 'calendar'
  }
  var locations = ['calendar', 'bookings', 'films', 'songs', 'requests']
  if (locations.includes(location)) {
    var toActiveTab = document.getElementById(location);
    toActiveTab.classList.add('active-tab');
  }
  return true;
}

document.addEventListener('DOMContentLoaded', setActiveTab);

document.addEventListener("turbolinks:load", function() {
  setActiveTab();
})


