/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Book;
import dto.BookBorrowRecord;
import dto.BookRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
    
    //ham nay lay sách dựa vào id để xem chi tiết
    public Book getBookById(int id){
        Book rs = null;
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = "SELECT [id],[title],[author],[isbn],[category],[published_year],[total_copies],[available_copies],[status]\n"
                        + "FROM [dbo].[books]\n"
                        + "WHERE [id] = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, id);
                
                ResultSet table = st.executeQuery();
                if(table != null){
                    while(table.next()){
                        String title = table.getString("title");
                        String author = table.getString("author");
                        String isbn = table.getString("isbn");
                        String category = table.getString("category");
                        int published_year = table.getInt("published_year");
                        int total_copies = table.getInt("total_copies");
                        int available_copies = table.getInt("available_copies");
                        String status = table.getString("status");
                        rs = new Book(id, title, author, isbn, category, published_year, total_copies, available_copies, status);
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
    
    //hàm này thêm request mu?n sách vào DB
    public int InsertRequest(int userid, int bookid, String requestDate){
        int rs = 0;
        
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date date = df.parse(requestDate);
            
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            
            if(cn != null){
                String sql = "INSERT INTO [dbo].[book_requests] ([user_id],[book_id],[request_date],[status]) VALUES (?,?,?,?)"; 
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, userid);
                st.setInt(2, bookid);
                st.setDate(3, sqlDate);
                st.setString(4, "pending");
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
    
    //ham nay lay du lieu muon sach dua vao userid
    public ArrayList<BookRequest> getBookRequest(int userid){
        ArrayList<BookRequest> rs = new ArrayList<>();
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = " SELECT [user_id],[book_id],[request_date],A.[status], B.title\n"
                        + "  FROM [dbo].[book_requests] A JOIN [dbo].[books] B ON A. book_id = B.id\n"
                        + "  WHERE A.user_id = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, userid);
                
                ResultSet table = st.executeQuery();
                if(table != null){
                    while(table.next()){
                        int bookid = table.getInt("book_id");
                        Date requestDate = table.getDate("request_date");
                        String status = table.getString("status");
                        String bookTitle = table.getString("title");
                        rs.add(new BookRequest(userid, bookid, requestDate, status, bookTitle));
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
    
    //ham nay lay lich su muon sach dua vao id
    public ArrayList<BookBorrowRecord> getBBRById(int userid){
        ArrayList<BookBorrowRecord> rs = new ArrayList<>();
        Connection cn = null;
        try{
            cn = DBUtil.getConnection();
            if(cn != null){
                String sql = "SELECT A.[id],A.[user_id], A.[book_id],A.[borrow_date],A.[due_date],A.[return_date],A.[status], B.title, B.author\n"
                        + "  FROM [dbo].[borrow_records] A JOIN [dbo].[books] B ON A.book_id = B.id\n"
                        + "  WHERE A.user_id = ?";
                PreparedStatement st = cn.prepareStatement(sql);
                st.setInt(1, userid);
                ResultSet table = st.executeQuery();
                if(table != null){
                    while(table.next()){
                        int brid = table.getInt("id");
                        int bookid = table.getInt("book_id");
                        Date borrow_date = table.getDate("borrow_date");
                        Date due_date = table.getDate("due_date");
                        Date return_date = table.getDate("return_date");
                        String status = table.getString("status");
                        String booktitle = table.getString("title");
                        String bookauthor = table.getString("author");
                        rs.add(new BookBorrowRecord(brid, userid, bookid, borrow_date, due_date, return_date, status, booktitle, bookauthor));
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
