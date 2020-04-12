<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" type="image/png" sizes="32x32" href="../image/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="../image/favicon-16x16.png">
    <title>EMS</title>
            <!-- Compiled and minified CSS -->
        <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"
      />
  
      <!-- Compiled and minified JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.card{
    padding:2px;
    border-radius:6px;
}
.logincard{
  max-width:400px;
  margin-top:50px;
}
.btn{
    margin:2px;
}
.input-field{
  max-width:60%;
}
table{
  width:50%;
}
</style>
</head>
<body>
    <div class="navbar-fixed ">
        <nav>
          <div class="nav-wrapper indigo darken-4">
          
          <a id="user" class="left" href="<%out.println(session.getAttribute("home"));%>"><i class="material-icons left">person</i><%out.println(session.getAttribute("user")); %></a>
            <a class="brand-logo center">EMS</a>
            <ul class="right">
              <li id="timer" style="display:none;"><input id="minutes" type="text" style=" 
             border: none;font-weight: bold; color: white; width:10px;"> mins&nbsp:&nbsp<input id="seconds" type="text" style="border: none; font-size: 16px; 
                        font-weight: bold; color: white;width:20px;">secs</li>
            </ul>
          </div>
        </nav>
</div>  
<div class="container">