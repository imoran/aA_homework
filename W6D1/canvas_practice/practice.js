document.addEventListener("DOMContentLoaded", function(){
  var canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');
  ctx.fillRect(10, 10, 55, 50);
  ctx.fillStyle = 'rgb(255,255,255)';


  ctx.beginPath();
  ctx.arc(100,75,50,0,2*Math.PI);
  ctx.strokeStyle="#FF0000";
  ctx.stroke();
  ctx.lineWidth = 40;
});
