/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.AdminFunction;
import cmr.entity.CMR_Users;
import com.sun.xml.rpc.processor.modeler.j2ee.xml.javaIdentifierType;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("act");
        AdminFunction db = new AdminFunction();
        if (action == null) {
            db = new AdminFunction();
            List<cmr.entity.CMR_Users> listUser = db.getAllUsers();
            request.setAttribute("listUser", listUser);
            RequestDispatcher dispacher = request.getRequestDispatcher("AD_ViewUsers.jsp");
            dispacher.forward(request, response);
            
         
            
        }else if (action == "addUser"){
       
        String username= request.getParameter("username");
        String password= request.getParameter("password");
        String fullname= request.getParameter("fullname");
        String gender = request.getParameter("gender");
           
        String email = request.getParameter("email");
        String address= request.getParameter("address");
        String phone = request.getParameter("phone");
        int roleID = Integer.parseInt(request.getParameter("roleID"));
        CMR_Users cmr= new CMR_Users(username, gender, null, roleID, address, phone, email);
        boolean result = db.addUser(cmr);
            if (result) {
                RequestDispatcher dispatcher =request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
            }else
            {
                 request.setAttribute("msg", "Error creating news");
                RequestDispatcher dispatcher = request.getRequestDispatcher("employee.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
