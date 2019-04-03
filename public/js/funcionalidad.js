var controller = {};
 
 //Se cargo todo SELECTOR DE PAICES en el registro de Usuarios
 $(document).ready(function () {
	   $.ajax({
			 url: "/paices",
			 method: "GET",
			 dataType: "json",
			 success: function (res) {
				   //console.log(res);
				   for (var i = 0; i < res.length; i++) {
						 $("#pais").append(
							   `<option value="${res[i].codigo_pais}">${res[i].nombre_pais}</option>`
						 );
				   }
			 },
			 error: function (error) {
			console.error(error);
			 }
	   });
 });

 //Se cargo todo SELECTOR DE UNIVERSIDADES en el registro de Usuarios
 $(document).ready(function () {
	$.ajax({
		  url: "/universidades",
		  method: "GET",
		  dataType: "json",
		  success: function (res) {
				//console.log(res);
				for (var i = 0; i < res.length; i++) {
					  $("#universidad").append(
							`<option value="${res[i].codigo_universidad}">${res[i].nombre_universidad}</option>`
					  );
				}
		  },
		  error: function (error) {
		 console.error(error);
		  }
	});
});
