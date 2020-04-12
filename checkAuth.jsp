<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%
if(session.getAttribute("user") == null){
response.sendRedirect("index.jsp");
}
%>