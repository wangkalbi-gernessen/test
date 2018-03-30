<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/userRegisterConfirm.css">
<script type="text/javascript">
	history.forward();
</script>
<title>登録内容確認画面</title>
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />


	<!--メインここから -->
	<div id="main">
		<br>
		<h2 class="title">新規ユーザー登録確認</h2>
		<br> <br>
		<div class="register_box">
			<div class="member">

				<div class="member_form">
					<s:form action="RegisterUserInfoAction" theme="simple">

						<div class="member-form-title">
							ふりがな:<s:property value="familyNameKana" />
							<s:hidden name="familyNameKana" value="%{familyNameKana}" />
							<s:property value="firstNameKana" />
							<s:hidden name="firstNameKana" value="%{firstNameKana}" />
							<br>名前:<s:property value="familyName" /><s:hidden name="familyName" value="%{familyName}" />
							<s:property value="firstName" /><s:hidden name="firstName" value="%{firstName}" />
							<br> ID:
							<s:property value="userId" />
							<s:hidden name="userId" value="%{userId}" />
							<br> パスワード:
							<s:property value="password" />
							<s:hidden name="password" value="%{password}" />
							<br> 性別:
							<s:if test="sex==0">
								男性
							</s:if>
							<s:else>
								女性
							</s:else>
							<s:hidden name="sex" value="%{sex}" />
							<br> メールアドレス:
							<s:property value="email" />
							<s:hidden name="email" value="%{email}" />
							<br> <br>
							<div class="member_btn">
								<button type="submit" class="">登録情報完了</button>
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