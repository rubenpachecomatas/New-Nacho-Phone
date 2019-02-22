<%-- 
    Document   : index
    Created on : 21 feb. 2019, 14:07:36
    Author     : ruben
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
        <title>JSP Page</title>
    </head>
    <body>
        
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
        
        <%}%>
    </body>
</html>
