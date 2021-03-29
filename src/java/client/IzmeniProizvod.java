/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Fix
 */
@WebServlet(name = "IzmeniProizvod", urlPatterns = {"/izmeniproizvod"})
@MultipartConfig()
public class IzmeniProizvod extends HttpServlet {

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
            
            int id = Integer.parseInt(request.getParameter("id"));
            String naziv = request.getParameter("naziv");
            String opis = request.getParameter("opis");
            double cena = Double.parseDouble(request.getParameter("cena"));
            
            Part picturePart = request.getPart("slika");
            response.getOutputStream().write(("Uploaded picture name: " + picturePart.getSubmittedFileName() + "<br>").getBytes());
            response.getOutputStream().write(("Uploaded picture size: " + picturePart.getSize() + "<br>").getBytes());
            String pictureName = UUID.randomUUID().toString() + "_" + picturePart.getSubmittedFileName();
            InputStream is = picturePart.getInputStream();
            
            String folderPath = "C:/Users/Fix/Documents/NetBeansProjects/AWebProdavnica/Build/web/productimages/";
            File theDir = new File(folderPath);
            
            if(!theDir.exists()){
                theDir.mkdirs();
                }
                
            
            
            
            int bajt;
            FileOutputStream fos = new FileOutputStream("C:/Users/Fix/Documents/NetBeansProjects/AWebProdavnica/Build/web/productimages/" + pictureName);
            while((bajt=is.read())!=-1){
                fos.write(bajt);
            }
            fos.close();
            
            String slika = pictureName;
            
            
            
            Session s = HibernateUtil.getSessionFactory().getCurrentSession();
            s.beginTransaction();
            
                String hql = "select id from Product where id = '"+id+"'";
                Query query = s.createQuery(hql);
                query.setMaxResults(1);
                Integer u = (Integer)query.uniqueResult();   
                
                model.Product pr = (model.Product) s.load(model.Product.class, u);
                    pr.setNaziv(naziv);
                    pr.setOpis(opis);
                    pr.setCena(cena);
                    pr.setSlika(slika);
            
                
                
                s.update(pr);
                s.getTransaction().commit();
                response.sendRedirect("adminpage.jsp");
        
        
        
        
        
        
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
