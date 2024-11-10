<%@page import="java.util.Map"%>
<%@page import="modelo.Ventas" %>
<%@page import="modelo.Ventas_detalle" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <style>
            .ver-detalles {
                background-color: green;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .gestionar {
                background-color: orange;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .gestionar-detalle{
                background-color: orange;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <h1>Formulario Ventas</h1>
        
        <div class="row">
            <div class="col-10">
               <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_venta" onclick="limpiarVenta()">Nueva Venta</button>
            </div>
            <div class="col-2">
                <button type="button" name="btn_redirect" id="btn_redirect" class="btn btn-light btn-lg"><a href="vw_cliente.jsp">Clientes</a></button>
            </div>
        </div>
        

        <div class="container">

            <div class="modal fade" id="modal_venta" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_ventas" method="post" class="form-group">
                                <label for="lbl_id_venta" ><b>ID</b></label>
                                <input type="text" name="txt_id_venta" id="txt_id_venta" class="form-control" readonly> 
                                <label for="lbl_no_factura" ><b>No. Factura</b></label>
                                <input type="text" name="txt_no_factura" id="txt_no_factura" class="form-control" required>
                                <label for="lbl_serie" ><b>Serie</b></label>
                                <input type="text" name="txt_serie" id="txt_serie" class="form-control" required>
                                <label for="lbl_fecha_factura" ><b>Fecha Factura</b></label>
                                <input type="date" id="fecha_factura" class="form-control" name="fecha_factura">
                                <label for="lbl_id_cliente" ><b>Cliente</b></label>
                                <select name="drop_clientes" id="drop_clientes" class="form-control">
                                    <%
                                        Ventas venta_ = new Ventas();
                                        HashMap<String, String> drop = venta_.drop_clientes();
                                        for (Map.Entry<String, String> entry : drop.entrySet()) {
                                            String key = entry.getKey();
                                            String value = entry.getValue();
                                            out.println("<option value='" + key + "'>" + value + "</option>");
                                        }
                                    %>
                                </select>
                                <label for="lbl_id_empleado"><b>Empleado</b></label>
                                <select name="drop_empleados" id="drop_empleados" class="form-control">
                                    <%
                                        Ventas _venta = new Ventas();
                                        HashMap<String, String> drop_ = _venta.drop_empleados();
                                        for (Map.Entry<String, String> entry : drop_.entrySet()) {
                                            String key = entry.getKey();
                                            String value = entry.getValue();
                                            out.println("<option value='" + key + "'>" + value + "</option>");
                                        }
                                    %>
                                </select>

                                <br>
                                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-lg">Agregar</button>
                                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                                <button name="btn_eliminar" id="btn_eliminar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                            return false" >Eliminar</button>
                                <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

            <div class="modal fade" id="modal_venta_detalle" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_ventas_detalle" method="post" class="form-group">
                                <label for="lbl_id_venta_detalle" ><b>ID Detalle</b></label>
                                <input type="text" name="txt_id_venta_detalle" id="txt_id_venta_detalle" class="form-control" readonly> 
                                <label for="lbl_id_compra_d" ><b>ID Venta</b></label>
                                <input type="text" name="txt_id_venta_d" id="txt_id_venta_d" class="form-control" required readonly>
                                <label for="lbl_producto" ><b>Producto</b></label>
                                <select name="drop_productos" id="drop_productos" class="form-control">
                                    <%
                                        Ventas_detalle vd = new Ventas_detalle();
                                        HashMap<String, String> drop_vd = vd.drop_productos();
                                        for (Map.Entry<String, String> entry : drop_vd.entrySet()) {
                                            String key = entry.getKey();
                                            String value = entry.getValue();
                                            out.println("<option value='" + key + "'>" + value + "</option>");
                                        }
                                    %>
                                </select>
                                <label for="lbl_cantidad" ><b>Cantidad</b></label>
                                <input type="number" name="txt_cantidad" id="txt_cantidad" class="form-control" required>
                                <label for="lbl_unitario" ><b>Precio Unitario</b></label>
                                <input type="text" name="txt_costo_unitario" id="txt_unitario" class="form-control" required>
                                <br>
                                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-primary btn-lg">Agregar</button>
                                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button>
                                <button name="btn_eliminar" id="btn_eliminar"  value="eliminar" class="btn btn-danger btn-lg" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                            return false" >Eliminar</button>
                                <button type="button" class="btn btn-warning btn-lg" data-dismiss="modal">Cerrar</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>

            <table id="tablaVentas" class="table table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>No. Factura</th>
                        <th>Serie</th>
                        <th>Fecha Factura</th>
                        <th>Cliente</th>
                        <th>Empleado</th>
                        <th>Fecha Ingreso</th>
                        <th colspan="2" style="text-align: center;">Acciones</th>
                    </tr>
                </thead>
                <tbody id="tbl_venta">
                    <%            Ventas venta = new Ventas();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = venta.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td><button class='ver-detalles'>Ver Detalles</button></td>");
                            out.println("<td><button class='gestionar' onclick=gestion(" + tabla.getValueAt(t, 0) + ")>Gestionar</button></td>");
                            out.println("</tr>");

                        }
                    %>

                </tbody>
            </table> <br>

            <div id="divDetalle" style="display: none">
                <h2>Detalles de la venta</h2>
                <br>
                <button type="button" name="btn_nuevo_detalle" id="btn_nuevo_detalle" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_venta_detalle" onclick="limpiarDetalle()">Agregar Detalle</button>
                <table id="tablaDetalles" class="hidden table table-striped">
                    <thead>
                        <tr>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio Unitario</th>
                            <th style="text-align: center;">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_venta_detalle">
                        <% Ventas_detalle venta_detalle = new Ventas_detalle();
                            DefaultTableModel tabla_detalle = new DefaultTableModel();
                            tabla_detalle = venta_detalle.leer();
                            for (int t = 0; t < tabla_detalle.getRowCount(); t++) {
                                out.println("<tr data-venta=" + tabla_detalle.getValueAt(t, 1) + ">");
                                out.println("<td>" + tabla_detalle.getValueAt(t, 2) + "</td>");
                                out.println("<td>" + tabla_detalle.getValueAt(t, 3) + "</td>");
                                out.println("<td>" + tabla_detalle.getValueAt(t, 4) + "</td>");
                                out.println("<td><button class='gestionar-detalle' onclick=gestionDetalle(" + tabla.getValueAt(t, 0) + ")>Gestionar</button></td>");
                                out.println("</tr>");

                            }
                        %>

                    </tbody>
                </table>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script type="text/javascript">
                    function limpiarVenta() {
                        $("#txt_id_venta").val(0);
                        $("#txt_no_factura").val(0);
                        $("#txt_serie").val('');
                        $("#fecha_factura").val('');
                    }

                    function gestion(id) {
                        let fila = document.querySelector("tr[data-id='" + id + "']");
                        if (fila) {
                            let celdas = fila.querySelectorAll("td");

                            let dato1 = celdas[0].textContent;
                            let dato2 = celdas[1].textContent;
                            let dato3 = celdas[2].textContent;
                            let dato4 = celdas[3].textContent;
                            let dato5 = celdas[4].textContent;
                            let dato6 = celdas[5].textContent;

                            // Asigna el resultado al input
                            document.getElementById("txt_id_venta").value = dato1;
                            document.getElementById("txt_no_factura").value = dato2;
                            document.getElementById("txt_serie").value = dato3;
                            document.getElementById("fecha_factura").value = dato4;
                            seleccionarOpcionPorTexto("drop_clientes", dato5);
                            seleccionarOpcionPorTexto("drop_empleados", dato6);

                            $("#modal_venta").modal('show');
                        }
                    }

                    

                    function limpiarDetalle() {
                        $("#txt_id_venta_detalle").val(0);
                        document.getElementById("txt_id_venta_d").value  = sessionStorage.getItem("venta_id");
                        $("#txt_cantidad").val(0);
                        $("#txt_costo_unitario").val('');
                    }

                    function gestionDetalle(id) {
                        let fila = document.querySelector("tr[data-venta='" + id + "']");
                        if (fila) {
                            let celdas = fila.querySelectorAll("td");

                            let dato1 = id;
                            let dato2 = sessionStorage.getItem("venta_id");
                            let dato3 = celdas[0].textContent;
                            let dato4 = celdas[1].textContent;
                            let dato5 = celdas[2].textContent;

                            // Asigna el resultado al input
                            document.getElementById("txt_id_venta_detalle").value = dato1;
                            document.getElementById("txt_id_venta_d").value = dato2;
                            seleccionarOpcionPorTexto("drop_productos", dato3);
                            document.getElementById("txt_cantidad").value = dato4;
                            

                            $("#modal_venta_detalle").modal('show');
                        }
                    }
                    
                    function seleccionarOpcionPorTexto(selectId, textoBuscar) {
                        const select = document.getElementById(selectId);

                        for (let i = 0; i < select.options.length; i++) {
                            if (select.options[i].text === textoBuscar) {
                                select.selectedIndex = i;
                                break;
                            }
                        }
                    }
        </script>
          <script>
            document.addEventListener("DOMContentLoaded", function () {
                const tablaVentas = document.getElementById("tablaVentas");
                const tablaDetalles = document.getElementById("tablaDetalles");

                tablaVentas.addEventListener("click", function (event) {
                    const boton = event.target.closest(".ver-detalles"); // Verifica si se hizo clic en un botón
                    if (!boton)
                        return; // Si no es un botón de "Ver Detalles", salir

                    document.getElementById("divDetalle").style.display = "block";
                    const fila = boton.closest("tr");
                    const ventaId = fila.getAttribute("data-id");
                    
                    sessionStorage.setItem("venta_id", ventaId);
                    
                    // Filtra y muestra los detalles correspondientes
                    const detallesFilas = tablaDetalles.querySelectorAll("tbody tr");
                    detallesFilas.forEach(filaDetalle => {
                        if (filaDetalle.getAttribute("data-venta") === ventaId) {
                            filaDetalle.style.display = ""; // Muestra la fila
                        } else {
                            filaDetalle.style.display = "none"; // Oculta la fila
                        }
                    });

                    // Asegúrate de mostrar la tabla de detalles si estaba oculta
                    tablaDetalles.classList.remove("hidden");
                });
            });
        </script>
    </body>
</html>
