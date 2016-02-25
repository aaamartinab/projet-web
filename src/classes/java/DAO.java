package classes.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO {

	public Connection conn = null;

	public Statement OpenDB() {

		Statement st = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection("jdbc:mysql://localhost/basetd-tp", "root", "");
			st = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

		} catch (ClassNotFoundException e) {
			System.out.println("erreur");
		} catch (SQLException e) {
			System.out.println("autre");
			e.printStackTrace();
		}
		return st;
	}

	public void CloseDB() throws ClassNotFoundException, SQLException {
		if (conn != null) {
			conn.close();
		}
	}

	public ResultSet getData(String query) {
		try {
			ResultSet rs = this.OpenDB().executeQuery(query);
			rs.last();
			rs.getString(2);
			rs.beforeFirst();
			return rs;
		} catch (Exception e) {
			return null;
		}
	}

	public int updateData(String query) {
		try {
			return this.OpenDB().executeUpdate(query);
		} catch (Exception e) {
			return -1;
		}
	}

}
