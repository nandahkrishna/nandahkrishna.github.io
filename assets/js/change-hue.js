var hues = ['#8d0016', '#00520c', '#003975', '#b05200'];
var random = Math.floor(Math.random() * Math.floor(4));
document.documentElement.style.setProperty('--default-hue', hues[random]);
