<!doctype html>
<html lang="en">
 <head>
  <meta charset="euc-kr">
	<script type="text/javascript" src="/common/js/jquery.js"></script>
  <title>Document</title>
  <Script language="javascript">
	function goAction(){
		var chkValue = $("input[name='chkValue']").val();			
		if (chkValue ==""){
			$("input[name='chkValue']").focus();			
		}
		$("#kText").html(chkValue);
		androidkim.altMSG(chkValue);

	 }
  </Script>

 </head>
 <body>
  
	<input type="text" name="chkValue" value="">
	<div id="kText">
	</div>
	<br/>
	<a href="javascript: goAction();">[���信�� �佺Ʈ�� 000����]</a>

	<br/>
	<a href="javascript: window.location.reload();">[���ΰ�ħ]</a>
	<%
		chkAgent =  LCase(request.servervariables("HTTP_USER_AGENT"))

		Response.Write chkAgent
	%>
 </body>
</html>
