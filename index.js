//Servidor web en nodeJS para publicar archivos estaticos.
var express = require("express");
var session = require("express-session");
var mysql = require("mysql");
var bodyParser = require("body-parser");
var app = express();
var credenciales = {
    user: "root",
    password: "Misael_0801198109176",
    database: "ntc-proyecto",
    host: "localhost",
    port: "3306"
};
/*
var realtime = require("./realtime");
var http = require("http");
var server = http.Server(app);
realtime(server)
var io = require('socket.io').listen(app);*/

var publicAdmin = express.static("public-admin");
var publicUsuario = express.static("public-usuario");

var codigoUsuario = null;
var codigoUniversidad = null;
var codigoCarrera = null;
var clases = [];
var correoUsuario = null;
var codigoTipoUsuario = null;


//Exponer una carpeta como publica, unicamente para archivos estaticos: .html, imagenes, .css, .js
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(express.static("public"));
app.use(session({
    secret: "ASDFE$%#%",
    resave: true,
    saveUninitialized: true
}));
//Midlleware para el logeo de usuarios
app.use(
    function (req, res, next) {
        if (req.session.correoUsuario) {
            //Significa que el usuario si esta logueado
            if (req.session.codigoTipoUsuario == 1)
                publicAdmin(req, res, next);
            else if (req.session.codigoTipoUsuario == 2)
                publicUsuario(req, res, next);
        } else
            return next();
    }
);

app.get("/obtener-session", function (req, res) {
    res.send("Codigo Usuario: " + req.session.codigoUsuario +
        ", Correo: " + req.session.correoUsuario +
        ", Tipo Usuario: " + req.session.codigoTipoUsuario
    );
    res.end();
});

app.get("/cerrar-sesion", function (req, res) {
    req.session.destroy();
    clases = null;
    res.redirect('/index.html');
    res.end();
});

app.get("/contenido-registringido", verificarAutenticacion, function (req, res) {
    res.send("Este es un contenido restringido");
    res.end();
});

///Para agregar seguridad a una ruta especifica:
function verificarAutenticacion(req, res, next) {
    if (req.session.correoUsuario)
        return next();
    else
        res.send("ERROR, ACCESO NO AUTORIZADO");
}

//RUTAS
//Para llenar los Paices en el formulario de registrogratis
app.get("/paices", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT codigo_pais, nombre_pais FROM tbl_paises",
        [],
        function (error, data, fields) {
            if (error)
                res.send(error);
            else {
                res.send(data);
                res.end();
            }
        }
    );
});
//Para llenar las universidades en el formulario de registrogratis
app.get("/universidades", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT codigo_universidad, nombre_universidad FROM tbl_universidades",
        [],
        function (error, data, fields) {
            if (error)
                res.send(error);
            else {
                res.send(data);
                res.end();
            }
        }
    );
});
//Para llenar las carreras en el formulario de inicio de sesion
app.get("/carreras", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        `select m.codigo_carrera, m.nombre_carrera, b.codigo_universidad
        from tbl_carreras m
        left join tbl_universidades_x_tbl_carreras b
        on(m.codigo_carrera=b.codigo_carrera) 
        where b.codigo_universidad=?
        group by m.codigo_carrera`,
        [codigoUniversidad],
        function (error, data, fields) {
            if (error)
                res.send(error);
            else {
                res.send(data);
                res.end();
            }
        }
    );
});

//Para llenar las clases en el formulario de Seleccion de clases que esta cursando
app.get("/clases", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        `select a.codigo_clase, a.nombre_clase, a.codigo_abreviatura, a.unidades_valorativas, 
        e.codigo_universidad, e.codigo_carrera, e.calificacion, d.nombre_dificultad
        from tbl_clases a
        left join tbl_universidades_x_tbl_carreras e
        on(e.codigo_clase=a.codigo_clase) 
        left join tbl_dificultades d
        on(d.codigo_dificultad=a.codigo_dificultad) 
        where e.codigo_universidad=? and codigo_carrera = ?
        group by a.codigo_clase`,
        [codigoUniversidad, codigoCarrera],
        function (error, data, fields) {
            if (error)
                res.send(error);
            else {
                res.send(data);
                res.end();
            }
        }
    );
});

