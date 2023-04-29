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
            String txtName = request.getParameter("txtName");
            int txtPhoneNumber = Integer.parseInt(request.getParameter("txtPhoneNumber"));
            String txtEmail = request.getParameter("txtEmail");
            String txtPassword = request.getParameter("txtPassword");
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");                                                 //Cambiar por, Admin$1234
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/users", "root", "AngelPorras0022");
            Statement statement = connection.createStatement();
            Statement statement2 = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from usuarios where Email = '" + txtEmail + "'");

            if (resultSet.next()) {
                out.println("<script type='text/javascript'>alert('Email ya ingresado');</script>");
            } else {
                String sql = "insert into usuarios (Name, PhoneNumber, Email, Password) "
                        + "values ('" + txtName + "', " + txtPhoneNumber + ", '" + txtEmail + "', '" + txtPassword + "')";

                statement2.executeUpdate(sql);

                out.println("<script type='text/javascript'>alert('Usuario creado exitosamente');</script>");
            }

            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
