<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!-- カンマ出すカスタムタグ -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/productListDetail.css">
<title>商品詳細画面</title>
<script type="text/javascript">
history.forward();
</script>
</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">

		<!--ヘッダーメニューここから-->
		<jsp:include page="subjsp/header.jsp" flush="true"/>
		<!--ヘッダーメニューここまで-->

		<!-- メインここから -->
		<div id="main">
		<br><div  class="pageback">
		<a href='<s:url action="GoHomeAction"/>'>TOP</a>
		&nbsp;>
		<a href='<s:url action="ProductInfoAction"/>'>商品一覧</a>
		&nbsp;>&nbsp;
		<a>商品詳細</a>
		</div>

		<h2 class="title">商品詳細</h2><br>

		<!--商品詳細-->
		<div class="box">
		<s:if test="productInfoDTO.stock==0">
		<h3>在庫がありません</h3>
		</s:if>
		<s:else>
		<div class="image_box">
		<img src= '<s:property value="productInfoDTO.imageFilePath" /><s:property value="productInfoDTO.imageFileName" />' alt="商品画像"></div>

		<div  class="detail_box">
		<div class="product_name_kana">
		<s:property value="productInfoDTO.productNameKana" /></div>
		<div class="product_name">
		<s:property value="productInfoDTO.productName" /></div><br>
		<div class="product_description">
		<s:property value="productInfoDTO.productDescription" /></div>
		<br><div class="price">
		税込<fmt:formatNumber value="${productInfoDTO.price}" />円</div>
		<div class="release_company">
		発売会社:<s:property value="productInfoDTO.releaseCompany" /></div>
		<div class="release_date">
		発売年月日:<s:date name="productInfoDTO.releaseDate" format="yyyy年MM月dd日" /></div>

		<s:form action="PutProductIntoCartAction" theme="simple">
		購入個数:<s:select list="count" name="count" value="1" />
		<br><br>
		<s:hidden name="productId" value="%{productId}" />
		<s:hidden name="duplicationFlg" value="%{duplicationFlg}" />
		<s:if test="duplicationFlg">
		<input type="submit" value="購入個数を変更">
		</s:if>
		<s:else>
		<input type="submit" value="カートに追加">
		</s:else>
		</s:form></div>
		</s:else>
		</div>
		<br><br>

		<div class="related_product_box"><br>
		<hr><h3 class="title2">関連商品</h3><hr>
		<s:iterator value="similarInfoDTOList">
		<div class="related_product_small_box">
		<div class="related_img">
		<a href='<s:url action="ProductInfoDetailAction"><s:param name="productId" value="%{productId}"/></s:url>'>
		<img src= '<s:property value="imageFilePath" /><s:property value="imageFileName" />' alt="商品画像"></a></div>
		<div class="related_name">
		<s:property value="productName" /></div>
		<div class="related_price">
		<fmt:formatNumber value="${price}" />円</div></div>
		</s:iterator></div>

<!-- レビューここから -->
		<div class="review">
		<hr><h3 class="title2">レビュー</h3><hr><br>

		<s:iterator value="reviewList">
		<div class="review_date">
		<s:property value="reviewDetail" /></div>
		<div class="review_name_day">
		投稿者:<s:property value="familyName" /> <s:property value="firstName" />
		投稿日時:<s:property value="insertDate" /></div>
		</s:iterator>
		</div>
		<!-- レビューここまで追加しました -->
		</div>
		<!-- メインここまで -->

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