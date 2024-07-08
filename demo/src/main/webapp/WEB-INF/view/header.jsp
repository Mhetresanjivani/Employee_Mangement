
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

</head>
<body>
        <header>
        <a class="navbar-brand" href="#">
            <img src="/resources/images/logo-headers-Black.png" alt="Company Logo" height="50px">
        </a>
        <div class="nav">
            <ul class="menu">
                <li><a href="/home">Home</a></li>
                <li><a href="/getEmpById/<%=session.getAttribute("Id") %>">Profile-(<%=session.getAttribute("name") %>)</a></li>
                <li><a href="/emplist">List of Employee</a></li>

        <% 

         String role=(String)session.getAttribute("role");

          if(role.equalsIgnoreCase("Admin"))
          { %>
            <li>
              <a href="/addEmployee">Add Employee</a>
            </li>

            <%

          }
          
          
          %>
          <li><a href="/logout">Logout</a></li>

        
            </ul>
        </div>
    </header>

</body>
</html>