// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs


$(document).ready(function(){

   var dropDown = $('#search-facet');
   var liElement = $('#search-facet-list li');
   var verticalMenu = $('.has-nav');
   
   var initialize = function(){
        dropDown.click(openDropDown);
        liElement.click(selectList);
        verticalMenu.mouseover(showMenu);
        verticalMenu.mouseout(hideMenu);
    }

    var openDropDown = function(){

        if($('#search-facet-list').attr('class') == 'closed')
        {
            $('#search-facet-list').removeClass("closed");
            $('#search-facet-list').addClass("open");
        }
        else
        {
            $('#search-facet-list').removeClass("open");
            $('#search-facet-list').addClass("closed");
        }

    }

    var selectList = function(){
        liElement.removeClass("selected");
        $(this).addClass("selected");
        $('#search-facet label').html($(this).html());

    }

    var showMenu = function(){ 
       $(this).children("div").css('display', 'block');
    }

    var hideMenu = function(){
       $(this).children("div").css('display', 'none');
    }

    $('body').bind('ajaxComplete', function() {

        initialize();

    });



    initialize();
});
