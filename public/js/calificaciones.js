
//PARA MOSTRAR EL NOMBRE DE LA CARRERA QUE ESTA CURSANDO EN EL FORMULARIO PRINCIPAL
$(document).ready(function () {
	$.ajax({
		url: "/mostrarcarrera",
		method: "GET",
		dataType: "json",
		success: function (res) {
			//console.log(res);
			$("#CCarrera").append(`${res[0].nombre_carrera}`);
		},
		error: function (error) {
		console.error(error);
		}
	});
});

//Se cargo la tabla de las clases Completamente
$(document).ready(function () {
	$.ajax({
		url: "/clasecalificacion",
		method: "GET",
		dataType: "json",
		success: function (res) {
			for (var i = 0; i < res.length; i++) {
				$("#calificaciones").append(
                `<tr>
                    <th scope="row">${i+1}</th>
                    <td>${res[i].codigo_abreviatura}</td>
                    <td>${res[i].nombre_clase}</td>
                    <td>${res[i].unidades_valorativas}</td>
                    <td>${res[i].calificacion}</td>
                  </tr>
                `
				);
			}console.log(res);
		},
		error: function (error) {
			console.error(error);
		}
	});
});

//Se cargaron las clases en el select para ingresar la calificacion
$(document).ready(function () {
	$.ajax({
		  url: "/clases",
		  method: "GET",
		  dataType: "json",
		  success: function (res) {
				//console.log(res);
				for (var i = 0; i < res.length; i++) {
					  $("#clase").append(
							`<option value="${res[i].codigo_clase}">${res[i].nombre_clase}</option>`
					  );
				}
		  },
		  error: function (error) {
		 console.error(error);
		  }
	});
});