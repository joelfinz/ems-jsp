<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<div class="card">
<center><h4>Examination Management Console<h4></center><hr>
<div>
<%@ include file="connection.jsp" %>
<%
try{
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select count(*) from questions");
    if(rs.next())
    out.println("Total number of questions in database: "+rs.getInt(1));
    rs = st.executeQuery("select count(*) from student");
    if(rs.next())
    out.println("<br>Number of students registered: "+rs.getInt(1));
    rs = st.executeQuery("select count(*) from tests");
    if(rs.next())
    out.println("<br>Number of tests done: "+rs.getInt(1));
}
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
}
%>
<br><br>
<center>
<a href="admin_viewStud.jsp" class="btn">Student Management</a>
<a href="admin_viewQuest.jsp" class="btn">Manage Questions</a>
<a class="btn">View test log</a>
<a class="btn red" href="logout.jsp">Logout</a>
</center>
<div>
</div>
<%@ include file="./templates/footer.jsp" %>