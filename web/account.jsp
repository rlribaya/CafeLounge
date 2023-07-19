<%@page session="false"%>
<%  
    // no caching to prevent back button press
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    if (request.getSession(false) == null) {
        response.sendRedirect("home");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="resources/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="global.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Details</title>
    </head>
    <body><%@include file="components/navbar.jsp"%>
        <form class="container-lg d-flex flex-column align-items-center mt-5" method="POST" action="update">
            <h1 class="title title-resp mb-5">Account Details</h1>
            
            <label for="firstname" class="form-label text-resp t-bold">
                First Name
            </label>
            <input class="form-control text-resp text-center mb-3" type="text" name="firstname" required
                   value="<%out.print(request.getSession().getAttribute("firstName"));%>" style="max-width: 80%">

            <label for="lastname" class="form-label text-resp t-bold">
                Last Name
            </label>
            <input class="form-control text-resp text-center mb-5" type="text" name="lastname" required
                   value="<%out.print(request.getSession().getAttribute("lastName"));%>" style="max-width: 80%">

            <div class="d-flex justify-content-center">
                <input class="btn btn-dark p-2 px-3 text-resp mb-3" type="submit" value="Update Details">
            </div>
            <%
                if (request.getAttribute("updateStatus") != null &&
                    (Boolean) request.getAttribute("updateStatus")) {
            %>
            <p class="text-resp t-bold" style="color: green;">Update Complete</p>
            <% } %>
        </form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
