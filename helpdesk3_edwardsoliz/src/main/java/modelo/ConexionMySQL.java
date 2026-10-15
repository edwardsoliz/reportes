package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMySQL {

    // ✅ CORREGIDO: nombre real de la BD según tu volcado SQL
    private String bd = "helpdesk3edwardsoliz";
    private String usuario = "root";
    private String password = "";

    // ✅ CORREGIDO: parámetros añadidos para evitar errores de SSL/timezone
    private String url = "jdbc:mysql://localhost:3306/" + bd
                       + "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    public Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, password);
            System.out.println("✅ Conexión exitosa a: " + bd);
        } catch (ClassNotFoundException e) {
            System.out.println("❌ No se encontró el Driver MySQL.");
            System.out.println("   Detalle: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("❌ Error al conectar con la base de datos.");
            System.out.println("   Detalle: " + e.getMessage());
        }
        return con;
    }
}