/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package num;

/**
 *
 * @author VothanaCHY
 */
public interface PATH {
    //You must put tomcat server in the project directory
    String classPath = System.getProperty("user.dir");
    public String PROJECT_SERVER_PATH = classPath.split("tomcat")[0];
}
