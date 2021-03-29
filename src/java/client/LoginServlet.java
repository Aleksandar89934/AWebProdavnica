
package client;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HibernateUtil;
import model.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
           
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                
                out.print("You are trying to login with username: <b>" + username +"</b>" );
            
                
                Session session = HibernateUtil.getSessionFactory().getCurrentSession();
                
                session.beginTransaction();
                
                    Criteria crit = session.createCriteria(User.class);
                    
                    crit.add(Restrictions.eq("username", username));
                    crit.add(Restrictions.eq("password", password));


                    Query q = session.getNamedQuery("user.auth");


                    q.setString("un", username);
                    q.setString("pwd", password);
                    
                    User user = (User)q.uniqueResult();
                    if(user!=null){

                        String userAgent = request.getHeader("User-Agent");
                        HttpSession httpSession = request.getSession();
                        httpSession.setAttribute("useragent", userAgent);
                        httpSession.setAttribute("username", username);
                         httpSession.setAttribute("ulogovan", true);
                         httpSession.setAttribute("status", user.status);
                         
                         if (user.status==1){response.sendRedirect("adminpage.jsp");}
                         else {response.sendRedirect("./");}
                         
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                
                
                session.getTransaction().commit();
                
            
            
            
            out.println("</body>");
            out.println("</html>");
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
