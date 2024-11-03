<%@page import="modelo.Proveedores" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <%@ include file="menu.jsp" %>
        <h1>Formulario Proveedor</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_proveedor" onclick="limpiar()">Nuevo</button>

        <div class="container">

            <div class="modal fade" id="modal_proveedor" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_proveedor" method="post" class="form-group">
                                <label for="lbl_id_proveedor" ><b>ID</b></label>
                                <input type="text" name="txt_id_proveedor" id="txt_id_proveedor" class="form-control"> 
                                <label for="lbl_proveedor" ><b>Proveedores</b></label>
                                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" required>
                                <label for="lbl_nit" ><b>Nit</b></label>
                                <input type="text" name="txt_nit" id="txt_nit" class="form-control" required>
                                <label for="lbl_direccion" ><b>Dirección</b></label>
                                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" required>
                                <label for="lbl_telefono" ><b>Telefono</b></label>
                                <input type="text" name="txt_telefono" id="txt_telefono" class="form-control" required>
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
                        <th>Proveedor</th>
                        <th>Nit</th>
                        <th>Dirección</th>
                        <th>Telefono</th>
                    </tr>
                </thead>
                <tbody id="tbl_proveedor">
                    <%            Proveedores proveedor = new Proveedores();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = proveedor.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0)+ ">");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
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
                                        $("#txt_id_proveedor").val(0);
                                        $("#txt_proveedor").val('');
                                        $("#txt_nit").val('');
                                        $("#txt_direccion").val('');
                                        $("#txt_telefono").val('');
                                    }

                                    $('#tbl_proveedor').on('click', 'tr td', function (evt) {
                                        var target, id_proveedor, proveedor, nit, direccion, telefono;
                                        target = $(event.target);
                                        id_proveedor = target.parent().data('id_proveedor');
                                        proveedor = target.parent().data('proveedor');
                                        nit = target.parent().data('nit');
                                        direccion = target.parent().data('direccion');
                                        telefono = target.parent().data('telefono');
                                        $("#txt_id_proveedor").val(id_proveedor);
                                        $("#txt_proveedor").val(proveedor);
                                        $("#txt_nit").val(nit);
                                        $("#txt_direccion").val(direccion);
                                        $("#txt_telefono").val(telefono);
                                        $("#modal_proveedor").modal('show');
                                    });

        </script>
    </body>
</html>