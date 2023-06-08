package br.edu.ifms.security;

import br.edu.ifms.model.User;

public class UserDetails {
	
	private User user;

	public UserDetails(User user) {
		this.user = user;		
	}
	
	public boolean isAtivo() {
		return user.isActive();
	}
	
	public String getNome() {
		return user.getName();
	}
	

}
