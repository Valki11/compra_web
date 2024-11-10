<%@page import="modelo.Clientes" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
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
        <h1>Formulario Cliente</h1>
        <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_cliente" onclick="limpiar()">Nuevo</button>

        <div class="container">

            <div class="modal fade" id="modal_cliente" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_cliente" method="post" class="form-group">
                                <label for="lbl_id_cliente" ><b>ID</b></label>
                                <input type="text" name="txt_id_cliente" id="txt_id_cliente" class="form-control" readonly> 
                                <label for="lbl_nombre" ><b>Nombres</b></label>
                                <input type="text" name="txt_nombre" id="txt_nombre" class="form-control" +required>
                                <label for="lbl_apellido" ><b>Apellidos</b></label>
                                <input type="text" name="txt_apellido" id="txt_apellido" class="form-control"required>
                                <label for="lbl_NIT" ><b>NIT</b></label>
                                <input type="text" name="txt_nit" id="txt_nit" class="form-control"required>
                                <label for="lbl_genero" ><b>Genero</b></label>
                                <select id="genero" name="genero" class="form-control">
                                    <option value="1">Hombre</option>
                                    <option value="0">Mujer</option>
                                 </select>
                                <label for="lbl_telefono" ><b>Telefono</b></label>
                                <input type="text" name="txt_telefono" id="txt_telefono" class="form-control"required>
                                <label for="lbl_correo"><b>Correo Electronico</b></label>
                                <input type="text" name="txt_correo" id="txt_correo" class="form-control"required>

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
                        <th>NIT</th>
                        <th>Genero</th>
                        <th>Telefono</th>
                        <th>Correo Electronico</th>
                        <th>Fecha Ingreso</th>
                        <th style="text-align: center;">Acciones</th>
                    </tr>
                </thead>
                <tbody id="tbl_cliente">
                    <%            Clientes cliente = new Clientes();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = cliente.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("<td><button class='gestionar' onclick=gestion(" + tabla.getValueAt(t, 0) + ")>Gestionar</button></td>");
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
                                        $("#txt_id_cliente").val(0);
                                        $("#txt_nombre").val('');
                                        $("#txt_apellido").val('');
                                        $("#txt_nit").val('');
                                        $("#txt_telefono").val('');
                                        $("#txt_correo").val('');
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
                                            let dato7 = celdas[6].textContent; 

                                            // Asigna el resultado al input
                                            document.getElementById("txt_id_cliente").value = dato1;
                                            document.getElementById("txt_nombre").value = dato2;
                                            document.getElementById("txt_apellido").value = dato3;
                                            document.getElementById("txt_nit").value = dato4;
                                            document.getElementById("genero").value = dato5 === "Hombre" ? 1 : 0;
                                            document.getElementById("txt_telefono").value = dato6;
                                            document.getElementById("txt_correo").value = dato7;
                                            
                                             $("#modal_cliente").modal('show');
                                        }

                                    }

        </script>
    </body>
</html>
