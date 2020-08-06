<html>
<body>


<% 
Dim sql, qName, qTitle
qName = Request.Form("empName")
qTitle = Request.Form("empTitle")

set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open Server.MapPath("database/dbRestobar.accdb")

sql = "INSERT INTO [customers] (companyname, contactname) VALUES ('" & qName & "', '" & qTitle & "')"

on error resume next
conn.Execute sql,recaffected
if err<>0 then
  Response.Write("No update permissions!")
else
  Response.Write("<h3>" & recaffected & " record added</h3>")
end if
conn.close

%>


</body>
</html>