package classes.java;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Utilisateur {
	public DAO db = new DAO();

	// Attributs
	private int identifiant = -1;
	private String pseudo = null;
	private String nom = null;
	private String prenom = null;
	private String motpasse = null;
	private String langue = null;

	// Constructeurs
	public Utilisateur(String pseudo, String nom, String prenom, String motpasse, String langue) {
		this.pseudo = pseudo;
		this.nom = nom;
		this.prenom = prenom;
		this.motpasse = motpasse;
		this.langue = langue;
	}
	
	public Utilisateur(int identif) {
		this.identifiant = identif;
		this.chargeInfo();
	}
	
	public Utilisateur() {
	}

	//Méthodes d'accès
	public int getIdentifiant() {
		return identifiant;
	}

	public void setIdentifiant(int identifiant) {
		this.identifiant = identifiant;
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	public void setMotpasse(String motpasse) {
		this.motpasse = motpasse;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getMotpasse() {
		return motpasse;
	}

	public void setmotpasse(String motpasse) {
		this.motpasse = motpasse;
	}

	public String getLangue() {
		return langue;
	}

	public void setLangue(String langue) {
		this.langue = langue;
	}

	public int connect(){
		String req = "SELECT * FROM users where pseudo= '" + this.getPseudo() + "' and permission='"
				+ this.getMotpasse() + "';";
		try {
			ResultSet rs =this.db.getData(req);
			while (rs.next()) {
				return	rs.getInt(1);		
			}
			return -1;
		} catch (Exception e) {
			return -1;
		}
	}
	
	public int delete() {
		String req = "DELETE FROM users where id= " + this.getIdentifiant();
		return this.db.updateData(req);
	}
	
	public int update() {
		String req = "update users set pseudo='" + this.getPseudo() + "', nom='" + this.getNom() + "',prenom='" + this.getPrenom() 
		+ "',permission='"+ this.getMotpasse() + "', langue='" +
		this.getLangue() + "' where id=" + this.getIdentifiant() ;
		if(this.getIdentifiant()==-1)
		{
			req = "insert into users values (null,'" + this.getPseudo() + "', '" 
					+ this.getNom() + "','" + this.getPrenom() + "','"
					+ this.getMotpasse() + "','" + this.getLangue() + "');";
		}
		return this.db.updateData(req);
	}
	
	public boolean verifPseudo() {
		String req = "SELECT * FROM users where pseudo= '" + this.getPseudo()+"'";
		if (this.db.getData(req) != null) {
			return true;
		} else {
			return false;
		}
	}
	
	protected void chargeInfo() {
		try {
			String req = "SELECT * FROM users where id= " + this.getIdentifiant();
			ResultSet rs = this.db.getData(req);
			while (rs.next()) {
				this.pseudo = rs.getString(2);
				this.nom = rs.getString(3);
				this.prenom = rs.getString(4);
				this.motpasse = rs.getString(5);
				this.langue = rs.getString(6);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Utilisateur> getAllUser(String nom) {
		try {
			
			String req = "SELECT * FROM users ";
			if(nom!=null)
			{
				req += " WHERE nom LIKE '"+nom+"%' ";
			}
			req += " ORDER BY nom";
			ResultSet rs = this.db.getData(req);
			List<Utilisateur> list = new ArrayList<Utilisateur>();
			while (rs.next()) {
				Utilisateur u = new Utilisateur();
				u.setIdentifiant(rs.getInt(1));
				u.setPseudo(rs.getString(2));
				u.setNom(rs.getString(3));
				u.setPrenom(rs.getString(4));
				u.setmotpasse(rs.getString(5));
				u.setLangue(rs.getString(6));
				list.add(u);
			}
			return list;
		} catch (Exception e) {
			return null;
		}
	}

}
