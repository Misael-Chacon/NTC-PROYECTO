var controller = {};
//Se cargo el Doom de Mensajes Completamente
$(document).ready(function () {
	$.ajax({
		url: "/mensajes",
		method: "POST",
		dataType: "json",
		success: function (res) {
			for (var i = 0; i < res.length; i++) {
				$("#mensajitos").append(
				`	<section>
						<div><h4>${res[i].titulo}</h4></div><br>
						<div><h5>${res[i].descripcion}</h5></div><br>
						<div style="box-sizing: border-box;">
						<hr>
							 <div class="row" style="color:black; display:flex; justify-content:center; align-items:left; box-sizing: border-box;">
								 <div style="width: 40px; heigth: 50px;">
								 	<img class="imagen" src="${res[i].foto}">
								 </div>
								<div>
									<h6>-  ${res[i].username}  </h6>
								</div>
							</div>
							<hr>
						</div>
						<h6>25k Views | 24 hours Ago</h6>
					</section>
				
				`
				);
			}
		},
		error: function (error) {
			console.error(error);
		}
	});
});