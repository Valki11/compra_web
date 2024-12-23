package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Productos;

/**
 *
 * @author keila
 */
public class sr_productos extends HttpServlet {

    Productos productos;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_productos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sr_productos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            
            Date fecha = new Date();
            java.sql.Date fechaSQL = new java.sql.Date(fecha.getTime());
            
            productos = new Productos (Integer.valueOf(request.getParameter("txt_id_producto")), request.getParameter("txt_producto"), Integer.valueOf(request.getParameter("drop_marcas")), request.getParameter("txt_descripcion"),request.getParameter("txt_imagen"), Integer.valueOf(request.getParameter("txt_costo")),  Integer.valueOf(request.getParameter("txt_venta")), Integer.valueOf(request.getParameter("txt_existencia")), (java.sql.Date) fechaSQL);

            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (productos.agregar() > 0) {
                    response.sendRedirect("vw_producto.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_producto.jsp'>Regresar...</a>");
                }
            }

            // Boton modificar 
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                if (productos.modificar() > 0) {
                    response.sendRedirect("vw_producto.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Modifico xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_producto.jsp'>Regresar...</a>");
                }
            }

            // Boton eliminar 
            if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
                if (productos.eliminar() > 0) {
                    response.sendRedirect("vw_producto.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Elimino xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_producto.jsp'>Regresar...</a>");
                }
            }

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
