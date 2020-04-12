<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="connection.jsp" %>
<div class="card">
<center>
<h5>Student Management<h5>
</center>
<table class="highlight responsive-table">
<thead>
    <tr>
        <th>REGNO</th>
        <th>USERNAME</th>
        <th>FULL NAME</th>
        <th>EMAIL</th>
        <th>ACTIONS</th>
    </tr>
</thead>
<tbody>
<%
try{
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from student");
    if(!con.isClosed()){
        while(rs.next()){
            out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td>");
            out.println("<td><form action='admin_upStud.jsp'><input type='hidden' value='"+rs.getString(1)+"' name='id'><button type='submit' class='btn orange'>Update</button></form>");
            out.println("<td><form action='admin_delStud.jsp'><input type='hidden' value='"+rs.getString(1)+"' name='id'><button type='submit' class='btn red'>Delete</button></form><td>");
            out.println("</tr>");
        }
    }
    con.close();
}
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
}
%>
</tbody>
</table>
<center>
<a class="btn" href="admin_addStud.jsp">Add Student</a>
</center>
</div>

<%@ include file="./templates/footer.jsp" %>