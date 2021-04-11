<!--#include file="conn.asp"-->
<!--#include file="yeepayCommon.asp"-->
<%

p1_MerId = request.QueryString("p1_MerId") 
r0_Cmd = request.QueryString("r0_Cmd")
r1_Code = request.QueryString("r1_Code")
r2_TrxId = request.QueryString("r2_TrxId")
r3_Amt = request.QueryString("r3_Amt")
r4_Cur = request.QueryString("r4_Cur")
r5_Pid = request.QueryString("r5_Pid")
r6_Order = request.QueryString("r6_Order")
r7_Uid = request.QueryString("r7_Uid")
r8_MP = request.QueryString("r8_MP")
r9_BType = request.QueryString("r9_BType")
rb_BankId = request.QueryString("rb_BankId")
ro_BankOrderId = request.QueryString("ro_BankOrderId")
rp_PayDate = request.QueryString("rp_PayDate")
rq_CardNo = request.QueryString("rq_CardNo")
ru_Trxtime = request.QueryString("ru_Trxtime")
hmac = request.QueryString("hmac")

'卡类独特返回
cardNo = request.QueryString("cardNo")
cardPwd = request.QueryString("cardPwd")
typeid = request.QueryString("typeid")
cardstatus=request.QueryString("cardstatus")

	'网银加密
	hmac_sign = getCallbackHmacString(r0_Cmd,r1_Code,r2_TrxId,r3_Amt,r4_Cur,r5_Pid,r6_Order,r7_Uid,r8_MP,r9_BType)
	'点卡加密
'	sign_card="returncode="&returncode&"&userid="&uid&"&orderid="&orderid&"&cardstatus="&cardstatus&"&cardNo="&cardNo&"&cardPwd="&cardPwd&"&typeid="&typeid&"&money="&money&"&keyvalue="&key
	'md5_sign_card = ASP_MD5(sign_card)
	

If hmac_sign=hmac Then
	if int(r1_Code)=1  then
		
		'商户业务数据成功处理	
		checkOrder r6_Order,r3_Amt,r8_MP
		response.write "SUCCESS"
	else
		'商户业务数据失败处理
		response.write("商户业务数据失败处理")
	end if
else
	response.write("交易信息被篡改")
end if 	
%>