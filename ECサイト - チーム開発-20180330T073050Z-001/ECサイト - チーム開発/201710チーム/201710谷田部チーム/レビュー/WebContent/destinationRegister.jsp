<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="./css/destinationRegister.css">
<title>ユーザー情報入力画面</title>
</head>

<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--メインここから -->
	<div id="main">
		<br>
		<h2 class="title">新規購入情報入力</h2>

		<br> <br>
		<div class="register_box">
			<div class="member">

				<s:form action="CheckDestinationInfoAction" theme="simple">
					<h5>
						<s:iterator value="errMsgList">
							<s:property />
						</s:iterator>
					</h5>

					<h3>下記に必要事項を入力して下さい</h3>
					<div class="member_form">
						<div class="member_form_title">姓</div>
						<div class="member_form_text">
							<s:textfield name="familyName" value="%{familyName}" />
						</div>
						<br>


						<div class="member_form_title">名</div>
						<div class="member_form_text">
							<s:textfield name="firstName" value="%{firstName}" />
						</div>
						<br>


						<div class="member_form_title">姓ふりがな</div>
						<div class="member_form_text">
							<s:textfield name="familyNameKana" value="%{familyNameKana}" />
						</div>
						<br>


						<div class="member_form_title">名ふりがな</div>
						<div class="member_form_text">
							<s:textfield name="firstNameKana" value="%{firstNameKana}" />
						</div>
						<br>


						<div class="member_form_title">メールアドレス</div>
						<div class="member_form_text">
							<s:textfield name="email" value="%{email}" />
						</div>
						<br>


						<div class="member_form_title">電話番号</div>
						<div class="member_form_text">
							<s:textfield name="telNumber" value="%{telNumber}" />
						</div>
						<br>


						<div class="member_form_title">住所</div>
						<div class="member_form_text">
							<s:textfield name="userAddress" value="%{userAddress}" />
						</div>
						<br>


						<div class="member_btn">
							<button type="submit" class="">登録情報確認</button>
						</div>
					</div>
				</s:form>
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