//Se cargo el Doom de universidades Completamente
$(document).ready(function () {
	$.ajax({
		url: "/departamentos",
		method: "GET",
		dataType: "json",
		success: function (res) {
			for (var i = 0; i < res.length; i++) {
				$("#verdepartamentos").append(
                `<div style="color:white">
                    <label  style="color:white">${i+1}). </label>
                    <label  style="color:yellow" for="chk-"${i}">${res[i].Nombre_departamento}</label><br>
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