<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Actualizar Vehiculo</title>
    </head>
    <body>
        <%
            int matricula = Integer.parseInt(request.getParameter("matricula"));
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");                                    //Cambiar por, Admin$1234
                con = DriverManager.getConnection("jdbc:mysql://localhost/vehiculos", "root", "AngelPorras0022");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from vehiculos where matricula=" + matricula);
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
                    <h3 class="card text-bg-primary mb-3">Actualizar Vehiculo</h3>
                </div>
                <div class="card-body">
                    <form action="actualizarvehiculos.jsp">            
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("matricula")%>' type="number" class="form-control" name="txtmatricula" placeholder="Matricula" readonly>
                            <label>Matricula</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("marca")%>' type="text" class="form-control" name="txtmarca" placeholder="Marca del vehiculo">
                            <label>Marca del vehiculo</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("modelo")%>' type="number" class="form-control" name="txtmodelo" placeholder="Modelo">
                            <label>modelo/label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("annofabricacion")%>' type="number" class="form-control" name="txtannofabricacion" placeholder="Año de fabricación">
                            <label>Año de fabricación</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("estilo")%>' type="text" class="form-control" name="txtestilo" placeholder="Estilo">
                            <label>Estilo</label>
                        </div>
                            <div class="form-floating mb-3">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmUpdateModal">Update</button>
                                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Delete</button>
                            </div>                          

                            <!-- Modal 1 -->
                            <div class="modal fade" id="confirmDeleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">Delete vehicle</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Estas seguro que quieres eliminar el vehiculo de la marca <%=resultset.getString("marca")%>?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                            <a class="btn btn-danger" href='eliminarvehiculos.jsp?matricula=<%=resultset.getInt("matricula")%>'>Yes, Delete!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal 2 -->
                            <div class="modal fade" id="confirmUpdateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="staticBackdropLabel">Update vehicle</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            Estas seguro que quieres actualizar el vehiculo de la marca <%=resultset.getString("marca")%>?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                            <button type="submit" class="btn btn-primary">Update</button> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </form>
                </div>
            </div>     
        </div> 
    </body>
</html>

