<html>
<head></head>
<body>


<div class="container">

	<div class = "page-header">
	<center> <h1> <b>Table List</b></h1> </center>
	</div>
		

	<div class ="jumbotron jumbotron-fluid">
	<center>
		<table class = "table" border = 0>
		<form method="post" action="listofitems5.asp">
			<%
			set conn=Server.CreateObject("ADODB.Connection")
			conn.Provider="Microsoft.ACE.OLEDB.12.0"
			conn.Open Server.MapPath("database/dbRestobar.accdb")
			
			set rsTables= server.createobject("adodb.recordset")
			rsTables.open "SELECT * FROM tableList",conn
			
			Dim category
			Dim item
			
			
				
				do until rsTables.EOF
					
					response.write"<p>"
					response.write "<td> <input type='Submit' name= 'tableselect' value = '"& rsTables.fields("tableNo") &"' >"
					response.write  rsTables.fields("tableName") & "</br>    " & rsTables.fields("tableDescription") & "</td>"
					response.write "<p></p>"
					rsTables.MoveNext	
					response.write "<tr></tr></p>"
					
				loop
				
				'response.write" <td><input type='Submit' class='btn btn-outline-success' value='Select'></td>"
				
			rsTables.close
			conn.close			
			
			%>
			
		</form>
		</table>
	</center>
	</div>
</div>
