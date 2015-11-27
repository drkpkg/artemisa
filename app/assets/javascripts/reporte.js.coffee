# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@ready = ->
  $('#report-template').hide()
  getTables()

$(document).ready(ready)

@getDependencies = () ->
  $('#dependencies').empty()
  value = $('#tables :selected').val()
  url = '/hermes/v1/reports/dependencies/' + value
  $.ajax
    url: url
    dataType: 'json'
    type: 'GET'
    async: false
    cache: false
    success: (data) ->
      values = []
      $.each data, (key, value) ->
        values.push(value)
        $("#dependencies").append '<div class="input-group"><span class="input-group-addon"><input type="checkbox" value=' + value + '></span>' + '<label class="form-control">' + value + '<label></div>'
      $("#dependencies").append '<input type="button" class="btn btn-default pull-right" value="Buscar" onclick="searchData('+values+')">'
      $("#report-template").show()

@searchData = () ->
  console.log "Buscando datos"

getTables = ()->
  url = '/hermes/v1/reports/tables'
  $.ajax
    url: url
    dataType: 'json'
    type: 'GET'
    async: false
    cache: false
    success: (data) ->
      $.each data, (key, value) ->
        $("#tables").append '<option value=' + value + '>' + value + '</option>'

