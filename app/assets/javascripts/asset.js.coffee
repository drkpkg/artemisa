# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  $("#asset-name").val("")
  $("#asset-desc").text("")

@editAsset = (id) ->
  $("#asset-name").val($("#actual-name-" + id).text())
  $("#asset-desc").text($("#actual-desc-" + id).text())
  $("#asset-price-buy").val($("#actual-price-buy-" + id).text())
  $("#asset-price-sell").val($("#actual-price-sell-" + id).text())
  $('#modify-modal').modal('show')
  $("#save-btn").on 'click', ->
    url = 'modify/'
    name = $("#asset-name").val()
    description = $("#asset-desc").val()
    employee = $("#asset-employee option:selected").val()
    buy = $("#asset-price-buy").val()
    sell = $("#asset-price-sell").val()
    data = {id: id, name: name, description: description, buy: buy, sell: sell}
    post(url, data)
    $("#modify-modal").modal('hide')

@deleteAsset = (id) ->
  url = 'delete/'
  data = {id: id}
  deleteObject(url, data)

@showQR = (id) ->
  qr = $("#actual-name-"+id).text() + "|" + $("#actual-desc-"+id).text() + "|" + $("#actual-price-"+id).text() + "|" + $.trim($("#actual-employee-"+id).text())
  $("#qr-img").attr("src", "https://chart.googleapis.com/chart?cht=qr&chl=" + qr + "&choe=UTF-8&chs=177x177")
  $("#qr-modal").modal('show')
