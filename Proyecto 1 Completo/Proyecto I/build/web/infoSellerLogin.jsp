<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Informacion del vendedor</title>
    </head>
    <body>
        <%
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/users", "root", "AngelPorras0022");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from usuarios");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>

        <nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <a class="navbar-brand" href="login.jsp">CRAutos</a>
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
                                <li><a class="dropdown-item" href="vehiculosDisponiblesLogin.jsp">Vehículos disponibles</a></li>
                                <li><a class="dropdown-item" href="infoSellerLogin.jsp">Información del vendedor</a></li>
                                <li><a class="dropdown-item" href="filtrovehiculos.jsp">Buscar vehiculos</a></li>
                            </ul>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top:6%">             
            <div class="card">
                <div class="card-header">
                    Selecciona tu nombre para ver todos los datos
                </div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Nombres</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (resultset.next()) {%>
                        <tr onclick="window.location.href = 'loadSellerLogin.jsp?PhoneNumber=<%=resultset.getInt("PhoneNumber")%>'">
                            <th scope="row"> <%=resultset.getString("Name")%></th>                                                              
                        </tr>                    
                        <%}%>
                    </tbody>
                </table>   
            </div>
        </div>
    </body>
</html>
