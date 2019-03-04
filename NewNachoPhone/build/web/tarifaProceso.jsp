<%-- 
    Document   : tarifaProceso
    Created on : 4 mar. 2019, 11:41:35
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
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
    </head>
    <body>
        
        <%
            request.setCharacterEncoding("UTF-8");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/New_Nacho_Phone", "root", "");
            Statement s = conexion.createStatement();
            
            Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/New_Nacho_Phone", "root", "");
            Statement t = conexion2.createStatement();
            
            int num = Integer.parseInt(request.getParameter("num"));
            String opcion = request.getParameter("opcion");
            boolean comprob = false;
            
            ResultSet tarifa = t.executeQuery("Select TfnGas FROM GASTOS");
            while (tarifa.next()) {
                if (num == tarifa.getInt("TfnGas")) {
                    comprob = true;
                }
            }
            
            if (comprob) {
                String actualizacion = "UPDATE GASTOS SET IdTar=" + opcion + " WHERE TfnGas =" + num;
                s.execute(actualizacion);
                %><script>
                    location.replace("principal.jsp");
                </script><%
            } else {
                %><script>
                    location.replace("tarifa.jsp");
                </script><%
            }
            
        %>
        
        
    </body>
</html>
