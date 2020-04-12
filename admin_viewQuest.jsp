<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="connection.jsp" %>
<div class="card">
<center>
<h5>Manage Questions</h5>
</center>
  <ul class="collapsible">
<%
try{
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from questions");
    int i = 0;
    if(!con.isClosed()){
        while(rs.next()){
            i++;
            out.println("<li><div class='collapsible-header'>"+i+". "+rs.getString(2)+"</div>");
            out.println("<div class='collapsible-body'><span>");
            out.println("Option 1 : "+rs.getString(3));
            out.println("<br>Option 2 : "+rs.getString(4));
            out.println("<br>Option 3 : "+rs.getString(5));
            out.println("<br>Option 4 : "+rs.getString(6));
            out.println("<br>Correct answer : "+rs.getString(7)+"<br><br>");
            out.println("<form action='admin_upQuest.jsp'>");
            out.println("<input type='hidden' name='id' value='"+rs.getString(1)+"'><button type='submit' class='btn green'>Edit Question</button></form>");
            out.println("<form action='admin_delQuest.jsp'>");
            out.println("<input type='hidden' name='id' value='"+rs.getString(1)+"'><button type='submit' class='btn red'>Delete Question</button></form>");
            out.println("</span></div></li>");
        }
    }
    con.close();
}
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
}
%>
</ul>
<center>
<a href="admin_addQuest.jsp" class="btn blue darken-3">Add question</a>
</center>
</div>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems);
  });
</script>

<%@ include file="./templates/footer.jsp" %>