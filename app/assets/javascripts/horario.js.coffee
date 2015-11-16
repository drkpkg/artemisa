# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@newHour = ->
  $("#new-hour-modal").modal('show')

@saveHour = ->
  url = '/schedules/create/'
  horae = $("#schedule-enter-new").val()
  horas = $("#schedule-exit-new").val()
  data = {hora_entrada: horae, hora_salida: horas}
  post(url, data)

@modifyHour = (id) ->
  $("#schedule-enter-modify").val($("#hora-entrada-" + id).text().trim(""))
  $("#schedule-exit-modify").val($("#hora-salida-" + id).text().trim(""))
  $("#cantidadm").val($("#cantidad-" + id).text().trim(""))
  $("#minimom").val($("#minimo-" + id).text().trim(""))
  $("#modify-hour-modal").modal('show')

  $("#save-modify-hour").on 'click', ->
    horae = $("#schedule-enter-modify").val()
    horas = $("#schedule-exit-modify" ).val()
    url = '/schedules/modify'
    data = {id: id, hora_entrada: horae, hora_salida: horas}
    post(url, data)
    $("#modify-hour-modal").modal('hide')

@deleteHour = (id) ->
  url = '/schedules/delete/'
  data = {id: id}
  deleteObject(url, data)