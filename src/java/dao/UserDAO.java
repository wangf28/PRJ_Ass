/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBUtil;

/**
 *
 * @author LENOVO
 */
public class UserDAO {

    public UserDAO() {
    }
    
    public ArrayList<User> getAllUsers(){
        ArrayList<User> userList = new ArrayList<>();
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = "SELECT*FROM users";
                PreparedStatement st = cn.prepareStatement(sql);
                ResultSet rs = st.executeQuery();
                if(rs != null){
                    while(rs.next()){
                        int id=rs.getInt("id");
                        String name=rs.getString("name");
                        String email=rs.getString("email");
                        String password=rs.getString("password");
                        String role=rs.getString("role");
                        String status=rs.getString("status");
                        userList.add(new User(id, name, email, password, role, status));
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            DBUtil.disconnectionDB(cn);
        }
        return userList;
    }
    
    public void addUser(User user){
        Connection cn=null;
        try {
            cn=DBUtil.getConnection();
            if(cn!=null){
                String sql="INSERT INTO users(name, email, password, role, status) "
                        +"VALUES(?,?,?,?,?)";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, user.getName());
                st.setString(2, user.getEmail());
                st.setString(3, user.getPassword());
                st.setString(4, user.getRole());
                st.setString(5, user.getStatus());
            }
        } catch (Exception e) {
            e.getMessage();
        } finally{
            DBUtil.disconnectionDB(cn);
        }
    }
}
