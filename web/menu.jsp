<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            /* Estilos generales */
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
            }

            /* Barra de navegación */
            nav {
                background-color: #333;
                padding: 10px 0;
            }

            nav ul {
                list-style-type: none;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            nav ul li {
                position: relative;
                margin-right: 20px;
            }

            nav ul li a {
                color: #fff;
                text-decoration: none;
                padding: 10px 15px;
                font-size: 16px;
                transition: background 0.3s;
            }

            nav ul li a:hover {
                background-color: #555;
                border-radius: 5px;
            }

            /* Estilos del submenú */
            nav ul li ul {
                display: none;
                position: absolute;
                top: 100%; /* Alinea el submenú debajo del elemento principal */
                left: 0;
                background-color: #333;
                min-width: 150px;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }

            nav ul li:hover ul {
                display: block; /* Muestra el submenú al pasar el cursor */
            }

            nav ul li ul li {
                width: 100%;
            }

            nav ul li ul li a {
                padding: 10px;
                color: #fff;
                display: block;
            }

            nav ul li ul li a:hover {
                background-color: #555;
            }

            /* Estilo para el enlace activo */
            nav ul li a.active {
                background-color: #555;
                border-radius: 5px;
            }

            /* Responsividad */
            @media (max-width: 768px) {
                nav ul {
                    flex-direction: column;
                    align-items: flex-start;
                    padding: 0 20px;
                }

                nav ul li {
                    margin-right: 0;
                    width: 100%;
                }

                nav ul li ul {
                    position: static;
                    box-shadow: none;
                }
            }

        </style>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="home.jsp">Inicio</a></li>
                <li><a href="vw_producto.jsp">Productos</a>
                    <ul>
                        <li><a href="vw_marca.jsp">Marcas</a></li>
                    </ul>
                </li>
                <li><a href="vw_venta.jsp">Ventas</a>
                    <ul>
                        <li><a href="vw_cliente.jsp">Clientes</a></li>
                        <li><a href="vw_empleado.jsp">Empleados</a>
                            <ul>
                                <li><a href="vw_puesto.jsp">Puestos</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a href="vw_compra.jsp">Compras</a>
                    <ul>
                        <li><a href="vw_proveedor.jsp">Proveedores</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </body>
</html>
