<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Search vehicles</title>
    </head>
    <body>

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

        <div class="container" style="margin-top:2%">             
            <div class="card">
                <div class="card-header">
                    Search vehicle
                </div>
                <div class="card-body">
                    <form action="filtrovehiculos.jsp">            
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="txtmarca" placeholder="Marca">
                            <label>Marca</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="txtestilo" placeholder="Estilo">
                            <label>Estilo</label>
                        </div>
                        <div class="form-floating mb-3">
                            <button type="submit" class="btn btn-primary">Search</button>                            
                        </div>                          
                    </form>                    
                </div>
            </div>   
            <%
                String txtmarca = request.getParameter("txtmarca");
                String txtestilo = request.getParameter("txtestilo");

                Connection con = null;
                ResultSet resultset = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/vehiculos", "root", "AngelPorras0022");
                    Statement statement = con.createStatement();
                    resultset = statement.executeQuery("select * from vehiculos where marca like '%" + txtmarca + "%' and estilo like '%" + txtestilo + "%'");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>   
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Matricula</th>
                        <th scope="col">Marca</th>
                        <th scope="col">Modelo</th>
                        <th scope="col">Año de fabricación</th>
                        <th scope="col">Estilo</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (resultset.next()) {%>
                    <tr onclick="window.location.href = 'filtrovehiculos.jsp?matricula=<%=resultset.getInt("matricula")%>'">
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
    </body>
</html>
