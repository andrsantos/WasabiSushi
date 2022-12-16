package model;

public class Produto {
	private int id;
	private String nome;
	private double preco;
	private String descricao;
	private int tipoProduto;
	private String url;
	public Produto(int id, String nome, double preco, String descricao, int tipoProduto, String url) {
		super();
		this.id = id;
		this.nome = nome;
		this.preco = preco;
		this.descricao = descricao;
		this.tipoProduto = tipoProduto;
		this.url = url;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public int getTipoProduto() {
		return tipoProduto;
	}
	public void setTipoProduto(int tipoProduto) {
		this.tipoProduto = tipoProduto;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	 
	

}
