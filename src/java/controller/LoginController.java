/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DatabaseModel;

public class LoginController extends HttpServlet {
    private String url;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void init() throws ServletException {
        super.init();
        url = getServletContext().getInitParameter("driverUrl") + "://" +
              getServletContext().getInitParameter("dbHost") + ":" +
              getServletContext().getInitParameter("dbPort") + "/" +
              getServletContext().getInitParameter("dbName") + "?useSSL=false";
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //check existing session
        if (request.getSession(false) != null) {
            // redirect to home
            response.sendRedirect("/home");
        }
        try {
            // Create Database Model
            DatabaseModel dm = new DatabaseModel(
                    url,
                    getServletContext().getInitParameter("driverClass"),
                    getServletContext().getInitParameter("dbUser"),
                    getServletContext().getInitParameter("dbPass")
            );
            
            // Check Credentials
            ResultSet rs = dm.login(request.getParameter("username"), request.getParameter("password"));
            if (rs != null) {
                // create session and session objects
                HttpSession session = request.getSession(); System.out.println("created session");
                
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("firstName", rs.getString("fname"));
                session.setAttribute("lastName", rs.getString("lname"));
                
                //Set Timeout if Remember Me is not checked
                if (request.getParameter("remember") == null) {
                    session.setMaxInactiveInterval(60 * 30); // 30 min inactive logs out the user
                }
                
                // redirect to home
                response.sendRedirect("home");
                rs.close();
            }
            else {
                System.out.println("wrong2");
                request.setAttribute("wrong", true);
                request.getRequestDispatcher("/login").forward(request, response);
            }
            dm.close(); // close connnection after every use
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
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
