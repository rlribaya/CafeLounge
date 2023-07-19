<%@page session="false"%>
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    if (request.getSession(false) != null) {
        response.sendRedirect("home");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="global.css">
        <link rel="icon" href="resources/logo.png">
    </head>
    
    <body><%@include file="/components/navbar.jsp" %>
        <div class="container-md mt-5">
            <div class="row"><div class="col-lg-3"></div>
                <div class="col-lg-3">
                    <center><img src="resources/logo.png" class="logo-image"></center>
                </div>
                <div class="col-lg-3">
                    <form class="row gy-2" method="POST" action="log">
                        <div class="col-lg-12">
                            <label for="username" class="form-label text-resp t-bold"> Username</label>
                            <input class="form-control text-resp" type="text" placeholder="Username"
                                   name="username" required>
                        </div>
                        <div class="col-lg-12 mb-2">
                            <label for="password" class="form-label text-resp t-bold"> Password</label>
                            <input class="form-control text-resp" type="password" placeholder="Password"
                                   name="password" required>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox"
                                       value="" id="remember" name="remember">
                                <label class="form-check-label" for="remember">
                                  Remember Me
                                </label>
                            </div>
                            <input class="btn btn-dark p-2 px-4 text-resp" type="submit" value="Login">
                            <%
                                if (request.getAttribute("wrong") != null && (Boolean)request.getAttribute("wrong")) {
                            %>
                            <h1 class="text-resp text-nowrap" style="margin: 0px; color: red; ">Incorrect username/password</h1>
                            <% } %>
                        </div>
                        <div class="col-lg-12">
                            <h5><A href="signup">create account</A></h5>
                        </div>
                    </form>
                </div><div class="col-lg-3"></div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
