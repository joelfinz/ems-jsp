<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="connection.jsp" %>
<div class="card">
<form action="admin_delStud.jsp" method="get">
<center>

<h5>Are you sure you want to delete this record?</h5>
<input type="hidden" name="iddel" value="<%out.println(request.getParameter("id"));%>">
<a class="btn blue" href="admin_viewStud.jsp">Nope.</a><button type="submit" class="btn red" type="submit">Yep.</button>
</form>
</center>
</div>
<%
if(request.getParameter("id") != null){

    String id= request.getParameter("id");
try{
    Statement st = con.createStatement();
    int i = st.executeUpdate("delete from student where(`s_id` = '"+id+"')");
    response.sendRedirect("admin_viewStud.jsp");
}
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
}    
}
%>
<%@ include file="./templates/footer.jsp" %>