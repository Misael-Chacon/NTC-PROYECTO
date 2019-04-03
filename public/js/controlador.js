
var controller = {};
//Se cargo el nombre del usuario y la foto en inicio de sesion
$(document).ready(function(){
	$.ajax({
		url:"/usuarios",
		method:"GET",
		dataType:"json",
		success:function(res){
			//console.log(res);
				$("#nameusuario").append(` ${res[0].username}`);
				$("#fotousuario").append(
                    `<div class="avatar-icon">
						<img src="${res[0].foto}" style="width: 50px; height: 60px">
					</div>`			
				);
		},
		error:function(error){
			console.error(error);
		}
    });
});

