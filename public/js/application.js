$(document).ready(function () {
    //Login partial AJAX call.
    $('header #login-toolbar').on('click', '#login-button', function (event) {
        event.preventDefault();
        var $target = $(event.target);

        $.ajax({
            url: '/login',
            type: 'GET'
        }).done(function (response) {
            $('#login-div').append(response);
        });
    });
});


