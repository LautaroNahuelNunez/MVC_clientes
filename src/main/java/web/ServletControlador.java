package web;

import datos.ClienteDaoJDBC;
import dominio.Cliente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "editar":
                    this.editarCliente(request, response); //Llamamos al método
                    break;
                default:
                    this.accionDefault(request, response);
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cliente> clientes = new ClienteDaoJDBC().listar();

        HttpSession sesion = request.getSession();

        System.out.println("clientes = " + clientes);
        sesion.setAttribute("clientes", clientes); //atributo de nombre "clientes" que pasa a listadoClientes.jsp
        sesion.setAttribute("totalClientes", clientes.size()); //clientes.size() nos da el largo de la lista
        sesion.setAttribute("saldoTotal", this.calcularSaldoTotal(clientes)); //saldo total de todos los clientes
        //request.getRequestDispatcher("clientes.jsp").forward(request, response);
        response.sendRedirect("clientes.jsp");

    }

    private double calcularSaldoTotal(List<Cliente> clientes) {
        double saldoTotal = 0;
        for (Cliente cliente : clientes) {
            saldoTotal = saldoTotal + cliente.getSaldo();
        }
        return saldoTotal;
    }
    
    private void editarCliente (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //recuperamos el idCliente
        int idCliente = Integer.parseInt(request.getParameter("idCliente")); //recupero el id del cliente
        Cliente cliente = new ClienteDaoJDBC().encontrar(new Cliente(idCliente)); //busco el cliente por id en la BBDD
        request.setAttribute("cliente", cliente);
        String jspEditar = "/WEB-INF/paginas/cliente/editarCliente.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    this.insertarCliente(request, response); //Llamamos al método
                    break;
                default:
                    this.accionDefault(request, response);
            }
        } else {
            this.accionDefault(request, response);
        }
    }

    private void insertarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //recuperamos los valores del formulario agregarCliente
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        double saldo = 0;
        String SaldoString = request.getParameter("saldo");
        if (SaldoString != null && !"".equals(SaldoString)) { //si saldoString no es null ni es igual a una cadena vacia
            saldo = Double.parseDouble(SaldoString); //casteo y asigno
        }

        //creamos el objeto de cliente (modelo)
        Cliente cliente = new Cliente(nombre, apellido, email, telefono, saldo);

        //insertamos el nuevo objeto en la BBDD
        int registrosModificados = new ClienteDaoJDBC().insertar(cliente);

        //redirigimos hacia la accion por default
        this.accionDefault(request, response);

    }
    
    
    
}
