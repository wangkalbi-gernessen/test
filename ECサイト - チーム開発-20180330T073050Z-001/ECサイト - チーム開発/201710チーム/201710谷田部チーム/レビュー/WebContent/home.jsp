<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YATABE 谷田部良品</title>
<link rel="stylesheet" type="text/css" href="./css/home.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="./jquery.bxslider/jquery.bxslider.min.js"></script>
<link href="./jquery.bxslider/jquery.bxslider.css" rel="stylesheet">

<script type="text/javascript">
	$(function() {
		$(".bxslider").bxSlider({

			auto : true,
			controls : false,
			mode : 'fade',
			speed : 1000

		});
	});
</script>

</head>
<body text="#232323" link="##404040" vlink="#404040" alink="#404040">
	<!--ヘッダーここから-->
	<jsp:include page="subjsp/header.jsp" flush="true" />
	<!--ヘッダーここまで-->

	<!--メインここから -->
	<div id="main">

		<!-- PickUp スライドショーここから -->
		<br>
		<br>
		<br>
		<div class="pickup_title">
			<h2>今月のPickUp商品</h2>
		</div>
		<div class="slideshow">
			<ul class="bxslider">
				<li><a href='<s:url action="ProductInfoDetailAction.action?productId=1"/>'><img src="./image/kumabook.jpg"></a></li>
				<li><a href='<s:url action="ProductInfoDetailAction.action?productId=17"/>'><img src="./image/nuigurumi.jpg"></a></li>
				<li><a href='<s:url action="ProductInfoDetailAction.action?productId=23"/>'><img src="./image/tree.jpg"></a></li>
				<li><a href='<s:url action="ProductInfoDetailAction.action?productId=24"/>'><img src="./image/ri-su.jpg"></a></li>
			</ul>
		</div>
		<!-- PickUp スライドショーここまで -->

		<!-- categorybox title-->
		<br>
		<br>
		<br>
		<br>
		<div class="categorybox_book_title">
			<h3>本</h3>
		</div>

		<div class="categorybox_kaden_title">
			<h3>家電・パソコン</h3>
		</div>
		<div class="categorybox_omocya_title">
			<h3>おもちゃ・ゲーム</h3>
		</div>

		<div class="categorybox">
		<!-- categorybox 本 -->
		<div class="categorybox_book">
			<div class="book_image1"><a href='<s:url action="ProductInfoDetailAction.action?productId=2"/>'><img src="./image/soccerbook.jpg"></a></div>
			<div class="title1">『<b>Yataber12月号</b>』<br>税込<font size="4">560</font>円</div>

			<div class="book_image2"><a href='<s:url action="ProductInfoDetailAction.action?productId=4"/>'><img src="./image/gamebook.jpg"></a></div>
			<div class="title2">『<b>どうぶつの林 攻略本</b>』<br>税込<font size="4">1,200</font>円</div>

			<div class="book_image3"><a href='<s:url action="ProductInfoDetailAction.action?productId=7"/>'><img src="./image/javabook.jpg"></a></div>
			<div class="title3">『<b>初心者向けJava解説本</b>』<br>税込<font size="4">1,200</font>円</div>

			<div class="book_image4"><a href='<s:url action="ProductInfoDetailAction.action?productId=6"/>'><img src="./image/girlcomic.jpg"></a></div>
			<div class="title4">『<b>少女漫画</b>』<br>税込<font size="4">450</font>円</div>

		</div>
		<!-- categorybox 家電 -->
		<div class="categorybox_kaden">
			<div class="kaden_image1"><a href='<s:url action="ProductInfoDetailAction.action?productId=10"/>'><img src="./image/suihankisiro.jpg"></a></div>
			<div class="title1">『<b>白色の圧力IHの炒飯器</b>』<br>税込<font size="4">30,000</font>円</div>
			<div class="kaden_image2"><a href='<s:url action="ProductInfoDetailAction.action?productId=12"/>'><img src="./image/reizouko.jpg"></a></div>
			<div class="title2">『<b>青色の大型冷蔵庫</b>』<br>税込<font size="4">60,000</font>円</div>
			<div class="kaden_image3"><a href='<s:url action="ProductInfoDetailAction.action?productId=13"/>'><img src="./image/reizoukokuma.jpg"></a></div>
			<div class="title3">『<b>くま型の小さい冷蔵庫</b>』<br>税込<font size="4">6,000</font>円</div>
			<div class="kaden_image4"><a href='<s:url action="ProductInfoDetailAction.action?productId=14"/>'><img src="./image/pcblack.jpg"></a></div>
			<div class="title4">『<b>黒のパソコン15インチ</b>』<br>税込<font size="4">180,000</font>円</div>
		</div>
		<!-- categorybox  おもちゃ -->
		<div class="categorybox_omocya">
			<div class="omocya_image1"><a href='<s:url action="ProductInfoDetailAction.action?productId=20"/>'><img src="./image/kumagame.jpg"></a></div>
			<div class="title1">『<b>くまの育成ゲームソフト</b>』<br>税込<font size="4">3,500</font>円</div>
			<div class="omocya_image2"><a href='<s:url action="ProductInfoDetailAction.action?productId=17"/>'><img src="./image/nuigurumi.jpg"></a></div>
			<div class="title2">『<b>クリスマステディベア</b>』<br>税込<font size="4">3,000</font>円</div>
			<div class="omocya_image3"><a href='<s:url action="ProductInfoDetailAction.action?productId=22"/>'><img src="./image/soccergame.jpg"></a></div>
			<div class="title3">『<b>サッカーゲームソフト</b>』<br>税込<font size="4">3,600</font>円</div>
			<div class="omocya_image4"><a href='<s:url action="ProductInfoDetailAction.action?productId=21"/>'><img src="./image/musougame.jpg"></a></div>
			<div class="title4">『<b>戦国無双のゲームソフト</b>』<br>税込<font size="4">3,800</font>円</div>
		</div>
		</div><br>


	</div>
	<br>
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