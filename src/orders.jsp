<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
  <head>
    <title>Track Order</title>
    </head>
  <body>

    <div class="container" style="margin-top: 5vh;">
    <h1>Track Order</h1>
    <form action="trackOrder.jsp" method="POST">
        <input type="number" placeholder="order id" class="form-control" name="order_id" id="order_id">
    </form>
    </div>
  </body>
</html>
