<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="card-header">
	<ul class="nav nav-tabs card-header-tabs">
		<li class="nav-item"><a class="nav-link <%=request.getParameter("clientes-a")%>"
			aria-current="true" href="<%=request.getParameter("clientes")%>">Clientes</a></li>
		<li class="nav-item"><a class="nav-link <%=request.getParameter("hoteis-a")%>" href="<%=request.getParameter("hoteis")%>">Hoteis</a></li>
		<li class="nav-item"><a class="nav-link <%=request.getParameter("voos-a")%>" href="<%=request.getParameter("voos")%>">Voos</a></li>
		<li class="nav-item"><a class="nav-link <%=request.getParameter("pacotes-a")%>" href="<%=request.getParameter("pacotes")%>">Pacotes</a></li>
		<li class="nav-item"><a class="nav-link <%=request.getParameter("compras-a")%>" href="<%=request.getParameter("compras")%>">Compras</a></li>
	</ul>
</div>