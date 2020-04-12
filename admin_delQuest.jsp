<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="connection.jsp" %>
<div class="card">
<form action="admin_delQuest.jsp" method="get">
<center>

<h5>Are you sure you want to delete this question?</h5>
<input type="hidden" name="iddel" value="<%out.println(request.getParameter("id"));%>">
<a class="btn blue" href="admin_viewQuest.jsp">Nope.</a><button type="submit" class="btn red" type="submit">Yep.</button>
</form>
</center>
</div>
<%
if(request.getParameter("id") != null){

    String id= request.getParameter("id");
try{
    Statement st = con.createStatement();
    int i = st.executeUpdate("delete from questions where(`q_id` = '"+id+"')");
    response.sendRedirect("admin_viewQuest.jsp");
}
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
}    
}
%>
<%@ include file="./templates/footer.jsp" %>