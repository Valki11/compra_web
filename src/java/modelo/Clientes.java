package modelo;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author keila
 */
public class Clientes {

    public Clientes() {
    }

    public Clientes(int id_Cliente, String nombres, String apellidos, String NIT, boolean genero, String telefono, String correo_electronico, Date fecha_ingreso) {
        this.id_Cliente = id_Cliente;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.NIT = NIT;
        this.genero = genero;
        this.telefono = telefono;
        this.correo_electronico = correo_electronico;
        this.fecha_ingreso = fecha_ingreso;
    }

    private int id_Cliente;
    private String nombres;
    private String apellidos;
    private String NIT;
    private boolean genero;
    private String telefono;
    private String correo_electronico;
    private Date fecha_ingreso;
    Conexion cn;

    public int getId_Cliente() {
        return id_Cliente;
    }

    public void setId_Cliente(int id_Cliente) {
        this.id_Cliente = id_Cliente;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNIT() {
        return NIT;
    }

    public void setNIT(String NIT) {
        this.NIT = NIT;
    }

    public boolean getGenero() {
        return genero;
    }

    public void setGenero(boolean genero) {
        this.genero = genero;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo_electronico() {
        return correo_electronico;
    }

    public void setCorreo_electronico(String correo_electronico) {
        this.correo_electronico = correo_electronico;
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
            String query = "SELECT id_cliente, nombres, apellidos, nit, CASE genero WHEN 1 THEN 'Hombre' ELSE 'Mujer' END as genero, telefono, correo_electronico, fecha_ingreso FROM clientes;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id_cliente","nombres", "apellidos","nit", "genero","telefono", "correo_electronico","fecha_ingreso"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[8];
            while (consulta.next()) {
                datos[0] = consulta.getString("id_cliente");
                datos[1] = consulta.getString("nombres");
                datos[2] = consulta.getString("apellidos");
                datos[3] = consulta.getString("nit");
                datos[4] = consulta.getString("genero");
                datos[5] = consulta.getString("telefono");
                datos[6] = consulta.getString("correo_electronico");
                datos[7] = consulta.getString("fecha_ingreso");

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
            String query = "insert into clientes (apellidos, correo_electronico,fecha_ingreso,genero,nit,nombres,telefono) values(?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getApellidos()); 
            parametro.setString(2, getCorreo_electronico());
            parametro.setDate(3, getFecha_ingreso());
            parametro.setBoolean(4, getGenero());
            parametro.setString(5, getNIT());
            parametro.setString(6, getNombres());
            parametro.setString(7, getTelefono());
           
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
            String query = "update clientes set apellidos= ?, correo_electronico= ?,genero= ?, nit= ?,nombres = ?,telefono= ?  where id_cliente = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getApellidos()); 
            parametro.setString(2, getCorreo_electronico());
            parametro.setBoolean(3, getGenero());
            parametro.setString(4, getNIT());
            parametro.setString(5, getNombres());
            parametro.setString(6, getTelefono());
            parametro.setInt(7, getId_Cliente());
            
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
            String query = "delete from clientes  where id_cliente = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_Cliente());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }
}


    
