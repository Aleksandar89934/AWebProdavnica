<%@page import="org.hibernate.Session"%>
<%@page import="model.HibernateUtil"%>
<%@page import="model.Product"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <title>AWeb Prodavnica</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body><%
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
		
		<div id="central">
		<div id="main">
                <%

                Session sesija = HibernateUtil.getSessionFactory().getCurrentSession();

                sesija.beginTransaction();

                List<Product> products = sesija.createCriteria(Product.class).list();
        
                sesija.getTransaction().commit();
                
                %>
		<h1>Proizvodi</h1>
                
                <%
                    for(Product pr : products) { %>
                        <div id="prikazProizvoda">
                        <label>Sifra: </label><%=pr.getId()%><br>
                        <label>Naziv: </label><%=pr.getNaziv()%><br>
                        <img src="productimages/<%=pr.getSlika()%>" alt="Slika ne moze biti ucitana trenutno." width="200" /><br>
                        <label>Opis: </label><%=pr.getOpis()%><br>
                        <label>Cena: </label><%=pr.getCena()%><br>
                        <a href='buyproduct?id=<%=pr.getId()%>&username=<%=session.getAttribute("username")%>&naziv=<%=pr.getNaziv()%>&slika=<%=pr.getSlika()%>&opis=<%=pr.getOpis()%>&cena=<%=pr.getCena()%>' >Kupi</a><br><hr>
                    </div><!--end prikazProizvoda-->
                        <% }
                %>
                
                
                    
                <a href="index.jsp"><b>Povratak na vrh stranice</b></a>
                </div>
               
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
