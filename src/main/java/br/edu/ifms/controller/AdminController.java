package br.edu.ifms.controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.edu.ifms.dao.UserDAO;
import br.edu.ifms.model.User;

/**
 * Servlet implementation class IndexControle
 */
@WebServlet("/auth/admin")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
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
	
			}
			
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	
	private void listUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException{
		List<User> users = userDAO.listUsers();
		request.setAttribute("listUser", users);
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
	

}
