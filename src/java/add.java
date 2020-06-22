/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bacel
 */
public class add extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet add</title>");
            out.println("<script>function validateForm() {  var x = document.forms['f1']['fname'].value;  if (x == '') {    alert('Name must be filled out');    return false;  }}</script>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Create new User Account</h1>");
            out.println("<form name='f1' method='POST'>");
            out.println("<table>");
            out.println("<tr><td>First Name: </td><td><input type='text' name='fname' value='' placeholder='Enter First name' style='width:150px'/></td></tr>");
            out.println("<tr><td>Last Name: </td><td><input type='text' name='lname' placeholder='Enter Last name' style='width:150px;'/></td></tr>");
            out.println("<tr><td>Username: </td><td><input type='text' name='username' placeholder='Enter a unique Username' style='width:150px'/></td></tr>");
            out.println("<tr><td>Password: </td><td><input type='text' name='password' placeholder='Enter you Password' style='width:150px'/></td></tr>");
            out.println("<tr><td>User Type: </td><td><select name='type'>");
            out.println("<option value='citizen'>Citizen</option>");
            out.println("<option value='admin'>Admin</option>");
            out.println("</select></td></tr>");
            out.println("</table>");
            out.println("<p><input type='submit' value='add'/></p>");
            out.println("</form>");
            String fname = request.getParameter("fname");  
            String lname = request.getParameter("lname");  
            String username = request.getParameter("username");  
            String password = request.getParameter("password");  
            String type = request.getParameter("type");
            if(fname=="" || lname=="" || password=="" || username==""){
                out.println("<p>please enter all missing values</p>");
            }
            out.println(fname+lname+username+password);
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
