/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import cmr.entity.Articles;
import cmr.entity.Comments;
import cmr.entity.Faculties;
import cmr.entity.Overall_process;
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
public class Overall_processDB {
    public List<Overall_process> getall(int mmid){
        List<Overall_process> listyear=new ArrayList<>();
        Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_getOverall_process(?)}");
            cstmt.setInt("mm_ID", mmid);
            ResultSet rs=cstmt.executeQuery();
            while (rs.next()) {                
                int id=rs.getInt("op_ID");
                Date year=rs.getDate("op_year");
                int mm_ID=rs.getInt("mm_ID");
                Date op_startDate=rs.getDate("op_startDate");
                Date op_endDate=rs.getDate("op_endDate");
                listyear.add(new Overall_process(id, year, mm_ID, op_startDate, op_endDate));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        return listyear;
    }
    
    public List<Faculties> getfaculty(int mcid){
        List<Faculties> listfaculty=new ArrayList<>();
         Connection conn=null;
         try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_getFaculties_by_ID(?)}");
            cstmt.setInt("mc_ID", mcid);
            ResultSet rs=cstmt.executeQuery();
             while (rs.next()) {                 
                 int id=rs.getInt("facultyID");
                 String name=rs.getString("facultyName");
                 Date academicYear=rs.getDate("academicYear");
                 int mc_ID=rs.getInt("mc_ID");
                 int op_ID=rs.getInt("op_ID");
                 Date fa_startDate=rs.getDate("fa_startDate");
                 Date fa_endDate=rs.getDate("fa_endDate");
                 Faculties f=new Faculties(name, academicYear, mc_ID, op_ID, fa_startDate, fa_endDate);
                 f.setFacultyID(id);
                 listfaculty.add(f);
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listfaculty;
    }
    
    public List<Faculties> getfacultyByOP(int oid){
        List<Faculties> listfaculty1=new ArrayList<>();
         Connection conn=null;
         try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_getFaculties_by_oID(?)}");
            cstmt.setInt("op_ID", oid);
            ResultSet rs=cstmt.executeQuery();
             while (rs.next()) {                 
                 int id=rs.getInt("facultyID");
                 String name=rs.getString("facultyName");
                 Date academicYear=rs.getDate("academicYear");
                 int mc_ID=rs.getInt("mc_ID");
                 int op_ID=rs.getInt("op_ID");
                 Date fa_startDate=rs.getDate("fa_startDate");
                 Date fa_endDate=rs.getDate("fa_endDate");
                 Faculties f=new Faculties(name, academicYear, mc_ID, op_ID, fa_startDate, fa_endDate);
                 f.setFacultyID(id);
                 listfaculty1.add(f);
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listfaculty1;
    }
    
    public List<Articles> getAllArticles(int id){
        List <Articles> listAr=new ArrayList<>();
        Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_getArticles_by_Fa(?)}");
            cstmt.setInt("articleFaculty", id);
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
    
    public List<Articles> getAprovedArticles(int id){
        List <Articles> listAr=new ArrayList<>();
        Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_getArticles_by_Fa1(?)}");
            cstmt.setInt("articleFaculty", id);
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
    
    public boolean Update_Status(Articles item){
        Connection conn = null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_updateStatus(?,?)}");
            cstmt.setInt("articleID", item.getArticleID());
            cstmt.setString("articleStatus", item.getArticleStatus());            
            int result=cstmt.executeUpdate();
            if (result > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Comments> getcomment(int id){
        List<Comments> listcom=new ArrayList<>();
        Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_showcommet(?)}");
            cstmt.setInt("articleID", id);
            ResultSet rs=cstmt.executeQuery();
            while(rs.next()){
               int cid=rs.getInt("comment_id");
               int aid=rs.getInt("articleID");
               String content=rs.getString("commentContent");
               int author=rs.getInt("commentAuthor");
               listcom.add(new Comments(cid, aid, content, author));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listcom;
    }
    
    public boolean insert_comment(Comments com){
        Connection conn = null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_addcomment(?,?,?)}");
            cstmt.setInt("articleID", com.getArticleID());
            cstmt.setString("commentContent", com.getCommentContent());
            cstmt.setInt("commentAuthor", com.getCommentAuthor());
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
