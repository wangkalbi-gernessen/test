<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ画面</title>
<link rel="stylesheet" type="text/css" href="./css/myPage.css">
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--ヘッダーメニューここまで-->

	<!-- メインここから -->
	<div id="main">
		<br>
		<div class="pageback">
			<a href='<s:url action="GoHomeAction"/>'>TOP</a> &nbsp;>&nbsp; <a>マイページ</a>
		</div>

		<h2 class="title">マイページ</h2>

		<s:form action="PurchaseHistoryAction">
			<table border="1"
				style="width: 500px; background-color: #f5f5f5; text-align: center;">
				<caption>《ユーザー情報》</caption>
				<s:iterator value="userInfoDTO">
					<tr>
						<td style="width: 200px;">ふりがな</td>
						<td style="width: 250px;"><s:property value="familyNameKana" />
							<s:property value="firstNameKana" /></td>
					</tr>
					<tr>
						<td>名前</td>
						<td><s:property value="familyName" /> <s:property
								value="firstName" /></td>
					</tr>
					<tr>
						<td>性別</td>
						<td><s:if test="sex==0">男性</s:if>
							<s:else>女性</s:else></td>
					</tr>
					<tr>
						<td>メールアドレス</td>
						<td><s:property value="email" /></td>
					</tr>
				</s:iterator>
			</table>
			<div class="parchase_history_btn">
				<button type="submit">注文履歴を確認する</button>
			</div>
		</s:form>



	</div>

	<!--メインここまで -->
	<!--フッターここから-->
	<br>
	<div id="footer">
		<p>Copyright© yataberyouhin All Rights Reserved.</p>
		<div class="footer_menu">
			<div class="footer_menu_1">
				<s:form method="post">
					<a href="ContactAction">お問い合わせ</a>
				</s:form>
			</div>
			<div class="footer_menu_2">
				&nbsp;&nbsp;&nbsp;&nbsp;<a
					href="https://www.google.co.jp/maps/place/インターノウス">位置情報</a>
			</div>
		</div>
	</div>
	<!--フッターここまで-->
</body>
</html>