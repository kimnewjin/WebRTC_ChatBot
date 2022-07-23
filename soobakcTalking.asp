


<%
	Call chkLogin(1)	
	talking = unescape(checkData(getData("talking")))
	

	Sql	=	"	Select top 1 idx From dbMember.dbo.tblMobileTempText	" &_
				"	Where soobakcText = '"&talking&"' "
	
	qIdx = getOne(sql)

	Sql	=	"	Select top 1 soobakcText from dbMember.dbo.tblMobileTempText As A	"	&_
				"	Where  (Select Count(1) From dbMember.dbo.tblMobileTempRelation	"	&_
				"		Where aidx = A.idx And qIdx= '"&qIdx&"') >0	"

	talking = getOne(Sql)

	If InStr(talking,"』』』") Then
		talking = Replace(talking,"』』』", userName)
	End IF
	
	


	Response.Write talking
%>