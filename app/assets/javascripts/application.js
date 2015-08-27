// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require sweet-alert
//= require turbolinks
//= require twitter/bootstrap
//= require_tree .

/*
* Generic message function to all instances.
* */
function redirectTo(data) {
    window.location.href = data.redirect_page;
}

function showMessage(data) {
    swal({
        title: data.title,
        text: data.description,
        type: data.type,
        timer: 3000,
        showConfirmButton: false
    });
}
/*
* Generic Post function.
* This will be call in all instances of the views, the only parameters are:
* - Url: Rails define the routes, the only to do is call it as a normal http
* - Data: Is a hash what defines the json to send via post.
* */
function post(url, data) {
    $.ajax({
        url: url,
        dataType: 'json',
        type: 'POST',
        data: data,
        async: false,
        success: function(data)
        {
            if (data.status == '200')
            {
                showMessage(data);
                redirectTo(data);
            }
            else
            {
                showMessage(data);
            }
        }
    });
}

function get(url, data) {
    $.ajax
    ({
        url: url,
        dataType: 'json',
        type: 'GET',
        data: data,
        async: false,
        success: function(data)
        {
            if (data.status == '200')
            {
                redirectTo(data);
            }
            else
            {
                showMessage(data)
            }
        }
    });
}

function deleteObject(url, data){
    swal({
        title: "¿Está seguro de borrar esta campo?",
        text: "No se podrá recuperar los datos eliminados",
        type: "warning",
        cancelButtonText: "Cancelar",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Si, eliminar",
        closeOnConfirm: false
    }, function() {
        return post(url, data);
    });
}

