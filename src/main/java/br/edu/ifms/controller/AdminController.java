package br.edu.ifms.controller;
import java.io.IOException;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.dao.RolesDAO;
import br.edu.ifms.dao.UserDAO;
import br.edu.ifms.model.Roles;
import br.edu.ifms.model.User;

/**
 * Servlet implementation class IndexControle
 */
@WebServlet("/auth/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private RolesDAO rolesDAO;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminController() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void init(){
		// TODO Auto-generated method stub
		userDAO = new UserDAO();
		rolesDAO = new RolesDAO();
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
			case "listar":
				listUser(request, response);
				break;
			case "deletar":
				deleteUser(request, response);
				break;
			case "alterar":
				updateUser(request, response);
				break;
			case "editar":
				editUser(request, response);
				break;
			case "changeRole":
				System.out.println("Em update");
				updateUserRole(request, response);
				break;
	
			}
			
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	
	private void listUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException{
		List<User> users = userDAO.listUsers();
		List<Roles> roles = rolesDAO.listAll();
		
		request.setAttribute("listUser", users);
		request.setAttribute("listRoles", roles);
		RequestDispatcher dispatcher = request.getRequestDispatcher(request.getServletPath() + "/admin-list-user.jsp");
		
		dispatcher.forward(request, response);
		
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException{
		long id = Long.parseLong(request.getParameter("id"));
		User user = new User();
		user.setId(id);
		userDAO.removeUser(user);
		String path = request.getContextPath() + request.getServletPath() + "?acao=listar";
		response.sendRedirect(path);
		
		
	}
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException{
		long id = Long.parseLong(request.getParameter("id"));
		
		User user = new User();
		user.setId(id);
		userDAO.updateUser(user);
		String path = request.getContextPath() + request.getServletPath() + "?acao=listar";
		response.sendRedirect(path);
		
		
	}
	
	private void updateUserRole(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException{
		long id = Long.parseLong(request.getParameter("idUpdate"));
		String[] roles = request.getParameterValues("checkboxRole");
		System.out.println(roles);
//		User user = new User();
//		user.setId(id);
//		userDAO.updateUser(user);
		String path = request.getContextPath() + request.getServletPath() + "?acao=listar";
		response.sendRedirect(path);
		
		
	}
	
	private void editUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		String id1 = request.getParameter("id");
		Long id = Long.parseLong(id1);
		String name = request.getParameter("nome");
		String cpf = request.getParameter("cpf");
		String nasc = request.getParameter("nascimento");
		String login = request.getParameter("login");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		if (password == "") {
			Instant new_data = LocalDate.parse(nasc).atStartOfDay().toInstant(ZoneOffset.UTC);
			Date real = Date.from(new_data);
			
			User user = new User(name, cpf, real, email, login, true);
			user.setId(id);
			User finalUser = userDAO.editUserWithoutPass(user);
		} else {

			Instant new_data = LocalDate.parse(nasc).atStartOfDay().toInstant(ZoneOffset.UTC);
			Date real = Date.from(new_data);

			User user = new User(name, cpf, real, email, password, login, true);
			user.setId(id);
			User finalUser = userDAO.editUser(user);
		}
		String path = request.getContextPath() + request.getServletPath() + "?acao=listar";
		response.sendRedirect(path);
	}
	

}
