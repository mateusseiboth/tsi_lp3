package br.edu.ifms.dao;

import java.sql.Connection;
import br.edu.ifms.dao.RolesDAO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.edu.ifms.model.*;
import br.edu.ifms.dao.util.Connect;

public class UserDAO {
	
	RolesDAO rolesDAO = new RolesDAO();
	
	private Connection connection;
	
	private void connect() throws SQLException{
		if (connection == null || connection.isClosed()) {
			connection = Connect.getConexao();
		}
	}
		
		private void disconnect() throws SQLException {
			if (connection != null && !connection.isClosed()) {
				connection.close();
			}
		}
		
		public User insertUser(User user) throws SQLException {
			String sql = "INSERT INTO usuario (nome, cpf, data_nascimento, email, password, login, ativo)"
					+ " VALUES (?, ?, ?, ?, ?, ?, ?)";		    
			
			connect();

			PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			statement.setString(1, user.getName());
			statement.setString(2, user.getCpf());
			long dataNumero = user.getDataNasc().getTime(); 
			Date nascimento = new Date(dataNumero);
			statement.setDate(3, nascimento);
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getPassword());
			statement.setString(6, user.getLogin());
			statement.setBoolean(7, user.isActive());
			
			statement.executeUpdate();
			
			ResultSet resultSet = statement.getGeneratedKeys();
			long id = 0;
			if(resultSet.next())
				id = resultSet.getInt("id");
			statement.close();

			disconnect();
			
			user.setId(id);
			return user;
		}
		
		public List<User> listUsers() throws SQLException {
			
			List<User> userList = new ArrayList<User>();
			String query = "select * from usuario order by id";
			
			connect();
			
			Statement statement = connection.createStatement();
			ResultSet result = statement.executeQuery(query);
			
			while(result.next()) {
				long id = result.getLong("id");
				String name = result.getString("nome");
				String cpf = result.getString("cpf");
				Date birthday = new Date(result.getDate("data_nascimento").getTime());
				String email = result.getString("email");
				String login = result.getString("login");
				String password = result.getString("password");
				boolean active = result.getBoolean("ativo");
				
				User user = new User(name, cpf, birthday, email, password, login, active);
				user.setId(id);
				
				List <Roles> rolesList = rolesDAO.searchRoleByUser(user);
				user.setRoles(rolesList);
				userList.add(user);
				System.out.println(user.getRoles());
			}
			result.close();
			disconnect();
			
			
			return userList;
		}
		
		public boolean removeUser(User user) throws SQLException {
	        String sql = "DELETE FROM usuario where id = ?";
	        
	        connect();
	         
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setLong(1, user.getId());
	         
	        boolean removedLine = statement.executeUpdate() > 0;
	        statement.close();
	        
	        disconnect();
	        
	        return removedLine;     
	   }
		
		public boolean updateUser(User user) throws SQLException {
	        String sql = "update usuario set ativo = NOT ativo where id = ?";
	        
	        connect();
	         
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setLong(1, user.getId());
	         
	        boolean updatedLine = statement.executeUpdate() > 0;
	        
	        statement.close();
	        
	        disconnect();
	        
	        return updatedLine;     
	   }
		
		public User editUserWithoutPass(User user) throws SQLException {
			String sql = "update usuario set nome=?, cpf=?, data_nascimento=?, email=?, login=?"
					+ " where id=?";		    
			
			connect();

			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, user.getName());
			statement.setString(2, user.getCpf());
			long dataNumero = user.getDataNasc().getTime(); 
			Date nascimento = new Date(dataNumero);
			statement.setDate(3, nascimento);
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getLogin());
			statement.setLong(6, user.getId());
			statement.executeUpdate();
			disconnect();
			
			return user;
	   }
		
		public User editUser(User user) throws SQLException {
			String sql = "update usuario set nome=?, cpf=?, data_nascimento=?, email=?, login=?, password=?"
					+ " where id=?";		    
			
			connect();

			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, user.getName());
			statement.setString(2, user.getCpf());
			long dataNumero = user.getDataNasc().getTime(); 
			Date nascimento = new Date(dataNumero);
			statement.setDate(3, nascimento);
			statement.setString(4, user.getEmail());
			statement.setString(5, user.getLogin());
			statement.setString(6, user.getPassword());
			statement.setLong(7, user.getId());
			statement.executeUpdate();
			disconnect();
			
			return user;
	   }



		public User searchUsername(String login) throws SQLException{
			User user = new User();
			RolesDAO papelDAO = new RolesDAO();
	        User usuario = null;
	        String sql = "SELECT * FROM usuario WHERE login = ?";
	         
	        connect();
	         
	        PreparedStatement statement = connection.prepareStatement(sql);
	        statement.setString(1, login);
	         
	        ResultSet resultSet = statement.executeQuery();
	         
	        if (resultSet.next()) {
	        	long id = resultSet.getLong("id");
	        	String nome = resultSet.getString("nome");
				String cpf = resultSet.getString("cpf");
				Date nascimento = new Date(resultSet.getDate("data_nascimento").getTime());
				String email = resultSet.getString("email");
				String password = resultSet.getString("password");
				boolean ativo = resultSet.getBoolean("ativo");

				usuario = new User(nome, cpf, nascimento, email, password, login, ativo);
				usuario.setId(id);			
				List<Roles> papeisUsuario = papelDAO.searchRoleByUser(usuario);
				usuario.setRoles(papeisUsuario);
			}
	         
	        resultSet.close();
	        statement.close();
	        
	        disconnect();
	       
			return usuario;
			
		}
		


}
