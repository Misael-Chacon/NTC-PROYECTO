$(document).ready(function(){
	$.ajax({
		url:"/titulo",
		method:"GET",
		dataType:"json",
		success:function(res){
			//console.log(res);
				$("#tituloproyecto").append(` ${res[0].nombre_proyecto}`);
		},
		error:function(error){
			console.error(error);
		}
    });
});

