<%@page import="modelo.Productos" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <style>
            .gestionar {
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
    <body>
        <%@ include file="menu.jsp" %>
        <h1>Formulario Producto</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_producto" onclick="limpiar()">Nuevo</button>

        <div class="container">

            <div class="modal fade" id="modal_producto" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_productos" method="post" class="form-group">
                                <label for="lbl_id_producto" ><b>ID</b></label>
                                <input type="text" name="txt_id_producto" id="txt_id_producto" class="form-control"> 
                                <label for="lbl_producto" ><b>Producto</b></label>
                                <input type="text" name="txt_producto" id="txt_producto" class="form-control" +required>
                                <label for="lbl_marca" ><b>Marca</b></label>
                                <input type="text" name="txt_marca" id="txt_marca" class="form-control"required>
                                <label for="lbl_descripcion" ><b>Descripcion</b></label>
                                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control"required>
                                <label for="lbl_imagen" ><b>Imagen</b></label>
                                <input type="text" name="txt_imagen" id="txt_imagen" class="form-control"required>
                                <label for="lbl_costo" ><b>Precio costo</b></label>
                                <input type="text" name="txt_costo" id="txt_costo" class="form-control"required>
                                <label for="lbl_venta" ><b>Precio Venta</b></label>
                                <input type="text" name="txt_venta" id="txt_venta" class="form-control"required>
                                <label for="lbl_existencia" ><b>Existencia</b></label>
                                <input type="text" name="txt_existencia" id="txt_existencia" class="form-control"required>
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

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Producto</th>
                        <th>Marca</th>
                        <th>Descripcion</th>
                        <th>Imagen</th>
                        <th>Precio Costo</th>
                        <th>Precio Venta</th>
                        <th>Existencia</th>
                        <th>Fecha Ingreso</th>
                        <th style="text-align: center;">Acciones</th>
                    </tr>
                </thead>
                <tbody id="tbl_producto">
                    <%
                        Productos producto = new Productos();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = producto.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id='" + tabla.getValueAt(t, 0) + "'>");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td><img src='" + tabla.getValueAt(t, 4) + "' alt='Imagen del producto' width='100' /></td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                            out.println("<td><button class='gestionar'>Gestionar</button></td>");
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
                                    function limpiar() {
                                        $("#txt_id_producto").val(0);
                                        $("#txt_producto").val('');
                                        $("#txt_marca").val(0);
                                        $("#txt_descripcion").val('');
                                        $("#txt_imagen").val('');
                                        $("#txt_costo").val(0);
                                        $("#txt_venta").val(0);
                                        $("#txt_existencia").val(0);
                                        $("#fecha_ingreso").val('');
                                    }

                                    document.querySelectorAll('.gestionar').forEach(button => {
                                        button.addEventListener('click', function () {
                                            var target, id_producto, producto, id_marca, descripcion, imagen, precio_costo, precio_venta, existencia, fecha_ingreso;
                                            target = $(event.target);
                                            id_producto = target.parent().data('id_producto');
                                            producto = target.parent().data('producto');
                                            id_marca = target.parent().data('id_marca');
                                            descripcion = target.parent().data('descripcion');
                                            imagen = target.parent().data('imagen');
                                            precio_costo = target.parent().data('precio_costo');
                                            precio_venta = target.parent().data('precio_venta');
                                            existencia = target.parent().data('existencia');
                                            fecha_ingreso = target.parent().data('fecha_ingreso');

                                            $("#txt_id_producto").val(id_producto);
                                            $("#txt_producto").val(producto);
                                            $("#txt_marca").val(id_marca);
                                            $("#txt_descripcion").val(descripcion);
                                            $("#txt_imagen").val(imagen);
                                            $("#txt_costo").val(precio_costo);
                                            $("#txt_venta").val(precio_venta);
                                            $("#txt_existencia").val(existencia);
                                            $("#fecha_ingreso").val(fecha_ingreso);
                                            $("#modal_producto").modal('show');
                                        });
                                    });

        </script>
    </body>
</html>
