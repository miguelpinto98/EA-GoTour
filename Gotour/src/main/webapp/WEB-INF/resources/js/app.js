$(document).ready(function () {
  $("#search-city-box").select2({
    placeholder: "Select a city",
    allowClear: true
  });

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

  $("#user-type").change(function () {
    var type = $("#user-type option:selected").text();
    if (type.indexOf("Guide") >= 0) {
      $(".phone").show();
    } else {
      $(".phone").hide();
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
        //$('#notice-success').show();
      },
      error: function () {
        $('#notice-error').show();
      }
    });
  });

  $("#city-search").change(function () {
    var city_id = $("#city-search").val();

    $.ajax({
      method: 'GET',
      contentType: 'application/json',
      url: '/Gotour/cities/' + city_id,
      dataType: 'json',
      success: function (result) {
        console.log(result);
      },
      error: function () {
        $('#notice-error').show();
      }
    });
  });

  $("#href-filter").click(function () {
    var city = $("#city-filter").val();
    var theme = $("#theme-filter").val();

    $("#href-filter").attr("href", "/Gotour/cities/" + city + "/" + theme);
  });

  $('#language-book').change(function () {
    var languageId = $(this).val();
    $("#tour_date").removeAttr("disabled");
    $("#tickets").removeAttr("disabled");
    $("#book").removeAttr("disabled");
    var selected = false;
    $("#tour_date option").each(function () {
      if (!selected && $(this).attr("languageId") === languageId) {
        $(this).prop('selected', true);
        selected = true;
      }
      if ($(this).attr("languageId") === languageId) {
        $(this).removeAttr("hidden");
      }
      else if ($(this).attr("value") !== "-1") {
        $(this).removeAttr('selected');
        $(this).prop('hidden', true);
      }
    });
    if (!selected) {
      $("#default_date").prop('selected', true);
    }
    $("#tour_date option").trigger("click");
  });

  $("#book").click(function () {
    $.ajax({
      method: 'POST',
      url: '/Gotour/enrollments/' + $("#tour_date option:selected").attr("value"),
      success: function (confirmed) {
        if (confirmed) {
          $("#book").prop("disabled", true);
          $("#message_success").removeAttr("hidden");
        }
        else
          $("#message_error").removeAttr("hidden");
      },
      error: function () {
        $("#message_error").removeAttr("hidden");
        $("#message_error p").text("There is no available tour for the selected language!");
      }
    });
  });
  $("#tour_date option").on("click", function () {
    $("#is_enrolled").prop('hidden', true);
    if ($("#tour_date option:selected").attr("value") == -1) {
      return;
    }
    $.ajax({
      method: 'GET',
      url: '/Gotour/enrollments/' + $("#tour_date option:selected").attr("value") + '/users',
      success: function (confirmed) {
        if (confirmed) {
          $("#is_enrolled").removeAttr("hidden");
        }
      },
      error: function () {
      }
    });
  });

  $(".point-href").click(function () {
    var point_id = $(this).attr('data-target');

    $.ajax({
      method: 'GET',
      contentType: 'application/json',
      url: '/Gotour/points/' + point_id,
      dataType: 'json',
      success: function (result) {
        $("#point-title").text(result.name);
        $("#point-desc").text(result.description);
        
        $("#poiModal").modal('show');
      },
      error: function () {
        $('#notice-error').show();
      }
    });
  });
  
  $("#remove-tour").click(function () {
    var tour_id = $(this).attr('data-target');

    $.ajax({
      method: 'POST',
      url: '/Gotour/tours/remove',
      data: {id: tour_id },
      success: function (result) {
        alert("success");
      },
      error: function () {
        alert("error");
      }
    });
  });
});