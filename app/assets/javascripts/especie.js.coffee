# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@newSpecie = ->
  $("#new-specie-modal").modal('show')

@saveSpecie = ->
  url = '/animals/species/create/'
  especie = $("#especien").val()
  data = {especie: especie}
  post(url, data)

@modifySpecie = (id) ->
  $("#especiem").val($("#especie-" + id).text().trim(""))
  $("#modify-specie-modal").modal('show')

  $("#save-modify-batch").on 'click', ->
    especie = $("#especiem").val()
    url = '/animals/species/modify'
    data = {id: id, especie: especie}
    post(url, data)
    $("#modify-batch-modal").modal('hide')

@deleteSpecie = (id) ->
  url = '/animals/species/delete/'
  data = {id: id}
  deleteObject(url, data)