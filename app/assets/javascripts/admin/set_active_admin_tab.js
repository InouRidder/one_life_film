var locationArray = window.location.href.split("/")
var id = locationArray[locationArray.length - 1]
if (id == 'admin') {
  id = 'calendar'
}
var toActiveTab = document.getElementById(id)
toActiveTab.classList.add('active-tab')

