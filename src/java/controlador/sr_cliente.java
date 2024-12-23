
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
import modelo.Clientes;

/**
 *
 * @author keila
 */
public class sr_cliente extends HttpServlet {
 
    Clientes cliente;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Puesto</title>");
            out.println("</head>");
            out.println("<body>");
            
            Date fecha = new Date();
            java.sql.Date fechaSQL = new java.sql.Date(fecha.getTime());
            boolean genero = request.getParameter("genero").equals("1");
            
            cliente = new Clientes(Integer.valueOf(request.getParameter("txt_id_cliente")), request.getParameter("txt_nombre"),request.getParameter("txt_apellido"),request.getParameter("txt_nit"), genero,request.getParameter("txt_telefono"), request.getParameter("txt_correo"), (java.sql.Date) fechaSQL);

            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (cliente.agregar() > 0) {
                    response.sendRedirect("vw_cliente.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_cliente.jsp'>Regresar...</a>");
                }
            }
            
            // Boton modificar 
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                if (cliente.modificar() > 0) {
                    response.sendRedirect("vw_cliente.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Modifico xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_cliente.jsp'>Regresar...</a>");
                }
            }

            // Boton eliminar 
            if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
                if (cliente.eliminar() > 0) {
                    response.sendRedirect("vw_cliente.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Elimino xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_cliente.jsp'>Regresar...</a>");
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
