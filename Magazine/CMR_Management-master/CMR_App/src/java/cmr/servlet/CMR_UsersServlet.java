/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cmr.servlet;

import cmr.db.CMR_UsersDb;
import cmr.entity.CMR_Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nguyen
 */
public class CMR_UsersServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("act");
        if (action == null) {
            Cookie[] cookies = request.getCookies();
            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (c.getName().equals("txtUserName")) {
                    request.setAttribute("user_name", c.getValue());
                    break;
                }
            }
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (action.equals("btnLogin")) {
            login(request, response);
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

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        CMR_UsersDb db = new CMR_UsersDb();
        HttpSession session = request.getSession(true);
//        System.out.println("Session ID: " + session.getId());
        String userName = request.getParameter("txtUserName");
        String password = request.getParameter("txtPassword");
        if (!userName.equals("") && !password.equals("")) {
            CMR_Users cmrUsers = new CMR_Users(userName, password);
            db.login(cmrUsers);
            if (cmrUsers.getUserName() != null) {
                switch (cmrUsers.getRoleID()) {
                    case 1:
                        {
                            //                db.SessionId(session.getId(), email); problem?
                            session.setAttribute("cmrUsers", cmrUsers);
                            Cookie cookie = new Cookie("txtUserName", userName);
                            Cookie cookie1=new Cookie("userid", String.valueOf(cmrUsers.getUserID()));
                            response.addCookie(cookie);
                            response.addCookie(cookie1);
                            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                            dispatcher.forward(request, response);
                            break;
                        }
                    case 2:
                        {
                            //                db.SessionId(session.getId(), email); problem?
                            session.setAttribute("cmrUsers", cmrUsers);
                            Cookie cookie = new Cookie("txtUserName", userName);
                            Cookie cookie1=new Cookie("userid", String.valueOf(cmrUsers.getUserID()));
                            response.addCookie(cookie);
                            response.addCookie(cookie1);
                            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Student_index.jsp");
                            dispatcher.forward(request, response);
                            break;
                        }
                    case 3:
                        {
                            session.setAttribute("cmrUsers", cmrUsers);
                            Cookie cookie = new Cookie("txtUserName", userName);
                            Cookie cookie1=new Cookie("userid", String.valueOf(cmrUsers.getUserID()));
                            response.addCookie(cookie);
                            response.addCookie(cookie1);
                            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/MC_index.jsp");
                            dispatcher.forward(request, response);
                            break;
                        }
                    case 4:
                        {
                            session.setAttribute("cmrUsers", cmrUsers);
                            Cookie cookie = new Cookie("txtUserName", userName);
                            Cookie cookie1=new Cookie("userid", String.valueOf(cmrUsers.getUserID()));
                            response.addCookie(cookie);
                            response.addCookie(cookie1);
                            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/MM_index.jsp");
                            dispatcher.forward(request, response);
                            break;
                        }
                    default:
                        request.setAttribute("msg", "Login fail");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                        break;
                }

            } else {
                request.setAttribute("msg", "Login fail");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Enter your user name or password again!");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

}
