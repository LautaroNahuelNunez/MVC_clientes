<div class="modal fade" id="agregarClienteModal"> <!-- id hacec referencia a data-target de botones de navegación de agregar cliente -->
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title">Agregar Cliente</h5>
                <button class="close" data-dismiss="modal"> <!-- data-dismiss es para cerrar la ventana -->
                    <span>&times;</span> <!-- simbolo de X -->
                </button>
            </div>

            <form action="${pageContext.request.contextPath}/ServletControlador?accion=insertar" method="post" class="was-validated">

                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" name="nombre" pattern="[a-z A-Z ÁÉÍÓÚáéíóúÜüÑñ]{1,40}" title="Sin números, espacios o guiones" required>
                    </div>

                    <div class="form-group">
                        <label for="apellido">Apellido</label>
                        <input type="text" class="form-control" name="apellido" pattern="[a-z A-Z ÁÉÍÓÚáéíóúÜüÑñ]{1,40}" title="Sin números, espacios o guiones" required>
                    </div>

                    <div class="form-group">
                        <label for="email">E-mail</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <input type="tel" class="form-control" name="telefono" pattern="[0-9]{1,15}" title="Solo núnmeros sin espacios ni guiones" required>
                    </div>

                    <div class="form-group">
                        <label for="saldo">Saldo</label>
                        <input type="number" class="form-control" name="saldo" pattern="[0-9]{1,15}" required>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">Guardar</button>
                </div>

            </form>

        </div>
    </div>
</div>
