/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.ArticlesDB;
import cmr.db.ConnectionUtil;
import cmr.db.Overall_processDB;
import cmr.entity.Articles;
import cmr.entity.Comments;
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
import javax.servlet.http.Part;

/**
 *
 * @author BUIVUHUECHI
 */
public class ShowArticlesServlet extends HttpServlet {

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
        ArticlesDB db = new ArticlesDB();
        int studentid =0;
        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userid")) {
                    //do something
                    //value can be retrieved using #cookie.getValue()
                  studentid=Integer.parseInt(cookie.getValue());  
                }
            }
        }
        List<Articles> listArt = db.getAllArticles(studentid);

        String action = request.getParameter("act");
        if (action == null) {
            request.setAttribute("listArt", listArt);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Student_viewAllCon.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("view")) {
            int id = Integer.parseInt(request.getParameter("id"));
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
            request.setAttribute("item", item);
            Overall_processDB db1=new Overall_processDB();
            List<Comments> listcom=db1.getcomment(A_id);
            request.setAttribute("listcom", listcom);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Student_viewCon.jsp");
            dispatcher.forward(request, response);

        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            request.setAttribute("editID", id);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Student_editCon.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("update")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Articles updateitem = new Articles();
            updateitem.setArticleID(id);
            updateitem.setArticleTitle(request.getParameter("title"));
            updateitem.setArticleContent(request.getParameter("content"));
            Part filePart = request.getPart("attachment");
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                // obtains input stream of the upload file
                updateitem.setArticlePicture(filePart.getInputStream());
            }
            if (db.Update_Articles(updateitem)) {
              //response.sendRedirect("/CMR_App/ShowArticles");
               RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ShowArticles?act=view&id="+id);
                dispatcher.forward(request, response);
            }
        }else if(action.equals("comment")){
            String content=request.getParameter("message");
            int id = Integer.parseInt(request.getParameter("id"));
            Comments com1=new Comments();
            com1.setArticleID(id);
            com1.setCommentAuthor(studentid);
            com1.setCommentContent(content);
            Overall_processDB db1=new Overall_processDB();
            if(db1.insert_comment(com1)){
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ShowArticles?act=view&id="+id);
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
        } catch (SQLException ex) {
            Logger.getLogger(ShowArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ShowArticlesServlet.class.getName()).log(Level.SEVERE, null, ex);
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
