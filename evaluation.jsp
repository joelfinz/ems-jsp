<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<h3>Computer Quiz</h3>
<h4>Test completed successfully</h4>
<%@ include file="connection.jsp" %>
<%
try{
int status = 0;
int incVal = 0;
int score = 0;
String user = "finz";
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from questions");
    if(!con.isClosed()){
        while(rs.next()){
            String q_id = rs.getString(1);
            String testans = "que_"+q_id;
            String q_ans = rs.getString(7);
            String selans = request.getParameter(testans);
            if(selans != null)
            if(selans.equals(q_ans))
                score+=1;
        }
    rs = st.executeQuery("select count(*) from tests");
    if(rs.next())
    incVal = rs.getInt(1)+1;
    int i = st.executeUpdate("insert into tests values('"+incVal+"','"+session.getAttribute("user")+"','"+score+"')");
    con.close();
    out.println("Your test score is  "+score);
    }
}
    catch(Exception ex){
    out.println("<script>console.log('Unable to connect to MySql Database.')</script>");
    out.println(ex);
}
%>
<br><a class="btn red" href='logout.jsp'>logout</a>
<%@ include file="./templates/footer.jsp" %>