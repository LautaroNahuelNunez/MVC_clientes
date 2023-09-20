<!-- BOTONES DE NAVEGACION EDICION-->
<section id="actions" class="py-4" mb-4 bg-light> <!-- p de padding, y de top y bottom, 4 es el size (1.5); mb es margin bottom -->
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <a href="index.jsp" class="btn btn-light btn-block">
                    <i class="fas fa-arrow-left"></i> Volver a inicio
                </a>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-success btn-block">
                <i class="fas fa-check"></i> Guardar Cliente
                </button>
            </div>  
            <div class="col-md-3">
                <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&idCliente=${cliente.idCliente}" class="btn btn-danger btn-block">
                    <i class="fas fa-trash"></i> Eliminar Cliente
                </a>
            </div>
        </div>
    </div>
</section>
