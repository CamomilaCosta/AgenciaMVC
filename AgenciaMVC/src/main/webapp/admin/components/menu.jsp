<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="header-nav navbar navbar-expand-lg fixed-top">
	<div class="container">
		<!--Logo-->
		<a class="navbar-brand" href="#"> <img class="logo"
			src="<%=request.getParameter("logo")%>" alt="logo" />
		</a>
		<!--Togle button-->
		<button class="navbar-toggler shadow-none border-0" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#navbarOffcanvasLg"
			aria-controls="navbarOffcanvasLg">
			<i class="bi bi-list fs-1 togle-menu"></i>
		</button>

		<!--Sidebar-->
		<div class="sidebar offcanvas offcanvas-end" tabindex="-1"
			id="navbarOffcanvasLg" aria-labelledby="navbarOffcanvasLgLabel">
			<!--sidebar header-->
			<div class="offcanvas-header">
				<img class="logo" src="<%=request.getParameter("logo")%>" alt="logo" /> <i
					class="bi bi-x-lg fs-1 close-btn" data-bs-dismiss="offcanvas"
					aria-label="Close"></i>
			</div>
			<!--sidebar body-->
			<div class="offcanvas-body">
				<ul class="navbar-nav justify-content-center fs-6 flex-grow-1">
					<li class="nav-item"><a class="nav-link a "
						aria-current="page" href="<%=request.getParameter("home")%>">Início</a></li>
					<li class="nav-item"><a class="nav-link a"
						href="<%=request.getParameter("about")%>">Sobre nós</a></li>
					<li class="nav-item"><a class="nav-link a"
						href="<%=request.getParameter("tours")%>">Pacotes</a></li>
					<li class="nav-item"><a class="nav-link a"
						href="<%=request.getParameter("contact")%>">Contato</a></li>
					<li class="nav-item"><a class="nav-link a active" href="<%=request.getParameter("admin")%>">Painel
							de administrador</a></li>
				</ul>
				<div
					class="social-icons fs-5 d-flex align-items-center justify-content-between">
					<a href=""><i class="social-icon bi bi-whatsapp"></i></a> <a
						href=""><i class="social-icon bi bi-facebook"></i></a> <a href=""><i
						class="social-icon bi bi-instagram"></i></a>
				</div>
			</div>
		</div>
	</div>
</nav>