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

	<table class = "table" border = 0>


	<%
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
			
			rsItems.Open "SELECT * FROM Items where catID=" & category, conn
			
			
			do until rsItems.EOF = true
			
				
				if count < 2 then
			
						response.write "<td><img width = '300' height = '200' src=' image/" & rsItems.fields("itemNo") & ".jpg' /><h3>" & rsItems.fields("name") &  "</h3>" & rsItems.fields("description") & "<br />Php " & formatnumber(rsItems.fields ("price"))
						response.write "<br />Qty.: <input type='Number' name='qty' min='1' value='1' disable>  <input type='Submit' class='btn btn-outline-success' value='Select'></td>" 
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
	%>

</table>

</div>
</div>

</body>
</html>