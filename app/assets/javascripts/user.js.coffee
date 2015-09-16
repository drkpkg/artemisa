# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@saveAdmin = ->
  password = $("#password-text").val()
  password_repeat = $("#password-text-again").val()
  url = 'user/create'
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
  url = 'create/'
  data = {username: username, password: password, password_repeat: password, type: user_id, name: name,flastname: flastname, mlastname: mlastname, email: email, direction: direction}
  post(url, data)

@deleteUser = (id) ->
  url = 'delete/'
  data = {id: id}
  deleteObject(url, data)

@newUser = ->
  $("#new-user-modal").modal('show')

@editUser = (id)->
  $("#modify-user-modal").modal('show')
  $("#user-username-title").html("Modificar " + $("#actual-identity-"+id).html().trim(""))
  $("#user-username").val($("#actual-identity-"+id).html().trim(""))
  $("#user-name").val($("#actual-name-"+id).html().trim(""))
  $("#user-father-lastname").val($("#actual-flastname-"+id).html().trim(""));
  $("#user-mother-lastname").val($("#actual-mlastname-"+id).html().trim(""))
  $("#user-direction").val($("#actual-direction-"+id).html().trim(""))
  $("#user-email").val($("#actual-email-"+id).html().trim(""))
  $("#user-group-selector option:contains('#{$("#actual-group-"+id).html().trim("")}')").attr('selected', true)
  $("#save-modify-user").on 'click', ->
    password = $("#user-password").val()
    name = $("#user-name").val()
    flastname = $("#user-father-lastname").val();
    mlastname = $("#user-mother-lastname").val()
    address = $("#user-direction").val()
    email = $("#user-email").val()
    group = $("#user-group-selector").val()
    url = 'modify'
    data = {id: id, password: password, name: name, flastname: flastname, mlastname: mlastname, address: address, email: email, group: group}
    post(url, data)


@login = ->
  username = $("#username-text").val()
  password = $("#password-text").val()
  url = 'user/auth_user'
  data = {username: username, password: password}
  post(url, data)
