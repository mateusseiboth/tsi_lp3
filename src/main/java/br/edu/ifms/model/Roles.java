package br.edu.ifms.model;

import java.util.List;

public class Roles {
	
	private Long id;
	
	private String typeRole;
	
	private List<User> users;
	
	public Roles() {
		super();
	}


	public Roles(Long id, String typeRole, List<User> users) {
		super();
		this.id = id;
		this.typeRole = typeRole;
		this.users = users;
	}

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getTypeRole() {
		return typeRole;
	}


	public void setTypeRole(String typeRole) {
		this.typeRole = typeRole;
	}


	public List<User> getUsers() {
		return users;
	}


	public void setUsers(List<User> users) {
		this.users = users;
	}

}
