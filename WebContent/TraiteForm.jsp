<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ma page JSP</title>
</head>
<body>
	<%
		String nom = request.getParameter("identifiant");
		String motpasse = request.getParameter("motdepasse");
		if (!(nom.isEmpty() || motpasse.isEmpty())) {
			if (nom.equals("mohamed") && motpasse.equals("azerty")) {
				response.sendRedirect("Bienvenu.jsp");
			} else {
				out.println("Vous n'êtes pas un bon utilisateur !");
			}
		} else {
			//response.sendRedirect("index.jsp");
			out.print("Veuillez entrer votre nom ou mot de passe !");
		}
	%>
</body>
</html>