// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function execute(querystring) {
  $.ajax({
      url : "/makequery?q=" + querystring,
      type : "GET",
      async : false,
      dataType: "json",
      success: function(data)  {
      var tableRef = document.getElementById('myTable').getElementsByTagName('tbody')[0];
      for (var i = 0; i < data.length; i++) {
	      var curr = data[i]

        // Insert a row in the table at the last row
        var newRow   = tableRef.insertRow(tableRef.rows.length);

        // Insert a cell in the row at index 0
        var newCell  = newRow.insertCell(0);

        // Append a text node to the cell
        var newText  = document.createTextNode(item);
        newCell.appendChild(newText);
        i++;
      }
    }
    })
}
