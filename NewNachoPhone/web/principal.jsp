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
    </head>
    <body>
        <%
          request.setCharacterEncoding("UTF-8");
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/New_Nacho_Phone", "root", "");
            Statement s = conexion.createStatement();  
            
            
            String email = (String)session.getAttribute("email"); 
            String dni = "";
            String nombre = "";
            String idGas = "";
            String MinGas = "";
            String MegGas = "";
            String IdTar = "";
            String NomTar = "";
            String MinTar = "";
            String MegTar = "";
            //out.println(email);
            
        
            
            ResultSet listado = s.executeQuery("Select EmaUsu, DNIusu FROM USUARIO");
                while (listado.next()){
                    if(email.equals(listado.getString("EmaUsu"))){
                        dni += listado.getString("DNIusu");
                    }
                }
                
            //out.println(dni);
            session.setAttribute("user", dni);
            
            listado = s.executeQuery("Select NomUsu, DNIusu FROM USUARIO");
                while(listado.next()){
                if(dni.equals(listado.getString("DNIusu"))){
                    nombre += listado.getString("NomUsu");
                }
            }
            
            //out.println(nombre);
            
            listado = s.executeQuery("Select idGas, MinGas, MegGas, IdTar, DNIUsu FROM GASTOS");
                while(listado.next()){
                    if(dni.equals(listado.getString("DNIUsu"))){
                        idGas += listado.getString("idGas");
                        MinGas += listado.getString("MinGas");
                        MegGas += listado.getString("MegGas");
                        IdTar += listado.getString("IdTar");
                    }
                }
           /* out.println(idGas);
            out.println(MinGas);
            out.println(MegGas);
            out.println(IdTar); */
            

            listado = s.executeQuery("Select NomTar , MinTar, MegTar, IdTar FROM TARIFA");
                while(listado.next()){
                if(IdTar.equals(listado.getString("IdTar"))){
                NomTar += listado.getString("NomTar");
                MinTar += listado.getString("MinTar");
                MegTar += listado.getString("MegTar");               
            }
                
            }
            /*
             out.println(NomTar);
            out.println(MinTar);
            out.println(MegTar);
            

            out.println("----"); */
            out.println("Nombre: "+ nombre + " ,DNI: "+dni+" ,Minutos gastados " +MinGas+ "/"+MinTar + " ,Megas gastados "+MegGas+"/"+MegTar+" , Nombre de la tarifa: "
                    + NomTar);
            
        %>
        
        
        <!-- <p>Hola <%= request.getParameter("name")%> con linea <%= request.getParameter("linea") %> </p>  -->
        <p>Crear una nueva linea </p>
        <button onclick="window.location.href='linea.jsp'"> Añadir una linea nueva</button>
            
    </body>
</html>
