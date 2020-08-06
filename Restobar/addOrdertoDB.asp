<html>
<body>

<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open Server.MapPath("database/dbRestobar.accdb")


dim orDate, orTime, cno
orDate = date()
orTime = time()
cno = Request.Form("crewID")


'Response.write(orDate)
'Response.write(orTime)
'Response.write(tno)	


''" & tno & "',
',
', [empno], [posted], [void]
', 0, false, false
sql="INSERT INTO [tblOrder]([tableNo],[OrderDate],[OrderTime],[crewno])" 
sql= sql & "VALUES ("& Session("tableNo") &",'" & orDate & "','" & orTime & "'," & cno & ")"


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