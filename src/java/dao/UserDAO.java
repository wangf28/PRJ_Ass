/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DBUtil;

/**
 *
 * @author ASUS
 */
public class UserDAO {
    
    public static UserDAO getInstance(){
        return new UserDAO();
    }
    
    //hàm này thêm người dùng mới vào
    public int AddNewUser(String name, String email, String password){
        int rs = 0;
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = "INSERT INTO [dbo].[users]([name],[email],[password],[role],[status]) VALUES (?,?,?,?,?)";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, name);
                st.setString(2, email);
                st.setString(3, password);
                st.setString(4, "user");
                st.setString(5, "active");
                rs = st.executeUpdate();
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                if(cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return rs;
    }
    
    public int updateUser(User user, String name, String email, String pass){
        int rs = 0;
        Connection cn = null;
        try {
            cn = DBUtil.getConnection();
            String sql = "UPDATE users "+
                        "SET "+
                        "name=?,\n"+
                        "email=?,\n"+
                        "password=?\n"+
                        "WHERE id=?;\n";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, pass);
            st.setInt(4, user.getId());
            rs=st.executeUpdate();
        } catch (Exception e) {
            e.getMessage();
        }finally{
            try {
                if(cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;
    }
    
    public User getUserByEmail(String email){
        User rs = null;
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = "SELECT [id],[name],[email],[password],[role],[status]\n"
                        + "FROM [dbo].[users]\n"
                        + "WHERE [email] = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, email);
                ResultSet table = st.executeQuery();
                if(table != null){
                    while(table.next()){
                        int id = table.getInt("id");
                        String name = table.getString("name");
                        String pass = table.getString("password");
                        String role = table.getString("role");
                        String status = table.getString("status");
                        rs = new User(id, name, email, pass, role, status);
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                if(cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;
    }
    
    public User getUserByEmailAndPass(String email, String pass){
        User rs = null;
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = "SELECT [id],[name],[email],[password],[role],[status]\n"
                        + "FROM [dbo].[users]\n"
                        + "WHERE [email] = ? AND [password] = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, email);
                st.setString(2, pass);
                ResultSet table = st.executeQuery();
                if(table != null){
                    while(table.next()){
                        int id = table.getInt("id");
                        String name = table.getString("name");
                        String role = table.getString("role");
                        String status = table.getString("status");
                        rs = new User(id, name, email, pass, role, status);
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                if(cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;
        
        
        
    }
    
    public User getUserById(int id){
        User rs = null;
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = "SELECT [id],[name],[email],[password],[role],[status]\n"
                        + "FROM [dbo].[users]\n"
                        + "WHERE [id] = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, id);
                ResultSet table = st.executeQuery();
                if(table != null){
                    while(table.next()){
                        String email = table.getString("email");
                        String name = table.getString("name");
                        String pass = table.getString("password");
                        String role = table.getString("role");
                        String status = table.getString("status");
                        rs = new User(id, name, email, pass, role, status);
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                if(cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;
    }
}
