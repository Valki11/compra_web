package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;
import java.sql.Date;

/**
 *
 * @author keila
 */
public class Empleado {

    private int id_empleado;
    private String nombres, apellidos, direccion, telefono, DPI;
    private Boolean genero;
    private Date fecha_nacimiento, fecha_inicio_labores, fecha_ingreso;
    private int id_puesto;

    private Conexion cn;

    public Empleado() {
    }

    public Empleado(int id_empleado, String nombres, String apellidos, String direccion, String telefono, String DPI, Boolean genero, Date fecha_nacimiento, Date fecha_inicio_labores, Date fecha_ingreso, int id_puesto) {
        this.id_empleado = id_empleado;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.telefono = telefono;
        this.DPI = DPI;
        this.genero = genero;
        this.fecha_nacimiento = fecha_nacimiento;
        this.fecha_inicio_labores = fecha_inicio_labores;
        this.fecha_ingreso = fecha_ingreso;
        this.id_puesto = id_puesto;
    }
    
        public int getId_empleado() {
        return id_empleado;
    }

    public String getNombres() {
        return nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public String getDPI() {
        return DPI;
    }

    public Boolean getGenero() {
        return genero;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public Date getFecha_inicio_labores() {
        return fecha_inicio_labores;
    }

    public Date getFecha_ingreso() {
        return fecha_ingreso;
    }

    public int getId_puesto() {
        return id_puesto;
    }
    
     public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public void setGenero(Boolean genero) {
        this.genero = genero;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public void setFecha_inicio_labores(Date fecha_inicio_labores) {
        this.fecha_inicio_labores = fecha_inicio_labores;
    }

    public void setFecha_ingreso(Date fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }
    

    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT * FROM empleados;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id_empleado", "nombres", "apellidos", "direccion", "telefono", "DPI", "genero", "fecha_nacimiento", "id_puesto","fecha_inicio_labores","fecha_ingreso"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[11];
            while (consulta.next()) {
                datos[0] = consulta.getString("id_empleado");
                datos[1] = consulta.getString("nombres");
                datos[2] = consulta.getString("apellidos");
                datos[3] = consulta.getString("direccion");
                datos[4] = consulta.getString("telefono");
                datos[5] = consulta.getString("DPI");
                datos[6] = consulta.getString("genero");
                datos[7] = consulta.getString("fecha_nacimiento");
                datos[8] = consulta.getString("id_puesto");
                datos[9] = consulta.getString("fecha_inicio_labores");
                datos[10] = consulta.getString("fecha_ingreso");
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
            String query = "insert into empleados(id_empleado, nombres, apellidos, dirrecion, telefono, DPI, genero, fecha_nacimiento, id_puesto,fecha_inicio_labores,fecha_ingreso) values(?,?,?,?,?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_empleado());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getDPI());
            parametro.setBoolean(7, getGenero());
            parametro.setDate(8, getFecha_nacimiento());
            parametro.setDate(9, getFecha_inicio_labores());
            parametro.setDate(10, getFecha_ingreso());
            parametro.setInt(11, getId_puesto());
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
            String query = "update empleados set id_empleado= ?, nombres= ?, apellidos= ?, dirrecion= ?, telefono= ?, DPI= ?, genero= ?, fecha_nacimiento= ?, id_puesto= ?,fecha_inicio_labores= ?,fecha_ingreso= ? where id_empleado = ?,= ?,= ?,= ?,= ?,= ?,= ?,= ?,= ?,= ?,= ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_empleado());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getDPI());
            parametro.setBoolean(7, getGenero());
            parametro.setDate(8, getFecha_nacimiento());
            parametro.setDate(9, getFecha_inicio_labores());
            parametro.setDate(10, getFecha_ingreso());
            parametro.setInt(11, getId_puesto());
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
            String query = "delete from empleados  where id_empleado = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_empleado());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }

}
