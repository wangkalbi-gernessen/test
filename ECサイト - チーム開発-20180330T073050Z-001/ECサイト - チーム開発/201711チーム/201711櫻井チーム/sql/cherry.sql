DROP DATABASE IF EXISTS cherry;
CREATE DATABASE cherry CHARACTER SET utf8;

use cherry;

-- -----------↓会員情報テーブル↓----------------------------
CREATE TABLE user_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,-- ID
user_id varchar(16) UNIQUE KEY NOT NULL,-- ユーザーID
password varchar(16) NOT NULL,-- パスワード
family_name varchar(32) NOT NULL, -- 姓
first_name varchar(32) NOT NULL,-- 名
family_name_kana varchar(32) NOT NULL,-- 姓かな
first_name_kana varchar(32) NOT NULL, -- 名かな
sex tinyint NOT NULL DEFAULT 0, -- 性別 (0:男性 1:女性)
email varchar(32) NOT NULL,-- メールアドレス
status tinyint NOT NULL DEFAULT 1,-- ステータス (0:無効、1:有効)
logined tinyint NOT NULL DEFAULT 0,-- ログインフラグ (0:未ログイン、1:ログイン済み)
regist_date datetime NOT NULL,-- 登録日
update_date datetime-- 更新日
);


-- -----------↓カテゴリマスタテーブル↓----------------------------
CREATE TABLE m_category(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT, -- ID
category_id int NOT NULL UNIQUE KEY, -- カテゴリID
category_name varchar(20) NOT NULL UNIQUE KEY, -- カテゴリ名
category_description varchar(100), -- カテゴリ詳細
insert_date datetime NOT NULL, -- 登録日
update_date datetime-- 更新日
);



-- -----------↓商品情報テーブル↓----------------------------
CREATE TABLE product_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,-- ID
product_id int UNIQUE KEY NOT NULL,-- 商品ID
product_name varchar(100) UNIQUE KEY NOT NULL,-- 商品名
product_name_kana varchar(100) UNIQUE KEY NOT NULL,-- 商品名かな
product_description varchar(255) NOT NULL,-- 商品詳細
category_id int NOT NULL,-- カテゴリID
price int ,-- 価格
stock int,-- 在庫
image_file_name varchar(255),-- 画像ファイル名
release_date datetime NOT NULL, -- 発売年月
release_company varchar(50), -- 発売会社
status tinyint NOT NULL DEFAULT 0,-- ステータス(0:無効、1:有効)
regist_date datetime NOT NULL,-- 登録日
update_date datetime,-- 更新日
FOREIGN KEY(category_id) REFERENCES m_category(category_id) ON UPDATE CASCADE
);


-- -----------↓カート情報テーブル↓----------------------------
CREATE TABLE cart_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,-- ID
user_id varchar(16) NOT NULL,-- ユーザーID
temp_user_id varchar(128),-- 仮ユーザーID
product_id int NOT NULL ,-- 商品ID
product_count int NOT NULL,-- 個数
price int NOT NULL,-- 金額
regist_date datetime NOT NULL,-- 登録日
update_date datetime,-- 更新日
/*FOREIGN KEY(user_id) REFERENCES user_info(user_id) ON UPDATE CASCADE,*/
FOREIGN KEY(product_id) REFERENCES product_info(product_id) ON UPDATE CASCADE
);

-- -----------↓購入履歴情報テーブル↓----------------------------
CREATE TABLE purchase_history_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,-- ID
user_id varchar(16) NOT NULL ,-- ユーザーID
product_id int NOT NULL ,-- 商品ID
product_count int NOT NULL ,-- 個数
price int NOT NULL, -- 金額
regist_date datetime NOT NULL,-- 登録日
update_date datetime,-- 更新日
FOREIGN KEY(user_id) REFERENCES user_info(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(product_id) REFERENCES product_info(product_id) ON UPDATE CASCADE
);


