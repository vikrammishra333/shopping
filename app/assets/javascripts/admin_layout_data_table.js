/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){

    var categoryGrid = $('#categories');
    var productGrid = $('#products');
    var cBox = $('.cancel');
    var oBox = $('a.more');

    var initialize = function(){
       displayCategoryGrid();
       displayProductGrid();
       addAnItem();
       cBox.live('click', closeCBox);
       oBox.live('click', openCBox);
    }

    // display data grid for categories
     var displayCategoryGrid = function(){
        
        categoryGrid.dataTable({
            sPaginationType: "full_numbers",
            bJQueryUI   : true,
            "aoColumns" : [ null,null,{ "bSortable": false }],
            'bRetrieve' : true
        });
        
        $('#categories_add').css('display','block');
        $('#categories_wrapper').children(':first-child').append($('div#categories_add'));
        
    }

    // display data grid for products
    var displayProductGrid = function(){
       
        productGrid.dataTable({
            sPaginationType: "full_numbers",
            bJQueryUI   : true,
            "aoColumns" : [{ "bSortable": false }, null,null,null,null, null,{ "bSortable": false }],
            'bRetrieve' : true
        });

        $('#products_wrapper').children(':first-child').append($('div#category_select'));
        $('#products_wrapper').children(':first-child').append($('div#products_add'));

    }


    //////////////////////////////////////////////////////////////////////////////
    // opening colorbox                                                         //
    //////////////////////////////////////////////////////////////////////////////

    var addAnItem = function (){
        $('.add_item').colorbox({
            transition:"none"
        });
    }


    var closeCBox = function(){
        $.colorbox.close();
    }
//
//    var openCBox = function(){
//
//        var id = $(this).attr('id');alert(id);
//
//        $('#'+id).colorbox();
//    }

    $('body').bind('ajaxComplete', function() {

        initialize();

    });


    var openCBox = function(){
       var content = $(this).next().html();
       $.fn.colorbox({ width: "50%", height:"auto", html:content});
    }

    initialize();
   
});


