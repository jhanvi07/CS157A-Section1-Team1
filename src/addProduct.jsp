<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <title>Add product</title>
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
        <li><a href="orders.jsp">Orders</a></li>
        <li><a href="products.html">Products</a></li>
        <li><a href="userpage.jsp">User Page</a></li>
		<li><a href="search.html">Product Search</a></li>
		<li><a href="update.jsp">Update Product</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> Log out</a></li>
      </ul>
    </div>
  </div>
</nav>

<h2>Add product</h2>
    <div class="container">
        <div class="row mt-3">
            <form class="offset-sm-4 col-sm-4" action="addProductComplete.jsp" method="POST">

				  <select type="text" class="form-control" name="category" id="category">
					<option disabled selected>Select category</option>
					<option value="1">Electronics</option>
					<option value ="2">Grocery</option>
					<option value="3">Beauty</option>
					<option value="4">Health</option>
					<option value="5">Toys</option>
					<option value="6">Sports</option>
					<option value="7">Outdoors</option>
					<option value="8">Automotive</option>
					<option value="9">Pet</option>
					<option value="10">Home</option>
					<option value="11">Clothing</option>
					<option value="12">Shoes</option>
					<option value="13">Jewelry</option>
					<option value="14">Books</option>
					<option value="15">Music</option>

				  </select>
        <input type="text" class="form-control" placeholder="Enter product name" name="name" id="name">
				<input type="text" class="form-control" placeholder="Enter product description" name="description" id="description">
				<input type="number" class="form-control" placeholder="Enter unit price" min="1.00" step=".01" name="price" id="price">
				<button class="btn btn-primary">Submit</button>

            </form>
        </div>
    </div>

</body>