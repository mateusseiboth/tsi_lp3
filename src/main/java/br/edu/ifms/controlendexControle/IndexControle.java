package br.edu.ifms.controlendexControle;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifms.dao.util.Conexao;

/**
 * Servlet implementation class IndexControle
 */
@WebServlet("/public")
public class IndexControle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexControle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		procRequest(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		procRequest(request, response);
	}
	
	private void procRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acao = request.getParameter("acao");
		try {
			switch (acao) {
			case "novo":
				novoUsuario(request, response);
				break;
			case "home":
				homeCall(request, response);
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	private void novoUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*
		Connection x = Conexao.getConexao();
		
		if(x != null) {
			System.out.println("Conexão aberta");
		} else 
			System.out.println("Conexão não aberta");
		*/
		RequestDispatcher dispatcher = request.getRequestDispatcher("public/public-newuser.jsp");
		dispatcher.forward(request, response);
	}
	
	private void homeCall(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}
	

}