//Para llenar las clases con su calificacion en el formulario de calificacion
app.get("/clasecalificacion", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        `select a.codigo_clase, a.nombre_clase, a.codigo_abreviatura, a.unidades_valorativas, 
        e.codigo_universidad, e.codigo_carrera, e.calificacion, d.nombre_dificultad
        from tbl_clases a
        left join tbl_universidades_x_tbl_carreras e
        on(e.codigo_clase=a.codigo_clase) 
        left join tbl_dificultades d
        on(d.codigo_dificultad=a.codigo_dificultad) 
        where e.codigo_usuario=? 
        group by a.codigo_clase`,
        [codigoUsuario],
        function (error, data, fields) {
            if (error)
                res.send(error);
            else {
                res.send(data);
                res.end();
            }
        }
    );
});

//Ruta para Logearse formulario login y login error
app.post("/login", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        `SELECT a.codigo_usuario, a.correo, a.codigo_tipo_usuario, a.codigo_universidad, c.codigo_carrera 
        FROM tbl_usuarios a
        left join (select m.codigo_usuario, n.codigo_carrera 
        from tbl_carreras n
        right join tbl_universidades_x_tbl_carreras m
        on(n.codigo_carrera = m.codigo_carrera)
        where m.codigo_usuario is not null
        group by m.codigo_usuario) c
        on(a.codigo_usuario=c.codigo_usuario)
        WHERE contrasenia = ? and correo=?`,
        [req.body.contrasena, req.body.correo],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                console.log(res);
                if (data.length == 1) {
                    req.session.codigoUsuario = data[0].codigo_usuario;
                    req.session.correoUsuario = data[0].correo;
                    req.session.codigoTipoUsuario = data[0].codigo_tipo_usuario;
                    req.session.codigoUniversidad = data[0].codigo_universidad;
                    req.session.codigoCarrera = data[0].codigo_carrera;
                    codigoUsuario = req.session.codigoUsuario;
                    correoUsuario = req.session.correoUsuario;
                    codigoTipoUsuario = req.session.codigoTipoUsuario;
                    codigoUniversidad = req.session.codigoUniversidad;
                    codigoCarrera = req.session.codigoCarrera;
                }
                res.send(data);
                res.end();
            }
        })
});
//Ruta para llenar el perfil y perfil actualizado 
app.get("/usuarios", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(`select a.nombre_completo, a.correo, a.username, 
    a.genero, a.telefono, a.descripcion, a.direccion, a.foto, a.fecha_nacimiento, 
    b.nombre_plan,c.nombre_pais,d.nombre_tipo_usuario, i.url_facebook, j.url_twitter, 
    k.url_linkedin, m.nombre_universidad, m.logo_universidad 
    from tbl_usuarios a 
    inner join tbl_planes b 
    on(a.codigo_plan = b.codigo_plan)
    inner join tbl_paises c
    on(a.codigo_pais = c.codigo_pais)
    inner join tbl_tipo_usuario d
    on(a.codigo_tipo_usuario = d.codigo_tipo_usuario) 
    left join tbl_facebook i
    on(a.codigo_usuario = i.codigo_usuario)
    left join tbl_twitter j
    on(a.codigo_usuario = j.codigo_usuario)
    left join tbl_linkedin k
    on(a.codigo_usuario = k.codigo_usuario)
    left join tbl_universidades m
    on(a.codigo_universidad = m.codigo_universidad)
    WHERE a.codigo_usuario = ?`,
        [codigoUsuario],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                res.send(data);
                res.end();
                conexion.end();
            }
        }
    )
});

//Para mostrar el nombre de la carrera en el formulario principal
app.get("/mostrarcarrera", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("select a.codigo_carrera, a.nombre_carrera from tbl_carreras a WHERE codigo_carrera = ?",
        [codigoCarrera],
        function (error, data, fields) {
            if (error)
                res.send(error);
            else {
                res.send(data);
                res.end();
            }
        }
    );
});

