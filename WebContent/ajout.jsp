<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enregistrement</title>
</head>
<body bgcolor="#FFF8DC" text="black" link="blue" vlink="#0e0e9a" alink="green">
	<form method="post" id="formEnreg" name="formEnreg"
		action="ServletUtilisateur">
		<fieldset
			style="margin-right: auto; margin-left: auto; border: solid 1px black; padding: 20px; width: 350px; color: midnightblue; font-family: verdana;">
			<legend style="font-size: 11; font-weight: bold; color: #333399;">Enregistrement</legend>
			<table>
				<tr>
					<td><label for="nom">Pseudo<span class="requis">*&nbsp;</span></label></td>
					<td><input type="text" name="pseudo" id="pseudo"
						placeholder="votre identifiant" /></td>
				</tr>
				<tr>
					<td><label for="nom">Nom<span class="requis">*&nbsp;</span></label></td>
					<td><input type="text" id="nom" name="nom"
						placeholder="votre nom" /></td>
				</tr>
				<tr>
					<td><label for="nom">Prénom<span class="requis">*&nbsp;</span></label></td>
					<td><input type="text" name="prenom" id="prenom"
						placeholder="votre prénom" /></td>
				</tr>
				<tr>
					<td><label for="nom">Mot de passe<span class="requis">*&nbsp;</span></label></td>
					<td><input type="password" name="motdepasse" id="motdepasse"
						placeholder="votre mot de passe" /></td>
				</tr>
				<tr>
					<td><label>Langue<span class="requis">&nbsp;</span></label></td>
					<td><input type="text" name="langue" id="langue"
						placeholder="votre langue" /></td>
				</tr>
				<tr>
					<td><input type="hidden" value="ajout" name="action"
						id="action" /></td>
					<td align="left"><input type="button" name="boum"
						onclick="verifInfo();" value="Enregistrer" /></td>
				</tr>
			</table>
			<br />
			<%
				String msg = request.getParameter("pouet");

				if (msg != null) {
					if (msg.equals("3")) {
						out.print("<center><font size=\"2\" color=\"green\">Ajout avec succès!</font></center>");
					} else if (msg.equals("1")) {
						out.print(
								"<center><font size=\"2\" color=\"red\">Ce pseudo est déjà présent!<br/> Réessayer à nouveau ? </font></center>");
					} else if (msg.equals("2")) {
						out.print(
								"<center><font size=\"2\" color=\"red\">Une erreur est surnveue lors de l'enregistrement!</font></center><br/>");
					}
				}
			%>
			<a href="affiche.jsp"><input type="button"
				style="font-size: 2; font-weight: bold; cursor: pointer;"
				value="Retour"> </a>
		</fieldset>
	</form>
	<script src="js/user.js" type="text/javascript"></script>
	<%@include file="pied_page.jsp"%>
</body>
</html>