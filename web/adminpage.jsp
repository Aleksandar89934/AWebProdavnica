<%-- 
    Document   : adminpage
    Created on : Oct 11, 2020, 3:08:42 PM
    Author     : Fix
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.HibernateUtil"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="sr">
    <head>
        <title>AWeb Prodavnica</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
		<h1>Proizvodi</h1>
                <div id="unosProizvoda">
                    <details><summary>Unos novog proizvoda</summary>
                    <form action="unosproizvodaservlet" method="post" enctype="multipart/form-data">
                        <label>Naziv: </label> <input type="text" name="naziv" /><br>
                        <label>Slika: </label> <input type="file" name="slika" /><br>
                        <label>Opis: </label> <textarea type="text" name="opis"></textarea><br>
                        <label>Cena: </label> <input type="text" name="cena" /><br>
                        <input type="submit" value="Unesi"/>
                    </form>
                    </details>
                </div><!--end unosProizvoda--><hr>
                
                <%

                Session sesija = HibernateUtil.getSessionFactory().getCurrentSession();

                sesija.beginTransaction();

                List<Product> products = sesija.createCriteria(Product.class).list();
        
                sesija.getTransaction().commit();
                
                %>
                
                
                <%
                    for(Product pr : products) { %>
                    <div id="prikazProizvoda">
                    <label>Sifra: </label><%=pr.getId()%><br>
                    <label>Naziv: </label><%=pr.getNaziv()%><br>
                    <img src="productimages/<%=pr.getSlika()%>" alt="Slika ne moze biti ucitana trenutno." width="200" /><br>
                    <label>Opis: </label><%=pr.getOpis()%><br>
                    <label>Cena: </label><%=pr.getCena()%><br>
                    <a href='product?id=<%=pr.getId()%>' > Obrisati </a> 
                    
                        <details><summary>Izmeni Proizvod</summary>
                    <form action="izmeniproizvod" method="post" enctype="multipart/form-data">
                        <label>Id: </label> <label><%=pr.getId()%></label><br>
                                               <input type="hidden" name="id" value="<%=pr.getId()%>"/>
                        <label>Naziv: </label> <input type="text" name="naziv" value="<%=pr.getNaziv()%>" /><br>
                        <label>Slika: </label> <input type="file" name="slika" value="<%=pr.getSlika()%>"/><br>
                        <label>Opis: </label> <textarea type="text" name="opis"/><%=pr.getOpis()%></textarea><br>
                        <label>Cena: </label> <input type="text" name="cena" value="<%=pr.getCena()%>"/><br>
                        <input type="submit" value="Izmeni"/>
                    </form>
                    </details></a><br>
                    </div><!--end prikazProizvoda--><hr> <% }

                %>
                
               <!--  target="popup" onclick="window.open('izmenaproizvoda.jsp','name','width=1000,height=500')" -->
		
		

		<a href="adminpage.jsp"><b>Povratak na vrh stranice</b></a>

		
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
