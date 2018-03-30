<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="./css/destinationRegisterConfirm.css">
	<script type="text/javascript">
	history.forward();
	</script>
<title>購入情報確認画面</title>
</head>

<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--メインここから -->
	<div id="main">
		<br>
		<h2 class="title">宛先情報登録確認</h2>
		<br> <br>
		<div class="register_box">
			<div class="member">

				<div class="member_form">

					<s:form action="RegisterDestinationInfoAction" theme="simple">

						<div class="member-form-title">
							<br>ふりがな:
							<s:property value="familyNameKana" />
							<s:hidden name="familyNameKana" value="%{familyNameKana}" />
							<s:property value="firstNameKana" />
							<s:hidden name="firstNameKana" value="%{firstNameKana}" />
							<br>名前:
							<s:property value="familyName" />
							<s:hidden name="familyName" value="%{familyName}" />
							<s:property value="firstName" />
							<s:hidden name="firstName" value="%{firstName}" />
							<br>メールアドレス:
							<s:property value="email" />
							<s:hidden name="email" value="%{email}" />
							<br>電話番号:
							<s:property value="telNumber" />
							<s:hidden name="telNumber" value="%{telNumber}" />
							<br>住所:
							<s:property value="userAddress" />
							<s:hidden name="userAddress" value="%{userAddress}" />
							<br>
							<br>
							<div class="member_btn">
								<button type="submit" class="">確定</button>
							</div>
						</div>
					</s:form>
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

</body>
</html>