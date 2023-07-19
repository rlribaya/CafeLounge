<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 align="center">Database Search Results</h1>
        <table border="1" align="center">
            <tr>
                <th>Name</th>
                <th>Type</th>
                <th>Price</th>
            </tr>

            <%
                ResultSet results = (ResultSet) request.getAttribute("menu");
                while (results.next()) {
            %>
            <tr>
                <td><%=results.getString("name")%></td>
                <td><%=results.getString("type")%></td>
                <td><%=results.getString("price")%></td>
            </tr>	
            <%
                }
            %>
        </table>
    </body>
</html>
