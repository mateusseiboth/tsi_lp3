package br.edu.ifms.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

import br.edu.ifms.controller.i18n.I18nUtil;
import br.edu.ifms.dao.UserDAO;
import br.edu.ifms.model.User;
import br.edu.ifms.security.Crypt;
import br.edu.ifms.security.UserDetails;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private UserDAO usuarioDAO;

	public void init() {
		usuarioDAO = new UserDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processarRequisicao(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processarRequisicao(request, response);
	}
	
	private void processarRequisicao(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("acao");

		try {
			switch (action) {
			case "login":
				login(request, response);
				break;
			case "formLogin":
				formLogin(request, response);
				break;
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}

	}

	private void formLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("public/login.jsp");
		dispatcher.forward(request, response);		
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, NoSuchAlgorithmException {
		String username = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		User usuario = usuarioDAO.searchUsername(username);
		String path = "";
		
		Locale locale = (Locale) Config.get(request.getSession(), Config.FMT_LOCALE);
				
		
		if (usuario != null && usuario.isActive()) { // login válido
			
			boolean comparacao = Crypt.passwordCheck(senha, usuario.getPassword());
			
			if(comparacao){ // senha válida
				
				UserDetails detalheUsuario = new UserDetails(usuario);
				
				HttpSession session = request.getSession();
				session.setAttribute("usuarioLogado", detalheUsuario);
				path = "index.jsp";
				
			} else { // senha inválida ou não ativo
				path = "public/login.jsp";				
				//String texto = I18nUtil.getMensagem(locale, "publica-login-invalido");
				request.setAttribute("mensagem", "Invalid username or password");
			}
		} else {
			path = "public/login.jsp";
			//String texto = I18nUtil.getMensagem(locale, "publica-login-invalido");
			request.setAttribute("mensagem", "Invalid username or password");			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}	

}
