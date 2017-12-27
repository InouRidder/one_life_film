const tabs = document.querySelectorAll('.tab')
const tabTargets = document.querySelectorAll('.tab-content')
tabs.forEach(function(tab){
  tab.addEventListener('click', function(){
    tabs.forEach(function(tab){
      tab.classList.remove('active')
    })
    this.classList.add('active')
    tabTargets.forEach(function(target){
      target.hidden = true;
    });
    let target = document.getElementById(this.getAttribute('data-target'));
    target.hidden = false;
  });
});
