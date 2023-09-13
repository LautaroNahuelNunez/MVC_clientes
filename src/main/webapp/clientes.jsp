<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!--Libreria jstl core-->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control de clientes</title>
    </head>
    <body>
        <h1>Control de clientes</h1>
        <ul>
            <c:forEach var="cliente" items="${clientes}"> <!-- recuperamos "clientes" de ServletControlador.jsp-->
                <li>${cliente.idCliente} ${cliente.nombre} ${cliente.apellido} ${cliente.email} ${cliente.telefono} ${cliente.saldo}</li>
            </c:forEach>
        </ul>
    </body>
</html>
