
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Empleado;

/**
 *
 * @author keila
 */
public class sr_empleados extends HttpServlet {

     Empleado empleado;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_empleados</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sr_empleados at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            
            Date fecha = new Date();
            java.sql.Date fechaSQL = new java.sql.Date(fecha.getTime());
            
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Ajusta el formato si es necesario
            Date fecha_lab = sdf.parse(request.getParameter("fecha_inicio_laborales"));
            java.sql.Date fecha_labores = new java.sql.Date(fecha_lab.getTime());
            
            Date fecha_nac = sdf.parse(request.getParameter("fecha_nacimiento"));
            java.sql.Date fecha_nacimiento = new java.sql.Date(fecha_nac.getTime());
            
            boolean genero = request.getParameter("genero").equals("1");
            
            empleado = new Empleado(Integer.valueOf(request.getParameter("txt_id_empleado")), request.getParameter("txt_nombre"), request.getParameter("txt_apellido"), request.getParameter("txt_direccion"),request.getParameter("txt_telefono"), request.getParameter("txt_dpi"), genero, (java.sql.Date) fecha_nacimiento , (java.sql.Date) fecha_labores, (java.sql.Date) fechaSQL, Integer.valueOf(request.getParameter("drop_puesto")));
            

            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (empleado.agregar() > 0) {
                    response.sendRedirect("vw_empleado.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_empleado.jsp'>Regresar...</a>");
                }
            }
            
            // Boton modificar 
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                if (empleado.modificar() > 0) {
                    response.sendRedirect("vw_empleado.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Modifico xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_empleado.jsp'>Regresar...</a>");
                }
            }

            // Boton eliminar 
            if ("eliminar".equals(request.getParameter("btn_eliminar"))) {
                if (empleado.eliminar() > 0) {
                    response.sendRedirect("vw_empleado.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Elimino xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_empleado.jsp'>Regresar...</a>");
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
         try {
             processRequest(request, response);
         } catch (ParseException ex) {
             Logger.getLogger(sr_empleados.class.getName()).log(Level.SEVERE, null, ex);
         }
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
         try {
             processRequest(request, response);
         } catch (ParseException ex) {
             Logger.getLogger(sr_empleados.class.getName()).log(Level.SEVERE, null, ex);
         }
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
        
