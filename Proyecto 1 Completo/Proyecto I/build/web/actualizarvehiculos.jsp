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
            Class.forName("com.mysql.cj.jdbc.Driver");                                                      //Cambiar por, Admin$1234
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/vehiculos", "root", "AngelPorras0022");
            Statement statement = connection.createStatement();

            String sql = "update vehiculos set marca = '" + txtmarca + 
                         "', modelo = " + txtmodelo + 
                         ", annofabricacion = " + txtannofabricacion + 
                         ", estilo = '" + txtestilo + "'" + 
                         " where matricula = " + txtmatricula;
                         
            statement.executeUpdate(sql);

            out.println("<script type='text/javascript'>alert('Vehiculo actualizado');</script>");
            
            RequestDispatcher rd = request.getRequestDispatcher("/vehiculos.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