//Ruta para guardar el registro de un Nuevo Usuario en registro gratis
app.get("/guardarregistro", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("INSERT INTO tbl_usuarios (nombre_completo, correo, username, contrasenia, genero, codigo_pais, codigo_universidad, codigo_plan,  codigo_tipo_usuario, foto) VALUES (?,?,?,?,?,?,?,1,2,'img/usuarios/avatar.jpg')",
        [req.query.nombrecompleto,
            req.query.correo,
            req.query.nombreusuario,
            req.query.password,
            req.query.genero,
            req.query.pais,
            req.query.universidad,
        ],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                res.redirect('/login.html');
                res.end();
            }
        });
});

app.get("/guardaruniversidad", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("INSERT INTO tbl_universidades (nombre_universidad, logo_universidad) VALUES (?,'img/usuarios/avatar.jpg')",
        [req.query.nombreuniversidad, ],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                res.redirect('/NuevaUniversidad.html');
                res.end();
            }
        });
});

//Para guardar la calificacion en la Base de datos y luego mostrarlo en la tabla
app.get("/guardarcalificacion", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        `select codigo_universidad, codigo_carrera, calificacion, codigo_usuario, codigo_clase
        from tbl_universidades_x_tbl_carreras 
        where codigo_clase= ? and codigo_carrera = ? and codigo_universidad = ? and codigo_usuario = ?`,
        [req.query.clase,
            codigoCarrera,
            codigoUniversidad,
            codigoUsuario,
        ],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                console.log(res);
                if (data.length == 1) {
                    var query = "UPDATE `tbl_universidades_x_tbl_carreras`SET";
                    query += "`calificacion`='" + req.query.calificacion + "'";                   
                    query += "WHERE `codigo_universidad` = " + codigoUniversidad + "";
                    query += "AND `codigo_carrera` = " + codigoCarrera + "";
                    query += "AND `codigo_usuario` = " + codigoUsuario + "";
                    query += "AND `codigo_clase` = " + req.query.clase + "";
                    var conexion = mysql.createConnection(credenciales);
                    conexion.query(query, function (error, data, fields) {
                        if (error) {
                            res.send(error);
                            res.end();
                        } else {
                            res.redirect('/calificaciones.html');
                            res.end();
                        }
                    });
                } else {
                    var conexion = mysql.createConnection(credenciales);
                    conexion.query("INSERT INTO tbl_universidades_x_tbl_carreras (codigo_clase, calificacion, codigo_usuario, codigo_carrera, codigo_universidad) VALUES (?,?,?,?,?)",
                        [req.query.clase,
                            req.query.calificacion,
                            codigoUsuario,
                            codigoCarrera,
                            codigoUniversidad,
                        ],
                        function (error, data, fields) {
                            if (error) {
                                res.send(error);
                                res.end();
                            } else {

                                res.redirect('/calificaciones.html');
                                res.end();
                            }
                        });
                }
            }
        });

});

//Ruta para guardar la Carrera del estudiante y seleccionar las clases
app.get("/selectcarrera", function (req, res) {
    if (req.query.carrera == 0) {
        res.redirect('/sesioniniciadaerror.html')
        res.end()
    } else {
        codigoCarrera = req.query.carrera;
        res.redirect('/selectclases.html');
        res.end();
    }
});

//Ruta para Mostrar la pagina principal de las clases que esta cursando 
app.get("/selectclases", function (req, res) {
    clases = req.query.chkclases;
    console.log(req.query.chkclases);
    res.redirect('/principal.html');
    res.end();
});

/*Ruta para mostrar las clases que esta cursando en el periodo
app.get("/clasescursadas", function (req, res) {
    res.send(clases);
    res.end();
});*/

