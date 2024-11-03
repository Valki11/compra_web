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

        <script>
            $(document).ready(function () {
                $("#fecha_factura").datepicker();
            });
            
            $(document).ready(function () {
                $("#fecha_ingreso").datepicker();
            });
        </script>
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <h1>Formulario Vetnas</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_venta" onclick="limpiarVenta()">Nueva Venta</button>
        <br>
        <button type="button" name="btn_nuevo_detalle" id="btn_nuevo_detalle" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_venta_detalle" onclick="limpiarDetalle()">Agregar Detalle</button>
        
        <div class="container">
            
            <div class="modal fade" id="modal_venta" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_ventas" method="post" class="form-group">
                                <label for="lbl_id_venta" ><b>ID</b></label>
                                <input type="text" name="txt_id_venta" id="txt_id_venta" class="form-control"> 
                                <label for="lbl_no_factura" ><b>No. Factura</b></label>
                                <input type="text" name="txt_no_factura" id="txt_no_factura" class="form-control" required>
                                <label for="lbl_serie" ><b>Serie</b></label>
                                <input type="text" name="txt_serie" id="txt_serie" class="form-control" required>
                                <label for="lbl_fecha_factura" ><b>Fecha Factura</b></label>
                                <input type="text" id="fecha_factura">
                                <label for="lbl_id_cliente" ><b>Cod. Cliente</b></label>
                                <input type="text" name="txt_id_cliente" id="txt_id_cliente" class="form-control" required>
                                <label for="lbl_id_empleado"><b>Cod. Empleado</b></label>
                                <input type="text" name="txt_id_empleado" id="txt_id_empleado" class="form-control" required>
                                <label for="lbl_fecha_ingreso" ><b>Fecha Ingreso</b></label>
                                <input type="text" id="fecha_ingreso">
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
                                <input type="text" name="txt_id_venta_detalle" id="txt_id_venta_detalle" class="form-control"> 
                                <label for="lbl_id_compra_d" ><b>Cod. Compra</b></label>
                                <input type="text" name="txt_id_compra_d" id="txt_id_compra_d" class="form-control" required>
                                <label for="lbl_producto" ><b>Cod. Producto</b></label>
                                <input type="text" name="txt_producto" id="txt_producto" class="form-control" required>
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
      
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>No. Factura</th>
                        <th>Serie</th>
                        <th>Fecha Factura</th>
                        <th>Cod. Cliente</th>
                        <th>Cod. Empleado</th>
                        <th>Fecha Ingreso</th>
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
                            out.println("</tr>");

                        }
                    %>

                </tbody>
            </table> <br>
                    
            <h2>Detalles de la venta</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Cod. Venta</th>
                        <th>Cod. Producto</th>
                        <th>Cantidad</th>
                        <th>Precio Unitario</th>
                    </tr>
                </thead>
                <tbody id="tbl_venta_detalle">
                    <% Ventas_detalle venta_detalle = new Ventas_detalle();
                        DefaultTableModel tabla_detalle = new DefaultTableModel();
                        tabla_detalle = venta_detalle.leer();
                        for (int t = 0; t < tabla_detalle.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla_detalle.getValueAt(t, 0) + ">");
                            out.println("<td>" + tabla_detalle.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla_detalle.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla_detalle.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla_detalle.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla_detalle.getValueAt(t, 4) + "</td>");
                            out.println("</tr>");

                        }
                    %>

                </tbody>
            </table>
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
                                        $("#txt_id_cliente").val(0);
                                        $("#txt_id_empleado").val(0);
                                        $("#fecha_ingreso").val('');
                                    }
                                    
                                    $('#tbl_venta').on('click', 'tr td', function (evt) {
                                        var target, id_venta, no_factura, serie, fecha_factura, id_cliente, id_empleado, fecha_ingreso;
                                        target = $(event.target);
                                        id_venta = target.parent().data('id_venta');
                                        no_factura = target.parent().data('no_factura');
                                        serie = target.parent().data('serie');
                                        fecha_factura = target.parent().data('fecha_factura');
                                        id_cliente = target.parent().data('id_cliente');
                                        id_empleado = target.parent().data('id_empleado');
                                        fecha_ingreso = target.parent().data('fecha_ingreso');
                                        $("#txt_id_venta").val(id_venta);
                                        $("#txt_no_factura").val(no_factura);
                                        $("#txt_serie").val(serie);
                                        $("#fecha_factura").val(fecha_factura);
                                        $("#txt_id_cliente").val(id_cliente);
                                        $("#txt_id_empleado").val(id_empleado);¿
                                        $("#fecha_ingreso").val(fecha_ingreso);
                                        
                                        $("#modal_venta").modal('show');
                                    });
                                    
                                    function limpiarDetalle() {
                                        $("#txt_id_venta_detalle").val(0);
                                        $("#txt_id_venta_d").val(0);
                                        $("#txt_producto").val(0);
                                        $("#txt_cantidad").val(0);
                                        $("#txt_costo_unitario").val('');
                                    }

                                    $('#tbl_venta_detalle').on('click', 'tr td', function (evt) {
                                        var target, id_venta_detalle, id_compra_d, producto, cantidad, costo_unitario;
                                        target = $(event.target);
                                        id_venta_detalle = target.parent().data('id_venta_detalle');
                                        id_compra_d = target.parent().data('id_compra_d');
                                        producto = target.parent().data('producto');
                                        cantidad = target.parent().data('cantidad');
                                        costo_unitario = target.parent().data('costo_unitario');
                                        $("#txt_id_venta_detalle").val(id_venta_detalle);
                                        $("#txt_id_venta_d").val(id_venta_d);
                                        $("#txt_producto").val(producto);
                                        $("#txt_cantidad").val(cantidad);
                                        $("#txt_costo_unitario").val(costo_unitario);
                                        
                                        $("#modal_venta_detalle").modal('show');
                                    });

        </script>
    </body>
</html>
