<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleado</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    </head>
    <body>
        <body>
        <%@ include file="menu.jsp" %>
        <h1>Formulario Empleado</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo</button>

        <div class="container">

            <div class="modal fade" id="modal_empleado" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_empleados" method="post" class="form-group">
                                <label for="lbl_id_empleado" ><b>ID</b></label>
                                <input type="text" name="txt_id_empleado" id="txt_id_empleado" class="form-control"> 
                                <label for="lbl_nombre" ><b>Nombres</b></label>
                                <input type="text" name="txt_nombre" id="txt_nombre" class="form-control" +required>
                                <label for="lbl_apellido" ><b>Apellidos</b></label>
                                <input type="text" name="txt_apellido" id="txt_apellido" class="form-control"required>
                                <label for="lbl_direccion" ><b>Direccion</b></label>
                                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control"required>
                                <label for="lbl_telefono" ><b>Telefono</b></label>
                                <input type="text" name="txt_telefono" id="txt_telefono" class="form-control"required>
                                <label for="lbl_dpi" ><b>DPI</b></label>
                                <input type="text" name="txt_dpi" id="txt_dpi" class="form-control"required>
                                <label for="lbl_genero" ><b>Genero</b></label>
                                <input type="text" name="txt_genero" id="txt_genero" class="form-control"required>
                                <label for="lbl_fecha_nacimiento" ><b>Fecha Nacimiento</b></label>
                                <input type="date" id="fecha_nacimiento" name="fecha">
                                <label for="lbl_id_puesto" ><b>Cod. Puesto</b></label>
                                <input type="text" name="txt_id_puesto" id="txt_id_puesto" class="form-control"required>
                                <label for="lbl_inicio_laborales" ><b>Fecha Inicio Labores</b></label>
                                <input type="date" id="fecha_inicio_laborales" name="fecha">
                                <label for="lbl_fecha_ingreso" ><b>Fecha Ingreso</b></label>
                                <input type="text" id="fecha_ingreso">                                <input type="date" id="fecha_ingreso" name="fecha">

                                
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
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Dirección</th>
                        <th>Telefono</th>
                        <th>DPI</th>
                        <th>Genero</th>
                        <th>Fecha Naciemiento</th>
                        <th>Puesto</th>
                        <th>Fecha Inicio Laborales</th>
                        <th>Fecha Ingreso</th>
                    </tr>
                </thead>
                <tbody id="tbl_empleado">
                    <%            Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0)+ ">");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 9) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 10) + "</td>");
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
                                        $("#txt_id_empleado").val(0);
                                        $("#txt_nombre").val('');
                                        $("#txt_apellido").val('');
                                        $("#txt_direccion").val('');
                                        $("#txt_telefono").val('');
                                        $("#txt_dpi").val('');
                                        $("#txt_genero").val('');
                                        $("#fecha_nacimiento").val('');
                                        $("#txt_id_puesto").val(0);
                                        $("#fecha_inicio_laborales").val('');
                                        $("#fecha_ingreso").val('');
                                    }

                                    $('#tbl_empleado').on('click', 'tr td', function (evt) {
                                        var target, id_empleado, nombres, apellidos, direccion, telefono, DPI, genero, fecha_nacimiento, id_puesto, fecha_inicio, fecha_ingreso;
                                        target = $(event.target);
                                        id_empleado = target.parent().data('id_empleado');
                                        nombres = target.parent().data('nombres');
                                        apellidos = target.parent().data('apellidos');
                                        direccion = target.parent().data('NIT');
                                        telefono = target.parent().data('telefono');
                                        DPI = target.parent().data('DPI');
                                        genero = target.parent().data('genero');
                                        fecha_nacimiento = target.parent().data('fecha_nacimiento');
                                        id_puesto = target.parent().data('id_puesto');
                                        fecha_inicio = target.parent().data('fecha_inicio');
                                        fecha_ingreso = target.parent().data('fecha_ingreso');
                                        
                                        $("#txt_id_empleado").val(id_empleado);
                                        $("#txt_nombre").val(id_empleado);
                                        $("#txt_apellido").val(apellidos);
                                        $("#txt_direccion").val(direccion);
                                        $("#txt_telefono").val(telefono);
                                        $("#txt_dpi").val(DPI);
                                        $("#txt_genero").val(genero);
                                        $("#fecha_nacimiento").val(fecha_nacimiento);
                                        $("#txt_id_puesto").val(id_puesto);
                                        $("#fecha_inicio_laborales").val(fecha_inicio);
                                        $("#fecha_ingreso").val(fecha_ingreso);
                                        
                                        $("#modal_empleado").modal('show');
                                    });

        </script>
    </body>
</html>
