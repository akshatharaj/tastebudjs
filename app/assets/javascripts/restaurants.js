$('document').ready(function() {

  $(".add_restaurant").hide();

  $("#add_new").unbind("click").on("click", function(e) 
  {
    e.preventDefault();

    if($("#add_new").text() != 'Cancel')
    {    
      $("#add_new").text('Cancel');
      $(".add_restaurant").show();
    }

    else
    {
      $("#add_new").text('Don\'t see the restaurant listed? Add it!');
      $(".add_restaurant").hide();
    }

  });

  $("#add_restaurant_form").unbind('submit').submit(function(e) {

    e.preventDefault();

    $.ajax({
      type: 'POST',
      url: "/restaurants",
      data:$('#add_restaurant_form').serialize(),
      error: function(request, error){ console.log(request.responseText); },
      success: function(data)
      { 
        $("#add_new").text('Don\'t see the restaurant listed? Add it!');
        $(".add_restaurant").hide();
        $("#add_restaurant_form").find("input[type=text]").val("");
      },
      complete: function (){
      }
    });

  });

});

