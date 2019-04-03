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

var publicAdmin = express.static("public-admin");
var publicUsuario = express.static("public-usuario");

var codigoUsuario = null;
var correoUsuario = null;
var codigoTipoUsuario = null;
var CodigoProyecto = null;
//Exponer una carpeta como publica, unicamente para archivos estaticos: .html, imagenes, .css, .js
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));
app.use(session({
    secret: "ASDFE$%#%",
    resave: true,
    saveUninitialized: true
}));

app.use(
    function (req, res, next) {
        if (req.session.correoUsuario) {
            //Significa que el usuario si esta logueado
            if (req.session.codigoTipoUsuario == 1)
                publicAdmin(req, res, next);
            else if (req.session.codigoTipoUsuario == 2)
                publicUsuario(req, res, next);
            else if (req.session.codigoTipoUsuario == 3)
                publicUsuario(req, res, next);
            else if (req.session.codigoTipoUsuario == 4)
                publicUsuario(req, res, next);
            else if (req.session.codigoTipoUsuario == 5)
                publicUsuario(req, res, next);
        } else
            return next();
    }
);
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

///Para agregar seguridad a una ruta especifica:
function verificarAutenticacion(req, res, next) {
    if (req.session.correoUsuario)
        return next();
    else
        res.send("ERROR, ACCESO NO AUTORIZADO");
}

//Ruta para Logearse formulario login y login error
app.post("/login", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query(
        "SELECT codigo_usuario, correo, codigo_tipo_usuario FROM tbl_usuarios WHERE contrasenia = ? and correo=?",
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
                    codigoUsuario = req.session.codigoUsuario;
                    correoUsuario = req.session.correoUsuario;
                    codigoTipoUsuario = req.session.codigoTipoUsuario;
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
    k.url_linkedin, l.url_github 
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
    left join tbl_github l
    on(a.codigo_usuario = l.codigo_usuario) WHERE a.codigo_usuario = ?`,
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

app.get("/obtener-session", function (req, res) {
    res.send("Codigo Usuario: " + req.session.codigoUsuario +
        ", Correo: " + req.session.correoUsuario +
        ", Tipo Usuario: " + req.session.codigoTipoUsuario
    );
    res.end();
});

app.get("/cerrar-sesion", function (req, res) {
    req.session.destroy();
    res.redirect('/index.html');
    res.end();
});

app.get("/contenido-registringido", verificarAutenticacion, function (req, res) {
    res.send("Este es un contenido restringido");
    res.end();
});

//Ruta para guardar el registro de un Nuevo Usuario en registro gratis
app.get("/guardarregistro", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("INSERT INTO tbl_usuarios (nombre_completo, correo, username, contrasenia, genero, codigo_pais, codigo_universidad, codigo_plan,  codigo_tipo_usuario) VALUES (?,?,?,?,?,?,?,1,2)",
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
                res.redirect('/sesioniniciada.html');
                res.end();
            }
        });
});

app.post("/mensajes", function (req, res) {
    var conexion = mysql.createConnection(credenciales);
    conexion.query("SELECT a.titulo, a.descripcion, b.username, b.foto from tbl_mensajes a inner join tbl_usuarios b on(a.codigo_usuario = b.codigo_usuario) ORDER BY (a.codigo_mensaje) DESC",
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
                                    var query = "UPDATE `tbl_github`SET";
                                    query += "`url_github`='" + req.query.txtPlus + "'";
                                    query += "WHERE `tbl_github`.`codigo_usuario` = " + codigoUsuario + "";
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
        }
    });
});

 
//Crear y levantar el servidor web.
app.set('port', process.env.PORT || 8111);
app.listen(app.get('port'), () => {
    console.log(`SERVIDOR INICIADO EN EL PUERTO ${app.get('port')}`);
});
