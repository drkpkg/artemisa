# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  ready()

$(document).on 'page:change', ->
  ready()

ready = ->
  newDepartment()
  saveDepartment()

newDepartment = ->
  $("#btn-department").on 'click', ->
    $("#new-department-modal").modal('show')

saveDepartment = ->
  $("#save-department").on 'click', ->
    name = $("#department-name").val()
    description = $("#department-desc").val()
    $.ajax
      url: 'create/'
      dataType: 'json'
      type: 'POST',
      data: {name:name, description: description}
      success: (data) ->
        $("#new-category-modal").modal('hide')
        swal({
          title: "En hora buena",
          text: data.msg,
          type: "success",
          timer: 3000,
          showConfirmButton: false
        })
        window.location.href = data.auth_page

@modifyDepartment = (id) ->
  oldname = ''
  $("#btn-modify-"+id).on 'click', ->
    oldname = $("#department-name-"+id).text()
    $("#new-title-department").val($("#department-name-"+id).text())
    $("#new-desc-department").val($("#department-desc-"+id).text())
    $("#modify-department-modal").modal('show')
  $("#save-modify-department").on 'click', ->
    newname = $("#new-title-department").val()
    description = $("#new-desc-department").val()
    $.ajax
      url: 'modify/'
      dataType: 'json'
      type: 'POST',
      data: {oldname: oldname, newname: newname, description: description}
      success: (data) ->
        $("#modify-category-modal").modal('hide')
        swal({
          title: "En hora buena",
          text: data.msg,
          type: "success",
          timer: 3000,
          showConfirmButton: false
        })
        window.location.href = data.auth_page

@deleteDepartment = (id) ->
  $("#btn-delete-"+id).on 'click', ->
    swal({
        title: "¿Está seguro de borrar este departamento?",
        text: "No se podrá recuperar los datos eliminados",
        type: "warning",
        cancelButtonText: "Cancelar"
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Si, eliminar",
        closeOnConfirm: false
      }, ()->
      $.ajax
        url: 'delete/'
        dataType: 'json'
        type: 'POST',
        data: {id: id}
        success: (data) ->
          swal({
            title: "En hora buena",
            text: data.msg,
            type: "success",
            timer: 3000,
            showConfirmButton: false
          })
          window.location.href = data.auth_page
    )

#$(document).ready(ready)
#$(document).on('page:load', ready)