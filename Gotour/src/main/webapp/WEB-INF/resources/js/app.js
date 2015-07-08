$(document).ready(function() {
  /*$(".poi-multiple").select2({
    placeholder: "Select the points of interest or create",
    allowClear: true
  });*/
  $(".poi-multiple").select2Sortable({
    bindOrder: 'sortableStop'
  });
});