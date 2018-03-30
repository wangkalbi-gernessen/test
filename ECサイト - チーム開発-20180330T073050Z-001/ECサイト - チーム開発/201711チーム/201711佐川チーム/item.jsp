<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<link rel="stylesheet" type="text/css" href="./css/style.css">


<title>商品一覧</title>
</head>
<style type="text/css">

#main {
	margin-top: 100px;
	margin-bottom: 60px;
	min-height: 100%;
	height: auto !important;
	height: 100%;
	position: relative;
}

a {
	text-decoration: none;
}

a:visited {
	color: #0066c0;
	text-decoration: none
}

#info:hover {
	color: #9aa132;
	cursor: pointer;
	text-decoration: underline;
}

#price {
	color: #B12704;
}

#item {
	padding-top: 20px;
	padding-bottom: 20px;
	float: left;
	width: 33%;
	text-align: center;
}

#item2 {
	clear: both;
}

.main-container {
	text-align: center;
}

.main1 {
	position: relative;
}

.main2 {
	margin: 150px;
}

.main3 {
	clear: both;
}

.a:hover {
	color: #eb1515;
	cursor: pointer;
	text-decoration: underline;
}

</style>
<body>
	<header>

	<div id="main-logo">
		<img src="./css/sagaone_logo.png" height="100px">
	</div>

	<div id="search-form">

		<s:form action="SearchItemAction">
			<div id="search-box">
				<select name="itemCategory" id="category">
					<option value="0">全てのカテゴリー</option>
					<option value="1">本</option>
					<option value="2">家電・パソコン</option>
					<option value="3">おもちゃ・ゲーム</option>
				</select> <input type="text" name="searchWord" id="search" />
			</div>
			<div class="search-btn">
				<input type="image" src="./css/searchIcon.png" width="20"
					height="20" class="icon" />
			</div>
		</s:form>
	</div>

	<div id="header-container">

		<ul id="normal" class="dropmenu">

			<li><s:if test="session.loginUserId != null">
					<s:property value="#session.loginUserId" />でログイン中
					</s:if></li>

			<li>アカウントメニュー
				<ul>
					<s:if test="session.loginUserId != null">
						<li><s:form action="MyPageAction">
								<s:submit value="マイページ" cssClass="b-btn" />
							</s:form></li>
					</s:if>

					<s:if test="session == null">
						<li><s:form action="LoginPageAction">
								<s:submit value="ログイン画面へ" cssClass="b-btn" />
							</s:form></li>
					</s:if>

					<s:if test="session.loginUser == null">
						<li><s:form action="LoginPageAction">
								<s:submit value="ログイン画面へ" cssClass="b-btn" />
							</s:form></li>
					</s:if>

					<s:if test="session.loginUser != null">
						<li><s:form action="LogoutAction">
								<s:submit value="ログアウト" cssClass="b-btn" />
							</s:form></li>
					</s:if>

					<li><s:form action="UserCreateAction">
							<s:submit value="ユーザー登録" cssClass="b-btn" />
						</s:form></li>

					<li><s:form action="ItemAction">
							<s:hidden name="offset" value="0"></s:hidden>
							<s:submit value="商品一覧" cssClass="b-btn" />
						</s:form></li>

					<li><s:form action="CartAction">
							<s:hidden name="cartFlg" value="1"></s:hidden>
							<s:submit value="カート確認" cssClass="b-btn" />
						</s:form></li>

					<s:if test="session.loginUser != null">
						<li><s:form action="PaymentAction">
								<s:submit value="決済" cssClass="b-btn" />
							</s:form></li>
					</s:if>
				</ul>
			</li>
		</ul>
	</div>


	</header>
	<div id="main">
		<div class="main-container">
			<div class="main1">

				<p>
					<s:if test='%{addFlg =="1"}'>カートに入りました！
		<s:iterator value="#session.itemdetailDTOList">
							<s:form action="ItemDetailAction">
								<tr>
									<td><s:property value="product_name" />
									<td><input type="hidden" name="product_id"
										value="<s:property value='product_id' />"></input></td>
									<td><input type="hidden" name="category_id"
										value="<s:property value='category_id' />"></input></td>
									<td><input type="image"
										src="<s:property value="image_file_path"/>" width=auto
										height="100" /></td>
								</tr>
							</s:form>
						</s:iterator>


						<s:a href="CartAction?cartFlg=1">カート編集へ</s:a>
						<s:a href="PaymentAction">決済へ</s:a>

					</s:if>
				</p>

			</div>
			<div class="main2">

				<s:iterator value="#session.itemDTOList" status="st">

					<div id="item">

						<a
							href='<s:url action="ItemDetailAction"><s:param name="product_id" value="product_id" /><s:param name="category_id" value="category_id" /></s:url>'>
							<span id="info"> <img
								src=<s:property value="image_file_path"/> width=auto
								height="100"> <br> <s:property value="product_name" />
								（<s:property value="product_name_kana" />）
						</span>
						</a> <br> <a
							href='<s:url action="ItemDetailAction"><s:param name="product_id" value="product_id" /><s:param name="category_id" value="category_id" /></s:url>'>
							<span id="price">&#xA5;&nbsp;&nbsp;<s:property
									value="price" /></span>
						</a>


					</div>
					<s:if test='%{#st.count%3==0}'>
						<div id="item2">
							<hr />
						</div>
					</s:if>

				</s:iterator>

			</div>

			<div class="main3">
				<s:iterator id="itm" value="allpages" status="st">
					<s:if test='%{#st.count==page}'>
						<s:property value="itm" />
					</s:if>
					<s:else>
						<s:a href="ItemAction?offset=%{#st.index} ">
							<span class="a"> <s:property value="itm" /></span>

						</s:a>
					</s:else>
				</s:iterator>
			</div>
		</div>
		<div class="main3">
			 <s:a href="GoHomeAction"><span class="a">ホームへ戻る</span></s:a>
		</div>
	</div>
	<footer>© 2017-2018, Sagaone.com</footer>

</body>
</html>