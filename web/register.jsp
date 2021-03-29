<%-- 
    Document   : register
    Created on : Oct 11, 2020, 3:15:32 PM
    Author     : Fix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <div id="wrapper" class="cf">
			<div id="header" class="cf">
			<div id="logo">
				<img src="images/logo.png" alt="Slika trenutno ne može biti učitana.">
			</div>
			<div id="slogan">
				<p>AWeb Prodavnica</p>
			</div>
		</div><!--end #header-->
		
		<div id="central">
			<div id="main">
		<h1>Registracija</h1>
                <div id="login-form">
                <form method="post" action="registerservlet">
                      <input type="text" name="username" placeholder="Username"/>
                      <input type="password" name="password" placeholder="Password"/>
                     
                      <input type="submit" value="Register">
                </form>
                    
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
