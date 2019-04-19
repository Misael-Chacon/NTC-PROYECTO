//Se cargo el Doom de Mensajes Completamente
$(document).ready(function () {
	$.ajax({
		url: "/mensajes",
		method: "POST",
		dataType: "json",
		success: function (res) {
			for (var i = 0; i < res.length; i++) {
				console.log(res);
				$("#mensajitos").append(
				 `<div style="text-align:center" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-4">
					 <div  class="mensajasos">
				 	  <div style="color:black; font-weight: bold"><h6>${res[i].titulo}</h6></div><br>
					 <div><h7>${res[i].descripcion}</h7></div><br>
					 <div>
						 <img style="width: 40px; heigth: 50px; text-align:center" class="imagenn" src="${res[i].foto}">
					 </div>
					 <div>
						<h8>-  ${res[i].username}  </h8>
					 </div>
					 <hr>
					 <h8>25k Views | 24 hours Ago</h8>
					 <div>
		      	</div>
				`
				);
			}
		},
		error: function (error) {
			console.error(error);
		}
	});
});