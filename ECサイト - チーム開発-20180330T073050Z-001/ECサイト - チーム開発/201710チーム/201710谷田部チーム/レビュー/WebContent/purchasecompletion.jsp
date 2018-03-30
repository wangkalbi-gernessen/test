<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="./css/purchasecompletion.css">
<script type="text/javascript">
	history.forward();

	function autoLink() {
		location.href = "GoHomeAction";
	}
	setTimeout("autoLink()", 5000);
</script>
<title>購入完了画面</title>
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

	<!--タイトルロゴここから-->
	<div class="logo">ヤタベ良品</div>
	<!--タイトルロゴここまで-->

	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--メインここから -->
	<div id="main"><br>

		<div class="title">
			<h3>購入が完了しました</h3>
			5秒後にホーム画面に戻ります
			<br><br><br>
			<p>ショッピングをあなたの生活の一部に<br>
            YATABE良品<p>

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