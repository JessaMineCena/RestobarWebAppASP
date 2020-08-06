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

		<form method="post" action="listofItems6.asp">
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
						
						response.write "<br />Qty.: <input type='Number' name='quantity' min='1' placeholder ='1'> Select:  <input type='checkbox' name='itemNo' value='" & rsItems.fields("itemNo") &" "& formatnumber(rsItems.fields ("price")) &"'></td>" 
						'if Request.form("itemNo") <> unchecked then
						'	response.write"<input type='hidden' name='itemprice' value= "& formatnumber(rsItems.fields ("price")) &">"
						'end if
						'<input type='checkbox' name='itemprice' value= "& formatnumber(rsItems.fields ("price")) &">
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
				
			Dim stringQty, arrayQty
			dim qty
			
			'array for the quantity in each item selected
			qty= Request.form("quantity")
			stringQty = qty
			arrayQty = Split (stringQty, ",")
			
			Dim myString3, myArray3
			dim s3
			
			
			s3 = Request.form("itemprice")
			myString3 = s3
			myArray3 = Split (myString3, ",")
			
			for i=0 to UBound(myArray3)
			response.write myArray3(i)
			Next
			
			
			
		%>
		</table>
		<tr><td><center><input type='Submit' class='btn btn-outline-success' value='Place Order'><center></td></tr>
		</form>
		

	</div>
</div>

</body>
</html>