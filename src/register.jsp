<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"><img src="https://pbs.twimg.com/profile_images/1061714658321588224/wxfzDrCe.jpg" alt="" width="24" height="24"</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.html">Index</a></li>
        <li><a href="#">Orders</a></li>
        <li><a href="products.html">Products</a></li>
        <li><a href="userpage.jsp">User Page</a></li>
		<li><a href="search.html">Product Search</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> Log out</a></li>
      </ul>
    </div>
  </div>
</nav>




			<%String email= request.getParameter("email");%>
			<%String password= request.getParameter("password");%>
			<%String name= request.getParameter("name");%>
			<%String address= request.getParameter("address");%>
			<%String phone= request.getParameter("phone");%>
			<%String website= request.getParameter("website");%>
			<%String user_type= request.getParameter("user_type");%>
			<% session.setAttribute("username", email);%>
			<% session.setAttribute("password", password);%>
<%
String db = "whms";
String user; // assumes database name is the same as username
  user = "root";
String pw = "Bobby";


	java.sql.Connection con; 
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cs157a?serverTimezone=EST5EDT",user, pw);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT COUNT(*) AS 'check' FROM whms.login WHERE email='" + email+"';");
	rs.next();
	if(rs.getInt("check")>0)
	{
		out.println("User already exists");
	}
	else{
		PreparedStatement ps = null;
		
		
		String sql="INSERT INTO whms.login(email, password) VALUES(?,?);";
		ps = con.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		int i = ps.executeUpdate();
		if(i > 0)
		{
		out.print("Login Updated Successfully<br/>");
		}
		else
		{
		out.print("There is a problem in updating password.<br/>");
		}
		
		
		sql="INSERT INTO whms.address(address) Values(?);";
		ps = con.prepareStatement(sql);
		ps.setString(1,address);
		int k = ps.executeUpdate();
		if(k > 0)
		{
		out.print("Address Updated Successfully<br/>");
		}
		else
		{
		out.print("There is a problem in updating address.<br/>");
		}
		
		rs = stmt.executeQuery("SELECT user_id FROM whms.login WHERE email='" + email+"' and password='"+password+"';");
		rs.next();
		int user_id=rs.getInt("user_id");
		session.setAttribute("user_id", user_id);
		
		rs = stmt.executeQuery("SELECT address_id FROM whms.address WHERE address='" + address+"';");
		rs.next();
		int address_id=rs.getInt("address_id");
		
		sql="INSERT INTO whms.user(user_id, user_name, user_type, address_id, email, phone_no) VALUES(?,?,?,?,?,?);";
		ps = con.prepareStatement(sql);
		ps.setInt(1, user_id);
		ps.setString(2, name);
		ps.setString(3, user_type);
		ps.setInt(4, address_id);
		ps.setString(5, email);
		ps.setString(6, phone);
		int j = ps.executeUpdate();
		if(j > 0)
		{
		out.print("User info Updated Successfully<br/>");
		}
		else
		{
		out.print("There is a problem in updating password.<br/>");
		}
		
	}

			
			
			
%>
<li><a href="editprofile.html"> Edit Profile</a></li>

</body> 
</html>
