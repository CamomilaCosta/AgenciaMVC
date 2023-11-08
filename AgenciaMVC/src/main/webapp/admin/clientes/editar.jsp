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
	href="${pageContext.request.contextPath}/reset/style/style.css" />

<!-- styles reset admin-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/reset/resetadmin.css" />
<!-- styles clientes-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin/clientes/styles/cliente.css" />

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
						<jsp:param value="active" name="clientes-a" />
					</jsp:include>
					<div class="card-body card-body-add">
						<form action="AtualizarCliente" id="form">
							<h3>Editar Usuário</h3>
							<input type="hidden" id="id" name="id" value="${cliente.id}" />
							<div id="floating-name" class="form-floating">
								<input type="text" id="first-name" name="nome" value="${cliente.nome}"
									class="form-control focus-ring" /> <label
									for="first-name">Nome</label>
							</div>
							<div id="floating-email" class="form-floating">
								<input type="email" id="email" name="email" class="form-control" value="${cliente.email}"
									 /> <label for="last-name">E-mail</label>
							</div>
							<div id="floating-date" class="form-floating">
								<input type="date" id="date" name="date" class="form-control" value="${cliente.datanasc}"
									 /> <label for="date">Data
									de nascimento</label>
							</div>
							<div id="buttons" class="d-flex">
								<input type="submit" value="Atualizar" id="btn-submit" />
								<a id="btn-submit" href="Clientes">Cancelar</a>
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