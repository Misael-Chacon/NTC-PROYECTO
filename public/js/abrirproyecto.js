
$(document).ready(function(){
	$.ajax({
		url:"/Abierto/:codigo_proyecto",
		method:"GET",
		dataType:"json",
		success:function(res){
			//console.log(res);
                $("#editor").append(` ${res[0].nombre_archivo_html}`);
                $("#editorr").append(` ${res[0].nombre_archivo_css}`);
                $("#editora").append(` ${res[0].nombre_archivo_js}`);
		},
		error:function(error){
			console.error(error);
		}
    });
});
