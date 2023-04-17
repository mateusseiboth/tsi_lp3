package br.edu.ifms.controller;

import java.io.IOException;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.controller.util.DataModelling;
import br.edu.ifms.dao.UserDAO;
import br.edu.ifms.dao.util.Connect;
import br.edu.ifms.model.User;

/**
 * Servlet implementation class IndexControle
 */
@WebServlet("/public")
public class IndexControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndexControle() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void init(){
		// TODO Auto-generated method stub
		userDAO = new UserDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		procRequest(request, response);
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		procRequest(request, response);
	}

	private void procRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String acao = request.getParameter("acao");
		try {
			switch (acao) {
			case "novo":
				novoUsuario(request, response);
				break;
			case "insert":
				insertUser(request, response);
				break;
			case "home":
				homeCall(request, response);
			}
			
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	private void novoUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("public/public-newuser.jsp");
		dispatcher.forward(request, response);
	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String name = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String nasc = request.getParameter("nascimento");
		String login = request.getParameter("login");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		DataModelling dataMan = new DataModelling();
		Date new_data = dataMan.converterStringData(nasc);

		User user = new User(name, cpf, new_data, email, password, login, true);
		
		User finalUser = userDAO.insertUser(user);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("public/public-newuser.jsp");
		request.setAttribute("message", "Usuário cadastrado com sucesso");
		dispatcher.forward(request, response);	

	}
	

	private void homeCall(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}
	

}
