<%-- 
    Document   : productos
    Created on : Nov 2, 2022, 8:15:42 PM
    Author     : PC
--%>


<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Users</title>
    </head>
    <body>  
        <%!
            Connection con;
            ResultSet resultset;

            public void jspInit() {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/products", "root", "AngelPorras0022");
                    Statement statement = con.createStatement();
                    resultset = statement.executeQuery("select * from productos");
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            public void jspDestroy() {
                try {
                    con.close();
                    resultset.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        %>       
        
        <nav class="navbar navbar-dark navbar-expand-lg bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.html">Supermarket</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>                       
        <div class="container" style="margin-top:2%"> 
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Category</th>
                        <th scope="col">Price</th>
                        <th scope="col">Purchase date</th>
                    </tr>
                </thead>
                <tbody>
                    <% while (resultset.next()) {%>
                    <tr>
                        <th scope="row"> <%=resultset.getInt("Id")%> </th>
                        <td><%=resultset.getString("Name")%></td>
                        <td><%=resultset.getString("Category")%></td>
                        <td><%=resultset.getInt("Price")%></td>                        
                        <td><%=resultset.getString("Fecha")%></td>                                                                  
                    </tr>                    
                    <%}%>
                </tbody>
            </table>   
        </div>
    </body>
</html>
