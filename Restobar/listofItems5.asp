<!DOCTYPE html>
<html lang="en">
<head>
  <title>Menu</title>
  <!--#include file=bootstrapinclude.asp-->
</head>
<body>

	
<div class="container">

	<div class = "page-header">
	<center> <h1> <b> Restobar Menu </b></h1> </center>
	</div>

	<div class ="jumbotron jumbotron-fluid">

		<form method="post" action="listofItems5.asp">
		<table class = "table" border = 0>

		<%
			'addOrdertoDB
			Session("tableNo") = Request.form("tableselect")
			'response.write Session("tableNo")
			
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
				'conn.close
				
			
			Dim stringItem, arrayItem
			dim item 'for item and price
			Dim stringQty, arrayQty
			dim qty	'for quantity
			
			'call price
			set rsItemPrice= server.createobject("adodb.recordset")
			dim stringPrice, arrayPrice, Price
			
			'array for the items selected
			item = Request.form("itemNo")
			stringItem = item
			arrayItem = Split(stringItem, ",")
		
			'array for the quantity in each item selected
			qty = Request.form("quantity")
			stringQty = qty
			arrayQty = Split (stringQty, ",")
			
		'	for i= LBound(arrayItem) to UBound(arrayItem)
		'		
		'		'response.write "   index: " & i
		'		'response.write " element: " & arrayItem(i)
		'		rsItemPrice.open "SELECT price FROM Items WHERE itemNo =" & arrayItem(i),conn
		'		
		'		
		'		do until rsItemPrice.EOF = true
		'			
		'			Price = formatnumber(rsItemPrice.fields("price"))
		'			
		'			'arrayPrice = split(price, ",")
		'			rsItemPrice.MoveNext
		'			
		'		loop
		'		rsItemPrice.close
		'		
		'		stringPrice = price
		'		arrayPrice = Split(stringPrice, ",")
		'		'stringPrice = Price
		'		
		'	Next
			
			'output for items selected and price
			for i = 0 to UBound(arrayItem)
			rsItemPrice.open "SELECT price FROM Items WHERE itemNo =" & arrayItem(i),conn
			Price = formatnumber(rsItemPrice.fields("price"))
			stringPrice = price
			arrayPrice = Split(stringPrice, ",")
			response.write arrayItem(i) & " " & arrayPrice(i)
			rsItemPrice.close
			Next
			
			
			'for INSERT INTO ORDER DETAILS
			
		'	for i=0 to UBound(arrayPrice)
		'	Response.write arrayPrice(i)
		'	next

			
			conn.close
		%>
		</table>
		<center>
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Submit</button>
		</center>
			<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="modal-title">PLACE ORDER</h4>
		  </div>
		  <div class="modal-body">
			<p>Please input Crew ID</p>
			<p><input type="text" name="crewID"></p>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<input type='Submit' class='btn btn-outline-success' value='PlaceOrder'>
		  </div>
		</div>

	  </div>
	</div>
		<tr><td><center><center></td></tr>
		</form>
		

	</div>
</div>

</body>
</html>