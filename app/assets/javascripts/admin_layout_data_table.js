/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){

    var categoryGrid = $('#categories');
    var productGrid = $('#products');

    var initialize = function(){
       displayCategoryGrid();
       displayProductGrid();
       addAnItem();
    }

    // display data grid for categories
     var displayCategoryGrid = function(){
        
        categoryGrid.dataTable({
            sPaginationType: "full_numbers",
            bJQueryUI: true,
            "aoColumns": [ null,null,{ "bSortable": false }] 
        });
        
        $('#categories_add').css('display','block');
        $('#categories_wrapper').children(':first-child').append($('div#categories_add'));
        
    }

    // display data grid for products
    var displayProductGrid = function(){
       
        productGrid.dataTable({
            sPaginationType: "full_numbers",
            bJQueryUI: true,
            "aoColumns": [{ "bSortable": false }, null,null,null,null, null,{ "bSortable": false }]
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

    $('body').bind('ajaxComplete', function() {

        initialize();

    });



    initialize();
   
});


