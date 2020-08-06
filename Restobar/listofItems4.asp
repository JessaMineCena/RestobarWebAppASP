<!DOCTYPE html>
<html lang="en">
<head>
  <title>Menu</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
  <script src="bootstrap/jquery.min.js"></script>
  <script src="bootstrap/popper.min.js"></script>
  <script src="bootstrap/bootstrap.min.js"></script>
</head>
<body>

	
<div class="container">

	<div class = "page-header">
	<center> <h1> <b> Restobar Menu </b></h1> </center>
	</div>

	<div class ="jumbotron jumbotron-fluid">

		<form method="post" action="listofItems4.asp">
		<table class = "table" border = 0>

		<%
			
			Session("tableNo") = Request.form("tableselect")
			
			
			set conn=Server.CreateObject("ADODB.Connection")
			conn.Provider="Microsoft.ACE.OLEDB.12.0"
			conn.Open Server.MapPath("database/dbRestobar.accdb")

			set rsCategory= server.createobject("adodb.recordset")
			rsCategory.open "SELECT * FROM Category",conn

			set rsItems= server.createobject("adodb.recordset")

			Dim category
			Dim count
			count = 0
				
			do until rsCategory.EOF = true
					
				category = rsCategory.fields("catID")
					
				response.write "<tr>"
				response.write "<td> <p class='bg-light text-dark'><b><h2>"  & rsCategory.fields("catName") &  "</h2></b></p></td>"
				response.write "</tr>"
					
				rsItems.Open "SELECT * FROM Items where catID=" & category , conn
				//change to sql statement that only display available menu
				//code: SELECT * FROM Items WHERE available = TRUE
					
					
				do until rsItems.EOF = true
					' output items for each category
					if count < 2 then
							response.write "<td><img width = '300' height = '200' src=' image/" & rsItems.fields("itemNo") & ".jpg' /><h3>" & rsItems.fields("name") &  "</h3>" & rsItems.fields("description") & "<br />Php " & formatnumber(rsItems.fields ("price"))
							response.write "<br />Qty.: <input type='Number' name='quantity' min='1' placeholder ='1'> Select:  <input type='checkbox' name='itemNo' value='" & rsItems.fields("itemNo") &"'></td>" 
							count = count + 1
							rsItems.MoveNext
					else 
						response.write "<tr> </tr>"
						count = 0
					end if 
					
				loop
					
				rsItems.close
				rsCategory.movenext
				count = 0

			loop
				
				rsCategory.close
				conn.close
				
			
			Dim myString, myArray
			dim s
			
			'array for the items selected
			s = Request.form("itemNo")
			myString = s
			myArray = Split(myString, ",")
			
			
			Dim myString2, myArray2
			dim s2
			
			'array for the quantity in each item selected
			s2 = Request.form("quantity")
			myString2 = s2
			myArray2 = Split (myString2, ",")
			
			'output for items selected
			for i=0 to UBound(myArray)
			response.write myArray(i)
			Next
			
			'output for quantity of item selected
			for i=0 to UBound(myArray2)
			response.write myArray2(i)
			Next
			
			
			

		%>
		</table>
		<tr><td><center><input type='Submit' class='btn btn-outline-success' value='Place Order'><center></td></tr>
		</form>
		

	</div>
</div>

</body>
</html>