package br.edu.ifms.dao;

import java.sql.Connection;
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
			String query = "select * from usuario";
			
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
				userList.add(user);
			}
			result.close();
			disconnect();
			
			
			return userList;
		}


}
