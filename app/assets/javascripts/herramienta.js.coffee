# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@activateBunker = (id) ->
  url = '/info/activate_bunker'
  data = {}
  post(url, data)