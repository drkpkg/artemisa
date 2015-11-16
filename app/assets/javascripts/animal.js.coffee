# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@deleteAnimal = (id) ->
  url = '/animals/delete/'
  data = {id: id}
  deleteObject(url, data)

@showBreeds = () ->
  $("#animal_raza_id").empty()
  id = $( "#especie option:selected" ).val()
  url = '/hermes/v1/breeds/list'
  $.ajax
    url: url
    dataType: 'json'
    type: 'GET'
    data: {id: id}
    async: false
    cache: false
    success: (data) ->
      $.each data, (key, value) ->
        $("#animal_raza_id").append '<option value=' + value.id + '>' + value.nombre_raza + '</option>'

