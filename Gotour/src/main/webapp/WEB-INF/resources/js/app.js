$(document).ready(function () {
  $(".poi-multiple").multiSelect({
    keepOrder: true,
    selectableHeader: "<div class='custom-header'>Select the points</div>",
    selectionHeader: "<div class='custom-header'>Tour include</div>"
  });

  $(".poi-add").click(function () {
    $('input').val('');

    var city_name = $("#tour_city option:selected").text();
    var city_id = $("#tour_city").val();

    $("#poi-title").text(city_name);
    $("#poi-city").val(city_id);

    $("#myModal").modal('show');
  });

  $(".poi-save").click(function () {
    var city_id = $("#poi-city").val();
    var poi_name = $("#poi-name").val();
    var poi_desc = $("#poi-desc").val();
    var poi_coord = $("#poi-coord").val();

    $.ajax({
      method: 'POST',
      url: '/Gotour/points/create',
      data: {name: poi_name, description: poi_desc, location: poi_coord, cityid: city_id},
      success: function (point) {
        $('.poi-multiple').multiSelect('addOption', {value: point['id'], text: point['name'], index: 0});

        $("#myModal").modal('hide');
        $('#notice-success').show();
      },
      error: function () {
        $('#notice-error').show();
      }
    });
  });

  $("#tour_theme").change(function () {
    var theme = $("#tour_theme option:selected").text();
    if (theme.indexOf("Free") >= 0) {
      $(".price").hide();
    } else {
      $(".price").show();
    }
  });

  $("#tour_city").change(function () {
    $('.poi-multiple').empty().multiSelect('refresh');
    var city_id = $("#tour_city").val();

    $.ajax({
      method: 'GET',
      contentType: 'application/json',
      url: '/Gotour/points/city/' + city_id,
      dataType: 'json',
      success: function (result) {
        for (var i in result) {
          $('.poi-multiple').multiSelect('addOption', {value: result[i]['id'], text: result[i]['name'], index: 0});
        }
        $('#notice-success').show();
      },
      error: function () {
        $('#notice-error').show();
      }
    });
  });
});