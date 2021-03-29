<%-- 
    Document   : kupci
    Created on : Oct 11, 2020, 5:09:34 PM
    Author     : Fix
--%>

<%@page import="model.Kredit"%>
<%@page import="org.hibernate.Session"%>
<%@page import="model.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kupci</title>
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
		<h1>Kupci</h1>
		<%

                Session sesija = HibernateUtil.getSessionFactory().getCurrentSession();

                sesija.beginTransaction();

                List<User> users = sesija.createCriteria(User.class).list();
        
                sesija.getTransaction().commit();


                %>
                <%

                Session sk = HibernateUtil.getSessionFactory().getCurrentSession();

                sk.beginTransaction();

                List<Kredit> kr = sk.createCriteria(Kredit.class).list();
        
                sk.getTransaction().commit();


                %>
                <div id="dopunaKredita">
                    <%
                    for(Kredit kre : kr) { %>
                    <p>Kupac sa korisnickim imenom <%= kre.getUsername()%> zeli da dopuni kredit iznosom od <%= kre.getAmount()%> dinara. <a href="odobrenkredit?username=<%= kre.getUsername()%>&amount=<%= kre.getAmount()%>&id=<%=kre.getId()%>">Odobri</a> ili <a href="odbijenkredit?id=<%=kre.getId()%>">Odbij zahtev</a> <hr></p>
                    
                    <% }
                    %>
                    
                     
                </div>
                
                
                
                <div id="usersTable">
                <table id="userTable">
                    <tr><th>Id</th> <th>Ime</th> <th>Credit</th> <th>Obrisati</th></tr>
                <%
                    for(User us : users) { %>
                    <tr> <td><%=us.getId()%></td> <td class="left"> <%=us.getUsername()%> </td> <td><%=us.getCredit()%></td> <td><a href='user?id=<%=us.getId()%>' >Obrisati</a></td>  </tr>
                        <% }
                %>
                </table> 
                </div>
		



		<a href="kupci.jsp"><b>Povratak na vrh stranice</b></a>

		
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
