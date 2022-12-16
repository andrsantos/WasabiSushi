package controller;

import jakarta.servlet.ServletException;
/*import jakarta.servlet.annotation.WebServlet;*/
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Produto;
import model.ProdutoDAO;
import model.ProdutoSacola;
import model.ProdutoSacolaDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class ClienteController
 */
public class ClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static String url = "jdbc:mysql://localhost:3306/projetowasabi";
	static String usuario = "root";
	static String senha = "andrey12";
	static Connection conexao;
	HttpSession session;
	
	static public void conectar() throws SQLException {
		
		
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClienteController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	try {
	    	conexao = DriverManager.getConnection(url, usuario, senha);
			conexao.setAutoCommit(false);
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipoformulario = request.getParameter("tipoformulario");
	
		
		if(tipoformulario.equals("cadastro")) {
			
			/* CADASTRO */
			/********************************************/
			String email = request.getParameter("email");
			String nome = request.getParameter("nome");
			String cpf = request.getParameter("cpf").replaceAll("[-.]", "");
			String telefone = request.getParameter("telefone");
			String senha = request.getParameter("senha");
			String endereco = request.getParameter("endereco");
//			String numerocartao = request.getParameter("numerocartao");
			String numerocartao = "1010202030304040";
			
			
			
			try {
				String cliente_sql = "INSERT INTO cliente VALUES ("+cpf+", '"+nome+"','"+email+"', '"+endereco+"','"+telefone+"','"+numerocartao+"')";
				String login_sql = "INSERT INTO loginusuario2 VALUES ("+cpf+", '"+senha+"')";
				System.out.println(login_sql);
				System.out.println(cliente_sql);
				Statement st = conexao.createStatement();
				st.execute(cliente_sql);
				conexao.commit();
				st.execute(login_sql);
				conexao.commit();				
				response.sendRedirect("login.jsp");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.getMessage();
				response.sendRedirect("login.jsp");
			}
			/*********************************************/
			
		} else if (tipoformulario.equals("login")){
			/* LOGIN */
			/********************************************/
			String cpf = request.getParameter("cpf").replaceAll("[-.]", "");
			String senha = request.getParameter("senha");
			
			try {
				Statement st = conexao.createStatement();
				ResultSet rs = st.executeQuery("SELECT * from loginusuario2 WHERE cpf_cliente='"+cpf+"' AND senha='"+senha+"'");
				if(rs.next()) {
					ResultSet rs2 = st.executeQuery("SELECT * from cliente where cpf='"+cpf+"'");
					if(rs2.next()) {
				    String nome = rs2.getString(2);
				    String email = rs2.getString(3);
				    String endereco = rs2.getString(4);
				    String telefone = rs2.getString(5);
				    String numeroCartao = rs2.getString(6);
					session = request.getSession();
					session.setAttribute("cpf", cpf);
					session.setAttribute("nome", nome);
					session.setAttribute("email", email);
					session.setAttribute("endereco", endereco);
					session.setAttribute("endereco", endereco);
					session.setAttribute("telefone", telefone);
					session.setAttribute("numeroCartao", numeroCartao);
					session.setAttribute("login", "true");
					response.sendRedirect("index.jsp");
					}
					
				} else {
					response.sendRedirect("login.jsp");
				System.out.println("Não autenticado!");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} 
		else if(tipoformulario.equals("produtoSacola")) {
			/* SACOLA */
			/********************************************/
			List<ProdutoSacola> sacola = new ArrayList<>();
			ProdutoSacolaDAO dao = new ProdutoSacolaDAO();
			double acumulador = 0;
			try {
				sacola = ProdutoSacolaDAO.listarSacola();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   for(int i = 0; i < sacola.size(); i++) {
			   acumulador = acumulador + Double.parseDouble(sacola.get(i).getNome());
		   }
		   double valorTotal = acumulador;
		   session = request.getSession();
		   session.setAttribute("valorTotal", valorTotal);
			response.sendRedirect("finalizaPedido.jsp");
		} else if (tipoformulario.equals("confirmarpedido")) {
			double id = Math.random();
			String nome = request.getParameter("nomedocliente");
			String cpfDoCliente = request.getParameter("cpfdocliente");
			
			try {
				String insert1 = "INSERT INTO pedido VALUES ("+id+"," + "'"+cpfDoCliente+"'" + "," + "'"+nome+"'"+")";
				Statement st = conexao.createStatement();
				st.execute(insert1);				
				conexao.commit();
				System.out.println("Pedido feito com sucesso!");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.getMessage();
				response.sendRedirect("finalizaPedido.jsp");
			}
			   List<Produto> produtosComprados = new ArrayList<>();
		       List<ProdutoSacola> sacola = new ArrayList<>();
		       ProdutoSacolaDAO dao = new ProdutoSacolaDAO();
		       try {
				sacola = ProdutoSacolaDAO.listarSacola();
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		       List<Produto> produtos = new ArrayList<>();
		       ProdutoDAO dao2 = new ProdutoDAO();
		       try {
				produtos = ProdutoDAO.listAllProdutos();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		       
		       for(int j = 0; j < sacola.size(); j++){   
		       for(int i = 0; i < produtos.size(); i++){
		       String nomeSacola = sacola.get(j).getValor();
		       String nomeProduto = produtos.get(i).getNome();
		       if(nomeSacola.equals(nomeProduto)){
		    	   
		    	   produtosComprados.add(produtos.get(i));
		       }
		    	  
		       }
		       }
			int registroAtivo = 0;
			for(Produto p: produtosComprados) {
				Double id2 = Math.random();
				String insert = "INSERT INTO itens_do_pedido values(" + id2 + "," + id + "," + p.getId()+ " )";
				Statement st;
				try {
					st = conexao.createStatement();
					st.execute(insert);
					conexao.commit();
					
					System.out.println("Itens inseridos na itens_do_pedido");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			String desativa = "UPDATE produtos_sacola SET ativo = 0 where ativo = 1";
			try {
				Statement st = conexao.createStatement();
				st.execute(desativa);
				conexao.commit();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ServletSacola.sacola.clear();
			
			response.setContentType("text/html");
			PrintWriter out  = response.getWriter();
			out.println("Seu pedido foi realizado com sucesso!");
			response.sendRedirect("index.jsp");
			
			
		} else if (tipoformulario.equals("alterar")) {
			/* ALTERAR DADOS DO CLIENTE */
			/********************************************/
			String cpf = request.getParameter("cpf").replaceAll("[-.]", "");
			String nome = request.getParameter("nome");
			String email = request.getParameter("email");
			String endereco = request.getParameter("endereco");
			String telefone = request.getParameter("telefone");
			String numeroCartao = request.getParameter("numerodecartao");
			
		    try {
		    	String update = "UPDATE cliente SET nome=" + "'" + nome + "'" + "," + "email=" + "'" + email + "'" + "," +"telefone="+ "'" + telefone + "'" + "," + "numeroCartao=" + "'" + numeroCartao + "'" + " WHERE cpf="+ "'" + cpf + "'";
		    	System.out.println(update);
				Statement st = conexao.createStatement();
				st.execute(update);
				conexao.commit();
				session = request.getSession();
				session.setAttribute("cpf", cpf);
				session.setAttribute("nome", nome);
				session.setAttribute("email", email);
				session.setAttribute("endereco", endereco);
				session.setAttribute("telefone", telefone);
				session.setAttribute("numeroCartao", numeroCartao);
				response.sendRedirect("index.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}

}
