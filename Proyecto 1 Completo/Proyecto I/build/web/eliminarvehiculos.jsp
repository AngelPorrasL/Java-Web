<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int txtmatricula = Integer.parseInt(request.getParameter("matricula"));
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");                                                     //Cambiar por, Admin$1234
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/vehiculos", "root", "AngelPorras0022");
            Statement statement = connection.createStatement();

            String sql = "delete from vehiculos where matricula = " + txtmatricula;

            statement.executeUpdate(sql);

            out.println("<script type='text/javascript'>alert('Vehiculo eliminado');</script>");

            RequestDispatcher rd = request.getRequestDispatcher("/vehiculos.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
