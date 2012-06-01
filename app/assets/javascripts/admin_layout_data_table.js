/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){

    var dataGrid = $('#categories');

    var initialize = function(){
       displayDataGrid();
    }


     var displayDataGrid = function(){
        dataGrid.dataTable({
            sPaginationType: "full_numbers",
            bJQueryUI: true,
            "aoColumns": [ null,null, { "bSortable": false }]
        });
    }

    $('body').bind('ajaxComplete', function() {

        initialize();

    });



    initialize();
   
});


