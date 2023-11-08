<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
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
<link rel="stylesheet" type="text/css"
	href="reset/style/style.css" />

<!-- styles reset admin-->
<link rel="stylesheet" type="text/css"
	href="admin/reset/resetadmin.css" />
<!-- styles clientes-->
<link rel="stylesheet" type="text/css"
	href="admin/pacotes/styles/pacotes.css" />

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
					<div class="card-body card-body-add">
						<form action="AtualizarPacote" id="form">
							<h3>Editar Pacote</h3>
							<input type="hidden" id="id" name="id" value="${pacote.id}" />
							<div id="floating-Origem" class="form-floating">
								<input type="text" id="cidade_origem" name="cidade_origem"
									class="form-control focus-ring" value="${pacote.origem}" />
								<label for="cidade-origem">Cidade de origem</label>
							</div>
							<div id="floating-Destino" class="form-floating">
								<input type="text" id="cidade_destino" name="cidade_destino"
									class="form-control focus-ring" value="${pacote.destino}" />
								<label for="cidade-destino">Cidade de destino</label>
							</div>
							<div id="floating-dataIda" class="form-floating">
								<input type="date" id="data_ida" name="data_ida"
									class="form-control" value="${pacote.data_ida}" /> <label
									for="data_ida">Data de ida</label>
							</div>
							<div id="floating-dataVolta" class="form-floating">
								<input type="date" id="data_volta" name="data_volta"
									class="form-control" value="${pacote.data_volta}" /> <label
									for="data_volta">Data de volta</label>
							</div>
							<div id="floating-voo-ida" class="form-floating">
								<select id="voo-ida" name="id_voo_ida" class="form-select"
									aria-label="Floating label select example">
									<option value="${voo_ida.id}" selected>${voo_ida.cidade_origem}| ${voo_ida.cidade_destino} | ${voo_ida.dia_decolagem}</option>
									<jstl:forEach items="${listavoos}" var="v">
									<option value="${v.id}">${v.cidade_origem} | ${v.cidade_destino} |${v.dia_decolagem}</option>
									</jstl:forEach>
								</select> <label for="voo-ida">Escolha o voo de ida</label>
							</div>
							<div id="floating-voo-volta" class="form-floating">
								<select id="voo-volta" name="id_voo_volta" class="form-select"
									aria-label="Floating label select example">
									<option value="${voo_volta.id}" selected>${voo_volta.cidade_origem}| ${voo_volta.cidade_destino} | ${voo_volta.dia_decolagem}</option>
									<jstl:forEach items="${listavoos}" var="v">
									<option value="${v.id}">${v.cidade_origem} | ${v.cidade_destino} |${v.dia_decolagem}</option>
									</jstl:forEach>
								</select> <label for="voo-volta">Escolha o voo de volta</label>
							</div>
							<div id="floating-hotel" class="form-floating">
								<select id="hotel" name="id_hotel" class="form-select"
									aria-label="Floating label select example">
									<option value="${hotel.id}" selected>${hotel.nome}</option>
									<jstl:forEach items="${listahoteis}" var="h">
									<option value="${h.id}">${h.nome}</option>
									</jstl:forEach>
								</select> <label for="hotel">Escolha o hotel</label>
							</div>
							<div id="floating-dias" class="form-floating">
								<input type="number" id="dias" name="dias"
									class="form-control" value="${pacote.dias_pacote}" readonly/> <label
									for="dias">Dias do pacote</label>
							</div>
							<div id="floating-preco" class="form-floating">
								<input type="number" id="preco" name="preco"
									class="form-control" value="${pacote.preco}" readonly/> <label
									for="preco">Preço</label>
							</div>
							<div id="buttons" class="d-flex">
								<input type="submit" value="Atualizar" id="btn-submit" />
								<a id="btn-submit" href="Pacotes">Cancelar</a>
							</div>
						</form>

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