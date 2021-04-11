<!--#include file="md5.asp"-->
<!--#include file="conn.asp"-->
<%

returncode = request.QueryString("state")
customerid = request.QueryString("customerid")
sd51no = request.QueryString("sd51no")
orderid = request.QueryString("sdcustomno")
money = request.QueryString("ordermoney")
cardno = request.QueryString("cardno")
ext = request.QueryString("mark")
sign = request.QueryString("sign")
resign = request.QueryString("resign")
des = request.QueryString("des")

sign1 = "customerid="&customerid&"&sd51no="&sd51no&"&sdcustomno="&sdcustomno&"&mark="&mark&"&key="&key
sign1 = Ucase(ASP_MD5(sign1))

resign1 = "sign="&sign&"&customerid="&customerid&"&ordermoney="&ordermoney&"&sd51no="&sd51no&"&state="&state&"&key="&key
resign1 = Ucase(ASP_MD5(resign1))

If resign1=resign Then
	if int(returncode)=1  then
		'商户业务数据成功处理	
		response.write "<result>1</result>"
		response.write("充值成功")
	else
		'商户业务数据失败处理
		response.write("商户业务数据失败处理")
	end if
else
	response.write("交易信息被篡改")
end if 	
%>