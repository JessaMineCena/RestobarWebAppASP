<html>
<body>

<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open "D:\cena\database\dbItems.accdb"

set rs=Server.CreateObject("ADODB.Recordset")
rs.open "SELECT * FROM User WHERE username = '" & request.form("username") & "'",conn


session("comname")=request.form("comname")
session("userid")=request.form("userid")
response.write session("username") & "<br>"
response.write session("password")
conn.close
%>

</body>
</html>