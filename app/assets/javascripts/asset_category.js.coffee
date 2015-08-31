# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  newCategory()
  saveCategory()

newCategory = ->
  $("#btn-category").on 'click', ->
    $("#new-category-modal").modal('show')

saveCategory = ->
  $("#save-category").on 'click', ->
    url = 'create/'
    description = $("#category-desc").val()
    data = {description: description}
    post(url, data)
    $("#new-category-modal").modal('hide')

@modifyCategory = (id) ->
  $("#btn-modify-"+id).on 'click', ->
    $("#new-title-category").val($("#category-title-"+id).text())
    $("#modify-category-modal").modal('show')

  $("#save-modify-category").on 'click', ->
    newdescription = $("#new-title-category").val()
    url = 'modify'
    data = {id: id, newdescription: newdescription}
    post(url, data)
    $("#modify-category-modal").modal('hide')

@deleteCategory = (id) ->
  url = 'delete/'
  data = {id: id}
  deleteObject(url, data)

@addTypeToCategory = (id) ->
  $("#new-type-modal").modal('show')
  $("#save-type").on 'click', ->
    category_id = id
    description = $("#type-desc").val()
    url = '/types/create'
    data = {category_id: category_id, description: description}
    post(url, data)

@deleteTypeInCategory = (id_type, id_category) ->
  url = '/types/delete'
  data = {id_type: id_type, id_category: id_category}
  deleteObject(url, data)

#$(document).ready(ready)
#$(document).on('page:load', ready)