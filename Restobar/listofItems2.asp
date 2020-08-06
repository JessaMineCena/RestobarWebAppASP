<html>
<head></head>
<body>
<table border = 1 cellpadding= 5 cellspacing = 20>

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
	response.write "<th><b>"  & rsCategory.fields("catName") &  "</b></th>"
	response.write "</tr>"
	
	rsItems.Open "SELECT * FROM Items where catID=" & category, conn
	
	do until rsItems.EOF = true
	
		
		if count < 2 then
	
				response.write "<td><img width = '300' height = '200' src=' image/" & rsItems.fields("itemNo") & ".jpg' /><h3>" & rsItems.fields("name") &  "</h3>" & rsItems.fields("description") & "<br />Php " & formatnumber(rsItems.fields ("price"))
				response.write "<br />Qty.: <input type='Number' name='qty' min='1' value='1'> <input type='Submit' value='Select'></td>" 
				count = count + 1
				rsItems.MoveNext

		else 
			response.write "<tr></tr>"
			count = 0
		end if 
		
		
	loop
	
	rsItems.close
	count = 0
	rsCategory.movenext
	
loop

rsCategory.close

conn.close
%>

</table>
