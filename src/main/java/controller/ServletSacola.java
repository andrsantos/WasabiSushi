package controller;

import java.util.ArrayList;
import java.util.List;

import model.Produto;
import model.ProdutoSacola;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Servlet implementation class Autenticacao
 */
public class ServletSacola extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static String url = "jdbc:mysql://localhost:3306/projetowasabi";
    static String usuario = "root";
    static String senha = "andrey12";
    static Connection conexao; 
    static boolean autenticado = false;
    public static List<ProdutoSacola> sacola = new ArrayList<>();
    
    
    
    public static List<ProdutoSacola> getSacola() {
		return sacola;
	}

	public static void setSacola(List<ProdutoSacola> sacola) {
		ServletSacola.sacola = sacola;
	}

	/**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSacola() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    
    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("Iniciando os serviços...");
		try {
	    Class.forName("com.mysql.cj.jdbc.Driver");
		conexao = DriverManager.getConnection(url,usuario,senha);
		conexao.setAutoCommit(false);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*System.out.println("aaaa");
		String produtoSacolaID = request.getParameter("ProdutoSacolaID");
		System.out.println(produtoSacolaID);
		Double produtoSacolaID2 = Double.parseDouble(produtoSacolaID);
		String tipoRequisicao = request.getParameter("TipoRequisicao");
		if(tipoRequisicao.equals("1")) {
		String delete = "DELETE FROM PRODUTOS_SACOLA WHERE ProdutoSacolaID="+produtoSacolaID2;
		try {
	    Statement st = conexao.createStatement();
	    st.execute(delete);
	    conexao.commit();
		} catch(Exception e) {
			
		}
			
		}*/
		String tipoRequisicao = request.getParameter("TipoRequisicao");
		
		
	    if(tipoRequisicao == null) {
	    	System.out.println("requisição NULA!");
	    } else if(tipoRequisicao.equals("1")) {
	    	/* COLOCAR ITEM NA SACOLA */
			/********************************************/
	    	Double id = Math.random();
			String nome = request.getParameter("nome");
			String valor = request.getParameter("valor");
			String ativo = request.getParameter("ativo");
			int ativo2 = Integer.parseInt(ativo);
			String insert = "INSERT INTO PRODUTOS_SACOLA VALUES("+id+","+"'"+valor+"'"+","+"'"+nome+"'" + "," +ativo2+")";
			
			ProdutoSacola produto = new ProdutoSacola(id,nome,valor,ativo2);
			try {
				Statement st = conexao.createStatement();
				st.execute(insert);
				conexao.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			sacola.add(produto);
			sacola.forEach(System.out::println);
			sacola.forEach(item -> {
				if(item.getAtivo() == 1) {
				try {
					response.setContentType("text/html");
					PrintWriter out  = response.getWriter();
					String htmlResponse = "<div class=\"produto\">";

					htmlResponse += "<div class=\"row\">";
					htmlResponse +=        "<div class=\"col-md-12\">" + "<strong>" + "Nome: " + item.getNome() +"</strong>"+ "</div>";
					htmlResponse +=   "</div>";

					htmlResponse += "<div class=\"row\">";
					htmlResponse += "<div class=\"col-md-6\">" + "Valor: " + item.getValor() + "</div>";
					htmlResponse +="<div class=\"col-md-6\">" + "Nome: " + item.getNome() + "</div>";
					htmlResponse += "<div style=\"display:none;\">" + item.getProdutoSacolaId()+"</div>";
					htmlResponse += "</div>";

					htmlResponse +="<div class=\"row\">";
					htmlResponse += "<div class=\"col-md-6\">" + "</div>";
					htmlResponse += "<div class=\"col-md-6\">" + "<input class=\"btn btn-danger\" value=\"Remover\" id=" + item.getProdutoSacolaId() +" onclick=\"deletar(id)\">" + "</div>";
					htmlResponse += "<input type=\"hidden\" name=" + item.getProdutoSacolaId() + ">";
					htmlResponse += "</div>";
					htmlResponse += "</div>";
					
					out.println(htmlResponse);
					
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
				
				
				
				
				
				}});
			
		
		
	  	
	    	
	    }
	    
	    else if(tipoRequisicao.equals("2")) {
	    /* DELETAR ITEM DA SACOLA */
		/********************************************/
	    System.out.println("Requisição válida -> prosseguir! Tipo: " + tipoRequisicao);	
	    try {
	    String produtoSacolaID = request.getParameter("ProdutoSacolaID");
	    String valor = request.getParameter("Valor");
	    Double produtoSacolaID2 = Double.parseDouble(produtoSacolaID);	
	    System.out.println(produtoSacolaID2);
	    String delete = "delete from produtos_sacola where ProdutoSacolaID="+produtoSacolaID2;
	    Statement st = conexao.createStatement();
	    st.execute(delete);
	    for( int i = 0; i < sacola.size(); i++) {
	    	if(sacola.get(i).getProdutoSacolaId() == produtoSacolaID2) {
	    		System.out.println("Removido da Sacola com sucesso!");
	    		sacola.remove(i);
	    	}
	    }
	    conexao.commit();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	    	
	    	
	    }  
	}	
	/*FUNÇÃO DE AUTENTICAÇÃO*/
	protected boolean autenticacao(String cpf, String senha) {
	String consulta = "SELECT * FROM LOGIN2 where cpf='"+cpf+"'";
	Statement st;
	
	try {
		st = conexao.createStatement();
		ResultSet rs = st.executeQuery(consulta);
		if(rs.next()) {
			return true;
		} else {
			return false;
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
	return false;
	
	
	}
}