-- -----------↓宛先情報テーブル↓-----------------------------------
CREATE TABLE destination_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,-- ID
user_id varchar(16) NOT NULL,-- ユーザーID
family_name varchar(32) NOT NULL,-- 姓
first_name varchar(32) NOT NULL,-- 名
family_name_kana varchar(32) NOT NULL,-- 姓かな
first_name_kana varchar(32) NOT NULL,-- 名かな
email varchar(32) NOT NULL,-- メールアドレス
tel_number varchar(13) NOT NULL,-- 電話番号
user_address varchar(50) NOT NULL,-- 住所
regist_date datetime NOT NULL,-- 登録日
update_date datetime-- 更新日
);




-- ---------------↓INSERT文↓--------------------------------------

INSERT INTO user_info(-- ------会員情報テーブルへ-----------------
	user_id,-- ユーザーID
	password,-- パスワード
	family_name,-- 姓
	first_name,-- 名
	family_name_kana,-- 姓かな
	first_name_kana, -- 名かな
	sex,-- 性別 (0:男性 1:女性)
	email,-- メールアドレス
	regist_date -- 登録日
)VALUES(
	"taro",-- ユーザーID
	"123",-- パスワード
	"ポンデ",-- 姓
	"ライオン",-- 名
	"ぽんで",-- 姓かな
	"らいおん", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"ponde@com",-- メールアドレス
	NOW()-- 登録日
);

INSERT INTO destination_info(-- -----------宛先情報テーブルへ-----------
	user_id,-- ユーザーID
	family_name,-- 姓
	first_name,-- 名
	family_name_kana,-- 姓かな
	first_name_kana,-- 名かな
	email,-- メールアドレス
	tel_number,-- 電話番号
	user_address,-- 住所
	regist_date-- 登録日
)VALUES(
	"taro",-- ユーザーID
	"ポンデ",-- 姓
	"ライオン",-- 名
	"ぽんで",-- 姓かな
	"らいおん", -- 名かな
	"ponde@com",-- メールアドレス
	"080-0000-0000",-- 電話番号
	"東京",-- 住所
	NOW()-- 登録日
);

INSERT INTO m_category(-- --------カテゴリーマスタテーブルへ-----------
	category_id,-- カテゴリID
	category_name,-- カテゴリ名
	category_description,-- カテゴリ詳細
	insert_date,-- 登録日
	update_date-- 更新日
)VALUES
	(1,
	"全てのカテゴリー",
	"全てのカテゴリー",
	cast('2018-01-10' as date),
	cast('2018-01-10' as date)
	),

	(2,
	"本",
	"本に関するカテゴリー",
	cast('2018-01-10' as date),
	cast('2018-01-10' as date)
	),

	(3,
	"家電・パソコン",
	"家電とパソコンに関するカテゴリー",
	cast('2018-01-10' as date),
	cast('2018-01-10' as date)
	),

	(4, -- カテゴリID
	"おもちゃ・ゲーム", -- カテゴリ名
	"おもちゃとゲームに関するカテゴリー", -- カテゴリ詳細
	cast('2018-01-10' as date), -- 登録日
	cast('2017-01-10' as date) -- 更新日
	);



