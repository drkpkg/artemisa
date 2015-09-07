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
  username = $('#user-username').val()
  password = $('#user-password').val()
  password_repeat = $('#user-password-again').val()
  user_id = $('#user-group-selector').val()
  url = 'create/'
  data = {username: username, password: password, password_repeat: password_repeat, type: user_id}
  post(url, data)

@deleteUser = (id) ->
  url = 'delete/'
  data = {id: id}
  deleteObject(url, data)

@newUser = ->
  $("#new-user-modal").modal('show')

@editUser = (id)->
  $("#modify-user-modal").modal('show')
  $("#user-username").html("Modificar " + $("#actual-identity-"+id).html().trim(""))
  $("#user-name").val($("#actual-name-"+id).html().trim(""))
  $("#user-father-lastname").val($("#actual-flastname-"+id).html().trim(""));
  $("#user-mother-lastname").val($("#actual-mlastname-"+id).html().trim(""))
  $("#user-direction").val($("#actual-direction-"+id).html().trim(""))
  $("#user-email").val($("#actual-email-"+id).html().trim(""))
  $("#user-group-selector option:contains('#{$("#actual-group-"+id).html().trim("")}')").attr('selected', true)

@login = ->
  username = $("#username-text").val()
  password = $("#password-text").val()
  url = 'user/auth_user'
  data = {username: username, password: password}
  post(url, data)
