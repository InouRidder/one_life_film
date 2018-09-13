function setTab() {
  var tabs = document.querySelectorAll('.tab')
  tabs.forEach(function(tab){
    tab.addEventListener('click', function(){
      tabs.forEach(function(tab){
        tab.classList.remove('active')
      })
      this.classList.add('active')
    });
  });
}

setTab();

document.addEventListener("turbolinks:load", function() {
  setTab();
})