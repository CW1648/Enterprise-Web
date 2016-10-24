/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.AdminFunction;
import cmr.db.ConnectionUtil;
import cmr.entity.CMR_Users;
import cmr.entity.Faculties;
import cmr.entity.Overall_process;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jboss.classfilewriter.constpool.ConstPoolEntryType;

/**
 *
 * @author khatn
 */
public class AdminServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("act");
        AdminFunction db = new AdminFunction();
        if (action.equals("viewUser")) {
            List<cmr.entity.CMR_Users> listUser = db.getAllUsers();
            request.setAttribute("listUser", listUser);
            RequestDispatcher dispacher = request.getRequestDispatcher("AD_ViewUsers.jsp");
            dispacher.forward(request, response);
                      
        }else if (action.equals("addUser")){
       
        String username= request.getParameter("username");
        String password= request.getParameter("password");
        String fullname= request.getParameter("fullname");
        String gender = request.getParameter("gender");
        SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
        java.util.Date parsed=format.parse(request.getParameter("date"));
        java.sql.Date sql = new java.sql.Date(parsed.getTime());   
        String email = request.getParameter("email");
        String address= request.getParameter("address");
        String phone = request.getParameter("phone");
        int roleID = Integer.parseInt(request.getParameter("roleID"));
        CMR_Users cmr= new CMR_Users(username, gender, sql, roleID, address, phone, email);
        cmr.setuPassword(password);
        boolean result = db.addUser(cmr);
            if (result) {
                RequestDispatcher dispatcher =request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }else
            {
                 request.setAttribute("msg", "Error creating news");
                RequestDispatcher dispatcher = request.getRequestDispatcher("AD_addUser.jsp");
                dispatcher.forward(request, response);
            }
        }else if(action.equals("viewAY")){
            List<Overall_process> listAy = db.getallAY();
            request.setAttribute("listAy", listAy);
            RequestDispatcher dispacher = request.getRequestDispatcher("AD_ViewAY.jsp");
            dispacher.forward(request, response);                     
        }else if(action.equals("getAYinfo")){
            Connection conn=ConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement("select*from Users where roleID = 4");
            ResultSet rs=ps.executeQuery();
            List<CMR_Users> listmm=new ArrayList<>();
            while(rs.next()){
                  String username = rs.getString("userName");
                  int userid=rs.getInt("userID");
                  CMR_Users mm=new CMR_Users();
                  mm.setUserID(userid);
                  mm.setUserName(username);
                  listmm.add(mm);
            }
            request.setAttribute("listmm", listmm);
            RequestDispatcher dispacher = request.getRequestDispatcher("AD_addAY.jsp");
            dispacher.forward(request, response); 
        }else if(action.equals("addAY")){
              SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
              java.util.Date parsed=format.parse(request.getParameter("year"));
              java.sql.Date year = new java.sql.Date(parsed.getTime());
              
              SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
              java.util.Date parsed1=format1.parse(request.getParameter("dateStart"));
              java.sql.Date dateStart = new java.sql.Date(parsed1.getTime());
              
              SimpleDateFormat format2 = new SimpleDateFormat("MM/dd/yyyy");
              java.util.Date parsed2=format2.parse(request.getParameter("dateEnd"));
              java.sql.Date dateEnd = new java.sql.Date(parsed2.getTime());
              
              int mmid=Integer.parseInt(request.getParameter("mmid"));
              
              Overall_process a=new Overall_process();
              a.setMm_ID(mmid);
              a.setOp_year(year);
              a.setOp_startDate(dateStart);
              a.setOp_endDate(dateEnd);
              boolean result = db.addAY(a);
            if (result) {
                RequestDispatcher dispatcher =request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }else
            {
                 request.setAttribute("msg", "Error creating news");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin?act=getAYinfo");
                dispatcher.forward(request, response);
            }
        
        }else if(action.equals("viewFa")){      
            List<Faculties> listitem=db.getfaculty();
            request.setAttribute("listitem", listitem);
            RequestDispatcher dispatcher = request.getRequestDispatcher("AD_ViewFaculty.jsp");
            dispatcher.forward(request, response);
        }else if(action.equals("getFAinfo")){
            Connection conn=ConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement("select*from Users where roleID = 3");
            ResultSet rs=ps.executeQuery();
            List<CMR_Users> listmm=new ArrayList<>();
            while(rs.next()){
                  String username = rs.getString("userName");
                  int userid=rs.getInt("userID");
                  CMR_Users mm=new CMR_Users();
                  mm.setUserID(userid);
                  mm.setUserName(username);
                  listmm.add(mm);
            }
            request.setAttribute("listmm", listmm);
            List<Overall_process> listAy = db.getallAY();
            request.setAttribute("listAy", listAy);
            RequestDispatcher dispacher = request.getRequestDispatcher("AD_addFaculty.jsp");
            dispacher.forward(request, response); 
        }else if(action.equals("addFA")){
             SimpleDateFormat format1 = new SimpleDateFormat("MM/dd/yyyy");
              java.util.Date parsed1=format1.parse(request.getParameter("dateStart"));
              java.sql.Date dateStart = new java.sql.Date(parsed1.getTime());
              
              SimpleDateFormat format2 = new SimpleDateFormat("MM/dd/yyyy");
              java.util.Date parsed2=format2.parse(request.getParameter("dateEnd"));
              java.sql.Date dateEnd = new java.sql.Date(parsed2.getTime());
              
              String name=request.getParameter("faName");
              
              int opid=Integer.parseInt(request.getParameter("opid"));
              int mcid=Integer.parseInt(request.getParameter("mcid"));
              
              Faculties fa=new Faculties(name, dateEnd, mcid, opid, dateStart, dateEnd);
              
              boolean result = db.addFaculty(fa);
            if (result) {
                RequestDispatcher dispatcher =getServletContext().getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            }else
            {
                request.setAttribute("msg", "Error creating news");
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin?act=getFAinfo");
                dispatcher.forward(request, response);
            }
              
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
