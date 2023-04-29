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
            int txtmatricula = Integer.parseInt(request.getParameter("txtmatricula"));
            String txtmarca = request.getParameter("txtmarca");
            int txtmodelo = Integer.parseInt(request.getParameter("txtmodelo"));
            int txtannofabricacion = Integer.parseInt(request.getParameter("txtannofabricacion"));
            String txtestilo = request.getParameter("txtestilo");
           
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");                                                       //Cambiar por, Admin$1234
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/vehiculos", "root", "AngelPorras0022");
            Statement statement = connection.createStatement();
            Statement statement2 = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from vehiculos where matricula = " + txtmatricula);

            if (resultSet.next()) {
                out.println("<script type='text/javascript'>alert('User already created');</script>");
            } else {
                String sql = "insert into vehiculos (matricula, marca, modelo, annofabricacion, estilo) "
                        + "values (" + txtmatricula + ", '" + txtmarca + "', " + txtmodelo + ", " + txtannofabricacion + ", '" + txtestilo + "')";

                statement2.executeUpdate(sql);

                out.println("<script type='text/javascript'>alert('Vehiculo registrado');</script>");
            }

            RequestDispatcher rd = request.getRequestDispatcher("/vehiculos.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
