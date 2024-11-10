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
import modelo.Ventas_detalle;

/**
 *
 * @author keila
 */
public class sr_ventas_detalle extends HttpServlet {

    Ventas_detalle ventas_detalle;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet sr_ventas_detalle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet sr_ventas_detalle at " + request.getContextPath() + "</h1>");
            out.println("</body>");
           
            ventas_detalle = new Ventas_detalle(Integer.valueOf(request.getParameter("txt_id_venta_detalle")), Integer.valueOf(request.getParameter("txt_id_venta_d")), Integer.valueOf(request.getParameter("drop_productos")), Integer.valueOf(request.getParameter("txt_cantidad")), Integer.valueOf(request.getParameter("txt_costo_unitario")));

            // Boton agregar 
            if ("agregar".equals(request.getParameter("btn_agregar"))) {
                if (ventas_detalle.agregar() > 0) {
                    response.sendRedirect("vw_venta.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Ingreso xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_venta.jsp'>Regresar...</a>");
                }
            }

            // Boton modificar 
            if ("modificar".equals(request.getParameter("btn_modificar"))) {
                if (ventas_detalle.modificar() > 0) {
                    response.sendRedirect("vw_venta.jsp");

                } else {
                    out.println("<h1> xxxxxxx No se Modifico xxxxxxxxxxxx </h1>");
                    out.println("<a href='vw_venta.jsp'>Regresar...</a>");
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
        // </editor-fold>
    }
}