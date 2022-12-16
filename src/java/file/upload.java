/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package file;

import static file.delete.deleteFolder;
import java.io.File;
import static java.lang.System.out;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import static num.PATH.PROJECT_SERVER_PATH;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author VothanaCHY
 */
public class upload {

    public boolean uploadFile(HttpServletRequest request){
        String id = request.getParameter("id");
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
        
        
      File file ;
      int maxFileSize = 5000000 * 1024;
      int maxMemSize = 5000000 * 1024;

      // Verify the content type
      String contentType = request.getContentType();
      if ((contentType.contains("multipart/form-data"))) {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        
        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        // maximum file size to be uploaded.
        upload.setSizeMax( maxFileSize );
        try{ 
           // Parse the request to get file items.
           List<FileItem> fileItems = upload.parseRequest(request);

           // Process the uploaded file items
           Iterator i = fileItems.iterator();

           while ( i.hasNext () )
           {
              FileItem fi = (FileItem)i.next();
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
            out.print(ex.getMessage());
            return false;
        }
      }
      
      return false;
    }
}
