# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  $("#producto-name").val("")
  $("#producto-desc").text("")

@editProduct = (id) ->
  $("#producto-name").val($("#actual-name-" + id).text())
  $("#producto-desc").text($("#actual-desc-" + id).text())
  $("#producto-price-buy").val($("#actual-price-buy-" + id).text())
  $("#producto-price-sell").val($("#actual-price-sell-" + id).text())
  category = $("#actual-category-" + id).text().trim("")
  $("#producto-category option:contains("+category+")").val()
  $('#modify-modal').modal('show')

  $("#save-btn").on 'click', ->
    url = '/products/modify/'
    name = $("#producto-name").val()
    description = $("#producto-desc").val()
    buy = $("#producto-price-buy").val()
    sell = $("#producto-price-sell").val()
    category = $("#producto-category option:selected").val()
    data = {id: id, name: name, description: description, buy: buy, sell: sell, category: category}
    post(url, data)
    $("#modify-modal").modal('hide')

@deleteProduct = (id) ->
  url = '/products/delete/'
  data = {id: id}
  deleteObject(url, data)

@showQR = (id) ->
  qr = $("#actual-name-"+id).text() + "|" + $("#actual-desc-"+id).text() + "|" + $("#actual-price-"+id).text() + "|" + $.trim($("#actual-employee-"+id).text())
  $("#qr-img").attr("src", "https://chart.googleapis.com/chart?cht=qr&chl=" + qr + "&choe=UTF-8&chs=177x177")
  $("#qr-modal").modal('show')
