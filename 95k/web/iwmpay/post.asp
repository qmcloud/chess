<!--#include file="conn.asp"-->
<!--#include file="yeepayCommon.asp"-->
<!--#include file="md5.asp"-->
<%

Function CheckMobile()
 if InStr(LCase(Request.ServerVariables("HTTP_ACCEPT")),"text/vnd.wap.wml")>0 then  
  CheckMobile=True:Exit Function  
 end if
  
 '是否专用wap浏览器  
 If InStr(LCase(Request.ServerVariables("HTTP_ACCEPT")), "application/vnd.wap.xhtml+xml") Or Not IsEmpty(Request.ServerVariables("HTTP_X_PROFILE")) Or Not IsEmpty(Request.ServerVariables("HTTP_PROFILE")) Then  
   CheckMobile=True:Exit Function  
 End If   
 
 '是否（智能）手机浏览器  
 Dim MobileBrowser_List,PCBrowser_List,UserAgent  
 Set MobileBrowser_List = New RegExp '建立正则表达式  
 Set PCBrowser_List = New RegExp '建立正则表达式  
 MobileBrowser_List.Pattern ="up.browser|up.link|mmp|iphone|android|wap|netfront|java|opera\smini|ucweb|windows\sce|symbian|series|webos|sonyeriCSSon|sony|blackberry|cellphone|dopod|nokia|samsung|palmsource|palmos|pda|xphone|xda|smartphone|pieplus|meizu|midp|cldc|brew|tear" 
 PCBrowser_List.Pattern="mozilla|chrome|safari|opera|m3gate|winwap|openwave"  
 UserAgent = LCase(Request.ServerVariables("HTTP_USER_AGENT"))  
  
 If MobileBrowser_List.Test(UserAgent) Then  
    CheckMobile=True:Exit Function  
 ElseIf PCBrowser_List.Test(UserAgent) Then '未知手机浏览器，其UA标识为常见浏览器，不跳转  
    CheckMobile=False:Exit Function  
 Else   
    CheckMobile=False   
 End If 
End Function
	username = request.form("username")
	username2 = request.form("username")
	money = int(request.form("rechargeMoney"))
	paytype = request.form("payType")
	
	if Paytype="ALIPAY" then
	  if CheckMobile then  '如果是手机浏览器那么就跳转到手机客户端
             paytype = "zhifubao-wap"
          else 
             paytype = "zhifubao"
          end if
        end if

        if paytype="WECHATQRSM" then
		paytype = "weixin"
	end if
	
	
	if Paytype="WECHATQR" then
	if CheckMobile then  '如果是手机浏览器那么就跳转到手机客户端
   paytype = "weixin-wap"
    else 
   paytype = "weixin"
    end if
    end if
	BC = "BANK"
	orderid=createOrderId()
	ext=username
	
if username="" or username2="" or money="" or paytype="" then
	response.Write "缺少参数"
	response.End
end if

if username<>username2 then
	response.Write "充值帐号不一致"
	response.End
end if

if paytype="" then
	response.Write "请选择充值方式"
	response.End
end if

if BC = "" then
	response.Write "提交非法"
	response.End
end if
	
	p0_Cmd = "buy"
	p1_MerId = uid
	p2_Order = orderid
	p3_Amt = money
	p4_Cur = "CNY" 
	p5_Pid = ""
	p6_Pcat = ""
	p7_Pdesc = ""
	p8_Url = notify_url '服务器端点对点发货通知的地址，地址不能带参数。
	p9_SAF = "0"
	pa_MP = ext
	pd_FrpId = paytype '字段可依照附录:支付通道编码列表

	pr_NeedResponse = "1"
	hmac = HTMLcommom(p1_MerId,p2_Order,p3_Amt,p4_Cur,p5_Pid,p6_Pcat,p7_Pdesc,p8_Url,pa_MP,pd_FrpId,pr_NeedResponse)
	'p1_MerId=13777938814300017&p2_Order=31026856380930001&p3_Amt=100.0&p4_Cur=CNY&p5_Pid=&p6_Pcat=&p7_Pdesc=&p8_Url=http://www.test.com/paycallback/n98paybank.html&p9_SAF=0&pa_MP=&pd_FrpId=ABC-NET-B2C&pr_NeedResponse=1&hmac=cacd7e9a2b910899d3142fb428c44534

'卡类提交
'cardNo = request.form("cardNo")
'cardPwd = request.form("cardPwd")

