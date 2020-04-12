<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="checkAuth.jsp" %>
<div class="card">
<h2>Hello <%out.println(session.getAttribute("user"));%></h2><br>
<center>
<div class="card-action">
<h5>You have 2 minutes to complete this test.<h5>
<h5>Attempt all questions.<h5>
<h5>All the best.<h5>
<a href="test.jsp" class="btn">Start Test</a><a href="logout.jsp" class="btn red">Logout</a>
</div>
</center>
</div>
<%@ include file="./templates/footer.jsp" %>