package model;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JOptionPane;

public class AcessoBD {
	//ADICIONAR OS VALORES AQUI
	static String url = "jdbc:mysql://localhost:3306/projetowasabi";
	static String usuario = "root";
	static String senha = "andrey12";
	static Connection conexao;
	
	public static void conectar() throws SQLException{
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conexao = DriverManager.getConnection(url,usuario,senha);
		conexao.setAutoCommit(false);
	}
	
	/*public static void consultarCliente() throws SQLException {
		
		String consulta = "SELECT * FROM Cliente";
		Statement statement = conexao.createStatement();
		ResultSet rs = statement.executeQuery(consulta);
		while(rs.next()) {
			System.out.println("Nome: " + rs.getString(1));
			System.out.println("CPF: " + rs.getString(2));
			System.out.println("Endereço: " + rs.getString(3));
			System.out.println("Telefone: " + rs.getString(4));
			
			
		}
		
	}*/
	
	public static void mostrarMetaInfoBD() throws SQLException {
		DatabaseMetaData meta = conexao.getMetaData();
		String fabricanteBD = meta.getDatabaseProductName();
		String versaoBD = meta.getDatabaseProductVersion();
		JOptionPane.showMessageDialog(null,"Versão: " + versaoBD + "Fabricante: " + fabricanteBD);
	}
	
	/*public static void main(String[] args) throws ClassNotFoundException {
		try {
			conectar();
			mostrarMetaInfoBD();
			consultarCliente();
			conexao.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}*/

}