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
            int PhoneNumber = Integer.parseInt(request.getParameter("PhoneNumber"));
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");                                    //Cambiar por, Admin$1234
                con = DriverManager.getConnection("jdbc:mysql://localhost/users", "root", "AngelPorras0022");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from usuarios where PhoneNumber=" + PhoneNumber);
                resultset.next();
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

        <div class="container" style="margin-top:2%">
            <div class="card">
                <div class="card-body p-5 text-center">
                    <h3 class="card text-bg-primary mb-3">Informacion del vendedor</h3>
                </div>
                <div class="card-body">          
                    <div class="form-floating mb-3">
                        <input value='<%=resultset.getString("Name")%>' type="text" class="form-control" name="Name" placeholder="Nombre del vendedor" readonly>
                        <label>Nombre del vendedor</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input value='<%=resultset.getString("Email")%>' type="text" class="form-control" name="Email" placeholder="Email" readonly>
                        <label>Email</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input value='<%=resultset.getInt("PhoneNumber")%>' type="number" class="form-control" name="PhoneNumber" placeholder="Numero de telefono" readonly>
                        <label>Numero de telefono</label>
                    </div>
                        
                    <div class="form-floating mb-3 text-center">
                        <a class="btn btn-primary" href="vehiculos.jsp">Ir a pagina principal</a>                            
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
