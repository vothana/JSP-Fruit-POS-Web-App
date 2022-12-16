/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package file;

import java.io.File;
import static num.PATH.PROJECT_SERVER_PATH;

/**
 *
 * @author VothanaCHY
 */
public class get {
    public String getFilePath(String filename, String id, String role){
        String path = PROJECT_SERVER_PATH + "\\web\\images\\" + id + "\\" + filename;
        File directory = new File(path);
        if (directory.exists()){
            
            switch (role) {
                case "home":
                    return "images/" + id + "/" + filename;
                case "user":
                    return "../../images/" + id + "/" + filename;
                case "admin":
                    return "../../images/" + id + "/" + filename;
                default:
                    return null;
            }
        }else{
            return null;
        }
    }
}
