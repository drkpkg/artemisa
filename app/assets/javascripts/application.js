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
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap-switch
//= require toastr
//= require_tree .

$(document).ready(function(){
    $('[name="checkbox"]').bootstrapSwitch();
    $.fn.bootstrapSwitch.defaults.size = 'small';
    $('[data-toggle="tooltip"]').tooltip();
    $('#datetimepicker').datetimepicker({
        format: 'DD/MM/YYYY'
    });
    $('#time-in').datetimepicker({
        format: 'LT'
    });
    $('#time-out').datetimepicker({
        format: 'LT'
    });
    $('#time-in-modify').datetimepicker({
        format: 'LT'
    });
    $('#time-out-modify').datetimepicker({
        format: 'LT'
    });
});

$(document).on('page:load',function() {
    $('[name="checkbox"]').bootstrapSwitch();
    $.fn.bootstrapSwitch.defaults.size = 'small';
    $('[data-toggle="tooltip"]').tooltip();
    $('#datetimepicker').datetimepicker({
        format: 'DD/MM/YYYY'
    });
    $('#time-in').datetimepicker({
        format: 'LT'
    });
    $('#time-out').datetimepicker({
        format: 'LT'
    });
    $('#time-in-modify').datetimepicker({
        format: 'LT'
    });
    $('#time-out-modify').datetimepicker({
        format: 'LT'
    });
});

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
        cache: false,
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
        cache: false,
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
            title: "¿Eliminar?",
            text: "No se podrá recuperar los datos eliminados",
            cancelButtonText: "Cancelar",
            showCancelButton: true,
            closeOnConfirm: false,
            showLoaderOnConfirm: true
        },
        function(){
            setTimeout(function(){
                post(url, data);
            }, 1000);
        });
}

function config(){
    $("#config-modal").modal("show");
}

function onlyNumbers(e){
    if (e.which != 8 && e.which != 0 && (e.which < 46 || e.which > 57)){
            notify("error", "Solo se aceptan números");
        return false;
    }
    return true;
}

function onlyText(e){
    if (e.which != 8 && e.which != 0 && (e.which < 96 || e.which > 123) && (e.which < 64 || e.which > 91) && e.which != 32){
        notify("error", "Solo se aceptan letras");
        return false;
    }
    return true;
}

function validateEmail(email) {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    if(re.test(email)==false){
        notify("error", "Formato de correo no valido");
        return false;
    }
    return true;
}

function notify(type, message){
    toastr[type](message);
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": true,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "300",
        "timeOut": "10",
        "extendedTimeOut": "300",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
}

function search(seachInput){
    _this = $(seachInput);
    // Show only matching TR, hide rest of them
    $.each($("#table tbody").find("tr"), function() {
        if($(this).text().toLowerCase().indexOf($(_this).val().toLowerCase()) == -1){
            $(this).hide();
        }else{
            $(this).show();
        }
    });
}

function readURL(input) {
    var reader;
    if (input.files && input.files[0]) {
        reader = new FileReader;
        reader.onload = function(e) {
            return $('#preview').attr('src', e.target.result);
        };
        return reader.readAsDataURL(input.files[0]);
    }
};

function readURLID(id, input) {
    var reader;
    if (input.files && input.files[0]) {
        reader = new FileReader;
        reader.onload = function(e) {
            return $('#' + id).attr('src', e.target.result);
        };
        return reader.readAsDataURL(input.files[0]);
    }
};