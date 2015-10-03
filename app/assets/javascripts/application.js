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
//= require bootstrap-switch
//= require toastr
//= require_tree .

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $.fn.bootstrapSwitch.defaults.size = 'small';
    $('[name="checkbox"]').bootstrapSwitch();
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
        "hideDuration": "1000",
        "timeOut": "10",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
}

function updateToRest(){
    var state = $("#checkbox-invert").bootstrapSwitch('state');
    if(state){
        $("#app-main").css({"-webkit-filter":"invert(1)","filter":"invert(1)"});
    }else{
        $("#app-main").css({"-webkit-filter":"invert(0)","filter":"invert(0)"});
    }
}

function updateFontFamily(){
    font_family = $("#selectFontFamily").val();
    $("#app-main").css("font-family",font_family);
}

function updateFontSize(){
    var size = $("#selecFontSize").val();
    console.log(size);
    $("#app-main").css("font-size",size + "px");
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