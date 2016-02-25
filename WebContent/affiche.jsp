<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="classes.java.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" type="image/ico" href="favicon.ico" />
<title>Vieu users</title>
</head>
<body bgcolor="#FFFAFA">
	<%@include file="testSession.jsp"%>
	<h1>Administrateurs</h1>
	<hr align="left" style="width: 200px\" />
	<%
		Utilisateur conn = null;
		String info = "";
		if (session.getAttribute("idc") != null) {
			int idc = new Integer(session.getAttribute("idc").toString());
			conn = new Utilisateur(idc);
			info = "Bienvenue " + conn.getNom() + " " + conn.getPrenom();
		}
		String search = request.getParameter("search");
	%>

	<table style="width: 100%; border: none;">
		<tr style="background-color: #003399;">
			<td align="left" style="color: #FFFFFF;">
				<div style="float: left;">
					<b><%=info%></b>
				</div>
				<div style="float: right;">
					<a href="index.jsp?truc=ar"><input type="button"
						style="font-weight: bold; cursor: pointer;" value="Déconnexion" /></a>
				</div>
			</td>
		</tr>
	</table>
	<br />
	<br />
	<%
		Utilisateur u1 = new Utilisateur();
		List<Utilisateur> users = u1.getAllUser(search);
	%>
	<fieldset
		style="border: solid 1px black; padding: 20px; width: 350px; color: black; font-family: verdana;">
		<legend style="font-size: 11; font-weight: bold; color: #333399;">Administrateurs
			enregistrés</legend>
		<br />
		<%
			String rep = request.getParameter("pouet");
			if (rep != null && rep.equals("3")) {
		%>
		<em style="color: green;">Mise à jour effecutée avec succès...</em>
		<%
			}
			if (rep != null && rep.equals("5")) {
		%>
		<em style="color: red;">Une erreur est survenue lors de la
			suppression!</em>
		<%
			}
		%>
		<form method="post">
			<table style="width: 80%;">
				<tr>
					<td>Nom : <input size="15" <%if (search != null) {%>
						value="<%=search%>" <%}%> type="text" name="search" id="search" />
						<input type="submit" name="sendr" id="sendr" value="Search" />
					</td>
				</tr>
			</table>
		</form>
		<br />
		<table style="width: 600px;">
			<tr bgcolor="#A0BBBB">
				<td><label>Pseudo</label></td>
				<td><label>Nom</label></td>
				<td><label>Prénom</label></td>
				<td><label>Langue</label></td>
				<td bgcolor="#38C7CC">Options<label></label></td>
			<tr>

				<%
					if (users != null) {

						for (Utilisateur u : users) {
				%>
			
			<tr>
				<td><label><%=u.getPseudo()%></label></td>
				<td><label><%=u.getNom()%></label></td>
				<td><label><%=u.getPrenom()%></label></td>
				<td><label><%=u.getLangue()%></label></td>
				<td><a style="text-decoration: none;"
					href="modif.jsp?id=<%=u.getIdentifiant()%>"><img width="25"
						height="25" src="update_icone.png"></a> <%
 	if (conn != null && conn.getIdentifiant() != u.getIdentifiant()) {
 %><a style="text-decoration: none;"
					onclick="supprime('ServletUtilisateur?action=supp&id=<%=u.getIdentifiant()%>');"
					href="#"><img width="25" height="25" src="delete_icone.png"></a>
					<%
						}
					%></td>
			<tr>
				<%
					}
					} else {
				%>
			
			<tr>
				<td align="center" colspan="5">Aucun utilisateur enregistré !</td>
				<%
					}
				%>
			
		</table>
		<br /> <a style="text-decoration: none;" href="ajout.jsp"><img
			width="25" height="25" src="insert_icone.png"> Ajouter</a>
	</fieldset>
	<%@include file="pied_page.jsp"%>
	<script src="js/user.js" type="text/javascript"></script>
</body>
</html>