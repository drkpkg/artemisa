# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@hideName = () ->
  if $("#donation_nombre").prop('disabled') == true
    $("#donation_nombre").prop('disabled', false)
  else
    $("#donation_nombre").prop('disabled', true)