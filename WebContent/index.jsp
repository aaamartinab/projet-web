<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Page d'accueil</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/ico" href="favicon.ico" />
</head>
<!-- background="zhd.jpg"  -->
<body
	style="margin: 0; padding: 0; background: url(zhd.jpg) no-repeat center fixed; -webkit-background-size: cover; background-size: cover;"
	bgcolor="#FFF8DC" text="black" link="blue" vlink="#0e0e9a"
	alink="green">
	<%
		request.getSession().invalidate();
	%>
	<table style="width: 100%; border: none;">
		<tr bgcolor="#3333CC">
			<td style="color: #ffffff;"><b>Accueil</b></td>
		</tr>
		<tr>
			<td align="center">
				<%
					String ok = request.getParameter("truc");
					if (ok != null && ok.equals("ar")) {
						out.print("<b background-color=\"#33CC66\">Merci pour votre visite !</b>");
					}
				%>
			</td>
		</tr>
	</table>
	<br />
	<form method="post" action="ServletUtilisateur">
		<fieldset
			style="margin-right: auto; margin-left: auto; border: solid 1px black; padding: 20px; width: 350px; color: midnightblue; font-family: verdana;">
			<legend style="font-size: 11; font-weight: bold; color: #333399;">Login
				in</legend>
			<table id="t1">
				<tr>
					<td><label for="nom">Pseudo<span class="requis">*&nbsp;</span></label></td>
					<td><input type="text" id="pseudo" name="pseudo" /></td>
				</tr>
				<tr>
					<td><label>Mot de passe<span class="requis">*&nbsp;</span></label></td>
					<td><input type="password" id="motdepasse" name="motdepasse" /></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="right"><input type="submit" name="boum"
						value="connexion" /> <input type="hidden" name="action"
						id="action" value="connexion" /></td>
				</tr>
			</table>
			<%
				String nom = request.getParameter("message");

				if (nom != null && nom.equals("1")) {
					out.print("<center><font size=\"2\" color=\"red\">Pseudo ou mot de passe erroné !</font></center>");
				}
			%>
			<br /> <a href="ajout.jsp"><input type="button"
				style="font-size: 2; font-weight: bold; cursor: pointer;"
				value="Créer un nouveau"></a>
		</fieldset>
	</form>
	<%@include file="pied_page.jsp"%>
</body>
</html>