package model;

public class ProdutoSacola {
	
	double produtoSacolaId;
	String nome;
	String valor;
	int ativo;
	public ProdutoSacola(double produtoSacolaId, String nome, String valor, int ativo) {
		super();
		this.produtoSacolaId = produtoSacolaId;
		this.nome = nome;
		this.valor = valor;
		this.ativo = ativo;
	}
	public double getProdutoSacolaId() {
		return produtoSacolaId;
	}
	public void setProdutoSacolaId(double produtoSacolaId) {
		this.produtoSacolaId = produtoSacolaId;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	public int getAtivo() {
		return ativo;
	}
	public void setAtivo(int ativo) {
		this.ativo = ativo;
	}
	
	
	
	
	
}
