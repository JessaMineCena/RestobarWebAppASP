<%

set conn=Server.CreateObject("ADODB.Connection")
Conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open Server.MapPath("database/dbRestobar.accdb")
set rs = Server.CreateObject("ADODB.recordset")
rs.Open "SELECT * FROM Items",conn


do until rs.EOF
	response.write"<td>" & rs.fields("itemno") & "</td> " 
	rs.movenext
loop

rs.close
conn.close

'1) Create ADO Database Connection
'2) Open Database Connection
'3) Create ADO Recordset
'4) Open Recordset
'5) extract data from the recordset
'6) close recordset
'7) close connection

'INSERT INTO tablename(fields) VALUES(values corresponding to the fields)
'SELECT fields FROM tablename WHERE condition here ORDER BY column name ASC/DESCENDING
'UPDATE tablename SET columnname = '"& value &"'
'DELETE FROM tablename WHERE columnname = '"& value &"'

' "& numerical &", '"& alphanumerical &"'

sql = "INSERT INTO tablename () VALUES('"&&"')"
on error resume next
conn.Execute sql, recaffected
if err<> 0 then
reponse.write("fail")
else
response.write("success")
end if
conn.close

%>

