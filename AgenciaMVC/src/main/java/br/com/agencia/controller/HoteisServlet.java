package br.com.agencia.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.agencia.dao.HoteisDAO;
import br.com.agencia.model.Hoteis;

@WebServlet(urlPatterns = { "/Hoteis", "/AdicionarHotel", "/EditarHotel", "/AtualizarHotel",
		"/DeletarHotel" })
public class HoteisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HoteisDAO hdao = new HoteisDAO();
	Hoteis hotel = new Hoteis();

	public HoteisServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		switch (action) {
		case "/Hoteis":
			list(request, response);
			break;
		case "/DeletarHotel":
			delete(request, response);
			break;
		case "/AdicionarHotel":
			create(request, response);
			break;
		case "/EditarHotel":
			edit(request, response);
			break;
		case "/AtualizarHotel":
			update(request, response);
			break;
		default:
			response.sendRedirect("index.html");
			break;
		}
	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Hoteis> hoteis = new ArrayList<Hoteis>();

		hoteis = hdao.read();
		request.setAttribute("listahoteis", hoteis);

		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/hoteis/listar.jsp");
		dispatcher.forward(request, response);
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		hdao.delete(id);

		response.sendRedirect("Hoteis");
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		hotel.setNome(request.getParameter("nome"));
		hotel.setPreco_diaria(Float.parseFloat(request.getParameter("preco")));
		hotel.setCidade(request.getParameter("cidade"));
		hotel.setBairro(request.getParameter("bairro"));
		hotel.setRua(request.getParameter("rua"));

		hdao.create(hotel);
		response.sendRedirect("Hoteis");
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		hotel = hdao.readByID(id);

		request.setAttribute("hotel", hotel);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/hoteis/editar.jsp");
		dispatcher.forward(request, response);
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		hotel.setId(Integer.parseInt(request.getParameter("id")));
		hotel.setNome(request.getParameter("nome"));
		hotel.setPreco_diaria(Float.parseFloat(request.getParameter("preco")));
		hotel.setCidade(request.getParameter("cidade"));
		hotel.setBairro(request.getParameter("bairro"));
		hotel.setRua(request.getParameter("rua"));

		hdao.update(hotel);
		response.sendRedirect("Hoteis");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
