package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author keila
 */
public class Ventas {

    public Ventas(int id_Venta, int no_factura, char serie, Date fecha_factura, int id_Cliente, int id_empleado, Date fecha_ingreso) {
        this.id_Venta = id_Venta;
        this.no_factura = no_factura;
        this.serie = serie;
        this.fecha_factura = fecha_factura;
        this.id_Cliente = id_Cliente;
        this.id_empleado = id_empleado;
        this.fecha_ingreso = fecha_ingreso;
       
    }

    public Ventas() {
    }
    
    private int id_Venta;
    private int no_factura;
    private char serie;
    private Date fecha_factura;
    private int id_Cliente;
    private int id_empleado;
    private Date fecha_ingreso;
    Conexion cn;

    public int getId_Venta() {
        return id_Venta;
    }

    public void setId_Venta(int id_Venta) {
        this.id_Venta = id_Venta;
    }

    public int getNo_factura() {
        return no_factura;
    }

    public void setNo_factura(int no_factura) {
        this.no_factura = no_factura;
    }

    public char getSerie() {
        return serie;
    }

    public void setSerie(char serie) {
        this.serie = serie;
    }

    public Date getFecha_factura() {
        return fecha_factura;
    }

    public void setFecha_factura(Date fecha_factura) {
        this.fecha_factura = fecha_factura;
    }

    public int getId_Cliente() {
        return id_Cliente;
    }

    public void setId_Cliente(int id_Cliente) {
        this.id_Cliente = id_Cliente;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public Date getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(Date fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
 
     public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT v.id_venta, v.no_factura, v.serie, v.fecha_factura,CONCAT(c.nombres, ' ', c.apellidos) as id_cliente, CONCAT(e.nombres, ' ', e.apellidos) as id_empleado, v.fecha_ingreso"
                    + " FROM ventas v INNER JOIN clientes c ON v.id_cliente = c.id_cliente INNER JOIN empleados e ON v.id_empleado = e.id_empleado;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id_venta", "no_factura","serie","fecha_factura","id_cliente","id_empleado","fecha_ingreso"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[7];
            while (consulta.next()) {
                datos[0] = consulta.getString("id_venta");
                datos[1] = consulta.getString("no_factura");
                datos[2] = consulta.getString("serie");
                datos[3] = consulta.getString("fecha_factura");
                datos[4] = consulta.getString("id_cliente");
                datos[5] = consulta.getString("id_empleado");
                datos[6] = consulta.getString("fecha_ingreso");
                tabla.addRow(datos);
            }

            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return tabla;
    }

    public int agregar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "insert into ventas (fecha_factura, fecha_ingreso,id_cliente,id_empleado,no_factura,serie)values(?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setDate(1, getFecha_factura()); 
            parametro.setDate(2, getFecha_ingreso());
            parametro.setInt(3, getId_Cliente());
            parametro.setInt(4, getId_empleado());
            parametro.setInt(5, getNo_factura());
            parametro.setInt(6, getSerie());
            System.out.println(getSerie());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }

    public int modificar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "update ventas set fecha_factura = ?, fecha_ingreso = ? ,id_cliente = ? ,id_empleado = ?,no_factura = ?,serie = ?  where id_venta = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setDate(1, getFecha_factura()); 
            parametro.setDate(2, getFecha_ingreso());
            parametro.setInt(3, getId_Cliente());
            parametro.setInt(4, getId_empleado());
            parametro.setInt(5, getNo_factura());
            parametro.setInt(6, getSerie());
            parametro.setInt(7, getId_Venta());
                        System.out.println(getSerie());

            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }

    public int eliminar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from ventas  where id_venta = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_Venta());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }
    
    public HashMap drop_clientes() {
        HashMap<String, String> drop = new HashMap();
        try {
            String query = "Select id_cliente as id, CONCAT(nombres, ' ', apellidos) as cliente from clientes";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()) {
                drop.put(consulta.getString("id"), consulta.getString("cliente"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return drop;
    }
    
    public HashMap drop_empleados() {
        HashMap<String, String> drop = new HashMap();
        try {
            String query = "Select id_empleado as id, CONCAT(nombres, ' ', apellidos) as empleado from empleados";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()) {
                drop.put(consulta.getString("id"), consulta.getString("empleado"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return drop;
    }
}

