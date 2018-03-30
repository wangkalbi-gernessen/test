<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- カンマ出すカスタムタグ -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>決済確認画面</title>
<link rel="stylesheet" type="text/css" href="./css/settlement.css">
<script type="text/javascript">
	history.forward();
</script>
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

	<!--ヘッダーメニューここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--ヘッダーメニューここまで-->
	<!-- メインここから -->
	<div id="main">
		<br>
		<h2 class="title">決済確認</h2>
		<br>



		<s:form action="PurchaseCompletionAction" theme="simple">
			<table border="1"
				style="width: 1100px; background-color: #f5f5f5; text-align: center;">
				<caption>購入情報は以下となります</caption>
				<s:iterator value="cartInfoDTOList">

					<thead style="background-color: #d3d3d3;">
						<tr>
							<th></th>
							<th>商品名</th>
							<th>ふりがな</th>
							<th>値段</th>
							<th>購入個数</th>
							<th>発売会社名</th>
							<th>発売年月日</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><img src='<s:property value="imageFilePath" /><s:property value="imageFileName" />'
								alt="商品画像"></td>
							<td><s:property value="productName" /></td>
							<td><s:property value="productNameKana" /></td>
							<td><fmt:formatNumber value="${price}" />円</td>
							<td><s:property value="count" /></td>
							<td><s:property value="releaseCompany" /></td>
							<td><s:date name="releaseDate" format="yyyy年MM月dd日" /></td>
						</tr>
					</tbody>
				</s:iterator>
			</table>
			<br>
			<br>
			<div class="totalprice">
			合計金額:<fmt:formatNumber value="${totalPrice}" /><span>円</span></div><br>


			<!-- 宛先情報 -->
			<s:iterator value="destinationInfoListDTO">
				<div class="box">
					<div class="destination_title">
						<label><input type="radio" name="id" checked="checked" />宛先情報</label>
					</div>
					<div class="destination_box">
						ふりがな:
						<s:property value="familyNameKana" />
						<s:property value="firstNameKana" />
						<br>
						名前:
						<s:property value="familyName" />
						<s:property value="firstName" />
						<br>
						住所:
						<s:property value="userAddress" />
						<br>
						電話番号:
						<s:property value="telNumber" />
						<br>
						メールアドレス:
						<s:property value="email" />
						<br>
					</div>
				</div>
			</s:iterator>

			<div class="box_2">

			<div class="btn_1">
			<input type="button" value="宛先情報の新規登録"
			onclick="location.href= '<s:url action="GoDestinationRegisterAction" />' "></div>
			<div class="btn_2">
			<button type="submit">完了</button></div></div>

		</s:form>


	</div><br><br>
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