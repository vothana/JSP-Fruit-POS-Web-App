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
    public String getFilePath(String filename, String id){
        String path = PROJECT_SERVER_PATH + "\\web\\images\\" + id + "\\" + filename;
        File directory = new File(path);
        return directory.exists() ? "images/" + id + "/" + filename : null;
    }
}
