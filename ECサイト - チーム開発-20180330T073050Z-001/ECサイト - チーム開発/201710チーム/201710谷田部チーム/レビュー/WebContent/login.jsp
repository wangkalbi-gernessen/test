<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="./css/login.css">
<link rel="stylesheet" href="./css/validationEngine.jquery.css" type="text/css"/>
<script src="./js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="./js/languages/jquery.validationEngine-ja.js" type="text/javascript" charset="utf-8"></script>
<script src="./js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
   jQuery("#LoginForm").validationEngine();
});
</script>
<title>ログイン画面</title>
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">


	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--ヘッダーメニューここまで-->

	<!--メインここから -->
	<div id="main">
		<br>


		<div class="pageback">
			<a href='<s:url action="GoHomeAction"/>'>TOP</a> &nbsp;>&nbsp; <a>ログイン</a>
		</div>
		<h2 class="title">ログイン</h2>
		<br> <br>
		<div class="login_box">
		<div class="member">

			<h3>登録済みのお客様</h3>

			<h5>
				<s:iterator value="errorMessageList">
					<s:div>
						<s:property />
					</s:div>
				</s:iterator>
			</h5>

			<div class="member_form">
				<s:form action="LoginAction" theme="simple" id="LoginForm">

					<div class="member_form_title">
						ユーザーID<br>
					</div>
					<div class="member_textbox">
						<s:textfield type="text" name="userId" value="%{#session.saveId}" class="validate[required,minSize[1],maxSize[16],custom[onlyLetterNumber]]"/>
						<br>
					</div>

					<br>
					<div class="member_form_title">
						パスワード<br>
					</div>
					<div class="member_textbox">
						<s:password name="password" class="validate[required,minSize[1],maxSize[16],custom[onlyLetterNumber]]" />
					</div>

					※半角英数字のみで入力してください。<br>
					パスワードをお忘れの方は<a href="passwordResetting.jsp">こちら</a>


					<p>
						<s:checkbox name="saveLogin" />
						ID保存
					</p>

					<div class="member_btn">
						<button type="submit" class="">ログイン</button>
					</div>
				</s:form>
			</div>
		</div>



		<div class="nomember">
			<h3>初めてのお客様</h3>
			商品購入の際はユーザー登録をお願いします。<br><br>
			<div class="nomember_btn">
				<a href='<s:url action="GoUserRegisterAction"/>'>新規ユーザー登録</a>
			</div>
		</div>
		</div>



	</div>
	<!--メインここまで -->

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
	<script type="text/javascript" src="script.js"></script>
</body>
</html>