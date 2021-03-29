/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Fix
 */
@WebServlet(name = "odobrenKredit", urlPatterns = {"/odobrenkredit"})
public class odobrenKredit extends HttpServlet {

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
        
        String username = request.getParameter("username");
        String amount = request.getParameter("amount");
        
        Session su = HibernateUtil.getSessionFactory().getCurrentSession();
            su.beginTransaction();
               
            String hql = "select id from User where username = '"+username+"'";
                Query query = su.createQuery(hql);
                query.setMaxResults(1);
                Integer u = (Integer)query.uniqueResult();   
                
                model.User uc = (model.User) su.load(model.User.class, u);
                uc.setCredit(uc.getCredit()+Double.parseDouble(amount));
                
           su.update(uc);
           su.getTransaction().commit();
           
           Session session = null;
            String del = request.getParameter("id");
            
            int delId = Integer.parseInt(del);
            
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            model.Kredit forDelete = (model.Kredit) session.get(model.Kredit.class, delId);
         

            session.delete(forDelete);
            session.getTransaction().commit();
            
           
           
           
           
           
           
           response.sendRedirect("kupci.jsp");
        
        
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
