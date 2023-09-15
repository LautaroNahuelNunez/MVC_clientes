<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!--Libreria jstl core-->
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- Libreria de formatos -->
<fmt:setLocale value="es_AR"/>


<section id="clientes">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Listado de clientes</h4>
                    </div>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>E-mail</th>
                                <th>Teléfono</th>
                                <th>Saldo</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Iteramos cada elemento de la lista de clientes -->
                            
                            <c:forEach var="cliente" items="${clientes}"> <!-- items es la lista a iterar, la buscamos en el servlet -->
                            
                            <tr>
                                <td>${cliente.idCliente}</td>
                                <td>${cliente.nombre}</td>
                                <td>${cliente.apellido}</td>
                                <td>${cliente.email}</td>
                                <td>${cliente.telefono}</td>
                                <td> <fmt:formatNumber value="${cliente.saldo}" type="currency"/></td> <!-- currency es tipo moneda -->
                                <td>
                                    <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idCliente=${cliente.idCliente}" class="btn btn-secondary">
                                        <i class="fas fa-angle-double-right"></i>Editar
                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>            
        </div>        
    </div>
</section>