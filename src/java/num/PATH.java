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
    String classpath = System.getProperty("user.dir");
    public String PROJECT_SERVER_PATH = classpath.split("tomcat")[0];
}
