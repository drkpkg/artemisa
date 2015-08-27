# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  if($('#login').length)
    $("#login-button").on 'click', ->
      username = $("#username-text").val()
      password = $("#password-text").val()
      url = 'user/auth_user'
      data = {username: username, password: password}
      get(url, data)


  if($('#first-run').length)
    $("#register-button").on 'click', ->
      password = $("#password-text").val()
      password_repeat = $("#password-text-again").val()
      url = 'user/create'
      password = $("#password-text").val()
      data = {username: 'admin', password: password, password_repeat: password_repeat, type: 1}
      post(url, data)

@deleteUser = (id) ->
  url = 'delete/'
  data = {id: id}
  deleteObject(url, data)