package classes.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.java.Utilisateur;

/**
 * Servlet implementation class ServletUtilisateur
 */
@WebServlet("/ServletUtilisateur")
public class ServletUtilisateur extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletUtilisateur() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		Utilisateur user = new Utilisateur();

		if (action != null) {
			if (action.equals("connexion")) {
				String pseudo = request.getParameter("pseudo");
				String motpasse = request.getParameter("motdepasse");
				user.setPseudo(pseudo);
				user.setmotpasse(motpasse);
				int idc = user.connect();
				if (idc != -1) {
					HttpSession session = request.getSession();
					session.setAttribute("idc", idc);
					response.sendRedirect("affiche.jsp");
				} else {
					response.sendRedirect("index.jsp?message=1");
				}
			} else if (action.equals("ajout")) {
				String pseudo = request.getParameter("pseudo");
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String permission = request.getParameter("motdepasse");
				String langue = request.getParameter("langue");
				user.setPseudo(pseudo);
				if (!user.verifPseudo()) {

					user = new Utilisateur(pseudo, nom, prenom, permission, langue);
					if (user.update() == 1) {
						response.sendRedirect("ajout.jsp?pouet=3");
					} else {
						response.sendRedirect("ajout.jsp?pouet=2");
					}
				} else {
					response.sendRedirect("ajout.jsp?pouet=1");
				}
			} else if (action.equals("modif")) {
				int id = new Integer(request.getParameter("id"));
				String pseudo = request.getParameter("pseudo");
				String nom = request.getParameter("nom");
				String prenom = request.getParameter("prenom");
				String permission = request.getParameter("motdepasse");
				String langue = request.getParameter("langue");
				user = new Utilisateur(id);
				String oldPseudo = user.getPseudo();
				String oldPasse = user.getMotpasse();
				user.setPseudo(pseudo);
				if (oldPseudo.equals(pseudo) || !user.verifPseudo()) {
					user = new Utilisateur(pseudo, nom, prenom, permission, langue);
					user.setIdentifiant(id);
					if (permission.equals("")) {
						user.setmotpasse(oldPasse);
					}
					if (user.update() == 1) {
						response.sendRedirect("affiche.jsp?pouet=3");
					} else {
						response.sendRedirect("modif.jsp?pouet=2&id=" + id);
					}
				} else {
					response.sendRedirect("modif.jsp?pouet=1&id=" + id);
				}

			} else if (action.equals("supp")) {
				if (request.getSession().getAttribute("idc") != null) {
					int id = new Integer(request.getParameter("idc"));
					user = new Utilisateur(id);
					if (user.delete() == 1) {
						response.sendRedirect("affiche.jsp?pouet=3");
					} else {
						response.sendRedirect("affiche.jsp?pouet=5");
					}
				} else {
					response.sendRedirect("index.jsp");

				}
			} else {
				response.sendRedirect("erreur.jsp");
			}
		}
	}
}
