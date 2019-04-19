//Se cargo el Doom de universidades Completamente
$(document).ready(function () {
	$.ajax({
		url: "/universidades",
		method: "GET",
		dataType: "json",
		success: function (res) {
			for (var i = 0; i < res.length; i++) {
				$("#veruniversidades").append(
                `<div style="color:white">
                    <label  style="color:white">${i+1}). </label>
                    <label  style="color:yellow" for="chk-"${i}">${res[i].nombre_universidad}</label><br>
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