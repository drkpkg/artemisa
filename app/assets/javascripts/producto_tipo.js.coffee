# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@newProductType = ->
  $("#new-category-modal").modal('show')

@saveProductType = ->
  url = '/product_types/create/'
  description = $("#category-desc").val()
  data = {nombre: description}
  post(url, data)

@modifyProductType = (id) ->
  $("#new-title-category").val($("#nombre-"+id).text().trim(""))
  $("#modify-category-modal").modal('show')

  $("#save-modify-category").on 'click', ->
    newdescription = $("#new-title-category").val()
    url = '/product_types/modify'
    data = {id: id, nombre: newdescription}
    post(url, data)
    $("#modify-category-modal").modal('hide')

@deleteProductType = (id) ->
  url = '/product_types/delete/'
  data = {id: id}
  deleteObject(url, data)