


<%
	talking = unescape(checkData(getData("talking")))

	talking = Replace(talking," ","")

	

	Select Case talking
		Case "���ھ��ȳ�"
			answer = " �� �ȳ��ϼ��� �贺��! ������ ���͵帱����?"
		Case "�ȳ�"
			answer = " �� �ȳ��ϼ��� �贺��!  ������ ���͵帱����?"
		Case "�ɽ���"
			answer = " �ɽ��ϸ� ��û�� ������"
		Case "¥����"
			answer = " ¥������ ¥��� �弼��"
		Case Else
			answer = " ���Ҹ� �ϴ��� �𸣰ھ��"
	End Select

	 Response.Write answer


%>