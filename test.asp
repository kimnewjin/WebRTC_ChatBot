<%
	 For Each strKey In Request.ServerVariables

response.write "[[[[[[[[strKey = ]]]]]]]]]]]]" & strKey & "<BR>"
response.write "[[[[[[[Request.ServerVariables(strKey) = ]]]]]]]" & Request.ServerVariables(strKey) & "<BR>"

Next

 



%>