//Ruta para mostrar las clases que esta cursando en el periodo
app.get("/clasescursando", function (req, res) {
    res.send(clases);
    res.end();
});
//Ruta para mostrar las clases que cursará el siguiente periodo
app.get("/clasescursara", function (req, res) {
    cclases1 = new Array();
    cclases1[7] = "";
    for (var i = 0; i < clases.length; i++) {
        cclases1[i] = clases[i];
    }
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        `SELECT requisito.nombre_clase_requisito, intermedia.codigo_clase, clasesprox.nombre_clase, 
        d.nombre_dificultad as Nivel_de_dificultad
        FROM tbl_clases as clases
        INNER JOIN tbl_clase_requisitos as requisito on (clases.nombre_clase = requisito.nombre_clase_requisito)
        INNER JOIN tbl_clases_x_tbl_clase_requisitos as intermedia on (requisito.codigo_requisito = intermedia.codigo_requisito)
        INNER JOIN tbl_clases as clasesprox on (intermedia.codigo_clase = clasesprox.codigo_clase)
        left join tbl_dificultades d
        on(d.codigo_dificultad=clases.codigo_dificultad) 
        WHERE requisito.nombre_clase_requisito = ?
        or requisito.nombre_clase_requisito = ?
        or requisito.nombre_clase_requisito = ?
        or requisito.nombre_clase_requisito = ?
        or requisito.nombre_clase_requisito = ?
        or requisito.nombre_clase_requisito = ?
        or requisito.nombre_clase_requisito = ?
        group by clasesprox.nombre_clase`,
        [cclases1[0],
            cclases1[1],
            cclases1[2],
            cclases1[3],
            cclases1[4],
            cclases1[5],
            cclases1[6],
        ],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                res.send(data);
                res.end();
            }
        });
});
//Esta RUTA MUESTRA LAS CLASES QUE NO TIENEN REQUISITOS Y QUE PUEDE CURSAR EL ESTUDIANTE
app.get("/clasescursara2", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        `select b.codigo_clase, b.nombre_clase, b.unidades_valorativas, b.codigo_abreviatura,
        c.nombre_dificultad as Nivel_de_dificultad
        from tbl_clases b
        left join tbl_clases_x_tbl_clase_requisitos A 
        on(A.codigo_clase = b.codigo_clase)
        left join tbl_dificultades c
        on(c.codigo_dificultad=b.codigo_dificultad)
        left join tbl_universidades_x_tbl_carreras e
        on(e.codigo_clase=b.codigo_clase) 
        WHERE A.codigo_requisito IS NULL and e.codigo_universidad=? and codigo_carrera = ?
        group by b.nombre_clase desc`,
        [codigoUniversidad, codigoCarrera],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {

                res.send(data);
                res.end();
            }
        });
});

//Ruta para guardar la OPINION de un Nuevo Usuario
app.post("/mensaje", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("INSERT INTO tbl_mensajes(titulo, descripcion, codigo_usuario) VALUES (?,?,?)",
        [req.body.nombredmensaje,
            req.body.mensaje,
            codigoUsuario,
        ],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                res.redirect('/principal.html');
                res.end();
            }
        });
});


app.post("/mensajes", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        `SELECT a.codigo_mensaje,a.codigo_usuario, a.titulo, a.descripcion, c.username, c.foto, count( a.codigo_usuario ) AS cant_likes
        FROM tbl_mensajes  a
        inner join tbl_usuarios c
        on (a.codigo_usuario=c.codigo_usuario)
        INNER JOIN tbl_likes  b ON a.codigo_mensaje = b.codigo_mensaje
        GROUP BY a.codigo_usuario`,
        [],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                res.send(data);
                res.end();
            }
        });
});

app.post("/mensajestodos", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        `SELECT a.codigo_mensaje, a.codigo_usuario, a.titulo, a.descripcion, c.username, c.foto, count( a.codigo_usuario ) AS cant_likes
        FROM tbl_mensajes  a
        inner join tbl_usuarios c
        on (a.codigo_usuario=c.codigo_usuario)
        INNER JOIN tbl_likes  b 
        GROUP BY a.codigo_usuario`,
        [],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                res.send(data);
                res.end();
            }
        });
});


app.post("/sumarunlike", function (req, res) {
   
    var conexion = mysql.createConnection(credenciales);
    conexion.query("INSERT INTO tbl_likes(codigo_mensaje, codigo_usuario) VALUES (?,?)",
        [
            parseInt(req.body.codigo_mensaje),
            parseInt(req.body.codigo_usuario),
        ],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
				res.send(data);
				
                res.end();
            }
		});
        
});  

