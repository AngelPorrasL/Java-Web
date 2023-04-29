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
            String txtEmail = request.getParameter("txtEmail");
            String txtPassword = request.getParameter("txtPassword");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");                                                 //Cambiar por, Admin$1234
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/users", "root", "AngelPorras0022");
                PreparedStatement pst = connection.prepareStatement("select * from usuarios where Email = ? and Password = ?");
                pst.setString(1, txtEmail);
                pst.setString(2, txtPassword);

                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    out.println("<script type='text/javascript'>alert('Bienvenido a CRAutos!');</script>");
                                                                        
                    RequestDispatcher rd = request.getRequestDispatcher("/vehiculos.jsp");
                    rd.include(request, response);
                } else {
                    out.println("<script type='text/javascript'>alert('Data incorrect');</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    rd.include(request, response);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }


        %>   
    </body>
</html>
