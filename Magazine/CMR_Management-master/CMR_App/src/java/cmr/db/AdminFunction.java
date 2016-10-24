/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import cmr.entity.CMR_Users;
import cmr.entity.Faculties;
import cmr.entity.Overall_process;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author khatn
 */
public class AdminFunction {
    
    private String md5(String passwordToHash) {
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(passwordToHash.getBytes());
            byte[] bytes = md.digest();
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 255) + 256, 16).substring(1));
            }
            generatedPassword = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return generatedPassword;
    }

    public List<CMR_Users> getAllUsers() {
        List<CMR_Users> listUsers = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cs = conn.prepareCall("{call usp_getAllUser()}");
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                String username = rs.getString("userName");
                String gender = rs.getString("gender");
                Date dob = rs.getDate("dob");
                  int roleID = rs.getInt("roleID");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
              
                CMR_Users cmrUser = new CMR_Users(username, gender,dob, roleID, email, address, phone);
                listUsers.add(cmrUser);
            }
        } catch (Exception e) {
        }
        return listUsers;
    }
    public boolean addUser(CMR_Users cmr){
        Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cs=conn.prepareCall("{call usp_addUsers(?,?,?,?,?,?,?,?)}");
            cs.setString("u_name",cmr.getUserName());
            cs.setString("u_pass",md5(cmr.getuPassword()));
            cs.setString ("gender",cmr.getGender());
            cs.setDate("dob",cmr.getDob());
            cs.setString ("email",cmr.getMail());
            cs.setString("address", cmr.getAddress());
            cs.setString("phone",cmr.getPhone());
            cs.setInt("roleID", cmr.getRoleID());
            int result = cs.executeUpdate();
            if (result >0) {
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(AdminFunction.class.getName()).log(Level.SEVERE, null, e);
        }finally{
            if(conn!=null){
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AdminFunction.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return false;
    }
    
    public List<Overall_process> getallAY(){
         List<Overall_process> listAy = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectionUtil.getConnection();
            CallableStatement cs = conn.prepareCall("{call usp_getAllOverall_process()}");
            ResultSet rs = cs.executeQuery();
           while (rs.next()) {                
                int id=rs.getInt("op_ID");
                Date year=rs.getDate("op_year");
                int mm_ID=rs.getInt("mm_ID");
                Date op_startDate=rs.getDate("op_startDate");
                Date op_endDate=rs.getDate("op_endDate");
                String mm=rs.getString("userName");
                Overall_process a=new Overall_process(id, year, mm_ID, op_startDate, op_endDate);
                a.setMM(mm);
                listAy.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listAy;
    }
    
    public boolean addAY(Overall_process ay){
         Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cs=conn.prepareCall("{call usp_addOverall_process(?,?,?,?)}");
            cs.setDate("op_year", ay.getOp_year());
            cs.setDate("op_startDate", ay.getOp_startDate());
            cs.setDate("op_endDate", ay.getOp_endDate());
            cs.setInt("mm_ID", ay.getMm_ID());
            int result = cs.executeUpdate();
            if (result >0) {
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(AdminFunction.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
    public List<Faculties> getfaculty(){
        List<Faculties> listfaculty=new ArrayList<>();
         Connection conn=null;
         try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cstmt=conn.prepareCall("{call usp_getFaculties()}");
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
    
    public boolean addFaculty(Faculties fa){
        Connection conn=null;
        try {
            conn=ConnectionUtil.getConnection();
            CallableStatement cs=conn.prepareCall("{call usp_addFaculties(?,?,?,?,?,?)}");
            cs.setString("facultyName", fa.getFacultyName());
            java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
            cs.setDate("academicYear", sqlDate);
            cs.setInt("mc_Id", fa.getMc_ID());
            cs.setInt("op_id", fa.getOp_ID());
            cs.setDate("fa_startDate", sqlDate);
            cs.setDate("fa_endDate", sqlDate);
            int result = cs.executeUpdate();
            if (result >0) {
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(AdminFunction.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
}
