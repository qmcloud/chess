<% Response.CodePage=65001%>  
<% Response.Charset="UTF-8" %>
<%
'调试模式

BANKS = Array(Array("ICBC-NET","工商银行"),Array("CCB-NET","建设银行"),Array("CCB-NET","中国银行"),Array("CMBCHINA-NET","招商银行"),Array("ECITIC-NET","中信银行"),Array("CIB-NET","兴业银行"),Array("CEB-NET","光大银行"),Array("ABC-NET","农业银行"),Array("POST-NET","邮政银行"),Array("SDB-NET","深圳发展银行"),Array("GDB-NET","广东发展银行"),Array("SPDB-NET","上海浦东发展银行"),Array("CMBC-NET","民生银行"),Array("BOCO-NET","交通银行"),Array("NJCB-NET","南京银行"),Array("PINGANBANK","平安银行"),Array("CBHB-NET","渤海银行"),Array("HKBEA-NET","东亚银行"),Array("NBCB-NET","宁波银行"),Array("SHB-NET","上海银行"),Array("CZ-NET","浙商银行"),Array("HZBANK-NET","杭州银行"),Array("NCBBANK-NET","南洋银行"),Array("SCCB-NET","河北银行"),Array("ZJTLCB-NET","泰隆银行"),Array("zhifubao","支付宝扫码"),Array("weixin","微信扫码"),Array("zhifubao-wap","支付宝WAP"),Array("weixin-wap","微信WAP"))
CARDS = Array(Array("cm","移动神州行"),Array("cmb","移动神州行(大面值)"),Array("cd","移动神州行地方卡"),	Array("cc","联通充值卡"),Array("ccb","联通充值卡(大面值)"),Array("dx","电信充值卡"),Array("dxb","电信充值卡(大面值)"),Array("th","天宏一卡通"),Array("tx","天下一卡通(通用卡)"),Array("txzx","天下一卡通(专项卡)"),Array("wm","完美一卡通"),Array("jy","久游一卡通"),Array("zt","征途一卡通"),Array("sd","盛大一卡通"),Array("sft","盛付通卡"),Array("qq","QQ卡"),Array("wy","网易一卡通"),Array("sh","搜狐一卡通"),Array("jw","骏网一卡通"))

'商户号
uid = "15221450899253282"
'商户密钥
key = "34f03240489b062996d277dc372dbcf7"

'测试商户号
'uid_test = "1000" 
'测试密钥
'key_test = "uy6UJer7Gerijq2lIY7kasD41HD44Sddg6"

'充值比例
rate = "1"
ratenum = "1"
'货币名称
currencyName = "游戏币"

'同步通知地址
notify_url="http://dd.zhangkunsujiao.com/iwmpay/notify.asp" 
'异步通知地址
return_url="http://dd.zhangkunsujiao.com/iwmpay/return.asp"

'数据库连接
connStr="Driver={SQL Server}; server=./;uid=sa;pwd=fgadsga#!31#@!4d;database=QPAccountsDB;"
set conn1=server.createobject("ADODB.CONNECTION")
conn1.open connStr

connStrs="Driver={SQL Server}; server=./;uid=sa;pwd=fgadsga#!31#@!4d;database=QPTreasureDB;"
set conn2=server.createobject("ADODB.CONNECTION")
conn2.open connStrs

'业务处理部分---将订单插入数据库
sub createOrder(orderid,money,paytype,ext)
	'先生成本地订单
	
	if paytype = "zhifubao" then 
	           si = "102"
	else if paytype = "weixin" then
	         si = "103"
	         else si = "104"
	    end if
	end if
	set rs=server.CreateObject("adodb.recordset")
	sql="select UserID,GameID,Accounts from AccountsInfo where UserID ='" &ext& "'"
	rs.Open sql,conn1,1,1
	if not rs.eof then 
		SET rs1=server.CreateObject("adodb.recordset")
		sql1="select * from OnLineOrder"
		rs1.open sql1,conn2,1,3
		rs1.addnew
		rs1("OperUserID")=rs("UserID")
		rs1("ShareID")=si
		rs1("UserID")=rs("UserID")
		rs1("GameID")= rs("GameID")
		rs1("Accounts")= rs("Accounts")
		rs1("OrderID")= orderid
		rs1("CardTypeID")= 1
		rs1("CardPrice")= money
		rs1("CardGold")= money*rate
		rs1("CardTotal")= money*rate
		rs1("OrderAmount")= money
		rs1("DiscountScale")= rate
		rs1("PayAmount")=0            
		rs1("OrderStatus")=0
		rs1("IPAddress")=getClientIP()
		rs1("ApplyDate")=now()
		rs1.update
		rs1.close
		set rs1=nothing
	else
		response.write("输入帐号错误!")
		response.end()	
	end if
	'生成本地订单
	set rs=nothing 
