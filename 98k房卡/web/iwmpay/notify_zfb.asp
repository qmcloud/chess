<!--#include file="conn.asp"-->
<!--#include file="md5.asp"-->
<%
'url = GetUrl
'response.write url
'response.end

notify_time = request.QueryString("notify_time")
notify_type = request.QueryString("notify_type")
notify_id = request.QueryString("notify_id")
sign_type = request.QueryString("sign_type")
subject = request.QueryString("subject")
payment_type = request.QueryString("payment_type")
trade_no = request.QueryString("trade_no")
trade_status = request.QueryString("trade_status")
gmt_create = request.QueryString("gmt_create")
gmt_payment = request.QueryString("gmt_payment")
gmt_close = request.QueryString("gmt_close")
refund_status = request.QueryString("refund_status")
gmt_refund = request.QueryString("gmt_refund")
seller_email = request.QueryString("seller_email")
buyer_email = request.QueryString("buyer_email")
seller_id = request.QueryString("seller_id")
buyer_id = request.QueryString("buyer_id")
price = request.QueryString("price")
total_fee = request.QueryString("total_fee")
quantity = request.QueryString("quantity")
body = request.QueryString("body")
discount = request.QueryString("discount")
is_total_fee_adjust = request.QueryString("is_total_fee_adjust")
use_coupon = request.QueryString("use_coupon")
extra_common_param = request.QueryString("extra_common_param")
Sign = request.QueryString("Sign")
out_trade_no = request.QueryString("out_trade_no")
'返回加密验证
'md5Str = "body="&body&"&buyer_email="&buyer_email&"&buyer_id="&buyer_id&"&discount="&discount&"&extra_common_param="&extra_common_param&"&gmt_close="&gmt_close&"&gmt_create="&gmt_create&"&gmt_payment="&gmt_payment&"&gmt_refund="&gmt_refund&"&is_total_fee_adjust="&is_total_fee_adjust&"&notify_id="&notify_id&"&notify_time="&notify_time&"&notify_type="&notify_type&"&out_trade_no="&out_trade_no&"&payment_type="&payment_type&"&price="&price&"&quantity="&quantity&"&refund_status="&refund_status&"&seller_email="&seller_email&"&seller_id="&seller_id&"&subject="&subject&"&total_fee="&total_fee&"&trade_no="&trade_no&"&trade_status="&trade_status&"&use_coupon="&use_coupon&key

'md5Sign = ASP_MD5(md5Str)
'response.write md5Str&"<br>"
'response.write md5Sign&"<br>"
'response.write Sign&"<br>"

dim arr(25)
arr(0) = Array("notify_time",notify_time)
arr(1) = Array("notify_type",notify_type)
arr(2) = Array("notify_id",notify_id)
arr(3) = Array("subject",subject)
arr(4) = Array("payment_type",payment_type)
arr(5) = Array("trade_no",trade_no)
arr(6) = Array("trade_status",trade_status)
arr(7) = Array("gmt_create",gmt_create)
arr(8) = Array("gmt_payment",gmt_payment)
arr(9) = Array("gmt_close",gmt_close)
arr(10) = Array("refund_status",refund_status)
arr(11) = Array("gmt_refund",gmt_refund)
arr(12) = Array("seller_email",seller_email)
arr(13) = Array("buyer_email",buyer_email)
arr(14) = Array("seller_id",seller_id)
arr(15) = Array("buyer_id",buyer_id)
arr(16) = Array("price",price)
arr(17) = Array("total_fee",total_fee)
arr(18) = Array("quantity",quantity)
arr(19) = Array("body",body)
arr(20) = Array("discount",discount)
arr(21) = Array("is_total_fee_adjust",is_total_fee_adjust)
arr(22) = Array("use_coupon",use_coupon)
arr(23) = Array("extra_common_param",extra_common_param)
arr(24) = Array("out_trade_no",out_trade_no)

For i = 0 To ubound(arr)-1
	For j = i + 1 To ubound(arr)-1
		If Asc(Left(arr(i)(0),1))>Asc(Left(arr(j)(0),1)) Then
			temp = arr(i)
			arr(i) = arr(j)
			arr(j) = temp
		End If 
		If Asc(Left(arr(i)(0),1))=Asc(Left(arr(j)(0),1)) Then
			If Len(trim(arr(i)(0))) > Len(trim(arr(j)(0))) Then 
				lens = Len(trim(arr(j)(0)))
				Else
				lens = Len(trim(arr(i)(0)))
			End if
			For abc = 2 To lens
				If Asc(Mid(arr(i)(0),abc,1)) > Asc(Mid(arr(j)(0),abc,1))  Then
					temp = arr(i)
					arr(i) = arr(j)
					arr(j) = temp
				End If
				if Asc(Mid(arr(i)(0),abc,1)) < Asc(Mid(arr(j)(0),abc,1))  Then
				    exit for
				end if
			Next
		End If
	Next
Next

'md5Str1 = arr(0)(0)&"="&arr(0)(1)
md5Str2 = arr(0)(0)&"="&arr(0)(1)
for i = 1 to UBound(arr)-1
	if arr(i)(1) <> "" then 
		md5Str1 = md5Str1 &"&amp"& arr(i)(0)&"="&arr(i)(1)
		md5Str2 = md5Str2 &"&"& arr(i)(0)&"="&arr(i)(1)
	end if
next
'md5Str1 = md5Str1&key
md5Str2 = md5Str2&key
'md5Sign1 = ASP_MD5(md5Str1)
md5Sign2 = ASP_MD5(md5Str2)

'response.write md5Str2&"<br>"
'response.write md5Sign2&"<br>"
'response.write Sign&"<br>"



If Sign=md5Sign2 Then
	if trade_status = "TRADE_SUCCESS"  then
		'商户业务数据成功处理	
		
		checkOrder trade_no,total_fee,r8_MP
		response.write "OK"
	else
		'商户业务数据失败处理
		response.write("商户业务数据失败处理")
	end if
else
	response.write("交易信息被篡改")
end if

Function GetUrl()    
   On Error Resume Next    
   Dim strTemp    
   If LCase(Request.ServerVariables("HTTPS")) = "off" Then    
   strTemp = "http://"    
   Else    
   strTemp = "https://"    
   End If    
   strTemp = strTemp & Request.ServerVariables("SERVER_NAME")    
   If Request.ServerVariables("SERVER_PORT") <> 80 Then strTemp = strTemp & ":" & Request.ServerVariables("SERVER_PORT")    
   strTemp = strTemp & Request.ServerVariables("URL")    
   If Trim(Request.QueryString) <> "" Then strTemp = strTemp & "?" & Trim(Request.QueryString)    
   GetUrl = strTemp    
  End Function  
 	
%>