<%-- 
    Document   : registro
    Created on : 22 feb. 2019, 9:13:56
    Author     : roman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </head>
    <body>
        

        <form class="form-horizontal" action = "registroProceso.jsp" method = "GET">
            <fieldset>

                <!-- Form Name -->
                <legend style="text-align: center">Formulario de registro</legend>

                
                   <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="dni">DNI</label>  
                    <div class="col-md-4">
                        <input id="dni" name="dni" type="text" placeholder="DNI/NIE" class="form-control input-md" required="" maxlength="9">

                    </div>
                </div>
                   
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="mail">E-mail</label>  
                    <div class="col-md-4">
                        <input id="mail" name="mail" type="text" placeholder="E-mail" class="form-control input-md" required="">

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="pwd">Password</label>  
                    <div class="col-md-4">
                        <input id="pwd" name="pwd" type="password" placeholder="password" class="form-control input-md" required="">

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="name">Nombre</label>  
                    <div class="col-md-4">
                        <input id="name" name="name" type="text" placeholder="nombre" class="form-control input-md" required="">

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="apellido">Apellido</label>  
                    <div class="col-md-4">
                        <input id="apellido" name="apellido" type="text" placeholder="Apellido" class="form-control input-md" required="">

                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="tfno">Telefono</label>  
                    <div class="col-md-4">
                        <input id="tfno" name="tfno" type="text" placeholder="Telefono" class="form-control input-md" required="" maxlength="9">

                    </div>
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="rol">Rol</label>
                    <div class="col-md-4">
                        <select id="rol" name="rol" class="form-control">
                            <option value="1">Usuario Basico</option>
                            <option value="2">Admin</option>
                            <option value="3">Comercial</option>
                        </select>
                    </div>
                </div>

                <!-- Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="Submit"></label>
                    <div class="col-md-4">
                        <input type="submit" value="submit">
                    </div>
                </div>
                
                

            </fieldset>
        </form>
    </body>
</html>
