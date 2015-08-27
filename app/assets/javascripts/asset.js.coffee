# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  $("#asset-name").val("")
  $("#asset-desc").text("")

  $("#asset_activo_precio_compra").on 'keypress', (e) ->
    if (e.which != 8 && e.which != 0 && (e.which < 46 || e.which > 57))
      $("#errmsg").html("Solo números").show().fadeOut("slow")

@editAsset = (id) ->
  $("#asset-name").val($("#actual-name-" + id).text())
  $("#asset-desc").text($("#actual-desc-" + id).text())
  $('#modify-modal').modal('show')
  $("#save-btn").on 'click', ->
    url = 'modify/'
    name = $("#asset-name").val()
    description = $("#asset-desc").val()
    employee = $("#asset-employee option:selected").val()
    data = {id: id, name: name, description: description, employee_id: employee}
    post(url, data)
    $("#modify-modal").modal('hide')

@deleteAsset = (id) ->
  url = 'delete/'
  data = {id: id}
  deleteObject(url, data)

@showQR = (id) ->
  qr = $("#actual-name-"+id).text() + "|" + $("#actual-desc-"+id).text() + "|" + $("#actual-price-"+id).text() + "|" + $.trim($("#actual-employee-"+id).text())
  $("#qr-img").attr("src", "https://chart.googleapis.com/chart?cht=qr&chl=" + qr + "&choe=UTF-8&chs=177x177")
  $("#qr-modal").modal('show')
