$( document ).ready(function(){
  $('#search_again').click(function(e){
    e.preventDefault();
    var $title = $('h2');
    var $form = $('form');
    $title.text("New physician search");
    $form.find('#address').val("");
    $form.find('#zipcode').val("");
    $form.find('select').val("");
    $form.show();
    $('#doctor_results').hide();
  });
});

$( document ).ready(function(){
  $('.btn-primary').click(function(e){
    e.preventDefault();
    var $form = $(this).closest('form');
    $.ajax({
      url: $form.attr('action'),
      type: 'POST',
      data: $form.serialize(),
      dataType: 'script',
      success: function(d){
        var response = JSON.parse(d);
        if (response[0].hasOwnProperty("notice")){
          $('div.container').prepend("<p class=notice>" + response[0]["notice"]);
        } else {
          $('.notice').remove();
          $form.hide();
          var $title = $('h2');
          $title.html("Search results")

          var $results = $('#doctor_results > ol');
          $results.html("");
          for (var i = 0; i < response.length; i++){
            $results.append("<li>" + response[i]["last_name"] + ", " + response[i]["first_name"] + "</li>");
            $results.append("<p>" + response[i]["full_address"] + "</p>");
            $results.append("<p>Distance: " + response[i]["distance"] + " miles</p>");
          }
          $('#doctor_results').append("<a id=search_again href='/'>");
          $('#doctor_results > a').text("Search again");
          $('#doctor_results').show();
        }
      },
      failure: function(){alert('Could not perform search');}
    });
  });
});