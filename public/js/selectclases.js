//Se cargo el Doom de las clases Completamente
$(document).ready(function () {
	$.ajax({
		url: "/clases",
		method: "GET",
		dataType: "json",
		success: function (res) {
			for (var i = 0; i < res.length; i++) {
				$("#clasess").append(
                `<div style="color:white" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xl-4 order-md-1">
                    <label  style="color:white">${i+1}). </label>
                    <input type="checkbox" id="chk-"${i}"" name="chkclases[]" value="${res[i].nombre_clase}">
                    <label  style="color:yellow" for="chk-"${i}">${res[i].nombre_clase}</label><br>
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