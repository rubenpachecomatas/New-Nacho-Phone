<%-- 
    Document   : cambioTarifa
    Created on : 4 mar. 2019, 10:56:11
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

        %>
        
        <form class="form-horizontal" method="post" action="tarifaProceso.jsp">
        <fieldset>

        <!-- Form Name -->
        <legend>Seleccione su nueva tarifa</legend>

        <!-- Text input-->
        <div class="form-group">
          <label class="col-md-4 control-label" for="num">Número</label>  
          <div class="col-md-4">
          <input id="num" name="num" type="text" placeholder="Número de la línea" class="form-control input-md" required="">

          </div>
        </div>

        <!-- Select Basic -->
        <div class="form-group">
          <label class="col-md-4 control-label" for="tarifa">Tarifa</label>
          <div class="col-md-10">
            <select id="opcion" name="opcion" class="form-control">
                <%
                    ResultSet listado = s.executeQuery("Select idTar, NomTar FROM TARIFA");
                    while (listado.next()) {
                    %><option value="<%=listado.getInt("idTar")%>"><%=listado.getString("NomTar")%></option><%
                    }
                %>
            </select>
          </div>
        </div>

        <!-- Button -->
        <div class="form-group">
          <label class="col-md-4 control-label" for="cambiar"></label>
          <div class="col-md-4">
            <button id="cambiar" name="cambiar" class="btn btn-primary">Cambiar</button>
          </div>
        </div>

        </fieldset>
        </form>


        
    </body>
</html>
