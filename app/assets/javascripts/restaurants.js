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

});

