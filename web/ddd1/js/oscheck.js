			// 是否是安卓
			function isAndroid() {
				var u = navigator.userAgent;
				if (u.indexOf('Android') > -1 || u.indexOf('Linux') > -1) { //安卓手机
					return true;
				}
				return false;
			}
			
			function isIOS(){
				var u = navigator.userAgent;
				var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
				return isiOS;
			}
			function isRunOnWeChat(){
				var ua = navigator.userAgent.toLowerCase();  
			    if(ua.match(/MicroMessenger/i)=="micromessenger") {  
			        return true;  
			    } else {  
			        return false;  
			    }  
			}
			$(document).ready(function(){
				initialize();
				function initialize(){
					
					if(true == isIOS()){
						$('#download-tip').removeClass("common-hide");
						$('.common-ios').removeClass('common-hide');
					}else if(true == isAndroid()){
						$('.common-android').removeClass('common-hide');
					}else{
						$('.common-pc').removeClass('common-hide');
					}
					// 如果在微信中打开，直接弹遮罩
					//if(true == isRunOnWeChat()){
						//$('#mask').removeClass("common-hide");
						$('#mask').addClass("common-hide");//add by huxiuming 默认关闭
					//}					
				}
				$('#download-android').on('click', function(e){
					if(true == isRunOnWeChat()){
						e.preventDefault();
						$('#mask').removeClass("common-hide");
					}				
				});
				$('#download-ios').on('click', function(e){
					if(true == isRunOnWeChat()){
						e.preventDefault();
						$('#mask').removeClass("common-hide");
					}				
				});
				$('#download-pc').on('click', function(){
					alert("在手机中浏览器中打开点击“立即下载”，将会自动下载安装包。");
					// var url=$('#pc_downurl').val();
					// window.location.href=url;
				});
				$('#mask').on('click', function(){
					$('#mask').addClass("common-hide");
				});
			});