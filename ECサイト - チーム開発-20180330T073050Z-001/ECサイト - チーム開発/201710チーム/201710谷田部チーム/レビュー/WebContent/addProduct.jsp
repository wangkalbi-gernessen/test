<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html>
<html>
<head>
<sx:head />
</head>
<body>

	<h3>管理画面（新規商品登録）</h3>
	<s:iterator value="errMsgList">
		<s:property />
	</s:iterator>
	<s:form action="AddProductAction" enctype="multipart/form-data" theme="simple">
		<s:div>
			<span>商品名:</span>
			<s:textfield name="productName" />
		</s:div>
		<s:div>
			<span>商品名かな:</span>
			<s:textfield name="productNameKana" />
		</s:div>
		<s:div>
			<span>商品詳細:</span>
			<s:textfield name="productDescription" />
		</s:div>
		<s:div>
			<span>カテゴリー:</span>
			<s:select name="categoryId"  list="categoryMap" />
		</s:div>
		<s:div>
			<span>価格:</span>
			<s:textfield name="price" />
		</s:div>
		<s:div>
			<span>在庫:</span>
			<s:textfield name="stock" />
		</s:div>
		<s:div>
			<span>商品画像を選択</span>
			<s:file property="uploadFile" name="imageFile" />
		</s:div>
		<s:div>
			<span>販売元会社:</span>
			<s:textfield name="releaseCompany" />
		</s:div>
		<s:div>
			<span>発売日:</span>
			<sx:datetimepicker name="releaseDate" displayFormat="yyyy-MM-dd"/>
		</s:div>
		<s:submit value="登録" />
	</s:form>

</body>
</html>