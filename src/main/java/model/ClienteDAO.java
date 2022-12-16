package model;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ClienteDAO {
	static String url = "jdbc:mysql://localhost:3306/projetowasabi";
	static String usuario = "root";
	static String senha = "andrey12";
	static Connection conexao;
	
	
	public ClienteDAO() {
		
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
	
	public static ArrayList<Cliente> listarClientes() throws ClassNotFoundException, SQLException{
		conectar();
		ArrayList<Cliente> clientes = new ArrayList<>();
		String consulta = "SELECT * FROM CLIENTE";
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery(consulta);
		while(rs.next()) {
			String cpf = rs.getString(1);
			String nome = rs.getString(2);
			String email = rs.getString(3);
			String endereco = rs.getString(4);
			String telefone = rs.getString(5);
			String numeroCartao = rs.getString(6);
			Cliente novoCliente = new Cliente(cpf,nome,email,endereco,telefone,numeroCartao);
			clientes.add(novoCliente);
		}
		return clientes;
		
	}
	

}
