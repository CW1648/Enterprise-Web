/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import cmr.entity.Articles;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;

import java.util.List;

/**
 *
 * @author BUIVUHUECHI
 */
public class ArticlesDB {
    public List<Articles> getAllArticles(int id){
        List <Articles> listAr=new ArrayList<>();
        Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_getArticles(?)}");
            cstmt.setInt("articleAuthor", id);
            ResultSet rs=cstmt.executeQuery();
            while(rs.next()){
                int A_id=rs.getInt("articleID");
                String articleTitle=rs.getString("articleTitle");
                String articleContent=rs.getString("articleContent");
                //String =rs.getString("articleTitle");
                byte[] b=rs.getBytes("articlePicture");
                InputStream is=new ByteArrayInputStream(b);
                int articleAuthor=rs.getInt("articleAuthor");
                int articleFaculty=rs.getInt("articleFaculty");
                String articleStatus=rs.getString("articleStatus");
                Date submitted_at=rs.getDate("submitted_at");
                Date updated_at=rs.getDate("updated_at");
                listAr.add(new Articles(A_id, articleTitle, articleContent, is, articleAuthor, articleFaculty, articleStatus, submitted_at, updated_at));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listAr;
    }
    
    public boolean Add_Articles(String articleTitle,String articleContent,InputStream articlePicture,int articleAuthor,int articleFaculty,String articleStatus){
         Connection conn = null;
         try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_addArticles(?,?,?,?,?,?,?,?)}");
            cstmt.setString("articleTitle", articleTitle);
            cstmt.setString("articleContent", articleContent);
            cstmt.setBinaryStream("articlePicture", articlePicture);
            cstmt.setInt("articleAuthor", articleAuthor);
            cstmt.setInt("articleFaculty", articleFaculty);
            cstmt.setString("articleStatus", articleStatus);
            java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
            cstmt.setDate("updated_at", sqlDate);
            cstmt.setDate("submitted_at", sqlDate);
            int result=cstmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
}
