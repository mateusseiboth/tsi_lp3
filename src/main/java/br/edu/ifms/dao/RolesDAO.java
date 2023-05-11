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
	
	public Roles buscarRolesPorTipo(String tipo) throws SQLException {
        Roles papel = null;
        String sql = "SELECT * FROM papel WHERE tipo_papel LIKE ?";
         
        connect();
         
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, tipo);
         
        ResultSet resultSet = statement.executeQuery();
         
        if (resultSet.next()) {
        	long id = resultSet.getLong("id");
        	String tipoRoles = resultSet.getString("tipo_papel");

			papel = new Roles(id, tipoRoles);
		}
         
        resultSet.close();
        statement.close();
        
        disconnect();
        
        return papel;
    }
	
	public void atribuirRolesUsuario(Roles papel, User usuario) throws SQLException{
		String sql = "INSERT INTO usuario_papel (usuario_id, papel_id)"
				+ " VALUES (?, ?)";		    
		
		connect();

		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, usuario.getId());
		statement.setLong(2, papel.getId());
		
		statement.executeUpdate();
		statement.close();

		disconnect();
	}
}
