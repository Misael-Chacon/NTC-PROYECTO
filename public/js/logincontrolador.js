//Para Iniciar Sesion de usuario
$("#btn-login").click(function(){
    var parametros = `correo=${$("#correo").val()}&contrasena=${$("#contrasena").val()}`;
    console.log(parametros);  
    $.ajax({
        url:"/login",
        method:"POST",
        data: parametros,
        dataType:"json",
        success:function(respuesta){
            console.log(respuesta);
            if (respuesta.length == 1)
                window.location.href = "/sesioniniciada.html";
            else 
                window.location.href = "/loginerror.html";
        },
        error:function(error){
            console.error(error);
        }
    });
});
