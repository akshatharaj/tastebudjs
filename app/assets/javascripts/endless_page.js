var currentPage = 1;
var intervalID = -1000;
 
function checkScroll() {
  if (nearBottomOfPage() && window.location.pathname == '/restaurants') {
    currentPage++;
    $.ajax({
      type: 'GET',
      url: [window.location.pathname, '?page=', currentPage].join(''),
      error: function(request, error){ console.log(request.responseText); },
      success: function(data)
      {
        if (data.indexOf('tr') < 0){
          clearInterval(intervalID);
        }
      },
      complete: function (){
      }
    });
  }

  if ($("#view_reviews").text() == 'Hide Reviews' && nearBottomOfPage() && window.location.pathname.match(/^\/restaurants\/([0-9]+)$/)) {
    console.log('paging reviews');
    currentPage++;
    $.ajax({
      type: 'GET',
      url: [window.location.pathname, '/reviews/?page=', currentPage].join(''),
      error: function(request, error){ console.log(request.responseText); },
      success: function(data)
      {
        if (data.indexOf('<p>') < 0){
          clearInterval(intervalID);
        }
      },
      complete: function (){
      }
    });    
  }

}
 
function nearBottomOfPage() {
  return scrollDistanceFromBottom() < 50;
}
 
function scrollDistanceFromBottom(argument) {
  return pageHeight() - (window.pageYOffset + self.innerHeight);
}
 
function pageHeight() {
  return Math.max(document.body.scrollHeight, document.body.offsetHeight);
}
 
$('document').ready(function(){
	intervalID = setInterval(checkScroll, 250);
})
