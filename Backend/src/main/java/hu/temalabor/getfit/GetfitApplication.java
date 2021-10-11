package hu.temalabor.getfit;

import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;



@SpringBootApplication
public class GetfitApplication {

    static final String DB_URL = "jdbc:mysql://localhost/";
    static final String USER = "guest";
    static final String PASS = "guest123";

    public static void main(String[] args) {

        //SpringApplication.run(GetfitApplication.class, args);

            // Open a connection
            try(Connection conn = DriverManager.getConnection(DB_URL);
                Statement stmt = conn.createStatement();
            ) {
                String sql = "CREATE DATABASE GETFIT";
                stmt.executeUpdate(sql);
                System.out.println("Database created successfully...");
            } catch (SQLException e) {
                e.printStackTrace();
            }


    }

}
