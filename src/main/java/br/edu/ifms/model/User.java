package br.edu.ifms.model;

import java.util.Date;

public class User {

	private Long id;
	private String name;
	private String cpf;
	private Date dataNasc;
	private String email;
	private String password;
	private String login;
	private boolean active;
	
	public User() {
		super();
	}

	public User(String name, String cpf, Date dataNasc, String email, String password, String login, boolean active) {
		super();
		this.name = name;
		this.cpf = cpf;
		this.dataNasc = dataNasc;
		this.email = email;
		this.password = password;
		this.login = login;
		this.active = active;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getDataNasc() {
		return dataNasc;
	}

	public void setDataNasc(Date dataNasc) {
		this.dataNasc = dataNasc;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

}
