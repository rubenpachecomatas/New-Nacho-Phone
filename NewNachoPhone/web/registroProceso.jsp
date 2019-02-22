<%-- 
    Document   : registroProceso
    Created on : 22 feb. 2019, 9:38:43
    Author     : roman
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro completado</title>
    </head>
    <body>
        <h1>Te has registrado correctamente</h1>

        <%
            request.setCharacterEncoding("UTF-8");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/New_Nacho_Phone", "root", "");
            Statement s = conexion.createStatement();
        %>

        <%
            ResultSet listado = s.executeQuery("SELECT * FROM USUARIO");
            while (listado.next()) {
        %>

        <p><%=listado.getString("NomUsu")%></p>

        <%}
            String nombre, email, apellido, pwd, tfno, rol,dni;
            int rolInt = 0;
            
            nombre = request.getParameter("name");
            email = request.getParameter("mail");
            apellido = request.getParameter("apellido");
            pwd = request.getParameter("pwd");
            tfno = request.getParameter("tfno");
            rolInt = Integer.parseInt(request.getParameter("rol"));
            dni = request.getParameter("dni");

            out.println(pwd);
           



int i=s.executeUpdate("insert into USUARIO(DNIUsu,PwdUsu,NomUsu,ApeUsu,EmaUsu,ConUsu,IdRol)values('"+dni+"','"+pwd+"','"+nombre+"','"+apellido+"','"+email+"','"+tfno+"','"+rolInt+"')");
out.println("Te has registrado correctamente");



        


        %>
    </body>
</html>
