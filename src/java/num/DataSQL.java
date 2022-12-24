/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package num;


import static file.delete.deleteFolder;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static num.PATH.PROJECT_SERVER_PATH;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
/**
 *
 * @author VothanaCHY
 */
public class DataSQL {
    
    private final Database database = new Database();
    
        String query;
        SimpleDateFormat formatter = new SimpleDateFormat("yyy-MM-dd");
        Date date = new Date();
        
        String INNERJOIN =  " FROM ((ORDERS " +
                            " INNER JOIN CART " +
                            " ON ORDERS.ORDERID = CART.ORDERID) " +
                            " INNER JOIN FRUIT " +
                            " ON CART.FRUITID = FRUIT.FRUITID) " + 
                            " WHERE ORDERS.STATUS = 'PROCESSING' AND ORDERS.USERID = " ;

    	public List<User> selectAllUsers() throws SQLException {

            query = "SELECT * FROM USERS";
            List<User> users = new ArrayList<>();
            
            try{
                Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                System.out.println(preparedStatement + "\n\n");
                
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
        
        public List<Fruit> searchAllFruit(String search) throws SQLException{
            
            query = "SELECT * FROM `FRUIT` WHERE NAME LIKE '%" + search +"%' ;";
            List<Fruit> fruits = new ArrayList<>();
            try{
                Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                System.out.println(preparedStatement + "\n\n");
                
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("fruitID");
                    String Name = rs.getString("Name");
                    double Price = rs.getDouble("Price");
                    String Description = rs.getString("Discription");
                    String DateIn = rs.getString("DateIn");
                    int Day = rs.getInt("Day");
                    String Image = rs.getString("Image");
                    fruits.add(new Fruit(id, Name, Price, Description, DateIn, Day, Image));
                }
            } catch (SQLException e) {
                    printSQLException(e);
            }
            
            return fruits;
        }
        
        public List<Order> getActiveOrder(String userID) throws SQLException{
            
            query = " SELECT " +
                    " FRUIT.FRUITID, " +
                    " FRUIT.NAME, " +
                    " FRUIT.PRICE, " +
                    " FRUIT.IMAGE, " +
                    " FRUIT.DISCRIPTION, " +
                    " CART.QUANTITY, " +
                    " ORDERS.ORDERID " + INNERJOIN + userID + ";";
            List<Order> orders = new ArrayList<>();
            try{
                Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                System.out.println(preparedStatement + "\n\n");
                
                ResultSet rs = preparedStatement.executeQuery();
                while (rs.next()) {
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
            } catch (SQLException e) {
                printSQLException(e);
            }
            
            return orders;
        }
        
        public Cart getACartByFruidID(String userID,String orderID, String fruitId) throws SQLException{
            
            query = " SELECT CART.CARTID, CART.QUANTITY " + INNERJOIN + userID +
                    " AND ORDERS.ORDERID = " + orderID +
                    " AND FRUIT.FRUITID =  " + fruitId + ";";
            Cart cart = null;
            
            try{
                Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                System.out.println(preparedStatement + "\n\n");
                
                ResultSet rs = preparedStatement.executeQuery();
                if(rs.next()) {
                    int CartID = rs.getInt("CartID");
                    int FruitID = Integer.parseInt(fruitId);
                    int OrderID = Integer.parseInt(orderID);
                    int Quantity = rs.getInt("Quantity");
                    cart = new Cart(CartID,FruitID,OrderID,Quantity);
                }
            } catch (SQLException e) {
               printSQLException(e);
            }
            
            return cart;
        }
        
        public double getTotalPrice(String userID) throws SQLException{
            List<Order> orders = getActiveOrder(userID);
            double totalPrice = 0;
            if(!orders.isEmpty()){
                for(Order order : orders){
                   totalPrice += (order.getPrice() * order.getQuantity());
                }
            }
            
            return totalPrice;
        }
        
        public boolean order(String userID, String fruitID, String... values) throws SQLException{
            
            int orderID = getProcessingOrder(userID);
            
            if(orderID <= 0 && Integer.parseInt(userID) != 0){
                return newOrder(userID,String.valueOf(orderID),fruitID);
            }else{
                return updateQty(userID,String.valueOf(orderID),fruitID, values[0]);
            }
            
        }
        
        public boolean finishOrder(String userID) throws SQLException{
            
            query = "UPDATE ORDERS SET STATUS = ? WHERE USERID = ?";
            
            try{
                Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setString(1, "DONE");
                preparedStatement.setString(2, userID);
                        
                System.out.println(preparedStatement + "\n\n");
                
                if(preparedStatement.executeUpdate() > 0){
                    return true;
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
            
            return false;
        }
        
        private boolean newOrder(String userID,String orderID, String fruitID) throws SQLException{
            query = "INSERT INTO ORDERS " +
                    " (ORDERDATE,USERID,TOTALPRICE,STATUS) " +
                    "  VALUES (?,?,?,?)";
            
            boolean isCreated = false;
            try{
                Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setString(1, formatter.format(date));
                preparedStatement.setString(2, userID);
                preparedStatement.setInt(3, 0);
                preparedStatement.setString(4, "PROCESSING");
                
                System.out.println(preparedStatement + "\n\n");
                
                if(preparedStatement.executeUpdate() > 0){
                    isCreated = true;
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
            
            if(isCreated) return addNewFruitToCart(orderID,fruitID) ;
            
            return false;
        }
        
        private int getProcessingOrder(String userID) throws SQLException{
            query = " SELECT ORDERID FROM ORDERS WHERE USERID = " + userID + 
                    " AND STATUS = 'PROCESSING'";
            try{
                Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                System.out.println(preparedStatement + "\n\n");
                
                ResultSet rs = preparedStatement.executeQuery();
                if(rs.next())
                    return rs.getInt("ORDERID");

            } catch (SQLException e) {
               printSQLException(e);
            }
            return 0;
        }
        
        private boolean addNewFruitToCart(String orderID, String fruitID) throws SQLException{
            if(Integer.parseInt(orderID) > 0){
                query = "INSERT INTO CART" +
                        " (CARTDATE,FRUITID,ORDERID,QUANTITY) " +
                        "  VALUES (?,?,?,?)";
                
                try{
                    Connection connection = database.connect();
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    
                    preparedStatement.setString(1, formatter.format(date));
                    preparedStatement.setString(2, fruitID);
                    preparedStatement.setString(3, orderID);
                    preparedStatement.setInt(4, 1);
                    
                    System.out.println(preparedStatement + "\n\n");
                    
                    if(preparedStatement.executeUpdate() > 0){
                        return true;
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
            }
            return false;
        }
        
        private boolean updateQty(String userID,String orderID, String fruitId, String... values) throws SQLException{
            
            Cart cart = getACartByFruidID(userID,orderID,fruitId);
            if(cart == null){ //It mean not yet added this fruit to cart
                return addNewFruitToCart(orderID,fruitId);
            }
            
            int oldQty = cart.getQuantity();
            
            int newQty = values[0].equals("remove") ? (oldQty - 1) : (oldQty + 1);
            
            query = " UPDATE ORDERS  " +
                    " INNER JOIN CART  " +
                    " ON ORDERS.ORDERID = CART.ORDERID " +
                    " INNER JOIN FRUIT " +
                    " ON CART.FRUITID = FRUIT.FRUITID " +
                    " SET  " +
                    " CART.CARTDATE = ? ," + 
                    " CART.QUANTITY = ? " +
                    " WHERE  " +
                    " ORDERS.STATUS = 'PROCESSING'  " +
                    " AND ORDERS.USERID = ? " + 
                    " AND ORDERS.ORDERID = ? " + 
                    " AND FRUIT.FRUITID =  ? ";
            
            try{
                Connection connection = database.connect();
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                
                preparedStatement.setString(1, formatter.format(date));
                preparedStatement.setInt(2, newQty);
                preparedStatement.setString(3, userID);
                preparedStatement.setString(4, orderID);
                preparedStatement.setString(5, fruitId);
                
                System.out.println(preparedStatement + "\n\n");
                
                if(preparedStatement.executeUpdate() > 0){
                    return true;
                }
            } catch (SQLException e) {
                printSQLException(e);
            }
            
            return false;
        }
        
        public boolean deleteCart(String orderID, String fruitId){
            query = " DELETE  FROM CART " +
                    " WHERE  ORDERID = ?" +
                    " AND FRUITID = ? " ;
                try{
                    Connection connection = database.connect();
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    
                    preparedStatement.setString(1, orderID);
                    preparedStatement.setString(2, fruitId);
                    
                    System.out.println(preparedStatement + "\n\n");
                    
                    if(preparedStatement.executeUpdate() > 0){
                        return true;
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
            
            return false;
        }
        
        public int getMaxIdFruit(){
            query = " SELECT MAX(FRUITID) FROM FRUIT;";
                try{
                    Connection connection = database.connect();
                    PreparedStatement preparedStatement = connection.prepareStatement(query);

                    System.out.println(preparedStatement + "\n\n");
                    
                    ResultSet rs = preparedStatement.executeQuery();
                    
                    if(rs.next()){
                        return rs.getString(1) != null ? Integer.parseInt(rs.getString(1)) : 0;
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
            
            return -1;
        }
        
        public boolean deleteFruit(String fruitId){
            query = " DELETE FROM FRUIT " +
                    " WHERE FRUITID = ? " ;
                try{
                    Connection connection = database.connect();
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    
                    preparedStatement.setString(1, fruitId);
                    
                    System.out.println(preparedStatement + "\n\n");
                    
                    if(preparedStatement.executeUpdate() > 0){
                        return true;
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
            
            return false;
        }
         
        public boolean createFruit(List<FileItem> fileItems) throws FileUploadException{
            query = " INSERT INTO " +
                    " FRUIT (NAME, PRICE, DISCRIPTION, DATEIN, DAY, IMAGE)" +
                    " VALUES (?,?,?,?,?,?); ";
                try{
                    Connection connection = database.connect();
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    
                    int i = 1;
                    for (FileItem item : fileItems) {
                        if(!("id".equals(item.getFieldName()))){
                            if(!("Image".equals(item.getFieldName()))){
                                preparedStatement.setString(i, item.getString());
                                System.out.println( i + " Field = " + item.getFieldName() + "  Value = " + item.getString());
                                i++;
                            }else{
                                preparedStatement.setString(i, item.getName());
                                System.out.println( i + " Field = " + item.getFieldName() + "  Name = " + item.getName());
                                i++;
                            }
                        }
                    }

                    System.out.println(preparedStatement + "\n\n");
                    
                    if(preparedStatement.executeUpdate() > 0){
                        return true;
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
            
            return false;
        }
       
        public boolean updateFruit(List<FileItem> fileItems) throws FileUploadException{
            query = " UPDATE FRUIT" +
                    " SET " + 
                    " NAME = ? ," +
                    " PRICE = ? ," +
                    " DISCRIPTION = ? ," + 
                    " DATEIN = ? , " + 
                    " DAY = ? , " + 
                    " IMAGE = ? " + 
                    " WHERE FRUITID = ? ;";
                try{
                    Connection connection = database.connect();
                    PreparedStatement preparedStatement = connection.prepareStatement(query);
                    
                    int i = 1;
                    String id = "";    
                    boolean isUpdating = false;
                    for (FileItem item : fileItems) {
                        if(!("id".equals(item.getFieldName()))){
                            if(!("Image".equals(item.getFieldName()))){
                                preparedStatement.setString(i, item.getString());
                                System.out.println( i + " Field = " + item.getFieldName() + "  Value = " + item.getString());
                                i++;
                            }else{
                                if(!"".equals(item.getName())){
                                    preparedStatement.setString(i, item.getName());
                                    System.out.println( i + " Field = " + item.getFieldName() + "  Name = " + item.getName());
                                }else{
                                    isUpdating = true;
                                }
                                i++;
                            }
                        }else{
                            id = item.getString();
                        }
                    }
                    
                    if(isUpdating){
                        String image = "";
                        String folder =  PROJECT_SERVER_PATH + "\\web\\images\\" + id + "\\";
                        File directory = new File(folder);
                        if (directory.exists()){
                             for (File subFile : directory.listFiles()) {
                                image = subFile.getName();
                                System.out.println("==========================" + subFile.getName());
                             }
                            preparedStatement.setString(6, image);
                        }
                    }
                    
                    preparedStatement.setString(7, id);
                    System.out.println(preparedStatement + "\n\n");
                    
                    if(preparedStatement.executeUpdate() > 0){
                        return true;
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
            
            return false;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        private void checkConnectionState() throws SQLException{
            if(database.connect().isClosed()){
                database.connect();
            }else{
                database.disconnect();
            }
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
