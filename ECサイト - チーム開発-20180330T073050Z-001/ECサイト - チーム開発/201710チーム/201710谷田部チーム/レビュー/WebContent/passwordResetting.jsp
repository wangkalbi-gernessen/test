<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="./css/passwordResetting.css">
	<link rel="stylesheet" href="./css/validationEngine.jquery.css" type="text/css"/>
<script src="./js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="./js/languages/jquery.validationEngine-ja.js" type="text/javascript" charset="utf-8"></script>
<script src="./js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
   jQuery("#PasswordResettingConfirmForm").validationEngine();
});
</script>
<title>パスワード再設定画面</title>
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--ヘッダーメニューここまで-->

	<div id="main">
		<br>
		<br><br><div class="pageback">
			<a href='<s:url action="GoHomeAction"/>'>TOP</a> &nbsp;>&nbsp; <a>再パスワード設定</a>
		</div>
		<h2>パスワード再設定画面</h2>

		<br>
		<div class="new_password">
			<h5>
				<s:iterator value="errMsgList">
					<s:div>
						<s:property />
					</s:div>
				</s:iterator>
			</h5>

					<s:form action="PasswordResettingConfirmAction" theme="simple" id="PasswordResettingConfirmForm">
						<div class="new_password_title">
							ユーザーID<br>
						</div>
						<div class="new_password_textbox">
							<s:textfield name="userId" class="validate[required,minSize[1],maxSize[16],custom[onlyLetterNumber]]" />
							<br>
						</div>
						<br>
						<div class="new_password_title">
							パスワード<br>
						</div>
						<div class="new_password_textbox">
							<s:password name="password" class="validate[required,minSize[1],maxSize[16],custom[onlyLetterNumber]]" />
							<br>
						</div>
						<br>
						<div class="new_password_title">
							再確認パスワード<br>
						</div>
						<div class="new_password_textbox">
							<s:password name="passwordConfirm" class="validate[required,minSize[1],maxSize[16],custom[onlyLetterNumber]]" />
							<br>
						</div>
						<br>
						<div class="new_password_btn">
							<s:submit value="再設定" />
						</div>
					</s:form>
		</div>
	</div>
<!--フッターここから-->
		<br><div id="footer">
		<p>Copyright© yataberyouhin All Rights Reserved.</p>
	  <div class="footer_menu">
		<div class="footer_menu_1">
		<s:form method="post">
			<a href="ContactAction">お問い合わせ</a>
        </s:form></div>
        		<div class="footer_menu_2">
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="https://www.google.co.jp/maps/place/インターノウス">位置情報</a>
			</div>
	</div>
	</div>
		<!--フッターここまで-->
</body>
</html>