<% 

set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.ACE.OLEDB.12.0"
conn.Open Server.MapPath("database/dbRestobar.accdb")
'conn.Open ("database/dbItems.accdb")



%>


