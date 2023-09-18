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

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet{
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Cliente> clientes = new ClienteDaoJDBC().listar();
        System.out.println("clientes = " + clientes);
        request.setAttribute("clientes", clientes); //atributo de nombre "clientes" que pasa a listadoClientes.jsp
        request.setAttribute("totalClientes", clientes.size()); //clientes.size() nos da el largo de la lista
        request.setAttribute("saldoTotal", this.calcularSaldoTotal(clientes)); //saldo total de todos los clientes
        request.getRequestDispatcher("clientes.jsp").forward(request, response);
        
    }
    
    private double calcularSaldoTotal(List<Cliente> clientes){
        double saldoTotal = 0;
        for(Cliente cliente: clientes){
            saldoTotal = saldoTotal + cliente.getSaldo();
        }
        return saldoTotal;
    }
    
}
