<!--NAVIGATION BAR-->
<%@page session="false"%>
<nav class="navbar navbar-expand-lg navbar-dark text-resp" style="background-color: #203239;">
    <div class="container-fluid">
        <a class="navbar-brand" href="home"><img src="resources/logo.png" class="nav-icon"></a>
        <a class="navbar-brand" href="home">
            <h1 class="title nav-title" style="margin:0px">
                <%
                    if (request.getAttribute("header") != null)
                        out.print(request.getAttribute("header"));
                %>
            </h1>
        </a>
        <%
            String urla[] = request.getRequestURI().substring(1).split("/");
            String url=urla[urla.length-1];
            System.out.println(url+"iii22ii");
            if(!url.equals("login.jsp") && !url.equals("signup.jsp")) {
        %>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon" style="height: 50px; width: 50px"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
      <ul class="navbar-nav text-resp">
        <li class="nav-item">
          <a class="nav-link" href="#">Order Now</a>
        </li>
        <li class="nav-item dropdown text-resp">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Products
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#cake">Cake</a></li>
            <li><a class="dropdown-item" href="#coffee">Coffee</a></li>
            <li><a class="dropdown-item" href="#tea">Tea</a></li>
            <li><a class="dropdown-item" href="#choc">Hot Chocolate</a></li>
          </ul>
        </li>
        <%if(request.getSession(false) != null) {%>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Account
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="account">Edit Details</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="logout">Logout</a></li>
          </ul>
        </li>
        <% } else {%>
        <li class="nav-item">
          <a class="nav-link" href="login" tabindex="-1">Login</a>
        </li>
        <%}%>
      </ul>
    </div><%}%>
  </div>
</nav>
