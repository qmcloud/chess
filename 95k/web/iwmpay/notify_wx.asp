<!--#include file="conn.asp"-->
<!--#include file="yeepayCommon.asp"-->
<!--#include file="md5.asp"-->
<%
state = request.QueryString("state")
customerid = request.QueryString("customerid")
sd51no = request.QueryString("sd51no")
sdcustomno = request.QueryString("sdcustomno")
ordermoney = request.QueryString("ordermoney")
cardno = request.QueryString("cardno")
mark = request.QueryString("mark")
sign = request.QueryString("sign")
resign = request.QueryString("resign")
des = request.QueryString("des")

sign1 = "customerid="&customerid&"&sd51no="&sd51no&"&sdcustomno="&sdcustomno&"&mark="&mark&"&key="&key
sign1 = Ucase(ASP_MD5(sign1))

resign1 = "sign="&sign&"&customerid="&customerid&"&ordermoney="&ordermoney&"&sd51no="&sd51no&"&state="&state&"&key="&key
resign1 = Ucase(ASP_MD5(resign1))



If resign1=resign Then
	if int(state)=1  then
		
		'商户业务数据成功处理	
		checkOrder sdcustomno,ordermoney,mark
		response.write "<result>1</result>"
	else
		'商户业务数据失败处理
		response.write("商户业务数据失败处理")
	end if
else
	response.write("交易信息被篡改")
end if 	
%>