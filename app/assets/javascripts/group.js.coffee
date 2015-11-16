# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@createGroup = ->
  group = $('#newgroup-username').val()
  url = '/groups/create/'
  data = {descripcion_grupo: group}
  post(url, data)

@modifyGroup = ->
  group = $('#newgroup-username').val()
  url = '/groups/modify/'
  data = {group_name: group}
  post(url, data)

@deleteGroup = (id) ->
  url = '/groups/delete/'
  data = {id: id}
  deleteObject(url, data)

@newGroup = ->
  $("#new-group-modal").modal('show')

@editGroup = (id)->
  $("#modify-usuario-modal").modal('show')
