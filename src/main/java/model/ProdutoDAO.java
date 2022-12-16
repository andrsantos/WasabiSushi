package model;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {
	static String url = "jdbc:mysql://localhost:3306/projetowasabi";
	static String usuario = "root";
	static String senha = "andrey12";
	static Connection conexao;
	
	
	public ProdutoDAO() {
		
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
	
	public static ArrayList<Produto> listarProdutos(int tipo) throws SQLException, ClassNotFoundException {
		conectar();
		if(tipo == 1) {
	    ArrayList<Produto> produtos = new ArrayList<>();
		String consulta = "SELECT * FROM PRODUTO2 WHERE tipoProduto = 1";
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery(consulta);
		while(rs.next()) {
			int id = rs.getInt(1);
			String nome = rs.getString(2);
			Double preco = rs.getDouble(3);
			String descricao = rs.getString(4);
			int tipoProduto = rs.getInt(5);
			String url = rs.getString(6);
			Produto produto = new Produto(id,nome,preco,descricao,tipoProduto,url);
			produtos.add(produto);
			
		}
		return produtos;
		
	} else if(tipo == 2) {
		ArrayList<Produto> produtos = new ArrayList<>();
		String consulta = "SELECT * FROM PRODUTO2 WHERE tipoProduto = 2";
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery(consulta);
		while(rs.next()) {
			int id = rs.getInt(1);
			String nome = rs.getString(2);
			Double preco = rs.getDouble(3);
			String descricao = rs.getString(4);
			int tipoProduto = rs.getInt(5);
			String url = rs.getString(6);
			Produto produto = new Produto(id,nome,preco,descricao,tipoProduto,url);
			produtos.add(produto);
			System.out.println(nome);
			
		}
		return produtos;
	} else if(tipo == 3) {
		ArrayList<Produto> produtos = new ArrayList<>();
		String consulta = "SELECT * FROM PRODUTO2 WHERE tipoProduto = 3";
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery(consulta);
		while(rs.next()) {
			int id = rs.getInt(1);
			String nome = rs.getString(2);
			Double preco = rs.getDouble(3);
			String descricao = rs.getString(4);
			int tipoProduto = rs.getInt(5);
			String url = rs.getString(6);
			Produto produto = new Produto(id,nome,preco,descricao,tipoProduto,url);
			produtos.add(produto);
			
		}
		return produtos;
	} else if (tipo == 4) {
		ArrayList<Produto> produtos = new ArrayList<>();
		String consulta = "SELECT * FROM PRODUTO2 WHERE tipoProduto = 4";
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery(consulta);
		while(rs.next()) {
			int id = rs.getInt(1);
			String nome = rs.getString(2);
			Double preco = rs.getDouble(3);
			String descricao = rs.getString(4);
			int tipoProduto = rs.getInt(5);
			String url = rs.getString(6);
			Produto produto = new Produto(id,nome,preco,descricao,tipoProduto,url);
			produtos.add(produto);
			
		}
		return produtos;
	} else {
		return null
				;
		
	}
	}
	
	
	public static ArrayList<Produto> listAllProdutos() throws SQLException, ClassNotFoundException {
		conectar();
		ArrayList<Produto> produtosAll = new ArrayList<>();
		String consulta = "SELECT * FROM PRODUTO2";
		Statement st = conexao.createStatement();
		ResultSet rs = st.executeQuery(consulta);
		while(rs.next()) {
			int id = rs.getInt(1);
			String nome = rs.getString(2);
			Double preco = rs.getDouble(3);
			String descricao = rs.getString(4);
			int tipoProduto = rs.getInt(5);
			String url = rs.getString(6);
			Produto novoProduto = new Produto(id,nome,preco,descricao,tipoProduto,url);
			produtosAll.add(novoProduto);
		}
		return produtosAll;
	}
}


