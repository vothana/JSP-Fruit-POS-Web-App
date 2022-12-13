/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package num;

import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author VothanaCHY
 */
public class DataSQL {
    
    private final Database database = new Database();
    
    public void Test(){
        String sql = "SELECT * FROM `Fruit`";
        try {
            PreparedStatement statement = database.connect().prepareStatement(sql);
            
        } catch (SQLException e) {
        } finally {
            database.disconnect();
        }
    }
}
