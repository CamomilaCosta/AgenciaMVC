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

import br.com.agencia.dao.HoteisDAO;
import br.com.agencia.dao.PacotesDAO;
import br.com.agencia.dao.VoosDAO;
import br.com.agencia.model.Hoteis;
import br.com.agencia.model.Pacotes;
import br.com.agencia.model.Voos;

@WebServlet(urlPatterns = { "/Pacotes","/AdicionarGetPacote", "/AdicionarPacote", "/EditarPacote", "/AtualizarPacote",
		"/DeletarPacote" })
public class PacotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	PacotesDAO pdao = new PacotesDAO();
	VoosDAO vdao = new VoosDAO();
	HoteisDAO hdao = new HoteisDAO();
	
	Pacotes pacote = new Pacotes();
	Voos voos = new Voos();
	Hoteis hoteis = new Hoteis();

	public PacotesServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		switch (action) {
		case "/Pacotes":
			list(request, response);
			break;
		case "/DeletarPacote":
			delete(request, response);
			break;
		case "/AdicionarPacote":
			create(request, response);
			break;
		case "/AdicionarGetPacote":
			getCreate(request, response);
			break;
//		case "/EditarPacote":
//			edit(request, response);
//			break;
//		case "/AtualizarPacote":
//			update(request, response);
//			break;
		default:
			response.sendRedirect("index.html");
			break;
		}
	}

	protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Pacotes> pacotes = new ArrayList<Pacotes>();

		pacotes = pdao.read();
		request.setAttribute("listapacotes", pacotes);

		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/pacotes/listar.jsp");
		dispatcher.forward(request, response);
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		pdao.delete(id);

		response.sendRedirect("Pacotes");
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int voo_ida = Integer.parseInt(request.getParameter("id_voo_ida"));	
		int voo_volta = Integer.parseInt(request.getParameter("id_voo_volta"));
		int hotel = Integer.parseInt(request.getParameter("id_hotel"));	
		
		pacote.setDestino(request.getParameter("cidade_destino"));
		pacote.setOrigem(request.getParameter("cidade_origem"));
		pacote.setData_ida(Date.valueOf(request.getParameter("data_ida")));
		pacote.setData_volta(Date.valueOf(request.getParameter("data_volta")));
		pacote.setVoo_ida(vdao.readByID(voo_ida));
		pacote.setVoo_volta(vdao.readByID(voo_volta));
		pacote.setHotel(hdao.readByID(hotel));

		pdao.create(pacote);
		response.sendRedirect("Pacotes");
	}

	protected void getCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Voos> listavoos = vdao.read();
		List<Hoteis> listahoteis = hdao.read();

		request.setAttribute("listavoos", listavoos);
		request.setAttribute("listahoteis", listahoteis);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/pacotes/adicionar.jsp");
		dispatcher.forward(request, response);
	}
	/*protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		pacote = vdao.readByID(id);

		request.setAttribute("pacote", pacote);
		RequestDispatcher dispatcher = request.getRequestDispatcher("./admin/pacotes/editar.jsp");
		dispatcher.forward(request, response);
	}*/

//	protected void update(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		pacote.setId(Integer.parseInt(request.getParameter("id")));
//		pacote.setEmpresa(request.getParameter("empresa"));
//		pacote.setCidade_origem(request.getParameter("cidade_origem"));
//		pacote.setCidade_destino(request.getParameter("cidade_destino"));
//		pacote.setAeroporto_decolagem(request.getParameter("aeroporto_decolagem"));
//		pacote.setAeroporto_pouso(request.getParameter("aeroporto_pouso"));
//		pacote.setHora_decolagem(request.getParameter("hora_decolagem"));
//		pacote.setHora_pouso(request.getParameter("hora_pouso"));
//		pacote.setDia_decolagem(Date.valueOf(request.getParameter("dia_decolagem")));
//		pacote.setDia_pouso(Date.valueOf(request.getParameter("dia_pouso")));
//		pacote.setPreco(Float.parseFloat(request.getParameter("preco")));
//
//		vdao.update(pacote);
//		response.sendRedirect("Pacotes");
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
