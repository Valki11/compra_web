<%@page import="modelo.Compras" %>
<%@page import="modelo.Compras_detalle" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compras</title>
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
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const tablaCompras = document.getElementById("tablaCompras");
                const tablaDetalles = document.getElementById("tablaDetalles");

                tablaCompras.addEventListener("click", function (event) {
                    const boton = event.target.closest(".ver-detalles"); // Verifica si se hizo clic en un botón
                    if (!boton)
                        return; // Si no es un botón de "Ver Detalles", salir

                    document.getElementById("divDetalle").style.display = "block";
                    const fila = boton.closest("tr");
                    const compraId = fila.getAttribute("data-id");

                    // Filtra y muestra los detalles correspondientes
                    const detallesFilas = tablaDetalles.querySelectorAll("tbody tr");
                    detallesFilas.forEach(filaDetalle => {
                        if (filaDetalle.getAttribute("data-compra") === compraId) {
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
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <h1>Formulario Compras</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_compra" onclick="limpiarCompra()">Nueva Compra</button>

        <div class="container">

            <div class="modal fade" id="modal_compra" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_compras" method="post" class="form-group">
                                <label for="lbl_id_compra" ><b>ID</b></label>
                                <input type="text" name="txt_id_compra" id="txt_id_compra" class="form-control"> 
                                <label for="lbl_no_orden_compra" ><b>No. orden compra</b></label>
                                <input type="text" name="txt_no_orden_compra" id="txt_no_orden_compra" class="form-control" required>
                                <label for="lbl_id_proveedor" ><b>Cod. Proveedor</b></label>
                                <input type="text" name="txt_id_proveedor" id="txt_id_proveedor" class="form-control" required>
                                <label for="lbl_fecha_orden" ><b>Fecha Orden</b></label>
                                <input type="date" id="fecha_orden" name="fecha">
                                <label for="lbl_fecha_ingreso" ><b>Fecha Ingreso</b></label>
                                <input type="date" id="fecha_ingreso" name="fecha">

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

            <div class="modal fade" id="modal_compra_detalle" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_compras_detalle" method="post" class="form-group">
                                <label for="lbl_id_compra_detalle" ><b>ID Detalle</b></label>
                                <input type="text" name="txt_id_compra_detalle" id="txt_id_compra_detalle" class="form-control"> 
                                <label for="lbl_id_compra" ><b>ID Compra</b></label>
                                <input type="text" name="txt_id_compra_d" id="txt_id_compra_d" class="form-control" required>
                                <label for="lbl_producto" ><b>Cod. Producto</b></label>
                                <input type="text" name="txt_producto" id="txt_producto" class="form-control" required>
                                <label for="lbl_cantidad" ><b>Cantidad</b></label>
                                <input type="number" name="txt_cantidad" id="txt_cantidad" class="form-control" required>
                                <label for="lbl_costo_unitario" ><b>Precio Costo Unitario</b></label>
                                <input type="text" name="txt_costo_unitario" id="txt_costo_unitario" class="form-control" required>
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


            <table id="tablaCompras" class="table table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>No. Orden Compra</th>
                        <th>Proveedor</th>
                        <th>Fecha Orden</th>
                        <th>Fecha Ingreso</th>
                        <th colspan="2" style="text-align: center;">Acciones</th>
                    </tr>
                </thead>
                <tbody id="tbl_compra">
                    <%            Compras compra = new Compras();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = compra.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td><button class='ver-detalles'>Ver Detalles</button></td>");
                            out.println("<td><button class='gestionar'>Gestionar</button></td>");
                            out.println("</tr>");

                        }
                    %>

                </tbody>
            </table> <br>

            <div id="divDetalle" style="display: none">
                <h2>Detalles de la compra</h2>
                <br>
                <button type="button" name="btn_nuevo_detalle" id="btn_nuevo_detalle" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_compra_detalle" onclick="limpiarDetalle()">Agregar Detalle</button>
                <table id="tablaDetalles" class="hidden table table-striped">
                    <thead>
                        <tr>
                            <th>Producto</th>
                            <th>Cantidad</th>
                            <th>Precio Costo unitario</th>
                            <th style="text-align: center;">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbl_compra_detalle">
                        <% Compras_detalle compra_detalle = new Compras_detalle();
                            DefaultTableModel tabla_detalle = new DefaultTableModel();
                            tabla_detalle = compra_detalle.leer();
                            for (int t = 0; t < tabla_detalle.getRowCount(); t++) {
                                out.println("<tr data-compra=" + tabla_detalle.getValueAt(t, 1) + ">");
                                out.println("<td>" + tabla_detalle.getValueAt(t, 2) + "</td>");
                                out.println("<td>" + tabla_detalle.getValueAt(t, 3) + "</td>");
                                out.println("<td>" + tabla_detalle.getValueAt(t, 4) + "</td>");
                                out.println("<td><button class='gestionar-detalle'>Gestionar</button></td>");
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
                    function limpiarCompra() {
                        $("#txt_id_compra").val(0);
                        $("#txt_no_orden_compra").val(0);
                        $("#txt_id_proveedor").val(0);
                        $("#fecha_orden").val('');
                        $("#fecha_ingreso").val('');
                    }

                    document.querySelectorAll('.gestionar').forEach(button => {
                        button.addEventListener('click', function () {
                            var target, id_compra, no_orden_compra, id_proveedor, fecha_orden, fecha_ingreso;
                            target = $(event.target);
                            id_compra = target.parent().data('id_compra');
                            no_orden_compra = target.parent().data('no_orden_compra');
                            id_proveedor = target.parent().data('id_proveedor');
                            fecha_orden = target.parent().data('fecha_orden');
                            fecha_ingreso = target.parent().data('fecha_ingreso');
                            $("#txt_id_compra").val(id_compra);
                            $("#txt_no_orden_compra").val(no_orden_compra);
                            $("#txt_id_proveedor").val(id_proveedor);
                            $("#fecha_orden").val(fecha_orden);
                            $("#fecha_ingreso").val(fecha_ingreso);
                            $("#modal_compra").modal('show');
                        });
                    });

                    function limpiarDetalle() {
                        $("#txt_id_compra_detalle").val(0);
                        $("#txt_id_compra_d").val(0);
                        $("#txt_producto").val(0);
                        $("#txt_cantidad").val(0);
                        $("#txt_costo_unitario").val('');
                    }

                    document.querySelectorAll('.gestionar-detalle').forEach(button => {
                        button.addEventListener('click', function () {
                            var target, id_compra_detalle, id_compra_d, producto, cantidad, costo_unitario;
                            target = $(event.target);
                            id_compra_detalle = target.parent().data('id_compra_detalle');
                            id_compra_d = target.parent().data('id_compra_d');
                            producto = target.parent().data('producto');
                            cantidad = target.parent().data('cantidad');
                            costo_unitario = target.parent().data('cantidad');
                            $("#txt_id_compra_detalle").val(id_compra_detalle);
                            $("#txt_id_compra_d").val(id_compra_d);
                            $("#txt_producto").val(producto);
                            $("#txt_cantidad").val(cantidad);
                            $("#txt_costo_unitario").val(costo_unitario);
                            $("#modal_compra_detalle").modal('show');
                        });
                    });

        </script>
    </body>
</html>
