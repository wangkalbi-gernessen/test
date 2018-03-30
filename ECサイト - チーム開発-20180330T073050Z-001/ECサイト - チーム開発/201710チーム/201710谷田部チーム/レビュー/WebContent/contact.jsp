<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/contact.css">
<link rel="stylesheet" type="text/css" href="./css/footer.css">
<link rel="stylesheet" href="./css/validationEngine.jquery.css" type="text/css"/>
<script src="./js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="./js/languages/jquery.validationEngine-ja.js" type="text/javascript" charset="utf-8"></script>
<script src="./js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	history.forward();
	jQuery(document).ready(function(){
		   jQuery("#contactForm").validationEngine();
		});
</script>
<title>お問い合わせ</title>
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">
	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--ヘッダーメニューここまで-->
	<br>
	<br>
	<!--メインここから -->
	<div id="main">
		<br>
		<div class="pageback">
			<a href='<s:url action="GoHomeAction"/>'>TOP</a> &nbsp;>&nbsp; <a>お問い合わせ</a>
		</div>
		<h2 class="title">お問い合わせ</h2>
		<div class="menu">
			電話でのお問い合わせはこちらにお電話ください。 <br> 000-0000-0000 <br>
		</div>
		<br>
		<div class="menu_1">
			それ以外でのお問い合わせは以下に書き込み登録してください。 <br> <br>
			<s:form method="post" action="ContactCompleteAction" theme="simple" id="contactForm">
				<div class="menu_2">
					名前:<br> <input type="text" name="name" class="validate[required]"/> <br> <br>
					お問い合わせの種類:<br> <select name="qtype">
						<option value="kaden">家電、パソコンについて</option>
						<option value="book">本について</option>
						<option value="omotya">ゲーム、おもちゃについて</option>
					</select> <br> <br> お問い合わせ内容:
					<s:textarea name="content" rows="6" cols="30" class="validate[required]"/>
				</div>
				<br>
				<div class="member_btn">
					<button type="submit" class="">登録</button>
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