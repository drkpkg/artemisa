# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@saveAdmin = ->
  password = $("#password-text").val()
  password_repeat = $("#password-text-again").val()
  url = '/users/create'
  password = $("#password-text").val()
  data = {username: 'admin', password: password, password_repeat: password_repeat, type: 1}
  post(url, data)

@createUser = ->
  username = $('#newuser-username').val()
  password = $('#newuser-passwordar').val()
  name = $('#newuser-name').val()
  flastname = $('#newuser-father-lastname').val()
  mlastname = $('#newuser-mother-lastname').val()
  direction = $('#newuser-direction').val()
  email = $('#newuser-email').val()
  user_id = $('#newuser-group-selector').val()
  url = '/users/create/'
  data = {username: username, password: password, password_repeat: password, type: user_id, name: name,flastname: flastname, mlastname: mlastname, email: email, direction: direction}
  post(url, data)

@deleteUser = (id) ->
  url = '/users/delete/'
  data = {id: id}
  deleteObject(url, data)

@newUser = ->
  $("#new-user-modal").modal('show')

@editUser = (id)->
  $("#modify-user-modal").modal('show')
  $("#user-username-title").html("Modificar " + $("#actual-identity-"+id).html().trim(""))
  $("#user-username").val($("#actual-identity-"+id).html().trim(""))
  $("#user-email").val($("#actual-email-"+id).html().trim(""))
  $("#user-group-selector option:contains('#{$("#actual-group-"+id).html().trim("")}')").attr('selected', true)
  if($("#actual-state-"+id).html().trim("")=="Activo")
    $("#user-state").bootstrapSwitch('state',true)

  $("#save-modify-user").on 'click', ->
    username = $("#user-username").val()
    password = $("#user-password").val()
    name = $("#user-name").val()
    email = $("#user-email").val()
    group = $("#user-group-selector").val()
    state = $("#user-state").bootstrapSwitch('state')
    url = '/users/modify'
    data = {id: id, username: username, password: password, email: email, group: group, state: state}
    post(url, data)


@login = ->
  username = $("#username-text").val()
  password = $("#password-text").val()
  url = 'auth_user'
  data = {username: username, password: password}
  post(url, data)
