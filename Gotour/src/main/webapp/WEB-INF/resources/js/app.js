$(document).ready(function() {
  $(".poi-multiple").multiSelect({
    keepOrder: true,
    selectableHeader: "<div class='custom-header'>Select the points</div>",
    selectionHeader: "<div class='custom-header'>Tour include</div>"
  });
  
  $(".poi-add").click(function(){
    $('input').val('');
    
    var city_name = $("#tour_city option:selected").text();
    var city_id = $("#tour_city").val();
    
    $("#poi-title").text(city_name);
    $("#poi-city").val(city_id);
    
    $("#myModal").modal('show');
  });
  
  $(".poi-save").click(function (){
    var city_id = $("#poi-city").val();
    var poi_name = $("#poi-name").val();
    var poi_desc = $("#poi-desc").val();
    var poi_coord = $("#poi-coord").val();
    
    $.ajax({
      method: 'POST',
      url: '/Gotour/points/create',
      data: {name: poi_name, description: poi_desc, location: poi_coord, cityid: city_id},
      success: function(result){
        var point = JSON.parse(result);        
        $('.poi-multiple').multiSelect('addOption', {value: point['id'], text: point['name'], index: 0});
        
        $("#myModal").modal('hide');
      },
      error: function(){
        alert("error");
      }
    });
  });
});