INSERT INTO product_info(-- ------商品情報テーブルへ--------------
	product_id,-- 商品ID
    product_name,-- 商品名
    product_name_kana,-- 商品名かな
    product_description,-- 商品詳細
    category_id,-- カテゴリID
    price,-- 値段
    stock,
	image_file_name, -- 画像ファイル名
	release_date,-- 発売年月
	release_company,-- 発売会社
	status,-- ステータス(0:無効、1:有効)
	regist_date,-- 登録日
	update_date-- 更新日
)VALUES(
	1,-- 商品ID
	"英雄伝説",-- 商品名
	"えいゆうでんせつ",-- 商品名かな
	"おもしろいゲーム", -- 商品詳細
	4,-- カテゴリID
	2000, -- 値段
	5,-- 在庫
	"/cherry/img/test_game.jpeg",-- 画像ファイル名
	cast('2017-12-31' as date),-- 発売年月
	"ファルファル",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ----------------------2つ目の商品---------------------------
	2,
	"デデンネのぬいぐるみ",
	"ででんねのぬいぐるみ",
	"デデンネのかわいいぬいぐるみです！！",
	4,
	1000,
	5,-- 在庫
	"/cherry/img/test_dede.jpg",-- 画像ファイル名
	cast('2017-08-01' as date),
	"ポケモンの会社",
	1,
	NOW(),
	NOW()
	),(-- ------------------------3つ目の商品------------------------
	3,-- 商品ID
	"洗濯機",-- 商品名
	"せんたくき",-- 商品名かな
	"結構きれいな洗濯機です", -- 商品詳細
	3,-- カテゴリID
	10000, -- 値段
	5,-- 在庫
	"/cherry/img/test_sentaku.jpg",-- 画像ファイル名
	cast('2017-12-31' as date),-- 発売年月
	"ノジマ",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ------------------------4つ目の商品-------------------------
	4,-- 商品ID
	"頭文字D 47巻",-- 商品名
	"いにしゃるでぃー",-- 商品名かな
	"頭文字Dの漫画", -- 商品詳細
	2,-- カテゴリID
	400, -- 値段
	5,-- 在庫
	"/cherry/img/test_initialD.jpg",-- 画像ファイル名
	cast('2017-12-31' as date),-- 発売年月
	"藤原とうふ店",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- -----------------------------5つ目の商品--------------------
	5,-- 商品ID
	"北斗の拳 3巻",-- 商品名
	"ほくとのけん",-- 商品名かな
	"YouはShock", -- 商品詳細
	2,-- カテゴリID
	200, -- 値段
	5,-- 在庫
	"/cherry/img/test_hokuto.jpg",-- 画像ファイル名
	cast('2017-12-21' as date),-- 発売年月
	"本の出版社",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- -------------------------------6つ目の商品----------------------
	6,-- 商品ID
	"ミキサー",-- 商品名
	"みきさー",-- 商品名かな
	"ハリケーンミキサー", -- 商品詳細
	3,-- カテゴリID
	4000, -- 値段
	5,-- 在庫
	"/cherry/img/test_mixer.jpg",-- 画像ファイル名
	cast('2017-10-31' as date),-- 発売年月
	"家電量販店",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- -------------------------------7つ目の商品----------------------
	7,-- 商品ID
	"キーホルダー",-- 商品名
	"きーほるだー",-- 商品名かな
	"ナナチのキーホルダー", -- 商品詳細
	4,-- カテゴリID
	500, -- 値段
	5,-- 在庫
	"/cherry/img/test_nanachi.jpg",-- 画像ファイル名
	cast('2017-10-31' as date),-- 発売年月
	"グッズ会社",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- -------------------------------8つ目の商品----------------------
	8,-- 商品ID
	"クラッシュバンディクー2",-- 商品名
	"くらっしゅばんでぃくー2",-- 商品名かな
	"クラッシュのゲーム", -- 商品詳細
	4,-- カテゴリID
	2500, -- 値段
	5,-- 在庫
	"/cherry/img/test_crash.jpg",-- 画像ファイル名
	cast('2017-10-31' as date),-- 発売年月
	"ゲームを作ってる会社",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- -------------------------------9つ目の商品----------------------
	9,-- 商品ID
	"パソコン",-- 商品名
	"ぱそこん",-- 商品名かな
	"普通のパソコン", -- 商品詳細
	3,-- カテゴリID
	9000, -- 値段
	5,-- 在庫
	"/cherry/img/test_pc.jpg",-- 画像ファイル名
	cast('2017-10-31' as date),-- 発売年月
	"パソコンショップ",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	);

















