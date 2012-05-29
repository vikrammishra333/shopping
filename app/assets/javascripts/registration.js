$(document).ready(function(){

   var fb = $('#facebook-register');


   var initialize = function(){
        fb.click(redirectToFacebook);
    }

    var redirectToFacebook = function(){
        //location.href = '/auth/facebook';
        alert("This functionality is currently deactivated");
    }

    $('body').bind('ajaxComplete', function() {

        initialize();

    });



    initialize();
});
