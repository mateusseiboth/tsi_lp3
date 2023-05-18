package br.edu.ifms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import br.edu.ifms.dao.util.*;
import br.edu.ifms.model.*;


public class RolesDAO {
	
	private Connection connection;
	
	private void connect() throws SQLException {
		if (connection == null || connection.isClosed()) {
			connection = Connect.getConexao();
		}
	}

	private void disconnect() throws SQLException {
		if (connection != null && !connection.isClosed()) {
			connection.close();
		}
	}
	
	public Roles searchRoleType(String type) throws SQLException {
		System.out.println("Chegada na funcao");
        Roles roles = null;
        System.out.println(type);
        String sql = "SELECT * FROM papel WHERE tipo_papel LIKE ?";
         
        connect();
         
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, type);
         
        ResultSet resultSet = statement.executeQuery();
         
        if (resultSet.next()) {
        	long id = resultSet.getLong("id");
        	String roleType = resultSet.getString("tipo_papel");

        	roles = new Roles(id, roleType);
		}
         
        resultSet.close();
        statement.close();
        
        disconnect();
        
        return roles;
    }
	
	public void linkRoleUser(Roles role, User user) throws SQLException{
		String sql = "INSERT INTO usuario_papel (usuario_id, papel_id)"
				+ " VALUES (?, ?)";		    
		
		connect();

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, user.getId());
		statement.setLong(2, role.getId());
		
		statement.executeUpdate();
		statement.close();

		disconnect();
	}
}
