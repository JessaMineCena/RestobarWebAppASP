
<!--#include file="fpdf.asp"-->

<%
set conn = Server.CreateObject("ADODB.Connection")
conn.Provider = "Microsoft.ACE.OLEDB.12.0"
conn.Open Server.MapPath("database/dbRestobar.accdb")

set rsItems= server.createobject("adodb.recordset")
rsItems.open "SELECT * FROM Items",conn

Set pdf=CreateJsObject("FPDF")
pdf.CreatePDF()
pdf.SetPath("fpdf/")
pdf.SetFont "Arial","",11
pdf.Open()
pdf.AddPage()

'table header
pdf.SetFont "Arial","b",11

pdf.Cell 30,5,"Item No",0,0,"C"
pdf.Cell 90,5,"Name",0,0,"C"
pdf.Cell 20,5,"Description",0,0,"C"
pdf.Cell 20,5,"Price",0,0,"C"
pdf.Cell 20,5,"Quantity",0,1,"C"

pdf.SetFont "courier","b",11

'insert to the table
do until rsItems.EOF = true
	pdf.Cell 30,5,"rsItems.fields('itemNo')",0,0,"C"
	pdf.Cell 90,5,"rsItems.fields('name')",0,0,"L"
	pdf.Cell 20,5,"rsItems.fields('description')",0,0,"L"
	pdf.Cell 20,5,"rsItems.fields('price')",0,0,"C"
	pdf.Cell 20,5,"rsItems.fields('quantity')",0,1,"C"
loop

rsItems.close
conn.close
pdf.Close()
pdf.Output()

%>