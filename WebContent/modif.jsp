<%@page import="java.sql.SQLException"%>
<%@page import="classes.java.Utilisateur"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/ico" href="favicon.ico" />
<title>Modification</title>
</head>
<body>
	<%@include file="testSession.jsp"%>
	<%
		Utilisateur user = new Utilisateur();
		try {
			if (request.getParameter("id") != null) {
				int ident = new Integer(request.getParameter("id"));
				user = new Utilisateur(ident);
				if (user.getPseudo() == null) {
					response.sendRedirect("erreur.jsp");
				}
			} else {
				response.sendRedirect("erreur.jsp");
			}
		} catch (Exception e) {
			response.sendRedirect("erreur.jsp");
		}
	%>
	<form method="post" action="ServletUtilisateur">
		<fieldset
			style="margin-right: auto; margin-left: auto; border: solid 1px black; padding: 20px; width: 350px; color: black; font-family: verdana;">
			<legend style="font-size: 11; font-weight: bold; color: #333399;">Modification</legend>

			<table>
				<tr>
					<td><label for="nom">Pseudo<span class="requis">*&nbsp;</span></label></td>
					<td><input type="text" name="pseudo"
						value="<%=user.getPseudo()%>" placeholder="votre pseudo" /></td>
				</tr>
				<tr>
					<td><label for="nom">Nom<span class="requis">*&nbsp;</span></label></td>
					<td><input type="text" value="<%=user.getNom()%>" name="nom"
						placeholder="votre nom" /></td>
				</tr>
				<tr>
					<td><label for="nom">Prenom<span class="requis">*&nbsp;</span></label></td>
					<td><input type="text" value="<%=user.getPrenom()%>"
						name="prenom" placeholder="votre prénom" /></td>
				</tr>
				<tr>
					<td><label for="nom">Mot de passe<span class="requis">*&nbsp;</span></label></td>
					<td><input type="password" name="motdepasse"
						placeholder="votre mot de passe" /></td>
				</tr>
				<tr>
					<td><label>Langue<span class="requis">&nbsp;</span></label></td>
					<td><input type="text" value="<%=user.getLangue()%>"
						name="langue" placeholder="votre langue" /></td>
				</tr>
				<tr>
					<td><input type="hidden" value="<%=user.getIdentifiant()%>"
						name="id" name="id" /> <input type="hidden" value="modif"
						name="action" name="action" /></td>
					<td align="left"><input type="submit" name="boum"
						value="Modifier" /></td>
				</tr>
			</table>
			<br />

			<%
				String msg = request.getParameter("pouet");

				if (msg != null) {
					if (msg.equals("1")) {
						out.print(
								"<font size=\"2\" color=\"red\">Ce pseudo choisi est déjà présent! Réessayer à nouveau ? </font>");
					} else if (msg.equals("2")) {
						out.print("<font size=\"2\" color=\"green\">Une erreur est survenue!</font>");
					}
				}
			%>
			<a href="affiche.jsp"><input type="button"
				style="font-size: 2; font-weight: bold; cursor: pointer;"
				value="Afficher les users"> </a>
		</fieldset>
	</form>
	<%@include file="pied_page.jsp"%>
</body>
</html>