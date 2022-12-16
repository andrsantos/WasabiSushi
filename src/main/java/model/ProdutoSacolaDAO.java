package model;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProdutoSacolaDAO {
	static String url = "jdbc:mysql://localhost:3306/projetowasabi";
	static String usuario = "root";
	static String senha = "andrey12";
	static Connection conexao;
	
	
	public ProdutoSacolaDAO() {
		
	}
	
	public static void conectar() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		conexao = DriverManager.getConnection(url,usuario,senha);
		DatabaseMetaData meta = conexao.getMetaData();
		conexao.setAutoCommit(false);
		System.out.println(meta.getDatabaseProductVersion());
	}
	
	public static void desconectar() throws SQLException {
		conexao.close();
	}
	
	public static ArrayList<ProdutoSacola> listarSacola() throws ClassNotFoundException, SQLException{
		conectar();
		ArrayList<ProdutoSacola> sacola = new ArrayList<>();
		int registroAtivo = 1;
		String consulta = "SELECT * FROM PRODUTOS_SACOLA where ativo="+registroAtivo;
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery(consulta);
		while(rs.next()) {
			Double id = rs.getDouble(1);
			String valor = rs.getString(2);
			String nome = rs.getString(3);
		    int ativo = rs.getInt(4);
			ProdutoSacola novoProdutoSacola = new ProdutoSacola(id,valor,nome,ativo);
			sacola.add(novoProdutoSacola);
		}
		return sacola;
		
	}
	

}
