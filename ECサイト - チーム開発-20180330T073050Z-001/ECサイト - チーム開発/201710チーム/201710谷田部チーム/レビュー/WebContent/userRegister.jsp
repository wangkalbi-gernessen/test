<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/userRegister.css">
<link rel="stylesheet" href="./css/validationEngine.jquery.css" type="text/css"/>
<script src="./js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="./js/languages/jquery.validationEngine-ja.js" type="text/javascript" charset="utf-8"></script>
<script src="./js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
   jQuery("#userRegister").validationEngine();
});
</script>
<title>ユーザー情報入力画面</title>
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--ヘッダーメニューここまで-->

	<!--メインここから -->
	<div id="main">
		<br>
		<div class="pageback">
			<a href='<s:url action="GoHomeAction"/>'>TOP</a> &nbsp;> <a
				href='<s:url action="GoLoginAction"/>'>ログイン</a>
			&nbsp;>&nbsp;新規ユーザー登録
		</div>
		<br> <br>


		<h2 class="title">新規ユーザー登録</h2>
		<br> <br>
		<div class="register_box">
			<div class="member">
				<h5>
					<s:iterator value="errMsgList">
						<s:div>
							<s:property />
						</s:div>
					</s:iterator>
				</h5>

				<h2>下記に必要事項を入力して下さい</h2>
				<div class="member_form">
					<s:form action="CheckUserInfoAction" theme="simple" id="userRegister">

						<div class="member_form_title">姓</div>
						<div class="member_form_text">
							<s:textfield type="text" name="familyName" value="%{familyName}" class="validate[required,custom[name],minSize[1],maxSize[16]]"/>
						</div>


						<br>
						<div class="member_form_title">
							名
							</div>

							<div class="member_form_text">
							<s:textfield type="text" name="firstName" value="%{firstName}" class="validate[required,custom[name],minSize[1],maxSize[16]]"/>
							<br>
						</div>

						<br>
						<div class="member_form_title">
							姓ふりがな
							</div>
							<div class="member_form_text">
							<s:textfield type="text" name="familyNameKana"
								value="%{familyNameKana}" class="validate[required,custom[name2],minSize[1],maxSize[16]]" />
							<br>
						</div>

						<br>
						<div class="member_form_title">
							名ふりがな
							</div>
							<div class="member_form_text">
							<s:textfield type="text" name="firstNameKana"
								value="%{firstNameKana}" class="validate[required,custom[name2],minSize[1],maxSize[16]]"/>
							<br>
						</div>

						<br>
						<div class="member_form_title">
							ユーザーID
							</div>
							<div class="member_form_text">
							<s:textfield type="text" name="userId" value="%{userId}" class="validate[required,custom[login],minSize[1],maxSize[16]]"/>
							<br>
						</div>

						<br>
						<div class="member_form_title">
						    パスワード
							</div>
							<div class="member_form_text">
							<s:password name="password" value="%{password}" class="validate[required,custom[password],minSize[1],maxSize[8]]"/>
							<br>
						</div>

						<br>
						<div class="member_form_title">
						    性別
							</div>
							<div class="member_form_radio">
							<s:radio name="sex" list="#{'0': '男性', '1': '女性'}" value="0" />
							<br>
						</div>

						<br>
						<div class="member_form_title">
							メールアドレス
							</div>
							<div class="member_form_text">
							<s:textfield type="text" name="email" value="%{email}"  class="validate[required,custom[email2],minSize[18],maxSize[32]]"/>
							<br>
						</div>

						<br>
						<div class="member_btn">
							<button type="submit" class="">登録情報確認</button>
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

		<script type="text/javascript" src="script.js"></script>


</body>
</html>