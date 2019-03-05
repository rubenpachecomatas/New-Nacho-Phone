<%-- 
    Document   : lineas
    Created on : 5 mar. 2019, 9:54:43
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
            
            Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/New_Nacho_Phone", "root", "");
            Statement r = conexion3.createStatement();
            
            String dni = request.getParameter("dni");
            String opcion = request.getParameter("rol");
            int rolCom = 0;
            boolean comprob = false;
            
            ResultSet lineas = t.executeQuery("Select DNIUsu, IdRol FROM USUARIO");
            while (lineas.next()) {
                if (dni.equals(lineas.getString("DNIUsu"))) {
                    comprob = true;
                    rolCom = lineas.getInt("IdRol");
                }
            }

            if (comprob && rolCom == 1) {
            %><button class="btn btn-secondary" onclick="location.href='principalAdmin.jsp'">Volver al panel</button><%
            ResultSet listado = s.executeQuery("Select idGas, MinGas, MegGas, IdTar, DNIUsu, TfnGas FROM GASTOS");
            while (listado.next()) {
                if(dni.equals(listado.getString("DNIUsu"))){
                    ResultSet tarifa = r.executeQuery("Select NomTar, MinTar, MegTar, idTar FROM TARIFA WHERE idTar = " + listado.getString("idTar"));
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
                    </table><br><%
                    }
                }
            }

            
            } else {
                %><script>
                    location.replace("principalAdmin.jsp");
                </script><%
            }
            
        %>
        
    </body>
</html>
