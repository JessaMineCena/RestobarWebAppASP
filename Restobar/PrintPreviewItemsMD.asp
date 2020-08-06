<%@language=vbscript%>

<!--#include file="fpdf.asp"-->

<%

set conn = Server.CreateObject("ADODB.Connection")
conn.Provider = "Microsoft.ACE.OLEDB.12.0"
conn.Open Server.MapPath("database/dbRestobar.accdb")

set rsCategory= server.createobject("adodb.recordset")
rsCategory.open "SELECT * FROM Category",conn
set rsItems= server.createobject("adodb.recordset")

Set pdf=CreateJsObject("FPDF")
pdf.CreatePDF()
pdf.SetPath("fpdf/")
pdf.SetFont "times","",11
pdf.Open()
pdf.AddPage()

'header

pdf.Cell 35,5,"Menu List",0,1,"L"
pdf.Cell 35,5,"Ala Turka Restaurant",0,1,"L"


pdf.Cell 35,5,"",0,0,""
pdf.Cell 35,5,"",0,1,""

'table header
pdf.SetFont "Arial","b",10

pdf.Cell 10,5,"Item No",0,0,"C"
pdf.Cell 50,5,"Name",0,0,"C"
pdf.Cell 95,5,"Description",0,0,"L"
pdf.Cell 20,5,"Price",0,0,"C"
pdf.Cell 20,5,"Quantity",0,1,"C"

' pdf.cell width, height, txt, border, current postion
	
pdf.SetFont "courier","",8

Dim category

do until rsCategory.EOF = true
	
	category = rsCategory.fields("catID")

	pdf.Cell 35,5,rsCategory.fields("catName")
	pdf.Cell 35,5,"",0,1,""
	
	rsItems.Open "SELECT * FROM Items where catID=" & category , conn
	
	do until rsItems.EOF = true

		pdf.Cell 10,5,rsItems.fields("itemNo")
		pdf.Cell 50,5,rsItems.fields("name")
		pdf.SetFont "courier","", 7
		pdf.Cell 100,5,rsItems.fields("description")
		pdf.SetFont "courier","", 8
		pdf.Cell 20,5,formatnumber(rsItems.fields("price"))
		pdf.Cell 20,5,rsItems.fields("quantity")

		rsItems.movenext
		
		pdf.Cell 120,5,"",0,0,"C"
		pdf.Cell 35,5,"",0,1,"C"
	loop
	
	rsCategory.movenext

loop

pdf.Close()
pdf.Output()

rsItems.close
conn.close
%>