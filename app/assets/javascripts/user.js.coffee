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
  user_id = $('#newuser-grupo-selector').val()
  url = '/users/create/'
  data = {username: username, password: password, password_repeat: password, type: user_id, name: name,flastname: flastname, mlastname: mlastname, email: email, direction: direction}
  post(url, data)

@deleteUser = (id) ->
  url = '/users/delete/'
  data = {id: id}
  deleteObject(url, data)

@newUser = ->
  $("#new-usuario-modal").modal('show')

@editUser = (id)->
  $("#modify-usuario-modal").modal('show')
  $("#usuario-username-title").html("Modificar " + $("#actual-identity-"+id).html().trim(""))
  $("#usuario-username").val($("#actual-identity-"+id).html().trim(""))
  $("#usuario-email").val($("#actual-email-"+id).html().trim(""))
  $("#usuario-grupo-selector option:contains('#{$("#actual-grupo-"+id).html().trim("")}')").attr('selected', true)
  if($("#actual-state-"+id).html().trim("")=="Activo")
    $("#usuario-state").bootstrapSwitch('state',true)

  $("#save-modify-usuario").on 'click', ->
    username = $("#usuario-username").val()
    password = $("#usuario-password").val()
    name = $("#usuario-name").val()
    email = $("#usuario-email").val()
    group = $("#usuario-grupo-selector").val()
    state = $("#usuario-state").bootstrapSwitch('state')
    url = '/users/modify'
    data = {id: id, username: username, password: password, email: email, group: group, state: state}
    post(url, data)


@login = ->
  username = $("#username-text").val()
  password = $("#password-text").val()
  url = 'auth_user'
  data = {username: username, password: password}
  post(url, data)
