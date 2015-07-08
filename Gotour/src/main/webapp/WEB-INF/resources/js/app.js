$(document).ready(function() {
  $(".poi-multiple").multiSelect({
    keepOrder: true,
    selectableHeader: "<div class='custom-header'>Select the points</div>",
    selectionHeader: "<div class='custom-header'>Tour include</div>",
  });
});