function showNav() {
  var label = document.querySelector('#collapsible-nav-label');
  var nav = document.querySelector('.collapsible-nav-items');
  if (label.classList.contains('active')) {
    label.classList.replace('active', 'inactive');
    nav.style.height = '0px';
  } else {
    if (label.classList.contains('inactive')) {
      label.classList.replace('inactive', 'active');
    } else {
      label.classList.add('active');
    }
    nav.style.height = nav.scrollHeight + 'px';
  }
}
