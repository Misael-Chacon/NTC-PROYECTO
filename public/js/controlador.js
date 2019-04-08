var controller = {};
//Se cargo el nombre del usuario y la foto en inicio de sesion
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
			$("#nombreuniversidad").append(` ${res[0].nombre_universidad}`);
			$("#logouniversidad").append(
				`<div class="avatar-icon">
	       <img src="${res[0].logo_universidad}" style="width: 50px; height: 60px">
        </div>`
			);
			$("#nombreestudiante").append(` ${res[0].nombre_completo}`);
		},
		error: function (error) {
			console.error(error);
		}
	});
});


//Se cargo todo SELECTOR DE CARRERAS en la sesion del usuario
$(document).ready(function () {
	$.ajax({
		  url: "/carreras",
		  method: "GET",
		  dataType: "json",
		  success: function (res) {
				//console.log(res);
				for (var i = 0; i < res.length; i++) {
					  $("#carrera").append(
							`<option value="${res[i].codigo_carrera}">${res[i].nombre_carrera}</option>`
					  );
				}
		  },
		  error: function (error) {
		 console.error(error);
		  }
	});
});
