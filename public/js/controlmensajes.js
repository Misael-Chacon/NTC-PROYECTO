//Se cargo el Doom de Mensajes Completamente
$(document).ready(function () {
	$.ajax({
		url: "/mensajes",
		method: "POST",
		dataType: "json",
		success: function (res) {
			$("#mensajitos").append(`<div id="opinion" class="py-1 text-center">
                <h3 class="plumasescogidas" styles="text-align:center; position:center; color:yellow"> La más votada</h3><br>
			</div>
			<hr>`);
			for (var i = 0; i < res.length; i++) {
				console.log(res);
				$("#mensajitos").append(
				 `<div style="text-align:center" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-4">
					 <div  class="mensajasos">
				 	  <div style="color:white; font-weight: bold"><h6>${res[i].titulo}</h6></div><br>
					 <div style="color:white;  text-align:justify" ><h7>${res[i].descripcion}</h7></div><br>
					 <div>
						 <img style="width: 40px; heigth: 50px; text-align:center" class="imagenn" src="${res[i].foto}">
					 </div>
					 <div>
					 <div style="color:white; font-weight:bold"><h8>-  ${res[i].username}  </h8></div>
					 </div>
					 <hr>
					 <div style="color:white; font-weight:bold"><h8>${res[i].cant_likes} Likes | 24 hours Ago</h8></div>
					 <div>
					 
					 
				  </div>
				  <button id="megusta" onclick=darLike("${res[i].codigo_mensaje}","${res[i].codigo_usuario}")  type="button" class="btn btn-blue">Me Gusta</button>
				  <br>
				`
				);
			}
		},
		error: function (error) {
			console.error(error);
		}
	});
});

$("#todos_mensajes").click(function(){
	$("#todos_mensajes").hide();
	$.ajax({
		url: "/mensajestodos",
		method: "POST",
		dataType: "json",
		success: function (res) {
			for (var i = 0; i < res.length; i++) {
				console.log(res);
				$("#mensajitos2").append(
				 `<div style="text-align:center" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-4">
					 <div  class="mensajasos">
				 	  <div style="color:white; font-weight: bold"><h6>${res[i].titulo}</h6></div><br>
					 <div style="color:white;  text-align:justify" ><h7>${res[i].descripcion}</h7></div><br>
					 <div>
						 <img style="width: 40px; heigth: 50px; text-align:center" class="imagenn" src="${res[i].foto}">
					 </div>
					 <div>
					 <div style="color:white; font-weight:bold"><h8>-  ${res[i].username}  </h8></div>
					 </div>
					 <hr>
					 <div style="color:white; font-weight:bold"><h8>${res[i].cant_likes} Likes | 24 hours Ago</h8></div>
					 <div>
					 
				  </div>
				  <button id="megusta" onclick=darLike("${res[i].codigo_mensaje}","${res[i].codigo_usuario}") type="button" class="btn btn-blue">Me Gusta</button>
				  <br>
				`
				);
			}
		},
		error: function (error) {
			console.error(error);
		}
	});
});

function darLike(codigo_mensaje,codigo_usuario){
	
            parametro="codigo_mensaje="+codigo_mensaje+"&codigo_usuario="+codigo_usuario; 
			alert(parametro);
			$.ajax({
				date: parametro,
				url: "/sumarunlike",
				method: "POST",
				dataType: "json",
				success: function (res) {
					
				alert("si");

		
				},
				error: function (error) {
				console.error(error);
				
				}		
			});

			
		};
		