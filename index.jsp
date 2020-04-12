<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<style>
#user{
  display:none;
}
</style>
      <center>
      <br>
      <h4>Examination Management System</h4>
        <div class="card logincard">
          <form action="validate.jsp" method="POST">
            <h3>Login</h3>
            <div class="input-field">
              <label for="">Username</label>
              <input type="text" name="uname"/>
            </div>
            <div class="input-field">
              <label for="">Password</label>
              <input type="password" name="upwd" />
            </div>
            <button
              class="btn waves-effect waves-light indigo darken-4"
              type="submit"
            >
              Login</button><br /><br />
          </form>
          Unable to login? Login as admin to get access
        </div>
      </center>
<%@ include file="./templates/footer.jsp" %>