end sub 

sub checkOrder(orderid,money,ext)
	set rs=server.createobject("adodb.recordset")
	sql="select * from OnLineOrder where OrderID='"&orderid&"'"
	rs.open sql,conn2,1,1
	if rs.eof then
		response.write("此订单不存在！")					
		Response.End
	else
		flag=rs("OrderStatus")
		if flag=0 then
                   set R=server.createobject("adodb.recordset")
	           sql="select SpreaderID from AccountsInfo where UserID="&rs("UserID")&""
	           R.open sql,conn1,1,1
	           if R("SpreaderID")="0" then
                        select case money
                        case 18	
                          ratenum="18"
                        case 38
                          ratenum="38"
                        case 68
                          ratenum="68"
                        case 128
                          ratenum="128"
                        case 368 
                          ratenum="368"
                        case 788 
                          ratenum="788"                    
                        end select
                  else                     
                        select case money
                        case 18
                          ratenum="21"
                        case 38
                          ratenum="45"
                        case 68
                          ratenum="81"
                        case 128
                          ratenum="158"
                        case 368 
                          ratenum="442"
                        case 788	 
                          ratenum="945"
                        end select
                  end if
      
			conn2.execute("update OnLineOrder set OrderStatus=2,PayAmount='"&money&"',CardPrice='"&clng(ratenum)&"' where OrderID='"&orderid&"'")
			conn2.execute("update GameScoreInfo set InsureScore=InsureScore+"&clng(ratenum)&"  where UserID="&rs("UserID")&"") 
			
			'Response.Write("OK")
			'response.write "<br>"
			'response.write("充值成功，请进入游戏查看，若未到帐，可联系客服，可根据定单号追加！")
		else
			'Response.Write("success")
			'response.write "<br>"
			'response.write("支付成功！")
			'Response.End 
		end if 	
	end if
end sub

'生成订单号
function createOrderId
	randomize timer
	kk=int(999*rnd)
	y=Year(now)
	m=month(now)
	if m<10 then m="0"&m
	d=day(now)
	if d<10 then d="0"&d
	h=hour(now)
	if h<10 then h="0"&h
	m2=minute(now)
	if m2<10 then m2="0"&m2
	s=second(now)
	if s<10 then s="0"&s
	s2=right(timer()*100,1)
	createOrderId=y&m&d&h&m2&s&s2&kk
end function

'检测提交方式 返回BANK或CARD
function getBankOrCard(payType)
	dim BC	
	for i=0 to ubound(BANKS)
		tempArr=BANKS(i)
		if BANKS(i)(0) = payType then 
			BC="BANK"
			exit for
		end if
	next	
	for i=0 to ubound(CARDS)
		tempArr=CARDS(i)
		if CARDS(i)(0) = payType then 
			BC="CARD"
			exit for			
		end if
	next
	getBankOrCard = BC
end function 
'根据BANK或者CARD输出汉字
function changeName(checkName,paytype)
	dim NAME
	if checkName = "BANK" THEN
		NAME = "网银支付"
		if paytype="weixin" or paytype="weixin-wap" THEN
			NAME = "微信"
		elseif paytype="alipay" or paytype="alipay-wap" THEN
			NAME = "支付宝"
		end if
	end if
	if checkName = "CARD" THEN
		NAME = "点卡支付"
	end if
	changeName = NAME
end function
'根据提交方式，获取中文
function getPayName(payType)
	dim payName	
	for i=0 to ubound(BANKS)
		tempArr=BANKS(i)
		if BANKS(i)(0) = payType then 
			payName = BANKS(i)(1)
			exit for
		end if
	next	
	for i=0 to ubound(CARDS)
		tempArr=CARDS(i)
		if CARDS(i)(0) = payType then 
			payName = CARDS(i)(1)
			exit for			
		end if
	next
	getPayName = payName
end function

function getClientIP()
	Dim strIPAddr 
	If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then 
		strIPAddr = Request.ServerVariables("REMOTE_ADDR") 
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then 
		strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1) 
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then 
		strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1) 
	Else 
		strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
	End If 
	getClientIP = Trim(Mid(strIPAddr, 1, 30)) 
End Function

%>
