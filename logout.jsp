<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>

Logging out now...
<%
    session.removeAttribute("user");
    session.removeAttribute("home");
    response.sendRedirect("index.jsp");
%>
<%@ include file="./templates/footer.jsp" %>