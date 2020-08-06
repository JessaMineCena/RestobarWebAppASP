<html>

<body>

<%

	set conn=Server.CreateObject("ADODB.Connection")
	conn.Provider="Microsoft.ACE.OLEDB.12.0"
	conn.Open Server.MapPath("database/dbRestobar.accdb")
	
	
	'set rsItem = Server.CreateObject("ADODB.recordset")
	'rsItems.Open "SELECT Price FROM Items where itemNo=" &  , conn
	
	
	'sqlOrder = "INSERT INTO Order(tableID) VALUES('" & session("tableNo") & "')"
'		sqlOrder = "INSERT INTO OrderDetails(itemNo,Price) VALUES('"& myArray(x) &"', "& price &")"
'				
'					on error resume next
'				conn.Execute sqlOrder,recaffected
'				'conn.Execute sqlOrderDetails,recaffected
'				if err<>0 then
'					Response.Write("No update permissions!")
'				else
'					Response.Write("<h3>" & recaffected & " record added</h3>")
'				end if
%>

</body>
</html>