/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DatabaseModel;

public class UpdateController extends HttpServlet {
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
    public void init() throws ServletException {
        super.init();
        url = getServletContext().getInitParameter("driverUrl") + "://" +
              getServletContext().getInitParameter("dbHost") + ":" +
              getServletContext().getInitParameter("dbPort") + "/" +
              getServletContext().getInitParameter("dbName") + "?useSSL=false";
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("home");
            return;
        }
        
        try {
            // Create Database Model
            DatabaseModel dm = new DatabaseModel(
                    url,
                    getServletContext().getInitParameter("driverClass"),
                    getServletContext().getInitParameter("dbUser"),
                    getServletContext().getInitParameter("dbPass")
            );
            // get username
            String user = (String) session.getAttribute("username");
            // get fname
            String fname = (String) request.getParameter("firstname");
            // get lname
            String lname = (String) request.getParameter("lastname");
            
            //Update user
            System.out.println("Updating user " + user);
            dm.updateUser(user, fname, lname);
            System.out.println("Update complete..");
            
            //Update session attributes
            session.setAttribute("firstName", fname);
            session.setAttribute("lastName", lname);
            
            request.setAttribute("updateStatus", true);
            request.getRequestDispatcher("account").forward(request, response);
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
