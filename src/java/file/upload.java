/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package file;

import static file.delete.deleteFolder;
import java.io.File;
import java.util.List;
import static num.PATH.PROJECT_SERVER_PATH;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author VothanaCHY
 */

public class upload{
    public boolean uploadFile(List<FileItem> fileItems){
        try{ 
            File file;
            String id = "";
            for (FileItem item : fileItems) {
                if (item.isFormField()) {
                    if("id".equals(item.getFieldName())){
                        id = item.getString();
                        break;
                    }
                }
            }
            
            if("".equals(id)) return false;
            
            String folder =  PROJECT_SERVER_PATH + "\\web\\images\\";
            String filePath = folder + id + "\\"; 
            
            for (FileItem fi : fileItems) {
                if ( !fi.isFormField()){
                    String fileName = fi.getName();
                    if("".equals(fileName) || fileName == null) return false;
                    
                    file = new File(folder);
                    if (!file.exists()) file.mkdir();

                    file = new File(filePath);
                    if (!file.exists()){
                        file.mkdir();
                    }else{
                        for (File subFile : file.listFiles()) {
                         if(subFile.isDirectory()) {
                            deleteFolder(subFile);
                         } else {
                            subFile.delete();
                         }
                      }
                        file.delete();
                        file.mkdir();
                    }
                    if( fileName.lastIndexOf("\\") >= 0 ){
                        file = new File( filePath +
                                fileName.substring( fileName.lastIndexOf("\\"))) ;
                    }else{
                        file = new File( filePath +
                                fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                    }
                    fi.write( file ) ;
                }
            }
           return true;
        }catch(Exception ex) {
            System.out.print(ex.getMessage());
        }
      
      return false;
    }
}
