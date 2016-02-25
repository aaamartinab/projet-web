function verifInfo() {
	var pseudo = document.getElementById('pseudo').value;
	var nom = document.getElementById('nom').value;
	var prenom = document.getElementById('prenom').value;
	var passe = document.getElementById('motdepasse').value;
	var langue = document.getElementById('langue').value;
	var sms = '';

	if (pseudo == '') {
		sms = '- Veuillez saisir votre pseudo\n';
	}

	if (nom == '') {
		sms += '- Veuillez saisir votre nom\n';
	}

	if (prenom == '') {
		sms += '- Veuillez saisir votre prénom\n';
	}

	if (passe == '') {
		sms += '- Veuillez saisir votre mot de passe\n';
	}

	if (sms != '') {
		alert(sms);
	} else {
		document.formEnreg.submit();
	}
}

function supprime(lien) {
	var rep = confirm('Voulez-vous vraiment supprimer cet utilisateur ?');

	if (rep) {
		location.replace(lien);
	}
}