/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import bean.UserBean;
import database.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author emmanueledmund
 */
public class registerServletPatient extends HttpServlet {

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

        String username = new String();
        String password = new String();
        String fullname = new String();
        String patient_type = new String();
        String address = new String();
        String postcode = new String();
        String DOB = new String();
       

        if (request.getParameter("username") != null) {
            username = request.getParameter("username");

        }

        if (request.getParameter("password") != null) {
            password = request.getParameter("password");

        }

        if (request.getParameter("fullname") != null) {
            fullname = request.getParameter("fullname");

        }

        if (request.getParameter("patient_type") != null) {
            patient_type = request.getParameter("patient_type");

        }
         if (request.getParameter("address") != null) {
            address = request.getParameter("address");

        }
          if (request.getParameter("postcode") != null) {
            postcode = request.getParameter("postcode");

        }
           if (request.getParameter("DOB") != null) {
            DOB = request.getParameter("DOB");

        }

     
        UserBean patient = new UserBean();
        patient.setUsername(username);
        patient.setPassword(password);
        patient.setFullName(fullname);
        patient.setPatient_type(patient_type);
        patient.setAddress(address);
        patient.setPostCode(postcode);
        patient.setDOB(DOB);

        UserDao registerDao = new UserDao();
        String result = registerDao.addPatient(patient);
        response.getWriter().print(result);
        response.sendRedirect("patLogin.jsp");
        response.getWriter().print(result);
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
