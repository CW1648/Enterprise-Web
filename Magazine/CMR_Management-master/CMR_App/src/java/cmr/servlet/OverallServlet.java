/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.ConnectionUtil;
import cmr.db.Overall_processDB;
import cmr.entity.Articles;
import cmr.entity.Comments;
import cmr.entity.Faculties;
import cmr.entity.Overall_process;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author BUIVUHUECHI
 */
public class OverallServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        Overall_processDB db=new Overall_processDB();
        int mmid=0;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userid")) {
                    //do something
                    //value can be retrieved using #cookie.getValue()
                  mmid=Integer.parseInt(cookie.getValue());  
                }
            }
        }
        String action=request.getParameter("act");
        if(action.equals("process")){
            List<Overall_process> listProcess=db.getall(mmid);
            request.setAttribute("listProcess", listProcess);
            RequestDispatcher dispatcher = request.getRequestDispatcher("MM_viewAllAY.jsp");
            dispatcher.forward(request, response);
        }else if(action.equals("falcuty")){
            int id = Integer.parseInt(request.getParameter("id"));
            List<Faculties> listitem=db.getfacultyByOP(id);
            request.setAttribute("listitem", listitem);
            RequestDispatcher dispatcher = request.getRequestDispatcher("MM_viewAllFaculties.jsp");
            dispatcher.forward(request, response);
        }else if (action.equals("con")) {
            int id=Integer.parseInt(request.getParameter("id"));
            int oid=Integer.parseInt(request.getParameter("oid"));
            List<Articles> listArt=db.getAllArticles(id);
            request.setAttribute("listArt", listArt);
            request.setAttribute("oid", oid);
            RequestDispatcher dispatcher = request.getRequestDispatcher("MM_viewAllCon.jsp");
            dispatcher.forward(request, response);
        }else if(action.equals("view")){
            int id = Integer.parseInt(request.getParameter("id"));
            int oid=Integer.parseInt(request.getParameter("oid"));
            Connection conn = ConnectionUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement("select * from Articles where articleID = ?");
            ps.setInt(1, id);
            Articles item = new Articles();
            ResultSet rs = ps.executeQuery();
            rs.next();
            int A_id = rs.getInt(1);
            String articleTitle = rs.getString("articleTitle");
            String articleContent = rs.getString("articleContent");
            //String =rs.getString("articleTitle");
            int articleAuthor = rs.getInt("articleAuthor");
            int articleFaculty = rs.getInt("articleFaculty");
            String articleStatus = rs.getString("articleStatus");
            Date submitted_at = rs.getDate("submitted_at");
            Date updated_at = rs.getDate("updated_at");
            item.setArticleID(A_id);
            item.setArticleTitle(articleTitle);
            item.setArticleContent(articleContent);
            item.setArticleFaculty(articleFaculty);
            item.setArticleAuthor(articleAuthor);
            request.setAttribute("item", item);
            request.setAttribute("oid", oid);
            List<Comments> listcom=db.getcomment(A_id);
            request.setAttribute("listcom", listcom);
            RequestDispatcher dispatcher = request.getRequestDispatcher("MM_viewCon.jsp");
            dispatcher.forward(request, response);
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
        } catch (SQLException ex) {
            Logger.getLogger(OverallServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(OverallServlet.class.getName()).log(Level.SEVERE, null, ex);
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
