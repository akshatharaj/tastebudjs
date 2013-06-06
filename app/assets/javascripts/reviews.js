$('document').ready(function() {

  $("#reviews_listing").hide();
  $("#new_review").hide();

  $("#view_reviews").unbind("click").on("click", function(e) {
    e.preventDefault();

    if($("#view_reviews").text() != 'Hide Reviews')
    {
      $("#view_reviews").text('Hide Reviews');
      $("#reviews_listing").show();
    }

    else
    {
      $("#view_reviews").text('View Reviews');
      $("#reviews_listing").hide();
    }

  });

  $("#add_review").unbind("click").on("click", function(e) {
    e.preventDefault();

    if($("#add_review").text() != 'Cancel')
    {
      $("#add_review").text('Cancel');
      $("#new_review").show();
    }

    else
    {
      $("#add_review").text('Submit yout review');
      $("#new_review").hide();
    }

  });

  $("#add_review_form").unbind('submit').submit(function(e) {

    e.preventDefault();

    $.ajax({
      type: 'POST',
      url: [window.location.pathname, '/reviews'].join(''),
      data:$('#add_review_form').serialize(),
      error: function(request, error){ console.log(request.responseText); },
      success: function(data)
      {
        $("#add_review").text('Submit your review');
        $("#new_review").hide();
        $("#add_review_form").find("input[type=text], textarea").val("");
      },
      complete: function (){
      }
    }); 

  });

});


