var controller = {};
//Se cargo el Perfil Completamente
$(document).ready(function () {
	$.ajax({
		url: "/usuarios",
		method: "GET",
		dataType: "json",
		success: function (res) {
			//console.log(res);
			$("#nameusuario").append(` ${res[0].username}`);
			$("#fotousuario").append(
				`<div class="avatar-icon">
					<img src="${res[0].foto}" style="width: 50px; height: 60px">
				</div>`			
			);
			$("#foto").append(`<img src="${res[0].foto}" alt="FOTO"/> 
			<div class="file btn btn-lg btn-primary">
			Cambiar Fotografía
			<input type="file" name="file"/>
	        </div>`);
			$("#username").append(` <h5 >"${res[0].username}"</h5> `);
			$("#plan").append(`${res[0].nombre_plan}`);
			$("#nombrecompleto").append(` <p >"${res[0].nombre_completo}"</p> `);
			$("#email").append(` <p >"${res[0].correo}"</p> `);
			$("#telefono").append(` <p >"${res[0].telefono}"</p> `);
			$("#pais").append(` <p >"${res[0].nombre_pais}"</p> `);
			$("#sexo").append(` <p >"${res[0].genero}"</p> `);
			$("#fechanacimiento").append(` <p >"${res[0].fecha_nacimiento}"</p> `);
			$("#direccion").append(` <p >"${res[0].direccion}"</p> `);
			$("#biografia").append(` <p >"${res[0].descripcion}"</p> `);
			$("#urlfacebook").append(`  <a href="https://www.facebook.com/${res[0].url_facebook}" target="blank">FACEBOOK</a> `);
			$("#urltwitter").append(`  <a href="https://www.twitter.com/${res[0].url_twitter}" target="blank">TWITTER</a> `);
			$("#urllinkedin").append(`  <a href="https://www.linkedin.com/${res[0].url_linkedin}" target="blank">LINKEDIN</a> `);
			$("#urlgithub").append(`  <a href="https://www.github.com/${res[0].url_github}" target="blank">GIT-HUB</a> `);
			$("#txtelefono").append(`value="${res[0].telefono}"`);
			$("#txtfecha").append(` value="${res[0].fecha_nacimiento}"`);
			$("#txtdireccion").append(` ${res[0].direccion}`);
			$("#txtBiography").append(` ${res[0].descripcion}`);
			$("#txtFacebook").append(` value="${res[0].url_facebook}"`);
			$("#txtTwitter").append(` value="${res[0].url_twitter}"`);
			$("#txtLinkedin").append(` value="${res[0].url_linkedin}"`);
			$("#txtPlus").append(` value="${res[0].url_github}"`);

		},
		error: function (error) {
			console.error(error);
		}
	});
});

$("#btnupdate").click(function(){
	var parametros = `txtelefono=${$("#txtelefono").val()}&txtfecha=${$("#txtfecha").val()}&txtdireccion=${$("#txtdireccion").val()}&txtBiography=${$("#txtBiography").val()}&txtFacebook=${$("#txtFacebook").val()}&txtTwitter=${$("#txtTwitter").val()}&txtLinkedin=${$("#txtLinkedin").val()}&txtPlus=${$("#txtPlus").val()}`;
     $.ajax({
        url:"/actualizar",
		method:"GET",
		data: parametros,
        dataType:"json",
        success:function(res){
			console.log(res);
			window.location.href = "/perfil.html";
        },
        error:function(error){
            console.error(error);
        }
    });
});