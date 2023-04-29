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
            int txtId = Integer.parseInt(request.getParameter("txtId"));
            int txtNota = Integer.parseInt(request.getParameter("txtNota"));
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/estudiantes", "root", "AngelPorras0022");
            Statement statement = connection.createStatement();

            String sql = "update students set Nota = " + txtNota + 
                         " where Id = " + txtId;
            statement.executeUpdate(sql);
                         
            if(txtNota>=70){
                String sqlAp = "update students set Estado = 'Aprobado' where Id = " + txtId;
                statement.executeUpdate(sqlAp);
            } else if(txtNota>=65 && txtNota<70){
                String sqlAplz = "update students set Estado = 'Aplazado' where Id = " + txtId;
                statement.executeUpdate(sqlAplz);
            } else{
                String sqlRep = "update students set Estado = 'Reprobado' where Id = " + txtId;
                statement.executeUpdate(sqlRep);
            }

            out.println("<script type='text/javascript'>alert('Student note and status updated');</script>");

            RequestDispatcher rd = request.getRequestDispatcher("/students.jsp");
            rd.include(request, response);
        %>
    </body>
</html>