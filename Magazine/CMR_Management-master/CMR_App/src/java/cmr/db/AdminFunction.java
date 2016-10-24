/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.db;

import cmr.entity.CMR_Users;
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
            CallableStatement cs=conn.prepareCall("{call usp_addUsers(?,?,?,?,?,?,?)}");
            cs.setString("u_name",cmr.getUserName());
            cs.setString("u_pass",cmr.getuPassword());
            cs.setString ("gender",cmr.getGender());
            cs.setDate("dob",cmr.getDob());
            cs.setString ("email",cmr.getMail());
            cs.setString("address", cmr.getAddress());
            cs.setString("phone",cmr.getPhone());
            
            
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
}
