<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="connection.jsp" %>

<%
if(request.getParameter("id")!=null){
try{
    if(!con.isClosed()){
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from questions where q_id='"+request.getParameter("id")+"'");
    while(rs.next()){
%>
<div class="card">
<h5>Edit Question</h5>
<form action=admin_upQuest.jsp id="form">
<input type="hidden" value="<%out.println(rs.getString(1));%>" name="idd">
<div class='input-field'><label>Question</label><input type='text' name='que' required='required' value='<%out.println(rs.getString(2));%>'/></div>    
    <div class='input-field'><label>Option1</label><input onfocus="optionselect()" type='text' name='opt1' required='required' value='<%out.println(rs.getString(3));%>'/></div>
    <div class='input-field'><label>Option 2</label><input onfocus="optionselect()" type='text' name='opt2' required='required' value='<%out.println(rs.getString(4));%>'/></div>
    <div class='input-field'><label>Option 3</label><input onfocus="optionselect()" type='text' name='opt3' required='required' value='<%out.println(rs.getString(5));%>'/></div>
    <div class='input-field'><label>Option 4</label><input onfocus="optionselect()" type='text' name='opt4' required='required' value='<%out.println(rs.getString(6));%>'/></div>
    <div class='input-field' onfocus="optionselect()">
    <select name="crct" required='required'>
    <option id="opt1"></option>
    <option id="opt2"></option>
    <option id="opt3"></option>
    <option id="opt4"></option>
    </select>
    <label>Correct Answer</label>
    </div>
    <button type='submit' class='btn'>Update</button>
    </form>
</div>
    <%}
    }
}
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
    out.println(ex);
}
}

if(request.getParameter("idd")!=null){
    try{
        Statement st = con.createStatement();
        int i = st.executeUpdate("update questions set `question`='"+request.getParameter("que")+"',`q_opt1`='"+request.getParameter("opt1")+"',`q_opt2`='"+request.getParameter("opt2")+"',`q_opt3`='"+request.getParameter("opt3")+"', `q_opt4`='"+request.getParameter("opt4")+"', `q_ans`='"+request.getParameter("crct")+"' where(`q_id`='"+request.getParameter("idd")+"')");
        if(!con.isClosed()){
        out.println("Question record updated successfully.");
        out.println("Redirecting to dashboard...");
        out.println("<script>alert('record updated successfully')</script>");
        response.sendRedirect("admin_viewQuest.jsp");
        }
        con.close();
}
    catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
    out.println(ex);
}
}
%>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems);
  });
function optionselect(){
document.getElementById("opt1").innerText = document.getElementById("form").opt1.value;
document.getElementById("opt1").value = document.getElementById("form").opt1.value;
document.getElementById("opt2").innerText = document.getElementById("form").opt2.value;
document.getElementById("opt2").value = document.getElementById("form").opt2.value;
document.getElementById("opt3").innerText = document.getElementById("form").opt3.value;
document.getElementById("opt3").value = document.getElementById("form").opt3.value;
document.getElementById("opt4").innerText = document.getElementById("form").opt4.value;
document.getElementById("opt4").value = document.getElementById("form").opt4.value;
}
optionselect()  
  console.log(document.getElementById("form").opt1.value);
</script>
<%@ include file="./templates/footer.jsp" %>