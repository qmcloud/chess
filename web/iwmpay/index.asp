<!--#include file="conn.asp"-->
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF8">
  <title>仟易付-充值中心-收银台</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="stylesheet" href="assets/css/amazeui.css"/>
  <link rel="stylesheet" href="assets/css/app.css"/>
</head>
<script language="javascript">
function checkForm()
{
	if(form.username.value=="")
	{
		alert("请输入账号！");
		return false;
	}
	if(form.username2.value=="")
	{
		alert("请确认账号！");
		return false;
	}
	if(form.username.value !=form.username2.value)
	{
		alert("两次输入账号不一致！");
		return false;
	}
	
	var val=$('input:radio[name="paytype"]:checked').val();
	if(val==null){
		alert("请选择支付方式");
		return false;
	}     
			
	return true;
}
</script>
<body>
<div class="am-g am-container">
	<div class="am-u-lg-12">
		<div class="am-g ap-pay">		
			<div class="am-u-lg-8 am-u-md-8 am-u-sm-12">
				<div class="ap-pay-warn">
				<h3>仟易提供专业稳定的卡寄售和消耗接口，支持接口有微信、支付宝、网银及各种消费卡等，全程提供技术协助，接口申请简单，操作方便，欢迎有实力的合作伙伴来洽谈合作。<br>仟易客服电话：0311-80664538</h3>
					您的充值兑换比例为：<span style="color:Red;">1元 = <%=rate%><%=currencyName%></span>
				</div>
				<hr/>
				<form name="form" id="form" class="am-form ap-pay-form" onSubmit="return checkForm()" action="post.asp" method="post">	
					<label class="ap-pay-form-lable" for="username" >充值帐号：</label><input class="ap-pay-form-input" id="username" name="username" type="text" placeholder="请填写账号，必填" required/><br/>
					<label class="ap-pay-form-lable" for="username2">确认账号：</label><input class="ap-pay-form-input" id="username2" name="username2" type="text" placeholder="请再次确认，必填" required/><br/>
					<label class="ap-pay-form-lable" for="money">充值金额：</label><input class="ap-pay-form-input" id="money" name="money" type="tel" placeholder="请填写充值金额，必填" required/><br/>
					<hr>					
					<div class="ap-pay-item">
						<div class="ap-pay-item-title">手机支付</div>
						<!--<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="weixin-wap" id="weixin-wap">
							<label for="weixin-wap">微信WAP</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="zhifubao-wap" id="zhifubao-wap">
							<label for="zhifubao-wap">支付宝WAP</label>
						</div>-->
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="weixin" id="weixin">
							<label for="weixin">微信扫码</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="zhifubao" id="zhifubao">
							<label for="zhifubao">支付宝扫码</label>
						</div>
					</div>
					<div class="clear"></div>
					<!--<div class="ap-pay-item">
						<div class="ap-pay-item-title">网银在线</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="ICBC-NET" id="ICBC-NET">
							<label for="ICBC-NET">工商银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CCB-NET" id="CCB-NET">
							<label for="CCB-NET">建设银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="BOC-NET" id="BOC-NET">
							<label for="BOC-NET">中国银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CMBCHINA-NET" id="CMBCHINA-NET">
							<label for="CMBCHINA-NET">招商银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="ECITIC-NET" id="ECITIC-NET">
							<label for="ECITIC-NET">中信银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CIB-NET" id="CIB-NET">
							<label for="CIB-NET">兴业银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CEB-NET" id="CEB-NET">
							<label for="CEB-NET">光大银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="ABC-NET" id="ABC-NET">
							<label for="ABC-NET">农业银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="POST-NET" id="POST-NET">
							<label for="POST-NET">邮政银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="SDB-NET" id="SDB-NET">
							<label for="SDB-NET">深圳发展银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="GDB-NET" id="GDB-NET">
							<label for="GDB-NET">广东发展银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="SPDB-NET" id="SPDB-NET">
							<label for="SPDB-NET">上海浦东发展银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CMBC-NET" id="CMBC-NET">
							<label for="CMBC-NET">民生银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="BOCO-NET" id="BOCO-NET">
							<label for="BOCO-NET">交通银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="NJCB-NET" id="NJCB-NET">
							<label for="NJCB-NET">南京银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="PINGANBANK" id="PINGANBANK">
							<label for="PINGANBANK">平安银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CBHB-NET" id="CBHB-NET">
							<label for="CBHB-NET">渤海银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="HKBEA-NET" id="HKBEA-NET">
							<label for="HKBEA-NET">东亚银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="NBCB-NET" id="NBCB-NET">
							<label for="NBCB-NET">宁波银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="SHB-NET" id="SHB-NET">
							<label for="SHB-NET">上海银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="CZ-NET" id="CZ-NET">
							<label for="CZ-NET">浙商银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="HZBANK-NET" id="HZBANK-NET">
							<label for="HZBANK-NET">杭州银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="NCBBANK-NET" id="NCBBANK-NET">
							<label for="NCBBANK-NET">南洋银行</label>
						</div>
						<div class="ap-pay-item-content">
							<input type="radio" name="paytype" value="SCCB-NET" id="SCCB-NET">
							<label for="SCCB-NET">河北银行</label>
						</div>
					</div>
					<div class="clear"></div>-->
					<div class="tc m2">
						<button type="submit" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-check"></i> 提 交</button>
					</div>
					<hr/>
				</form>				
			</div>			
		</div>
	</div>
</div>
<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="assets/js/amazeui.min.js"></script>
<script src="assets/js/layer/layer.js"></script>
</body>
</html>