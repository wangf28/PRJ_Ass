/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBUtil;

/**
 *
 * @author Admin
 */
public class BookDAO {
    public ArrayList<Book> getAllBook(){
        ArrayList<Book> rs = new ArrayList<>();
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = "SELECT [id],[title],[author],[isbn],[category],[published_year],[total_copies],[available_copies],[status]\n"
                        + "FROM [dbo].[books]";
                PreparedStatement st = cn.prepareStatement(sql);
                ResultSet table = st.executeQuery();
                if(table != null){
                    while(table.next()){
                        int id = table.getInt("id");
                        String title = table.getString("title");
                        String author = table.getString("author");
                        String isbn = table.getString("isbn");
                        String category = table.getString("category");
                        int published_year = table.getInt("published_year");
                        int total_copies = table.getInt("total_copies");
                        int available_copies = table.getInt("available_copies");
                        String status = table.getString("status");
                        rs.add(new Book(id, title, author, isbn, category, published_year, total_copies, available_copies, status));
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
    
    //ham nay de tim kiem sach theo ba muc
    public ArrayList<Book> searchBook(String key){
        ArrayList<Book> rs = new ArrayList<>();
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = "SELECT [id],[title],[author],[isbn],[category],[published_year],[total_copies],[available_copies],[status]\n"
                        + "FROM [dbo].[books]\n"
                        + "WHERE [title] LIKE ? OR [author] LIKE ? OR [category] LIKE ?"; 
                PreparedStatement st = cn.prepareStatement(sql);
                st.setString(1, "%" + key + "%");
                st.setString(2, "%" + key + "%");
                st.setString(3, "%" + key + "%");
                ResultSet table = st.executeQuery();
                if(table != null){
                    while(table.next()){
                        int id = table.getInt("id");
                        String title = table.getString("title");
                        String author = table.getString("author");
                        String isbn = table.getString("isbn");
                        String category = table.getString("category");
                        int published_year = table.getInt("published_year");
                        int total_copies = table.getInt("total_copies");
                        int available_copies = table.getInt("available_copies");
                        String status = table.getString("status");
                        rs.add(new Book(id, title, author, isbn, category, published_year, total_copies, available_copies, status));
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
