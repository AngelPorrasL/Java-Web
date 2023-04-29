<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Students</title>
    </head>
    <body>
        <%
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/estudiantes", "root", "AngelPorras0022");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from students");                                                           
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Students</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                </div>
            </div>
        </nav>

        <div class="container" style="margin-top:6%">             
            <div class="card">
                <div class="card-header">
                    Students list
                </div>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Nota</th>
                            <th scope="col">Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (resultset.next()) {%>
                        <tr onclick="window.location.href = 'loadStudents.jsp?Id=<%=resultset.getInt("Id")%>'">
                            <th scope="row"> <%=resultset.getInt("Id")%></th>
                            <td><%=resultset.getString("Nombre")%></td>
                            <td><%=resultset.getInt("Nota")%></td>
                            <td><%=resultset.getString("Estado")%></td>                                                                 
                        </tr>                    
                        <%}%>
                    </tbody>
                </table>   
            </div>
        </div>
    </body>
</html>
