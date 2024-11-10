<%@page import="java.util.Map"%>
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
       
        <div class="row">
            <div class="col-10">
                <button type="button" name="btn_nuevo" id="btn_nuevo" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal_producto" onclick="limpiar()">Nuevo</button>
            </div>
            <div class="col-2">
                <button type="button" name="btn_redirect" id="btn_redirect" class="btn btn-light btn-lg"><a href="vw_marca.jsp">Marcas</a></button>
            </div>
        </div>
        <div class="container">

            <div class="modal fade" id="modal_producto" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_productos" method="post" class="form-group">
                                <label for="lbl_id_producto" ><b>ID</b></label>
                                <input type="text" name="txt_id_producto" id="txt_id_producto" class="form-control" readonly> 
                                <label for="lbl_producto" ><b>Producto</b></label>
                                <input type="text" name="txt_producto" id="txt_producto" class="form-control" +required>
                                <label for="lbl_marca" ><b>Marca</b></label>
                                <select name="drop_marcas" id="drop_marcas" class="form-control">
                                    <%
                                        Productos producto_ = new Productos();
                                        HashMap<String, String> drop = producto_.drop_marcas();
                                        for (Map.Entry<String, String> entry : drop.entrySet()) {
                                            String key = entry.getKey();
                                            String value = entry.getValue();
                                            out.println("<option value='" + key + "'>" + value + "</option>");
                                        }
                                    %>
                                </select>
                                <label for="lbl_descripcion" ><b>Descripcion</b></label>
                                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control"required>
                                <label for="lbl_imagen" ><b>Imagen</b></label>
                                <input type="text" name="txt_imagen" id="txt_imagen" class="form-control"required>
                                <label for="lbl_costo" ><b>Precio costo</b></label>
                                <input type="number" name="txt_costo" id="txt_costo" class="form-control"required>
                                <label for="lbl_venta" ><b>Precio Venta</b></label>
                                <input type="number" name="txt_venta" id="txt_venta" class="form-control"required>
                                <label for="lbl_existencia" ><b>Existencia</b></label>
                                <input type="text" name="txt_existencia" id="txt_existencia" class="form-control"required>

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
                                        $("#txt_id_producto").val(0);
                                        $("#txt_producto").val('');
                                        $("#txt_descripcion").val('');
                                        $("#txt_imagen").val('');
                                        $("#txt_costo").val(0);
                                        $("#txt_venta").val(0);
                                        $("#txt_existencia").val(0);
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
                                            let dato8 = celdas[7].textContent;

                                            // Asigna el resultado al input
                                            document.getElementById("txt_id_producto").value = dato1;
                                            document.getElementById("txt_producto").value = dato2;
                                            seleccionarOpcionPorTexto("drop_marcas", dato3);
                                            document.getElementById("txt_descripcion").value = dato4;
                                            document.getElementById("txt_imagen").value = dato5;
                                            document.getElementById("txt_costo").value = dato6;
                                            document.getElementById("txt_venta").value = dato7;
                                            document.getElementById("txt_existencia").value = dato8;

                                            $("#modal_producto").modal('show');
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
    </body>
</html>
