# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@newBreed = ->
  $("#new-breed-modal").modal('show')

@saveBreed = (id) ->
  url = '/animals/species/breeds/create/'
  raza = $("#razan").val()
  data = {raza: raza, especie_id: id}
  post(url, data)

@modifyBreed = (id, especie_id) ->
  $("#razam").val($("#raza-" + id).text().trim(""))
  $("#modify-breed-modal").modal('show')

  $("#save-modify-breed").on 'click', ->
    raza = $("#razam").val()
    url = '/animals/species/breeds/modify'
    data = {id: id, raza: raza, especie_id: especie_id}
    post(url, data)
    $("#modify-batch-modal").modal('hide')

@deleteBreed = (id) ->
  url = '/animals/species/breeds/delete/'
  data = {id: id}
  deleteObject(url, data)