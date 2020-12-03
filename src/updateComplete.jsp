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
        <li><a href="generateBill.jsp">Orders</a></li>
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

<% String username = (String)session.getAttribute("username");%>
<% String password = (String)session.getAttribute("password");%>

<%String product_id= request.getParameter("product_id");%>
<%String category= request.getParameter("category");%>
<%String name= request.getParameter("name");%>
<%String description= request.getParameter("description");%>

<h2>Update Status</h2>

<%
String db = "whms";
        String user; // assumes database name is the same as username
          user = "root";
        String pw = "Bobby";
		
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cs157a?serverTimezone=EST5EDT",user, pw);
            PreparedStatement ps = null;
           
  if(category!=null)
{
	String sql="Update whms.product set category_id=? WHERE product_id='"+product_id+"';";
	ps = con.prepareStatement(sql);
	ps.setString(1,category);
	int i = ps.executeUpdate();
	
	if(i > 0)
	{
	out.print("Category Updated Successfully to: "+category+" <br/>");
	}
	else
	{
	out.print("There is a problem in updating category.<br/>");
	}
	
} 

if(name.length()>0)
{
	String sql1="Update whms.product set product_name=? WHERE product_id='"+product_id+"';";
	ps = con.prepareStatement(sql1);
	ps.setString(1,name);
	int i = ps.executeUpdate();
	
	if(i > 0)
	{
	out.print("Product name Updated Successfully to: "+name+" <br/>");
	}
	else
	{
	out.print("There is a problem in updating name.<br/>");
	}
}	

if(description.length()>0)
{
	String sql="Update whms.product set description=? WHERE product_id='"+product_id+"';";
	ps = con.prepareStatement(sql);
	ps.setString(1,description);
	int i = ps.executeUpdate();
	if(i > 0)
	{
	out.print("description Updated Successfully<br/>");
	}
	else
	{
	out.print("There is a problem in updating description.<br/>");
	}
}




			
			
			
%>

<li><a href="update.jsp">update another product</a></li>
<li><a href="addProduct.jsp">add a product</a></li>
</body>
</html>