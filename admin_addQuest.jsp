<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ include file="./templates/header.jsp" %>
<%@ include file="connection.jsp" %>

<div class="card">
<center>
<h5>Add Question</h5>
<form action="admin_addQuest.jsp" method="post" id="form">
    <div class="input-field">
        <label>Question</label>
        <input onfocus="optionselect()" type="text" name="que" required="required">
    </div>
    <div class="input-field">
        <label>Option 1</label>
        <input onfocus="optionselect()" type="text" name="opt1" required="required">
    </div>
    <div class="input-field">
        <label>Option 2</label>
        <input onfocus="optionselect()" type="text" name="opt2" required="required">
    </div>
    <div class="input-field">
        <label>Option 3</label>
        <input onfocus="optionselect()" type="text" name="opt3" required="required">
    </div>
    <div class="input-field">
        <label>Option 4</label>
        <input onfocus="optionselect()" type="text" name="opt4" required="required">
    </div>
    <div class="input-field">
    <select name="crct" required='required' onfocus="optionselect()">
    <option id="opt1">Option 1</option>
    <option id="opt2">Option 2</option>
    <option id="opt3">Option 3</option>
    <option id="opt4">OPtion 4</option>
    <label>Correct Answer</label>
    </select>
    </div>

<button class="btn blue" type="submit">Register</button>
</form>
</center>
</div>


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
</script>

<%@ include file="./templates/footer.jsp" %>