<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="jstl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Bootstrap CSS v5.2.1 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous" />
<!-- Bootstrap icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />

<!-- styles reset -->
<link rel="stylesheet" type="text/css" href="reset/style/style.css" />

<!-- styles reset admin-->
<link rel="stylesheet" type="text/css" href="admin/reset/resetadmin.css" />
<!-- styles clientes-->
<link rel="stylesheet" type="text/css" href="admin/voos/styles/pacotes.css" />

<title>Painel de administrador</title>
</head>
<body>
	<header>
		<jsp:include page="../components/menu.jsp">
			<jsp:param value="index.html" name="home"/>
			<jsp:param value="about.html" name="about"/>
			<jsp:param value="tours-1.html" name="tours"/>
			<jsp:param value="contact.html" name="contact"/>
			<jsp:param value="Clientes" name="admin"/>
			<jsp:param value="reset/img/logo1.png" name="logo"/>
		</jsp:include>
	</header>
	<main>
		<section id="itens-admin" class="container">
			<div class="cards">
				<div class="card text-center">
					<jsp:include page="../components/menuAdmin.jsp">
						<jsp:param value="Clientes" name="clientes" />
						<jsp:param value="Hoteis" name="hoteis" />
						<jsp:param value="Voos" name="voos" />
						<jsp:param value="Pacotes" name="pacotes" />
						<jsp:param value="Compras" name="compras" />
						<jsp:param value="active" name="pacotes-a" />
					</jsp:include>
					<div class="card-body">
						<a href="AdicionarGetPacote" class="btn btn-criar-cliente mb-4">Novo Pacote</a>
						<table class="table table-responsive table-hover">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Destino</th>
									<th scope="col">Origem</th>
									<th scope="col">Data de ida</th>
									<th scope="col">Data de volta</th>
									<th scope="col">Dias</th>
									<th scope="col">Preço</th>
									<th scope="col">Hotel</th>
									<th scope="col">Voo de ida</th>
									<th scope="col">Voo de volta</th>
									<th scope="col">Ações</th>
								</tr>
							</thead>
							<tbody>
							<jstl:forEach items="${listapacotes}" var="p">
								<tr>
									<td>${p.id}</td>
									<td>${p.destino}</td>
									<td>${p.origem}</td>
									<td>${p.data_ida}</td>
									<td>${p.data_volta}</td>
									<td>${p.dias_pacote}</td>
									<td>${p.preco}</td>
									<td>${p.hotel.nome}</td>
									<td>${p.voo_ida.id}</td>
									<td>${p.voo_volta.id}</td>
									<td>
										<div class="d-flex justify-content-center">
											<a href="EditarPacote?id=${p.id}" ><i class="bi bi-pencil-square text-primary-emphasis fs-5 me-2"></i></a>
											<a href="DeletarPacote?id=${p.id}"
											title="cancelar"
											onclick="return confirm('Deseja excluir o pacote ${p.id}?')"
											>
											<i class="bi bi-trash3 text-danger-emphasis fs-5"></i>
											</a>
										</div>
									</td>
								</tr>
								</jstl:forEach>
							</tbody>
						</table>
					</div>
				</div>


			</div>
		</section>
	</main>

	<!-- Bootstrap JavaScript Libraries -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"
		integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS"
		crossorigin="anonymous"></script>
</body>
</html>