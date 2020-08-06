<%
Session("tableNo") = Request.form("tableselect")
response.write session("tableNo")
%>
