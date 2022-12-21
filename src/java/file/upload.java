/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package file;

import static file.delete.deleteFolder;
import java.io.File;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import static num.PATH.PROJECT_SERVER_PATH;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
            
            if("".equals(id)){
                return false;
            }
            
            String folder =  PROJECT_SERVER_PATH + "\\web\\images\\";
            String filePath = folder + id + "\\";

            File fo = new File(folder);
            if (!fo.exists()){
                fo.mkdir();
            }

            File directory = new File(filePath);
            if (!directory.exists()){
                directory.mkdir();
            }else{
                for (File subFile : directory.listFiles()) {
                 if(subFile.isDirectory()) {
                    deleteFolder(subFile);
                 } else {
                    subFile.delete();
                 }
              }
                directory.delete();
                directory.mkdir();
            }
            
            for (FileItem fi : fileItems) {
                if ( !fi.isFormField()){
                    String fileName = fi.getName();
                    // Write the file
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
