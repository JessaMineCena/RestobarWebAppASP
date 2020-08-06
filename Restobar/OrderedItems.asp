<%
Dim myString, myArray
dim s

s = Request.form("itemno")
myString = s

myArray = Split(myString, ",")

for i=0 to UBound(myArray)
response.write myArray(i)
Next
%>