# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  newEmployee()
  saveEmployee()

newEmployee = ->
  $("#btn-new-employee").on 'click', ->
    $("#employee-identity").val("")
    $("#employee-name").val("")
    $("#employee-direction").val("")
    $("#save-employee").show()
    $("#modify-employee").hide()
    $("#employee-modal").modal('show')

saveEmployee = ->
  $("#save-employee").on 'click', ->
    name = $("#employee-name").val()
    identity = $("#employee-identity").val()
    direction = $("#employee-direction").val()
    office = $("#employee-office").val()
    department = $("#employee-department").val()
    url = 'create/'
    data = {name: name, identity: identity, direction: direction, office: office, department: department}
    post(url, data)
    $("#new-office-modal").modal('hide')

@editEmployee = (id) ->
  $("#employee-identity").val($("#actual-identity-"+id).text())
  $("#employee-name").val($("#actual-name-"+id).text())
  $("#employee-direction").val($("#actual-direction-"+id).text())
  $("#save-employee").hide()
  $("#modify-employee").show()
  $("#employee-modal").modal('show')

  $("#modify-employee").on 'click', ->
    name = $("#employee-name").val()
    identity = $("#employee-identity").val()
    direction = $("#employee-direction").val()
    office = $("#employee-office").val()
    department = $("#employee-department").val()

    url = 'modify/'
    data = {id: id, name: name, identity: identity, direction: direction, office: office, department: department}
    post(url, data)
    $("#new-office-modal").modal('hide')

@deleteEmployee = (id) ->
  url = 'delete/'
  data = {id: id}
  deleteObject(url, data)
