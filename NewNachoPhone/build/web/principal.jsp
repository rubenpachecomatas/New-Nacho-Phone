<%-- 
    Document   : principal
    Created on : 22 feb. 2019, 11:38:48
    Author     : roman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
            
            
            String email = (String)session.getAttribute("email"); 
            String dni = "";
            String nombre = "";
            
            ResultSet listado = s.executeQuery("Select EmaUsu, DNIusu, NomUsu FROM USUARIO WHERE DNIusu");
                while (listado.next()){
                    if(email.equals(listado.getString("EmaUsu"))){
                        dni = listado.getString("DNIusu");
                        nombre = listado.getString("NomUsu");
                    }
                }
                
            session.setAttribute("user", dni);
            session.setAttribute("nombre", nombre);
                 
        %>
        <div class="text-center">
            <h1 class="display-3">Hola <% out.println(nombre);%></h1>
            <h3>Estas son tus líneas contratadas:</h3>
            <br>
        </div>
        <%
            listado = s.executeQuery("Select idGas, MinGas, MegGas, IdTar, DNIUsu, TfnGas FROM GASTOS");
            while (listado.next()) {
                if(dni.equals(listado.getString("DNIUsu"))){
                    ResultSet tarifa = t.executeQuery("Select NomTar, MinTar, MegTar, idTar FROM TARIFA WHERE idTar = " + listado.getString("idTar"));
                    while (tarifa.next()) {
                    %><table class="table table-dark table-bordered">
                        <tr>
                            <td>Número</td>
                            <td><%=listado.getString("TfnGas")%></td>
                        </tr>
                        <tr>
                            <td>Minutos Gastados</td>
                            <td><%=listado.getString("MinGas")%> / <%=tarifa.getString("MinTar")%></td>
                        </tr>
                        <tr>
                            <td>Megas Gastados</td>
                            <td><%=listado.getString("MegGas")%> / <%=tarifa.getString("MegTar")%></td>
                        </tr>
                        <tr>
                            <td>Tarifa</td>
                            <td><%=tarifa.getString("NomTar")%></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <button class="btn btn-secondary" onclick="location.href='tarifa.jsp'">Cambiar de tarifa</button>
                            </td>
                        </tr>
                    </table><br><%
                    }
                }
            }
        %>
        <div class="text-center">
            <button class="btn btn-primary" onclick="window.location.href='linea.jsp'"> Añadir una linea nueva</button>
        </div>
        
        
            
    </body>
</html>
