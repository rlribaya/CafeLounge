<%@page session="false"%>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    if (request.getSession(false) != null) {
        response.sendRedirect("/OnlineCafeProj");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <head>
        <link rel="icon" href="resources/logo.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
        <link rel="stylesheet" href="global.css">
    </head>
    <body><%@include file="components/navbar.jsp" %>
        <div class="container-lg my-3">
            <div class="row justify-content-center">
                <div class="col-lg-6 text-center">
                    <h1 class="title title-resp">
                        SIGN UP!
                    </h1>
                </div>
            </div>
            <form method="POST" action="signupp">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="mb-3">
                        <label for="username" class="form-label text-resp t-bold px-2">Username</label>
                        <input class="form-control text-resp" type="text" placeholder="username" 
                               id="username" name="username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label text-resp t-bold px-2">Password</label>
                        <input class="form-control text-resp" type="password" placeholder="password" 
                               id="password" name="password" required>
                    </div>
                    <div class="mb-3">
                        <label for="confirmpassword" class="form-label text-resp t-bold px-2">Confirm Password</label>
                        <input class="form-control text-resp" type="password" placeholder="confirm password" 
                               id="password" name="confirmpassword" required>
                    </div>
                    <div class="mb-3">
                        <label for="firstname" class="form-label text-resp t-bold px-2">First Name</label>
                        <input class="form-control text-resp" type="text" placeholder="First Name" 
                               id="firstname" name="firstname" required>
                    </div>
                    <div class="mb-3">
                        <label for="lastname" class="form-label text-resp t-bold px-2">Last Name</label>
                        <input class="form-control text-resp" type="text" placeholder="Last Name" 
                               id="lastname" name="lastname" required>
                    </div>
                    <div class="d-flex justify-content-center">
                        <input class="btn btn-dark p-2 px-3 text-resp" type="submit" value="Create Account">
                    </div>
                    
                </div>
            </div>
            </form>
        </div>
        <h3>already haasdve an account?<br><A href="login.jsp">login here</A></h3>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
