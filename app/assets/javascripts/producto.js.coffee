# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  $("#producto-name").val("")
  $("#producto-desc").text("")

@editProduct = (id) ->
  $("#marca").val($("#marca-" + id).text())
  $("#producto").val($("#producto-" + id).text())
  $("#precio").val($("#precio-" + id).text())
  $("#vencimiento").val($("#vencimiento-" + id).text())

  $('#categoria option').filter(->
    category = $("#categoria-" + id).text().trim("");
    $(this).text() == category
  ).prop 'selected', true

  $('#lote option').filter(->
    lote = $("#lote-" + id).text().trim("");
    console.log lote
    $(this).text() == lote
  ).prop 'selected', true

  $('#modify-modal').modal('show')

  $("#save-btn").on 'click', ->
    url = '/products/modify/'
    marca = $("#marca").val()
    producto = $("#producto").val()
    vencimiento = $("#vencimiento").val()
    precio = $("#precio").val()
    tipo = $("#categoria option:selected").val()
    lote = $("#lote option:selected").val()
    data = {id: id, marca: marca, producto: producto, precio: precio, tipo: tipo, lote: lote, vencimiento: vencimiento}
    post(url, data)
    $("#modify-modal").modal('hide')

@deleteProduct = (id) ->
  url = '/products/delete/'
  data = {id: id}
  deleteObject(url, data)

@showQR = (id) ->
  qr = $("#actual-name-"+id).text() + "|" + $("#actual-desc-"+id).text() + "|" + $("#actual-price-"+id).text() + "|" + $.trim($("#actual-employee-"+id).text())
  $("#qr-img").attr("src", "https://chart.googleapis.com/chart?cht=qr&chl=" + qr + "&choe=UTF-8&chs=177x177")
  $("#qr-modal").modal('show')
