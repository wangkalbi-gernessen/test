<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!-- カンマ出すカスタムタグ -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	history.forward();
</script>
<title>注文履歴画面</title>
<link rel="stylesheet" type="text/css" href="./css/purchaseHistory.css">
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

	<!--ヘッダーここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--ヘッダーここまで-->

	<!--メインここから -->
	<div id="main">
		<br>
		<div class="pageback">
			<a href='<s:url action="GoHomeAction"/>'>TOP</a> &nbsp;> <a
				href='<s:url action="MyPage2Action"/>'>マイページ</a> &nbsp;>&nbsp; <a>注文履歴</a>
		</div>

		<h2 class="title">注文履歴</h2>
	<!-- 購入履歴削除後のメッセージ表示 -->
        <div class="no_purchase_history1">
		<s:if test="message !=null">
				<s:property value="message" />
		</s:if>
		</div>
	<!-- 削除後のメッセージ表示ここまで -->

		<s:if test="purchaseHistoryDTO==null">
			<div class="no_purchase_history">
				<h3>購入情報はありません</h3>
			</div>
		</s:if>
		<s:else>
		<table border="1"
				style="width: 1100px; background-color: #f5f5f5; text-align: center;">
				<caption>注文履歴は以下になります</caption>
				<s:iterator value="purchaseHistoryDTO">

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
		<!-- 購入履歴削除 -->
			<s:form method="delete" action="PurchaseHistoryAction" theme="simple">
				<input type="hidden" name="deleteFlg" value="1">
				<button type="submit">注文履歴を削除</button>
				</s:form>
		</s:else>
		<!-- 購入履歴削除ここまで -->

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