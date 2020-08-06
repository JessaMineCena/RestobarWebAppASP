<%@language=vbscript%>

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

pdf.Cell 50,10,"Item No"
pdf.Cell 20,10,"Name"
pdf.Cell 80,10,"Description"
pdf.Cell 20,10,"Price"
pdf.Cell 20,10,"Quantity"

do until rsItems.EOF = true

loop

pdf.Close()
pdf.Output()
%>