//Ruta para confirmar cantidad de proyectos que tienen derecho los usuarios formularios que tienen boton crear
app.get("/Proyects", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT codigo_plan from tbl_usuarios WHERE codigo_usuario = ?",
        [codigoUsuario],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                req.session.codigo_plan = data[0].codigo_plan;
                var conexion = mysql.createConnection(credenciales);
                conexion.query("select count(codigo_proyecto) as proyectos, (codigo_usuario) as plan from tbl_proyectos where codigo_usuario = ?",
                    [codigoUsuario],
                    function (error, data, fields) {
                        if (error) {
                            res.send(error);
                            res.end();
                        } else {
                            console.log(res);
                            data[0].plan = req.session.codigo_plan;
                            res.send(data);
                            res.end();
                        }
                    });
            }
        });
});

//RUTA DIRECTA PARA SABER LOS PLANES y bloquear usuarios si exceden los planes
app.get("/Proyectoos", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT codigo_plan from tbl_usuarios WHERE codigo_usuario = ?",
        [codigoUsuario],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                req.session.codigo_plan = data[0].codigo_plan;
                var conexion = mysql.createConnection(credenciales);
                conexion.query("select count(codigo_proyecto) as proyectos from tbl_proyectos where codigo_usuario = ?",
                    [codigoUsuario],
                    function (error, data, fields) {
                        if (error) {
                            res.send(error);
                            res.end();
                        } else {
                            console.log(res);
                            req.session.proyectos = data[0].proyectos;
                            if (req.session.codigo_plan == 1) {
                                if (req.session.proyectos == 1) {
                                    res.redirect('/aviso.html');
                                    res.end();
                                }
                                res.redirect('/proyectos.html');
                                res.end();

                            } else {
                                if (req.session.codigo_plan == 2) {
                                    if (req.session.proyectos < 11) {
                                        res.redirect('/proyectos.html');
                                        res.end();
                                    }
                                    res.redirect('/aviso.html');
                                    res.end();

                                } else {
                                    if (req.session.codigo_plan == 3) {
                                        if (req.session.proyectos < 26) {
                                            res.redirect('/proyectos.html');
                                            res.end();
                                        }
                                        res.redirect('/aviso.html');
                                        res.end();
                                    } else {
                                        if (req.session.codigo_plan == 4) {
                                            if (req.session.proyectos < 51) {
                                                res.redirect('/proyectos.html');
                                                res.end();
                                            }
                                            res.redirect('/aviso.html');
                                            res.end();
                                        }
                                        res.send(data);
                                        res.end();
                                    }
                                }
                            }

                        }
                    });
            }
        });
});


