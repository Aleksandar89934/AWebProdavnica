<%-- 
    Document   : kupljeniproizvodi
    Created on : Oct 23, 2020, 10:36:39 AM
    Author     : Fix
--%>

<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="model.purchasedProducts"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Query"%>

<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.HibernateUtil"%>
<%@page import="model.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AWeb Prodavnica</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <%
                int e = (Integer)session.getAttribute("status");
                if(e!=2){
                response.sendRedirect("logout");
                }
        %>
       <div id="wrapper" class="cf">
			<div id="header" class="cf">
			<div id="logo">
				<img src="images/logo.png" alt="Slika trenutno ne mo?e biti ucitana.">
			</div>
			<div id="slogan">
                            <p>AWeb Prodavnica</p><br>
                            <p>Dobrodosli <%= session.getAttribute("username")%></p>
                            <a href="logout">Logout</a>
			</div>
		</div><!--end #header-->
                <div id="nav">
		<ul>
			<li><a href="index.jsp">Pocetna</a></li>
			<li><a href="kupljeniproizvodi.jsp">Kupljeni proizvodi</a></li>
			
		</ul>
		</div> <!--end nav-->
		<div id="main">
		<div id="central">
                 <%
                Session sesija = HibernateUtil.getSessionFactory().getCurrentSession();

                sesija.beginTransaction();

                String hql = "from User where username = '"+session.getAttribute("username")+"'";
                Query query = sesija.createQuery(hql);
                query.setMaxResults(1);
                User u = (User)query.uniqueResult();
        
                sesija.getTransaction().commit();
                
                
                %>
                <label>Kredit: </label>
                <%=
                    u.getCredit()
                %>
                <br>
                <details>
                  <summary>Dopuni kredit</summary>
                <form action="buykredit">
                    <input type="text" name="dopuna">
                    <input type="hidden" name = "username" value="<%=session.getAttribute("username")%>">
                    <input type="submit" value="Posalji zahtev">
                    </form><br>
                </details><hr>
                <%

                Session s = HibernateUtil.getSessionFactory().getCurrentSession();

                s.beginTransaction();
                
                Criteria cr = s.createCriteria(purchasedProducts.class);
                cr.add(Restrictions.eq("username", session.getAttribute("username")));
                
                List<purchasedProducts> products = cr.list();
        
                s.getTransaction().commit();
                
                %>
                <h3>Kupljeni proizvodi</h3>
                <%
                    for(purchasedProducts pr : products) { %>
                    <div id="prikazProizvoda">
                        <label>Sifra: </label><%=pr.getProductid()%><br>
                        <label>Naziv: </label><%=pr.getNaziv()%><br>
                        <img src="productimages/<%=pr.getSlika()%>" alt="Slika ne moze biti ucitana trenutno." width="200" /><br>
                        <label>Opis: </label><%=pr.getOpis()%><br>
                        <label>Cena: </label><%=pr.getCena()%><br>
                        <label>Korisnicko ime: </label><%=pr.getUsername()%><br>
                    </div><!--end prikazProizvoda--><hr>
                        <% }
                %>
                
                <a href="kupljeniproizvodi.jsp"><b>Povratak na vrh stranice</b></a>
               
                </div><!--end main-->
		</div> <!--end central-->
		<hr>
		<div id="footer">
			<p>
			Assignment - Kreiranje web prodavnice
                        </p>
		</div> <!--end footer-->


	</div><!--end wrapper-->
    </body>
</html>
