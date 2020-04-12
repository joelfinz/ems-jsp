<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<h3>Computer Quiz</h3>
<script src="./js/script.js"></script>
<%@ include file="connection.jsp" %>
<%
try{
  Statement st= con.createStatement();
  ResultSet rs = st.executeQuery("select * from questions");
  int i=0;
  if(!con.isClosed()){

  out.println("<form name='testform' action='evaluation.jsp' method='POST'>");
  while(rs.next()){
    String q_id = rs.getString(1);
    String question = rs.getString(2);
    String q_opt1 = rs.getString(3);
    String q_opt2 = rs.getString(4);
    String q_opt3 = rs.getString(5);
    String q_opt4 = rs.getString(6);
    String q_ans = rs.getString(7);
    i++;
    out.println("<div class='card' id='quebox-"+q_id+"'>");
    out.println("<h6 id='que_'"+q_id+">"+i+". "+question+"</h6>");
    out.println("<label><input class='with-gap' type='radio' name='que_"+q_id+"' value='"+q_opt1+"'><span>"+q_opt1+"</span></label><br>");
    out.println("<label><input class='with-gap' type='radio' name='que_"+q_id+"' value='"+q_opt2+"'><span>"+q_opt2+"</span></label><br>");
    out.println("<label><input class='with-gap' type='radio' name='que_"+q_id+"' value='"+q_opt3+"'><span>"+q_opt3+"</span></label><br>");
    out.println("<label><input class='with-gap' type='radio' name='que_"+q_id+"' value='"+q_opt4+"'><span>"+q_opt4+"</span></label><br>");
  out.println("</div>");
  }
  out.println("<button type='submit' class='waves-effect waves-light btn' style='float:right'>Finish test</button>");
  out.println("<form>");

    out.println("<script>console.log('Successfully connected to Database')</script>");
}
    con.close();
  }
catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println("<script>console.log('"+ex+"')</script>");
}
%>
<%@ include file="./templates/footer.jsp" %>