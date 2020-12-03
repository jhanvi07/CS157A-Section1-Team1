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
        <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
      </ul>
    </div>
  </div>
</nav>


<%String password= request.getParameter("password");%>

<% String username = (String)session.getAttribute("username");%>

<% int user_id = (int)session.getAttribute("user_id");%>


<%String new_email= request.getParameter("new_email");%>
<%String new_password= request.getParameter("new_password");%>
<%String new_name= request.getParameter("new_name");%>
<%String new_address= request.getParameter("new_address");%>
<%String new_phone= request.getParameter("new_phone");%>
<%String new_website= request.getParameter("new_website");%>



<%
String db = "whms";
        String user; // assumes database name is the same as username
          user = "root";
        String pw = "Bobby";
		
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cs157a?serverTimezone=EST5EDT",user, pw);
            PreparedStatement ps = null;
            try
{
if(new_email.length()>0)
{
	String sql="Update whms.login set email=? WHERE email='"+username+"';";
	ps = con.prepareStatement(sql);
	ps.setString(1,new_email);
	int i = ps.executeUpdate();
	
	String sql1="Update whms.user set email=? WHERE email='"+username+"';";
	ps = con.prepareStatement(sql1);
	ps.setString(1,new_email);
	int j = ps.executeUpdate();
	if(i > 0 && j > 0)
	{
	out.print("Email Updated Successfully<br/>");
	session.setAttribute("username", new_email);
	}
	else
	{
	out.print("There is a problem in updating email.<br/>");
	}
	
	
}

if(new_password.length()>0)
{
	String sql="Update whms.login set password=? WHERE email='"+username+"';";
	ps = con.prepareStatement(sql);
	ps.setString(1,new_password);
	int i = ps.executeUpdate();
	if(i > 0)
	{
	out.print("Password Updated Successfully<br/>");
	session.setAttribute("password", new_password);
	}
	else
	{
	out.print("There is a problem in updating password.<br/>");
	}
}	

if(new_name.length()>0)
{
	String sql="Update whms.user set user_name=? WHERE email='"+username+"';";
	ps = con.prepareStatement(sql);
	ps.setString(1,new_name);
	int i = ps.executeUpdate();
	if(i > 0)
	{
	out.print("Name Updated Successfully<br/>");
	}
	else
	{
	out.print("There is a problem in updating name.<br/>");
	}
}

if(new_address.length()>0)
{
	String sql="Update whms.address set address=? WHERE (SELECT address_id FROM whms.user WHERE email='"+username+"') = address.address_id;";
	ps = con.prepareStatement(sql);
	ps.setString(1,new_address);
	int i = ps.executeUpdate();
	if(i > 0)
	{
	out.print("Address Updated Successfully<br/>");
	}
	else
	{
	out.print("There is a problem in updating email.<br/>");
	}
}

if(new_phone.length()>0)
{
	String sql="Update whms.user set phone_no=? WHERE email='"+username+"';";
	ps = con.prepareStatement(sql);
	ps.setString(1,new_phone);
	int i = ps.executeUpdate();
	if(i > 0)
	{
	out.print("Phone Number Updated Successfully<br/>");
	}
	else
	{
	out.print("There is a problem in updating phone number.<br/>");
	}
}
	
}
	catch(SQLException sql)
	{
	request.setAttribute("error", sql);
	out.println(sql);
	}

if(new_website.length()>0)
{
	String check="SELECT user_type FROM whms.user WHERE email='"+username+"';";
	
	ResultSet rs = con.createStatement().executeQuery(check);
	rs.next();
	if(rs.getString("user_type").equals("customer"))
	{
		out.println("Customers do not have website<br/>");
	}
	else if(rs.getString("user_type").equals("seller"))
	{
		String sql="Update whms.user set website=? WHERE email='"+username+"';";
		ps = con.prepareStatement(sql);
		ps.setString(1,new_website);
		int i = ps.executeUpdate();
		if(i > 0)
		{
		out.print("Phone Number Updated Successfully<br/>");
		}
		else
		{
		out.print("There is a problem in updating website.<br/>");
		}
	}
}

			
			
			
%>

<li><a href="userpage.jsp">return to user profile</a></li>

</body>
</html>
