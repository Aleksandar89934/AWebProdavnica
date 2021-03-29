<%-- 
    Document   : prodaja
    Created on : Oct 11, 2020, 5:09:48 PM
    Author     : Fix
--%>

<%@page import="org.hibernate.Session"%>
<%@page import="model.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="model.purchasedProducts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prodaja</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <%
                int u = (Integer)session.getAttribute("status");
                if(u!=1){
                response.sendRedirect("logout");
                }
        %>
           
        
        <div id="wrapper" class="cf">
			<div id="header" class="cf">
			<div id="logo">
				<img src="images/logo.png" alt="Slika trenutno ne može biti učitana.">
			</div>
			<div id="slogan">
                            <p>AWeb Prodavnica</p><br>
                            <p>Dobrodosli <%= session.getAttribute("username")%></p>
                            <a href="logout">Logout</a>
			</div>
		</div><!--end #header-->
		
		<div id="nav">
		<ul>
			<li><a href="adminpage.jsp">Proizvodi</a></li>
			<li><a href="prodaja.jsp">Prodaja</a></li>
			<li><a href="kupci.jsp">Kupci</a></li>
		</ul>
		</div> <!--end nav-->
		<div id="central">
			<div id="main">
		<h1>Prodaja</h1>
		<%

                Session sesija = HibernateUtil.getSessionFactory().getCurrentSession();

                sesija.beginTransaction();

                List<purchasedProducts> products = sesija.createCriteria(purchasedProducts.class).list();
        
                sesija.getTransaction().commit();
                
                %>
		<div id="usersTable">
                <table id="userTable">
                  <tr><th> ID kupovine </th><th> Sifra </th><th> Naziv </th><th> Slika </th><th> Opis </th><th> Cena </th><th> Korisnicko ime </th></tr>
                <%
                    for(purchasedProducts pr : products) { %>
                    
                    <tr>
                        <td><%=pr.getPurchasedProductsId()%></td>
                        <td><%=pr.getProductid()%></td>
                        <td><%=pr.getNaziv()%></td>
                        <td><img src="productimages/<%=pr.getSlika()%>" alt="Slika ne moze biti ucitana trenutno." width="80" /></td>
                        <td><%=pr.getOpis()%></td>
                        <td><%=pr.getCena()%></td>
                        <td><%=pr.getUsername()%></td>
                    
                    </tr>
                        
                    
                        <% }
                %>
		</table>
                </div>

		<a href="prodaja.jsp"><b>Povratak na vrh stranice</b></a>

		
		</div> <!--end main-->
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
