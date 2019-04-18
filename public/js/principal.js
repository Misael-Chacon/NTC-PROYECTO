
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

$(document).ready(function () {
    $.ajax({
          url: "/clasescursando",
          method: "GET",
          dataType: "json",
          success: function (res) {
                
                for (var i = 0; i < res.length; i++) {
                    $("#Cursando").append(
                    `<div>
                         <label style="color:white">${i+1}). </label>
                         <label style="color:white">${res[i]}</label>
                    </div>
                    `
                    );
                    
                }console.log(res);
          },
          error: function (error) {
         console.error(error);
          }
    });
});

$(document).ready(function () {
    $.ajax({
          url: "/clasescursara",
          method: "GET",
          dataType: "json",
          success: function (res) {
                
                for (var i = 0; i < res.length; i++) {
                    $("#Cursara").append(
                    `<div>
                         <label style="color:white">${i+1}). </label>
                         <label style="color:white">${res[i].nombre_clase}</label>
                    </div>
                    `
                    );
                    
                }console.log(res);
          },
          error: function (error) {
         console.error(error);
          }
    });
});


$(document).ready(function () {
    $.ajax({
          url: "/clasescursara2",
          method: "GET",
          dataType: "json",
          success: function (res) {
                
                for (var i = 0; i < res.length; i++) {
                    $("#norequisito").append(
                    `<div>
                         <label style="color:white">${i+1}). </label>
                         <label style="color:white">${res[i].nombre_clase}</label>
                    </div>
                    `
                    );
                    
                }console.log(res);
          },
          error: function (error) {
         console.error(error);
          }
    });
});