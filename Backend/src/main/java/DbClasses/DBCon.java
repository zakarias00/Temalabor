package DbClasses;

import java.sql.*;

public class DBCon {
    private static final String connectionUrl = "jdbc:sqlserver://localhost:1433;databasename=GetFitDB;";
    private static final String jdbcDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public void AddSport(String insertString){

        try (Connection connection = DriverManager.getConnection(connectionUrl);
             PreparedStatement prepsInsertProduct = connection.prepareStatement(insertString, Statement.RETURN_GENERATED_KEYS);) {
            prepsInsertProduct.execute();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void ConnectToDatabase(){
//        try
//        {
//            Class.forName(jdbcDriver);
//            System.out.println("JDBC driver loaded");
//        }
//        catch (Exception err)
//        {
//            System.err.println("Error loading JDBC driver");
//            err.printStackTrace(System.err);
//            System.exit(0);
//        }

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try
        {
            //Connect to the database
            Connection databaseConnection = DriverManager.getConnection(connectionUrl);
            System.out.println("Connected to the database");
        }
        catch (SQLException err)
        {
            System.err.println("Error connecting to the database");
            err.printStackTrace(System.err);
            System.exit(0);
        }

        System.out.println("Program finished");
    }
}
