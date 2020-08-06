<html>
<head></head>
<body>
<table border = 1 cellpadding= 5 cellspacing = 20>

<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open Server.MapPath("database/dbRestobar.accdb")


set rsItems= server.createobject("adodb.recordset")
rsItems.open "SELECT * FROM Items ORDER by catID asc",conn


Dim category
Dim item

	
	do until rsItems.EOF

		
				response.write "<td><img width = '300' height = '200' src=' image/" & rsItems.fields("itemNo") & ".jpg' /><h3>" & rsItems.fields("name") &  "</h3>" & rsItems.fields("description") & "<br />Php " & formatnumber(rsItems.fields ("price"))
				response.write "<br />Qty.: <input type='Number' name='qty' min='1' value='1'> <input type='Submit' value='Select'></td>" 

				rsItems.MoveNext

			response.write "<tr></tr>"

	loop


rsItems.close
conn.close
%>
