# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@newBatch = ->
  $("#new-batch-modal").modal('show')

@saveBatch = ->
  url = '/batch/create/'
  lote = $("#loten").val()
  cantidad = $("#cantidadn").val()
  minimo = $("#minimon").val()
  data = {lote: lote, cantidad: cantidad, minimo: minimo}
  post(url, data)

@modifyBatch = (id) ->
  $("#lotem").val($("#lote-" + id).text().trim(""))
  $("#cantidadm").val($("#cantidad-" + id).text().trim(""))
  $("#minimom").val($("#minimo-" + id).text().trim(""))
  $("#modify-batch-modal").modal('show')

  $("#save-modify-batch").on 'click', ->
    lote = $("#lotem").val()
    cantidad = $("#cantidadm" ).val()
    minimo = $("#minimom").val()
    url = '/batch/modify'
    data = {id: id, lote: lote, cantidad: cantidad, minimo: minimo}
    post(url, data)
    $("#modify-batch-modal").modal('hide')

@deleteBatch = (id) ->
  url = '/batch/delete/'
  data = {id: id}
  deleteObject(url, data)