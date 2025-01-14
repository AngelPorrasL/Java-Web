<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Change Students Notes n Status</title>
    </head>
    <body>
        <%
            int Id = Integer.parseInt(request.getParameter("Id"));
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/estudiantes", "root", "AngelPorras0022");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from students where Id=" + Id);
                resultset.next();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %> 
        <div class="container" style="margin-top:2%">
            <div class="card">
                <div class="card-header">
                    Update student note and status
                </div>
                <div class="card-body">
                    <form action="updateStudents.jsp">
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("Id")%>' type="text" class="form-control" name="txtId" placeholder="Id" readonly>
                            <label>Id</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("Nota")%>' type="number" class="form-control" name="txtNota" placeholder="Nueva nota">
                            <label>Nueva nota</label>
                        </div>

                        <div class="form-floating mb-3">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmUpdateModal">Update</button>
                        </div>

                        <div class="modal fade" id="confirmUpdateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Update student</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Do you really want to update the note of <%=resultset.getString("Nombre")%>?
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