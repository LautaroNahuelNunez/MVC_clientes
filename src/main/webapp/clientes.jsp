<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!--Libreria jstl core-->

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"> -->

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/b6865dcde7.js" crossorigin="anonymous"></script>
        
        <title>Control de clientes</title>
    </head>
    <body>
        <h1>Control de clientes</h1>
        <ul>
            <c:forEach var="cliente" items="${clientes}"> <!-- recuperamos "clientes" de ServletControlador.jsp-->
                <li>${cliente.idCliente} ${cliente.nombre} ${cliente.apellido} ${cliente.email} ${cliente.telefono} ${cliente.saldo}</li>
                </c:forEach>
        </ul>
        
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script> 
        
    </body>
</html>
