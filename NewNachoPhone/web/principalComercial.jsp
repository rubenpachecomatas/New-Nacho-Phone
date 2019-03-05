<%-- 
    Document   : principalComercial
    Created on : 5 mar. 2019, 9:28:54
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

            String email = (String) session.getAttribute("email");
            String dni = "";
            String nombre = "";
            int rolV = 0;

            ResultSet listado = s.executeQuery("Select EmaUsu, DNIusu, NomUsu, IdRol FROM USUARIO WHERE DNIusu");
            while (listado.next()) {
                if (email.equals(listado.getString("EmaUsu"))) {
                    dni = listado.getString("DNIUsu");
                    nombre = listado.getString("NomUsu");
                    rolV = listado.getInt("IdRol");

                }
            }

            session.setAttribute("user", dni);
            session.setAttribute("nombre", nombre);

        %>

        <div class="text-center">
            <h1 class="display-3">Hola <% out.println(nombre);%></h1>
            <h3>Bienvenido al panel de comerciales de NachoPhone</h3>
            <h3>Desde aquí puedes visualizar los datos de nuestros clientes</h3>
            <br>
                        <div style="padding-bottom: 2%;">
                <button class="btn btn-secondary" onclick="location.href='rol.jsp'">Cambiar Rol</button>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                  Ver lineas
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ver Líneas</h5>
                        </div>
                        <div class="modal-body" style="text-align: center; margin: 0 auto; padding: 0 auto;">
                            <form class="form-horizontal text-center" method="post" action="lineas.jsp" style="text-align: center; margin: 0 auto; padding: 0 auto;">
                            <fieldset>

                            <!-- Text input-->
                            <div class="form-group text-center" style="text-align: center; margin: 0 auto; padding: 0 auto; padding-bottom: 3%;">
                              <label class="control-label" for="textinput">DNI</label>  
                              <div>
                              <input id="dni" name="dni" type="text" placeholder="DNI del usuario" class="form-control input-md" required="">

                              </div>
                            </div>

                            <!-- Button -->
                            <div class="form-group">
                              <div>
                                <button id="singlebutton" name="singlebutton" class="btn btn-primary">Ver líneas</button>
                              </div>
                            </div>

                            </fieldset>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
            
        

        <%
            listado = s.executeQuery("SELECT * FROM USUARIO WHERE IdRol=" + 1);
            while (listado.next()) {
                ResultSet rol = t.executeQuery("Select IdRol, NomRol FROM ROLES WHERE IdRol = " + listado.getInt("IdRol"));
                while (rol.next()) {
        %>

        <div class="text-center">
            <table class="table table-dark table-bordered">
                <tr>
                    <td>Nombre</td>
                    <td><%= listado.getString("NomUsu")%></td>
                </tr>
                <tr>
                    <td>Apellido</td>
                    <td><%= listado.getString("ApeUsu")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%= listado.getString("EmaUsu")%></td>
                </tr>
                <tr>
                    <td>DNI</td>
                    <td><%= listado.getString("DNIUsu")%></td>
                </tr>
                <tr>
                    <td>Rol</td>
                    <td><%= rol.getString("NomRol")%></td>
                </tr>


            </table>
        </div>
    </div>
    <%
            }
        }

    %>

</body>
</html>
