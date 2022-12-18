/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package num;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 *
 * @author VothanaCHY
 */
public class DataSQL {
    
    private final Database database = new Database();
    
        String query;
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();

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
                database.disconnect();
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
                database.disconnect();
            } catch (SQLException e) {
                    printSQLException(e);
            }
            return fruits;
        }
        
        public List<Fruit> searchAllFruit(String search){
            query = "SELECT * FROM `FRUIT` WHERE NAME LIKE '%" + search +"%' ;";
            System.out.print(query);
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
                database.disconnect();
            } catch (SQLException e) {
                    printSQLException(e);
            }
            return fruits;
        }
        
        public List<Order> getActiveOrder(String userID){
            query = " SELECT " +
                    " FRUIT.FRUITID, " +
                    " FRUIT.NAME, " +
                    " FRUIT.PRICE, " +
                    " FRUIT.IMAGE, " +
                    " FRUIT.DISCRIPTION, " +
                    " CART.QUANTITY, " +
                    " ORDERS.ORDERID " +
                    " FROM ((ORDERS " +
                    " INNER JOIN CART " +
                    " ON ORDERS.ORDERID = CART.ORDERID) " +
                    " INNER JOIN FRUIT " +
                    " ON CART.FRUITID = FRUIT.FRUITID) " + 
                    " WHERE ORDERS.STATUS = 'PROCESSING' AND ORDERS.USERID = " + userID + ";";
            System.out.print(query);
            List<Order> orders = new ArrayList<>();
            try (Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    System.out.println("asasssssssssssssssssssssssssssssssssssssssssssssssssss");
                    int fruitId = rs.getInt("fruitID");
                    String Name = rs.getString("NAME");
                    double Price = rs.getDouble("PRICE");
                    String Image = rs.getString("IMAGE");
                    String Description = rs.getString("DISCRIPTION");
                    int Quantity = rs.getInt("QUANTITY");
                    int orderID = rs.getInt("ORDERID");
                    double Total =  Price * Quantity;
                    orders.add(new Order(fruitId, Name, Price, Image, Description, Quantity, orderID, Total));
                }
                database.disconnect();
            } catch (SQLException e) {
                printSQLException(e);
            }
            return orders;
        }
        
        public void order(String userID, String fruitID){
            List<Order> orders = getActiveOrder(userID);
            if(!orders.isEmpty()){
                newOrder(userID,fruitID);
            }else{
                String orderID = String.valueOf(orders.get(0).getOrderID());
                updateQty(userID,orderID,fruitID);
            }
        }
        
        public boolean finishOrder(String userID){
            query = " SELECT CART.QUANTITY, FRUIT.PRICE " +
                    " FROM ((ORDERS " +
                    " INNER JOIN CART " +
                    " ON ORDERS.ORDERID = CART.ORDERID) " +
                    " INNER JOIN FRUIT " +
                    " ON CART.FRUITID = FRUIT.FRUITID) " + 
                    "WHERE ORDERS.STATUS = 'PROCESSING' AND ORDERS.USERID = " + userID + ";";
            
            //Work in progress
            query = "UPDATE ORDERS SET STATUS = DONE WHERE USERID = " + userID ;
            
            return false;
        }
        
        private void newOrder(String userID, String fruitID){
            
            query = "INSERT INTO ORDERS " +
                    " (ORDERDATE,USERID,TOTALPRICE,STATUS) " +
                    " VALUES ('" +
                    formatter.format(date) + "', " +
                    Integer.valueOf(userID) + "," + 
                    "0," +
                    "'PROCESSING')";

            //Work in progress
            
            addNewFruitToCart(userID,fruitID);
        }
        
        private void addNewFruitToCart(String userID, String fruitID){
             List<Order> orders = getActiveOrder(userID);
            if(!orders.isEmpty()){
                int orderID = orders.get(0).getOrderID();
                query = "INSERT INTO CART" +
                        " (CARTDATE,FRUITID,ORDERID,QUANTITY) " +
                        " VALUES ('" + 
                        formatter.format(date) + "', " +
                        fruitID + "," + 
                        orderID + "," +
                        "1)";
                
                //Work in progress
            }
        }
        
        
        private Cart getACartByFruidID(String fruitID){
            query = "SELECT * FROM CART WHERE FRUITID = " + fruitID ;
            Cart cart = null;
            
            //Work in progress
            
            return cart;
        }
        
        public boolean updateQty(String userID,String orderID, String fruitId){
            Cart cart = getACartByFruidID(fruitId);
            int oldQty = cart.getQuantity();
            
            query = " UPDATE CART SET " +
                    " ' CARTDATE ' = '" + formatter.format(date) +
                    " ' QUANTITY ' = '" + (oldQty + 1) +
                    " ' WHERE FRUITID = '" +  2 + "';";
            
            //Work in progress
            
            return false;
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
