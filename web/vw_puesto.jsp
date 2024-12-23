<%@page import="modelo.Puesto" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puesto</title>
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
        <%@ include file="menu.jsp" %>
        <h1>Formulario Puesto</h1>
 
        <div class="row">
            <div class="col-10">
                 <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_puesto" onclick="limpiar()">Nuevo</button>
            </div>
            <div class="col-2">
                <button type="button" name="btn_redirect" id="btn_redirect" class="btn btn-light btn-lg"><a href="vw_empleado.jsp">Empleados</a></button>
            </div>
        </div>
        <div class="container">

            <div class="modal fade" id="modal_puesto" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_puesto" method="post" class="form-group">
                                <label for="lbl_id_puesto" ><b>ID</b></label>
                                <input type="text" name="txt_id_puesto" id="txt_id_puesto" class="form-control" readonly> 
                                <label for="lbl_puesto" ><b>Puesto</b></label>
                                <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="Ejemplo: Programador" required>
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
                        <th>Puesto</th>
                        <th style="text-align: center;">Acciones</th>
                    </tr>
                </thead>
                <tbody id="tbl_puesto">
                    <%            Puesto puesto = new Puesto();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = puesto.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 0) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
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
                                        $("#txt_id_puesto").val(0);
                                        $("#txt_puesto").val('');
                                    }

                                    function gestion(id) {
                                        let fila = document.querySelector("tr[data-id='" + id + "']");
                                        if (fila) {
                                            let celdas = fila.querySelectorAll("td");

                                            let dato1 = celdas[0].textContent; 
                                            let dato2 = celdas[1].textContent; 

                                            // Asigna el resultado al input
                                            document.getElementById("txt_id_puesto").value = dato1;
                                            document.getElementById("txt_puesto").value = dato2;
                                            
                                             $("#modal_puesto").modal('show');
                                        }

                                    }
        </script>
    </body>
</html>
