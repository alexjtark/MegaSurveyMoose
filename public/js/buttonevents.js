$(document).ready(function () {
  //Login partial AJAX call.
  var loginLoaded = false,
      loginActive = false,
      signupLoaded = false,
      signupActive = false;



  $('header').on('click', '#login-button', function (event) {
    event.preventDefault();

    if(loginLoaded) {
      if(loginActive) {
        $('#login').hide();
        loginActive = false;
      } else {
        $('#login').show();
        $('#signup').hide();
        loginActive = true;
        signupActive = false;
      }
      return;
    }

    var $target = $(event.target);

    $.ajax({
      url: '/login',
      type: 'GET'
    }).done(function (response) {
      $('#login').html(response);
    });

    $('#login').show();
    $('#signup').hide();
    loginLoaded = true;
    loginActive = true;
    signupActive = false;
  });

  $('header').on('click', '#signup-button', function (event) {
    event.preventDefault();

    if(signupLoaded) {
      if(signupActive) {
        $('#signup').hide();
        signupActive = false;
      } else {
        $('#signup').show();
        $('#login').hide();
        loginActive = false;
        signupActive = true;
      }
      return;
    }

    var $target = $(event.target);

    $.ajax({
      url: '/signup',
      type: 'GET'
    }).done(function (response) {
      $('#signup').html(response);
    });

    $('#signup').show();
    $('#login').hide();
    signupLoaded = true;
    signupActive = true;
    loginActive = false;
  });

  var questCounter = 0;

  $('#new-survey-form').on('click', '#add-question', function(event){
    event.preventDefault;
    console.log("add-question was called");
    $('#questions').append("<div id='q" + questCounter + "'><input type='text' size='75' name='q" + questCounter + "[]'><br><button type='button' class='add-answer'>Add an Answer</button></div>");
    questCounter++;

  });


  $('#new-survey-form').on('click', '.add-answer', function(event){
    event.preventDefault;
    $target=event.target;
    name = $($target).closest('div').attr('id');
    console.log("add-answer was called");
    console.log(name);
    $("#" + name).append(
      "<li><input type='text' size='75' name='"+ name + "[]'></li>");
  });


// Question ajax div

  $('#login-toolbar').on('click', '#create-survey', function (event){ event.preventDefault();
    $target = event.target;

    $.ajax({
      url: '/survey/new',
      type: 'GET',
      }).done(function (response) {
        $('#new-question-div').html(response);



    var questCounter = 0;

    $('#new-survey-form').on('click', '#add-question', function(event){
      event.preventDefault;
      console.log("add-question was called");
      $('#questions').append("<div id='q" + questCounter + "'><input type='text' size='75' name='q" + questCounter + "[]'><button type='button' class='add-answer'>Add an Answer</button></div>");
      questCounter++;
    });


    $('#new-survey-form').on('click', '.add-answer', function(event){
      event.preventDefault;
      $target=event.target;
      name = $($target).closest('div').attr('id');
      console.log("add-answer was called");
      console.log(name);
      $("#" + name).append(
      "<li><input type='text' size='50' name='"+ name + "[]'></li>");
      });
    });
  });
});


