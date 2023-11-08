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

import br.com.agencia.dao.VoosDAO;
import br.com.agencia.model.Voos;

@WebServlet(urlPatterns = { "/Voos", "/AdicionarVoo", "/EditarVoo", "/AtualizarVoo",
		"/DeletarVoo" })
public class VoosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	VoosDAO vdao = new VoosDAO();
	Voos voo = new Voos();

	public VoosServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		switch (action) {
		case "/Voos":
			list(request, response);
			break;
		case "/DeletarVoo":
			delete(request, response);
			break;
		case "/AdicionarVoo":
			create(request, response);
			break;
		case "/EditarVoo":
			edit(request, response);
			break;
		case "/AtualizarVoo":
			update(request, response);
			break;
		default:
			response.sendRedirect("index.html");
			break;
		}
	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Voos> voos = new ArrayList<Voos>();

		voos = vdao.read();
		request.setAttribute("listavoos", voos);

		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/voos/listar.jsp");
		dispatcher.forward(request, response);
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		vdao.delete(id);

		response.sendRedirect("Voos");
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		voo.setEmpresa(request.getParameter("empresa"));
		voo.setCidade_origem(request.getParameter("cidade_origem"));
		voo.setCidade_destino(request.getParameter("cidade_destino"));
		voo.setAeroporto_decolagem(request.getParameter("aeroporto_decolagem"));
		voo.setAeroporto_pouso(request.getParameter("aeroporto_pouso"));
		voo.setHora_decolagem(request.getParameter("hora_decolagem"));
		voo.setHora_pouso(request.getParameter("hora_pouso"));
		voo.setDia_decolagem(Date.valueOf(request.getParameter("dia_decolagem")));
		voo.setDia_pouso(Date.valueOf(request.getParameter("dia_pouso")));
		voo.setPreco(Float.parseFloat(request.getParameter("preco")));

		vdao.create(voo);
		response.sendRedirect("Voos");
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		voo = vdao.readByID(id);

		request.setAttribute("voo", voo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/voos/editar.jsp");
		dispatcher.forward(request, response);
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		voo.setId(Integer.parseInt(request.getParameter("id")));
		voo.setEmpresa(request.getParameter("empresa"));
		voo.setCidade_origem(request.getParameter("cidade_origem"));
		voo.setCidade_destino(request.getParameter("cidade_destino"));
		voo.setAeroporto_decolagem(request.getParameter("aeroporto_decolagem"));
		voo.setAeroporto_pouso(request.getParameter("aeroporto_pouso"));
		voo.setHora_decolagem(request.getParameter("hora_decolagem"));
		voo.setHora_pouso(request.getParameter("hora_pouso"));
		voo.setDia_decolagem(Date.valueOf(request.getParameter("dia_decolagem")));
		voo.setDia_pouso(Date.valueOf(request.getParameter("dia_pouso")));
		voo.setPreco(Float.parseFloat(request.getParameter("preco")));

		vdao.update(voo);
		response.sendRedirect("Voos");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
