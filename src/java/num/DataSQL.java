/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package num;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

/**
 *
 * @author VothanaCHY
 */
public class DataSQL {
    
    private final Database database = new Database();
    
        String query;

    	public List<User> selectAllUsers() {
            query = "SELECT * FROM USERS";
            List<User> users = new ArrayList<>();
            try (Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query);) {
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("userid");
                    String fullname = rs.getString("fullname");
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    users.add(new User(id, fullname, username, password));
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
            return users;
	}
        
        public List<Fruit> selectAllFruit(){
            query = "SELECT * FROM FRUIT";
            List<Fruit> fruits = new ArrayList<>();
            try (Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("fruitID");
                    String Name = rs.getString("Name");
                    double Price = rs.getDouble("Price");
                    double Discount = rs.getDouble("Discount");
                    String Description = rs.getString("Discription");
                    String DateIn = rs.getString("DateIn");
                    int Day = rs.getInt("Day");
                    String Image = rs.getString("Image");
                    fruits.add(new Fruit(id, Name, Price, Discount, Description, DateIn, Day, Image));
                }
            } catch (SQLException e) {
                    printSQLException(e);
            }
            return fruits;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        private void printSQLException(SQLException ex) {
            for (Throwable e : ex) {
                if (e instanceof SQLException) {
                    e.printStackTrace(System.err);
                    System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                    System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                    System.err.println("Message: " + e.getMessage());
                    Throwable t = ex.getCause();
                    while (t != null) {
                        System.out.println("Cause: " + t);
                        t = t.getCause();
                    }
                }
            }
	}
}
