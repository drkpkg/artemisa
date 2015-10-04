# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  $("#product-name").val("")
  $("#product-desc").text("")

@editProduct = (id) ->
  $("#product-name").val($("#actual-name-" + id).text())
  $("#product-desc").text($("#actual-desc-" + id).text())
  $("#product-price-buy").val($("#actual-price-buy-" + id).text())
  $("#product-price-sell").val($("#actual-price-sell-" + id).text())
  category = $("#actual-category-" + id).text().trim("")
  $("#product-category option:contains("+category+")").val()
  $('#modify-modal').modal('show')

  $("#save-btn").on 'click', ->
    url = '/products/modify/'
    name = $("#product-name").val()
    description = $("#product-desc").val()
    buy = $("#product-price-buy").val()
    sell = $("#product-price-sell").val()
    category = $("#product-category option:selected").val()
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
