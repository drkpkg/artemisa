# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  newOffice()
  saveOffice()

newOffice = ->
  $("#btn-office").on 'click', ->
    $("#new-office-modal").modal('show')

saveOffice = ->
  $("#save-office").on 'click', ->
    description = $("#office-desc").val()
    url = 'create/'
    data = {description: description}
    post(url, data)
    $("#new-office-modal").modal('hide')

@modifyOffice = (id) ->
  $("#modify-office-modal").modal("show")
  $("#new-title-office").val($("#office-text-"+id).text().trim(""))

  $("#save-modify-office").on 'click', ->
    url = 'modify/'
    description = $("#new-title-office").val()
    data = {id: id, description: description}
    post(url, data)

@deleteOffice = (id) ->
  url = 'delete/'
  data = {id: id}
  deleteObject(url, data)

#$(document).ready(ready)
#$(document).on('page:load', ready)