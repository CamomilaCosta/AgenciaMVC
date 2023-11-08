package br.com.agencia.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.agencia.dao.ClientesDAO;
import br.com.agencia.model.Clientes;

@WebServlet(urlPatterns = { "/Clientes", "/AdicionarCliente", "/EditarCliente", "/AtualizarCliente",
		"/DeletarCliente" })
public class ClientesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ClientesDAO cdao = new ClientesDAO();
	Clientes cliente = new Clientes();

	public ClientesServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		switch (action) {
		case "/Clientes":
			list(request, response);
			break;
		case "/DeletarCliente":
			delete(request, response);
			break;
		case "/AdicionarCliente":
			create(request, response);
			break;
		case "/EditarCliente":
			edit(request, response);
			break;
		case "/AtualizarCliente":
			update(request, response);
			break;
		default:
			response.sendRedirect("index.html");
			break;
		}
	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Clientes> clientes = new ArrayList<Clientes>();

		clientes = cdao.read();
		request.setAttribute("listaclientes", clientes);

		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/clientes/listar.jsp");
		dispatcher.forward(request, response);
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		cdao.delete(id);
		
		response.sendRedirect("Clientes");
	}
	
	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		cliente.setNome(request.getParameter("nome"));
		cliente.setDatanasc(Date.valueOf(request.getParameter("date")));
		cliente.setEmail(request.getParameter("email"));

		
		cdao.create(cliente);
		response.sendRedirect("Clientes");
	}
	
	protected void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		cliente = cdao.readByID(id);
		
		request.setAttribute("cliente", cliente);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/clientes/editar.jsp");
		dispatcher.forward(request, response);
	}
	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		cliente.setId(Integer.parseInt(request.getParameter("id")));
		cliente.setNome(request.getParameter("nome"));
		cliente.setDatanasc(Date.valueOf(request.getParameter("date")));
		cliente.setEmail(request.getParameter("email"));

		
		cdao.update(cliente);
		response.sendRedirect("Clientes");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