'识别paytype为BANK或CARD
'BC=getBankOrCard(paytype)
 
	if BC = "BANK" then
		if paytype = "zhifubao" then
			input_charset = "gbk"
			default_login = "N"
			exter_invoke_ip = getClientIP
			notify_url = "http://dd.zhangkunsujiao.com/iwmpay/notify_zfb.asp" 
			out_trade_no = orderid
			partner = uid
			payment_type = "1"
			seller_email = "test@163.com" '商户的收款支付宝账号
			service = "create_direct_pay_by_user"
			subject = "product"
			total_fee = money
			sign_type = "MD5"
			Md5str="_input_charset="&input_charset&"&default_login="&default_login&"&exter_invoke_ip="&exter_invoke_ip&"&notify_url="&notify_url&"&out_trade_no="&out_trade_no&"&partner="&partner&"&payment_type="&payment_type&"&seller_email="&seller_email&"&service="&service&"&subject="&subject&"&total_fee="&total_fee
			sign = ASP_MD5(Md5str&key)
			
			urlStr = "http://vip.wmcard.cn/intf/npay.html?"&Md5str&"&sign="&sign&"&sign_type="&sign_type
                elseif paytype = "zhifubao-wap" then
			customerid = uid
			sdcustomno = orderid
			orderAmount = money * 100
			cardno = "32"
			noticeurl = "http://dd.zhangkunsujiao.com/iwmpay/notify_wx.asp" 
			backurl = return_url
			
			md5Str="customerid="&customerid&"&sdcustomno="&sdcustomno&"&orderAmount="&orderAmount&"&cardno="&cardno&"&noticeurl=" &noticeurl&"&backurl="&backurl&key 
			
			sign = Ucase(ASP_MD5(md5Str))
			mark = exts
			urlStr="http://vip.wmcard.cn/intf/wapali.html?customerid="&customerid&"&sdcustomno="&sdcustomno&"&orderAmount="&orderAmount&"&cardno="&cardno&"&noticeurl="&noticeurl&"&backurl="&backurl&"&sign="&sign&"&mark="&mark
		elseif paytype = "weixin" then
			customerid = uid
			sdcustomno = orderid
			orderAmount = money * 100
			cardno = "32"
			noticeurl = "http://dd.zhangkunsujiao.com/iwmpay/notify_wx.asp" 
			backurl = return_url
			
			md5Str="customerid="&customerid&"&sdcustomno="&sdcustomno&"&orderAmount="&orderAmount&"&cardno="&cardno&"&noticeurl=" &noticeurl&"&backurl="&backurl&key 
			
			sign = Ucase(ASP_MD5(md5Str))
			mark = ext
			urlStr="http://vip.wmcard.cn/intf/wpay.html?customerid="&customerid&"&sdcustomno="&sdcustomno&"&orderAmount="&orderAmount&"&cardno="&cardno&"&noticeurl="&noticeurl&"&backurl="&backurl&"&sign="&sign&"&mark="&mark
		elseif paytype = "weixin-wap" then
			customerid = uid
			sdcustomno = orderid
			orderAmount = money * 100
			cardno = "32"
			noticeurl = "http://dd.zhangkunsujiao.com/iwmpay/notify_wx.asp" 
			backurl = return_url
			
			md5Str="customerid="&customerid&"&sdcustomno="&sdcustomno&"&orderAmount="&orderAmount&"&cardno="&cardno&"&noticeurl=" &noticeurl&"&backurl="&backurl&key 
			
			sign = Ucase(ASP_MD5(md5Str))
			mark = ext
			urlStr="http://vip.wmcard.cn/intf/wapwpay.html?customerid="&customerid&"&sdcustomno="&sdcustomno&"&orderAmount="&orderAmount&"&cardno="&cardno&"&noticeurl="&noticeurl&"&backurl="&backurl&"&sign="&sign&"&mark="&mark
		else
			urlStr="http://vip.wmcard.cn/intf/nbank.html?p0_Cmd="&p0_Cmd&"&p1_MerId="&p1_MerId&"&p2_Order="&p2_Order&"&p3_Amt="&p3_Amt&"&p4_Cur="&p4_Cur&"&p5_Pid="&p5_Pid&"&p6_Pcat="&p6_Pcat&"&p7_Pdesc="&p7_Pdesc&"&p8_Url="&p8_Url&"&p9_SAF="&p9_SAF&"&pa_MP="&pa_MP&"&pd_FrpId="&pd_FrpId&"&pr_NeedResponse="&pr_NeedResponse&"&hmac="&hmac
		end if	
	end if
'生成本地订单
createOrder orderid,money,paytype,ext
'跳转吧
Response.Redirect urlStr
%>