//Ruta para crear un nuevo proyecto Por el usuario
app.get("/nombrenuevoproyecto", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("INSERT INTO tbl_proyectos(nombre_proyecto, descripcion, codigo_usuario) VALUES (?,?,?)",
        [req.query.nombredproyecto,
            req.query.descripcion,
            codigoUsuario,
        ],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                conexion.query("SELECT codigo_proyecto from tbl_proyectos WHERE nombre_proyecto = ?",
                    [req.query.nombredproyecto, ],
                    function (error, data, fields) {
                        if (error) {
                            res.send(error);
                            res.end();
                        } else {
                            req.session.codigo_proyecto = data[0].codigo_proyecto;
                            CodigoProyecto = req.session.codigo_proyecto;
                            conexion.query("INSERT INTO tbl_usuarios_x_tbl_proyectos(codigo_usuario, codigo_proyecto) VALUES (?,?)",
                                [codigoUsuario,
                                    req.session.codigo_proyecto,
                                ],
                                function (error, data, fields) {
                                    if (error) {
                                        res.send(error);
                                        res.end();
                                    } else {
                                        conexion.query("INSERT INTO tbl_archivo_html(codigo_proyecto) VALUES (?)",
                                            [req.session.codigo_proyecto, ],
                                            function (error, data, fields) {
                                                if (error) {
                                                    res.send(error);
                                                    res.end();
                                                } else {
                                                    conexion.query("INSERT INTO tbl_archivo_css(codigo_proyecto) VALUES (?)",
                                                        [req.session.codigo_proyecto, ],
                                                        function (error, data, fields) {
                                                            if (error) {
                                                                res.send(error);
                                                                res.end();
                                                            } else {
                                                                conexion.query("INSERT INTO tbl_archivo_js(codigo_proyecto) VALUES (?)",
                                                                    [req.session.codigo_proyecto, ],
                                                                    function (error, data, fields) {
                                                                        if (error) {
                                                                            res.send(error);
                                                                            res.end();
                                                                        } else {
                                                                            res.redirect('/proyectos.html');
                                                                            res.end();
                                                                        }
                                                                    });
                                                            }
                                                        });
                                                }
                                            });
                                    }
                                });

                        }
                    });
            }
        });
});
//Ruta para comprar y ser usuario Premium formularios formpagoarranque, formpagodesarrollador, formpagosuper
app.get("/pago", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("INSERT INTO tbl_creditos(nombre_tarjeta, numero_tarjeta, vencimiento, codigo_seguridad, tipo_pago, codigo_plan) VALUES (?,?,?,?,?,?)",
        [req.query.nombretarjeta,
            req.query.numerotarjeta,
            req.query.vencimiento,
            req.query.codigotarjeta,
            req.query.paymentMethod,
            req.query.codigoplan,
        ],
        function (error, data, fields) {
            if (error) {
                res.send(error);
                res.end();
            } else {
                var query = "UPDATE `tbl_usuarios`SET";
                query += "`codigo_plan`='" + req.query.codigoplan + "'";
                query += "WHERE `tbl_usuarios`.`codigo_usuario` = " + codigoUsuario + "";
                var conexion = mysql.createConnection(credenciales);
                conexion.query(query, function (error, data, fields) {
                    if (error) {
                        res.send(error);
                        res.end();
                    } else {
                        res.redirect('/sesioniniciada.html');
                        res.end();
                    }
                });
            }
        });
});
//Ruta para actualizar los datos del Perfil en formulario perfilactualizado
app.get("/actualizar", function (req, res) {
    var query = "UPDATE `tbl_usuarios`SET";
    query += "`telefono`='" + req.query.txtelefono + "',";
    query += "`descripcion`='" + req.query.txtBiography + "',";
    query += "`direccion`='" + req.query.txtdireccion + "',";
    query += "`fecha_nacimiento`='" + req.query.txtfecha + "'";
    query += "WHERE `tbl_usuarios`.`codigo_usuario` = " + codigoUsuario + "";
    var conexion = mysql.createConnection(credenciales);
    conexion.query(query, function (error, data, fields) {
        if (error) {
            res.send(error);
            res.end();
        } else {
            var query = "UPDATE `tbl_facebook`SET";
            query += "`url_facebook`='" + req.query.txtFacebook + "'";
            query += "WHERE `tbl_facebook`.`codigo_usuario` = " + codigoUsuario + "";
            var conexion = mysql.createConnection(credenciales);
            conexion.query(query, function (error, data, fields) {
                if (error) {
                    res.send(error);
                    res.end();
                } else {
                    var query = "UPDATE `tbl_twitter`SET";
                    query += "`url_twitter`='" + req.query.txtTwitter + "'";
                    query += "WHERE `tbl_twitter`.`codigo_usuario` = " + codigoUsuario + "";
                    var conexion = mysql.createConnection(credenciales);
                    conexion.query(query, function (error, data, fields) {
                        if (error) {
                            res.send(error);
                            res.end();
                        } else {
                            var query = "UPDATE `tbl_linkedin`SET";
                            query += "`url_linkedin`='" + req.query.txtLinkedin + "'";
                            query += "WHERE `tbl_linkedin`.`codigo_usuario` = " + codigoUsuario + "";
                            var conexion = mysql.createConnection(credenciales);
                            conexion.query(query, function (error, data, fields) {
                                if (error) {
                                    res.send(error);
                                    res.end();
                                } else {
                                    res.send(data);
                                    res.end();
                                }
                            });
                        }
                    });
                }
            });
        }
    });
});


//Crear y levantar el servidor web.
app.set('port', process.env.PORT || 8111);
app.listen(app.get('port'), () => {
    console.log(`SERVIDOR INICIADO EN EL PUERTO ${app.get('port')}`);
});
/*
server.listen(8111, function(){
    console.log("SERVIDOR INICIADO EN EL PUERTO 8111");
});*/