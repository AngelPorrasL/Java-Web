<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Vehiculos disponibles</title>
    </head>
    <body>
        <%
            Connection con = null;
            ResultSet resultset = null;
            Statement smt;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");                                    //Cambiar por, Admin$1234
                con = DriverManager.getConnection("jdbc:mysql://localhost/vehiculos", "root", "AngelPorras0022");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from vehiculos");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
        <nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <a class="navbar-brand" href="vehiculos.jsp">CRAutos</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Información
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="vehiculosDisponiblesAfterLogin.jsp">Vehículos disponibles</a></li>
                                <li><a class="dropdown-item" href="infoSellerAfterLogin.jsp">Información del vendedor</a></li>
                                <li><a class="dropdown-item" href="filtrovehiculos.jsp">Buscar vehiculos</a></li>
                            </ul>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top:6%">             
            <div class="card">
                
                <div class="card-header">
                    Vehiculos disponibles
                </div>
                
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Matricula</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Nota</th>
                            <th scope="col">Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (resultset.next()) {%>
                        <tr>
                            <th scope="row"> <%=resultset.getInt("matricula")%> </th>
                            <td><%=resultset.getString("marca")%></td>
                            <td><%=resultset.getInt("modelo")%></td>
                            <td><%=resultset.getInt("annofabricacion")%></td>                        
                            <td><%=resultset.getString("estilo")%></td>                                                                 
                        </tr>                    
                        <%}%>
                    </tbody>
                </table>   
            </div>
        </div>
    </body>
</html>
