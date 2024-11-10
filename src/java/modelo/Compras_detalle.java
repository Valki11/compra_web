package modelo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author keila
 */
public class Compras_detalle {

    public Compras_detalle(int id_compra_detalle, int id_compra, int id_producto, int cantidad, double precio_costo_unitario) {
        this.id_compra_detalle = id_compra_detalle;
        this.id_compra = id_compra;
        this.id_producto = id_producto;
        this.cantidad = cantidad;
        this.precio_costo_unitario = precio_costo_unitario;
       
    }

    public Compras_detalle() {
    }
    
    private int id_compra_detalle;
    private int id_compra;
    private int id_producto;
    private int cantidad;
    private double precio_costo_unitario;
    Conexion cn;

    public int getId_compra_detalle() {
        return id_compra_detalle;
    }

    public void setId_compra_detalle(int id_compra_detalle) {
        this.id_compra_detalle = id_compra_detalle;
    }

    public int getId_compra() {
        return id_compra;
    }

    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio_costo_unitario() {
        return precio_costo_unitario;
    }

    public void setPrecio_costo_unitario(double precio_costo_unitario) {
        this.precio_costo_unitario = precio_costo_unitario;
    }
    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT cd.id_compra_detalle, cd.id_compra, p.producto as id_producto, cd.cantidad, cd.precio_costo_unitario "
                    + "FROM compras_detalle cd INNER JOIN productos p ON cd.id_producto = p.id_producto;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id_compra_detalle","id_compra","id_producto","cantidad","precio_costo_unitario"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[5];
            while (consulta.next()) {
                datos[0] = consulta.getString("id_compra_detalle");
                datos[1] = consulta.getString("id_compra");
                datos[2] = consulta.getString("id_producto");
                datos[3] = consulta.getString("cantidad");
                datos[4] = consulta.getString("precio_costo_unitario");
                
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
            String query = "insert into compras_detalle(id_compra, id_producto,	cantidad, precio_costo_unitario) values(?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_compra());
            parametro.setInt(2, getId_producto());
            parametro.setInt(3, getCantidad());
            parametro.setDouble(4, getPrecio_costo_unitario());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
            
            cn = new Conexion();
            query = "update productos set existencia = (existencia + ?), precio_costo = ?, precio_venta = ( ? * 1.25) WHERE id_producto = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getCantidad());
            parametro.setDouble(2, getPrecio_costo_unitario());
            parametro.setDouble(3, getPrecio_costo_unitario());
            parametro.setInt(4, getId_producto());
            
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
            String query = "update compras_detalle set cantidad= ?, id_compra= ? ,id_producto= ?,precio_costo_unitario = ? where id_compra_detalle = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getCantidad());
            parametro.setInt(2,  getId_compra());
            parametro.setInt(3,  getId_producto());
            parametro.setDouble(4,  getPrecio_costo_unitario());
            parametro.setInt(5,  getId_compra_detalle());
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
            String query = "delete from compras_detalle where id_compora_detalle = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId_compra_detalle());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return retorno;
    }
    
    public HashMap drop_productos() {
        HashMap<String, String> drop = new HashMap();
        try {
            String query = "Select id_producto as id, producto as producto from productos";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()) {
                drop.put(consulta.getString("id"), consulta.getString("producto"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return drop;
    }
}



