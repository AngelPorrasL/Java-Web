<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Login</title>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg" style="background-color: #e3f2fd;">
            <div class="container-fluid">
                <a class="navbar-brand" href="login.jsp">CRAutos</a>
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
                                <li><a class="dropdown-item" href="vehiculosDisponiblesLogin.jsp">Vehículos disponibles</a></li>
                                <li><a class="dropdown-item" href="infoSellerLogin.jsp">Información del vendedor</a></li>
                                <li><a class="dropdown-item" href="filtrovehiculos.jsp">Buscar vehiculos</a></li>
                                <li><a class="dropdown-item" href="filterYears.jsp">Buscar ann</a></li>
                            </ul>
                    </ul>
                </div>
            </div>
        </nav>
        <div class ="container-xxl">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card shadow-2-strong" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <h3 class="mb-5">Login</h3>
                                
                                <form  action="validateLogin.jsp">
                                    <div class="form-outline mb-4">
                                        <input name = "txtEmail" type="email" class="form-control" placeholder="Email" required/>
                                        <label class="form-label">Email</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input name = "txtPassword" type="password" class="form-control" placeholder="Password" required/>
                                        <label class="form-label">Contraseña</label>
                                    </div>

                                    <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>

                                    <div class="text-center">
                                        <p>No tienes una cuenta? <a href="registration.jsp">Registrate</a></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
