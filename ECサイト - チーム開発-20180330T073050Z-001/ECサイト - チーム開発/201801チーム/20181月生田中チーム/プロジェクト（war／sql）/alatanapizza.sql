SET names utf8;
SET foreign_key_checks = 0;
DROP DATABASE IF EXISTS alatanapizza;
CREATE DATABASE IF NOT EXISTS alatanapizza;

use alatanapizza;

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
secret_question int NOT NULL, -- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
secret_answer varchar(32)  NOT NULL, -- 秘密の質問の答え
status tinyint NOT NULL DEFAULT 1,-- ステータス (0:無効、1:有効)
logined tinyint NOT NULL DEFAULT 0,-- ログインフラグ (0:未ログイン、1:ログイン済み)
regist_date datetime NOT NULL,-- 登録日
update_date datetime,-- 更新日
master tinyint NOT NULL DEFAULT 0-- 管理者情報(0:一般、1:マスター)
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
msize_price int,-- Mサイズ価格
lsize_price int,-- Lサイズ価格
price int,-- サイドメニュー、ドリンク価格
stock int,-- 在庫
image_file_path varchar(100),-- 画像ファイルパス
image_file_name varchar(100),-- 画像ファイル名
release_date datetime NOT NULL, -- 発売年月
release_company varchar(50), -- 発売会社
status tinyint NOT NULL DEFAULT 0,-- ステータス(0:無効、1:有効)
regist_date datetime NOT NULL,-- 登録日
update_date datetime,-- 更新日
FOREIGN KEY(category_id) REFERENCES m_category(category_id) ON UPDATE CASCADE
);


-- -----------↓トッピング情報テーブル↓----------------------------
CREATE TABLE m_topping(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT, -- ID
topping_id int NOT NULL UNIQUE KEY, -- カテゴリID
topping_name varchar(20) NOT NULL UNIQUE KEY, -- トッピング名
msize_price int,-- Mサイズ価格
lsize_price int,-- Lサイズ価格
insert_date datetime NOT NULL, -- 登録日
update_date datetime-- 更新日
);


-- -----------↓カート情報テーブル↓----------------------------
CREATE TABLE cart_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,-- ID
user_id varchar(16) NOT NULL,-- ユーザーID
temp_user_id varchar(128),-- 仮ユーザーID
product_id int NOT NULL ,-- 商品ID
product_count int NOT NULL,-- 個数
price int NOT NULL,-- 金額
pizza_size varchar(10), -- ピザの時だけNULLでない。ピザの時はMまたはL
regist_date datetime NOT NULL,-- 登録日
update_date datetime,-- 更新日
/*FOREIGN KEY(user_id) REFERENCES user_info(user_id) ON UPDATE CASCADE,*/
FOREIGN KEY(product_id) REFERENCES product_info(product_id) ON UPDATE CASCADE
);

-- -----------↓カート内のピザのトッピングテーブル↓----------------------------
create table cart_topping_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT,-- ID
cart_id int NOT NULL,
topping_id int NOT NULL,
regist_date datetime NOT NULL,-- 登録日
update_date datetime-- 更新日
);

-- -----------↓お気に入り情報テーブル↓----------------------------
CREATE TABLE favorite_info(
id int not null primary key auto_increment,
user_id varchar (16),
product_id int,
regist_date datetime,
unique(user_id,product_id)

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
postal_code varchar(8) NOT NULL,-- 郵便番号
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
	secret_question,-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	secret_answer,-- 秘密の質問の答え
	regist_date, -- 登録日
	master
)VALUES (
	"taro",-- ユーザーID
	"123",-- パスワード
	"田中",-- 姓
	"こうじ",-- 名
	"たなか",-- 姓かな
	"こうじ", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"tanaka@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"alatana",-- ユーザーID
	"pizza",-- パスワード
	"アラタナ",-- 姓
	"ピザ",-- 名
	"あらたな",-- 姓かな
	"ぴざ", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"ピザ",-- 秘密の質問の答え
	NOW(), -- 登録日
	1-- 管理者情報
),
 (
	"y123",-- ユーザーID
	"123",-- パスワード
	"矢内",-- 姓
	"たろう",-- 名
	"やない",-- 姓かな
	"はなこ", -- 名かな
	1,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"n123",-- ユーザーID
	"123",-- パスワード
	"仲尾",-- 姓
	"たろう",-- 名
	"なかお",-- 姓かな
	"たろう", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"o123",-- ユーザーID
	"123",-- パスワード
	"太田",-- 姓
	"たろう",-- 名
	"おおた",-- 姓かな
	"たろう", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"i123",-- ユーザーID
	"123",-- パスワード
	"石井",-- 姓
	"たろう",-- 名
	"いしい",-- 姓かな
	"たろう", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"is123",-- ユーザーID
	"123",-- パスワード
	"石崎",-- 姓
	"はなこ",-- 名
	"いしざき",-- 姓かな
	"はなこ", -- 名かな
	1,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"s123",-- ユーザーID
	"123",-- パスワード
	"菅原",-- 姓
	"たろう",-- 名
	"すがわら",-- 姓かな
	"たろう", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"m123",-- ユーザーID
	"123",-- パスワード
	"森山",-- 姓
	"たろう",-- 名
	"もりやま",-- 姓かな
	"たろう", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"mt123",-- ユーザーID
	"123",-- パスワード
	"松野",-- 姓
	"はなこ",-- 名
	"まつの",-- 姓かな
	"はなこ", -- 名かな
	1,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"ym123",-- ユーザーID
	"123",-- パスワード
	"山中",-- 姓
	"たろう",-- 名
	"なまなか",-- 姓かな
	"たろう", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"u123",-- ユーザーID
	"123",-- パスワード
	"魚部",-- 姓
	"はなこ",-- 名
	"うおべ",-- 姓かな
	"はなこ", -- 名かな
	1,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"とまと",-- 秘密の質問の答え
	NOW(),-- 登録日
	0-- 管理者情報
	),
	(
	"alapizza",-- ユーザーID
	"123",-- パスワード
	"アラタナ",-- 姓
	"ピザ",-- 名
	"あらたな",-- 姓かな
	"ぴざ", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"ピザ",-- 秘密の質問の答え
	NOW(), -- 登録日
	1-- 管理者情報
),
(
	"pizza",-- ユーザーID
	"123",-- パスワード
	"アラタナ",-- 姓
	"ピザ",-- 名
	"あらたな",-- 姓かな
	"ぴざ", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"ピザ",-- 秘密の質問の答え
	NOW(), -- 登録日
	1-- 管理者情報
),
(
	"apizza",-- ユーザーID
	"123",-- パスワード
	"アラタナ",-- 姓
	"ピザ",-- 名
	"あらたな",-- 姓かな
	"ぴざ", -- 名かな
	0,-- 性別 (0:男性 1:女性)
	"alatana@pizza.com",-- メールアドレス
	"1",-- 秘密の質問 (1:好きな食べ物 2:嫌いな食べ物)
	"ピザ",-- 秘密の質問の答え
	NOW(), -- 登録日
	1-- 管理者情報
);

INSERT INTO destination_info(-- -----------宛先情報テーブルへ-----------
	user_id,-- ユーザーID
	family_name,-- 姓
	first_name,-- 名
	family_name_kana,-- 姓かな
	first_name_kana,-- 名かな
	email,-- メールアドレス
	tel_number,-- 電話番号
	postal_code,-- 郵便番号
	user_address,-- 住所
	regist_date-- 登録日
)VALUES(
	"taro",-- ユーザーID
	"田中",-- 姓
	"こうじ",-- 名
	"たなか",-- 姓かな
	"こうじ", -- 名かな
	"ponde@pizza.com",-- メールアドレス
	"080-0000-0000",-- 電話番号
	"1020075",-- 郵便番号
	"東京都千代田区三番町",-- 住所
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
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),

	(2,
	"Pizza",
	"ピザに関するカテゴリー",
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),

    (3,
	"SideMenu",
	"サイドメニューに関するカテゴリー",
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),

    (4,
	"Drink",
	"ドリンクに関するカテゴリー",
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	);


    INSERT INTO product_info(-- ------商品情報テーブルへ--------------
	product_id,-- 商品ID
    product_name,-- 商品名
    product_name_kana,-- 商品名かな
    product_description,-- 商品詳細
    category_id,-- カテゴリID
    msize_price,-- Mサイズ値段
    lsize_price,-- Lサイズ値段
    price,-- サイドメニュー、ドリンク価格
    stock,-- 在庫
    image_file_path, -- 画像ファイルパス
	image_file_name, -- 画像ファイル名
	release_date,-- 発売年月
	release_company,-- 発売会社
	status,-- ステータス(0:無効、1:有効)
	regist_date,-- 登録日
	update_date-- 更新日
)VALUES(-- ---------------マルゲリータ-----------------------
	1,-- 商品ID
	"Margherita",-- 商品名
	"まるげりーた",-- 商品名かな
	"ピザの王道！トマトとフレッシュモッツァレラチーズが絶妙です。",
	2,-- カテゴリID
	2000, -- Mサイズ値段
    3000, -- Lサイズ値段
    0,
	10,-- 在庫
	"./images/pizza/Margherita.jpg",-- 画像ファイルパス
	"Margherita.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ----------------シーフードミックス------------------
    2,-- 商品ID
	"SeafoodMix",-- 商品名
	"しーふーどみっくす",-- 商品名かな
	"シーフードピザナンバー１！魚介の旨みたっぷり！人気の海の幸と、野菜のリッチなおいしさ！",
	2,-- カテゴリID
	2700, -- Mサイズ値段
    4000, -- Lサイズ値段
    0,
	10,-- 在庫
	"./images/pizza/SeafoodMix.jpg",-- 画像ファイルパス
	"SeafoodMix.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ----------------デラックスピザ-----------------------
    3,-- 商品ID
	"DeluxePizza",-- 商品名
	"でらっくすぴざ",-- 商品名かな
	"「ピザ」と言えばこちら！ミートと野菜がトマトソースにぴったり。バランスのとれた定番のおいしさ。",
	2,-- カテゴリID
	2300, -- Mサイズ値段
    3400, -- Lサイズ値段
    0,
	10,-- 在庫
	"./images/pizza/DeluxePizza.jpg",-- 画像ファイルパス
	"DeluxePizza,png",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- --------------------チーズアンドチーズ----------------
    4,-- 商品ID
	"CheeseAndCheese",-- 商品名
	"ちーずあんどちーず",-- 商品名かな
	"チーズピザナンバー１！トマトの甘味ととろーりチーズが相性抜群の１枚です！",
	2,-- カテゴリID
	2300, -- Mサイズ値段
    3400, -- Lサイズ値段
    0,
	10,-- 在庫
	"./images/pizza/CheeseAndCheese.jpg",-- 画像ファイルパス
	"CheeseAndCheese.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- -------------------エビマヨベーコン--------------------
    5,-- 商品ID
	"EbimayoBacon",-- 商品名
	"えびまよべーこん",-- 商品名かな
	"ぷりぷりのエビと甘みのあるベーコンに、じゅわっととけたマヨネーズとチーズが最高なピザ！お子さまから大人まで愛されるこの味わいをぜひご堪能ください。",
	2,-- カテゴリID
	2500, -- Mサイズ値段
    3800, -- Lサイズ値段
    0,
	10,-- 在庫
	"./images/pizza/Ebimayo.jpg",-- 画像ファイルパス
	"Ebimayo.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- --------------------ツナチーズ-------------------------
    6,-- 商品ID
	"TunaCheese",-- 商品名
	"つなちーず",-- 商品名かな
	"ツナの旨みとチーズの味わいで幅広い年齢層に人気のピザです！",
	2,-- カテゴリID
	2100, -- Mサイズ値段
    3000, -- Lサイズ値段
    0,
	10,-- 在庫
	"./images/pizza/TunaCheese.jpg",-- 画像ファイルパス
	"TunaCheese.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- -------------------地中海の恵み--------------------------
    7,-- 商品ID
	"Mediterranean",-- 商品名
	"ちちゅうかいのめぐみ",-- 商品名かな
	"ずわい蟹の濃厚な香りとエビのぷりっとした食感が楽しめる、シーフード好きにはたまらないピザ。爽やかなチェリートマトとたっぷりふりかけたパルメザンチーズがより旨味を引き立てます。",
	2,-- カテゴリID
	2700, -- Mサイズ値段
    4000, -- Lサイズ値段
    0,
	10,-- 在庫
	"./images/pizza/Mediterranean.jpg",-- 画像ファイルパス
	"Mediterranean.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- -----------------バジルピザ-----------------------------
    8,-- 商品ID
	"BasilPizza",-- 商品名
	"ばじるぴざ",-- 商品名かな
	"オリーブオイルとガーリックの風味が本格的なバジルソース。バジルソースと酸味のあるクリームチーズが味を引き立てるピザ。",
	2,-- カテゴリID
	2100, -- Mサイズ値段
    3000, -- Lサイズ値段
    0,
	10,-- 在庫
	"./images/pizza/BasilPizza.jpg",-- 画像ファイルパス
	"BasilPizza.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- -----------------------てりやきピザ----------------------
    9,-- 商品ID
	"TeriyakiPizza",-- 商品名
	"てりやきぴざ",-- 商品名かな
	"チキンにしみこんだテリヤキソースがたまらない！ALATANAの和風定番ピザ。",
	2,-- カテゴリID
	2000, -- Mサイズ値段
    3200, -- Lサイズ値段
    0,
	10,-- 在庫
	"./images/pizza/TeriyakiPizza.jpg",-- 画像ファイルパス
	"TeriyakiPizza.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ---------------------フライドチキン------------------------
    10,-- 商品ID
	"FriedChicken",-- 商品名
	"ふらいどちきん",-- 商品名かな
	"こだわりの骨なしチキンを使ったとっておきのメニュー。どれにしようか迷ったら、コレで決まり！ジューシーでクセになるフライドチキンです。",
	3,-- カテゴリID
	0,
    0,
    520,-- 価格
	30,-- 在庫
	"./images/side/FriedChicken.jpg",-- 画像ファイルパス
	"FriedChicken.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ---------------------フライドポテト------------------------
    11,-- 商品ID
	"FriedPotato",-- 商品名
	"ふらいどぽてと",-- 商品名かな
	"皮つきのうまさ！外はカリッ、中はホックリ！お子様にも大人気です！口に運べば、バターの風味とポテトの旨みが広がるフライドポテト。",
	3,-- カテゴリID
	0,
    0,
    480,-- 価格
	30,-- 在庫
	"./images/side/FriedPotato.jpg",-- 画像ファイルパス
	"FriedPotato.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ---------------------シーザーサラダ------------------------
    12,-- 商品ID
	"CaesarSalad",-- 商品名
	"しーざーさらだ",-- 商品名かな
	"しゃきしゃきレタス・新鮮野菜と、スモークチキン＆クルトンが絶妙！シーザーサラダ",
	3,-- カテゴリID
	0,
    0,
    620,-- 価格
	30,-- 在庫
	"./images/side/CaesarSalad.jpg",-- 画像ファイルパス
	"CaesarSalad.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ---------------------グラタン----------------------------
    13,-- 商品ID
	"Gratin",-- 商品名
	"ぐらたん",-- 商品名かな
	"シーフードの定番であるイカとエビに、いろどりのブロッコリーをトッピングした王道のグラタンです。",
	3,-- カテゴリID
	0,
    0,
    680,-- 価格
	10,-- 在庫
	"./images/side/Gratin.jpg",-- 画像ファイルパス
	"Gratin.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ---------------------コーンスープ------------------------
    14,-- 商品ID
	"CornSoup",-- 商品名
	"こーんすーぷ",-- 商品名かな
	"コーンをふんだんに入れ、濃厚で上品な甘さが特徴のスープです。北海道十勝産スイートコーンを使用したクリーミーなスープに仕上げました。",
	3,-- カテゴリID
	0,
    0,
    500,-- 価格
	30,-- 在庫
	"./images/side/CornSoup.jpg",-- 画像ファイルパス
	"CornSoup.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ---------------------アイス----------------------------
    15,-- 商品ID
	"Ice",-- 商品名
	"あいす",-- 商品名かな
	"わたあめ味のアイスクリームにちりばめられたキャンディーの粒。食後のデザート定番品！",
	3,-- カテゴリID
	0,
    0,
    350,-- 価格
	30,-- 在庫
	"./images/side/Ice.jpg",-- 画像ファイルパス
	"Ice.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ---------------------コーラ----------------------------
    16,-- 商品ID
	"Cola",-- 商品名
	"こーら",-- 商品名かな
	"ピザに良く合う！定番コーラ！350ML缶",
	4,-- カテゴリID
	0,
    0,
    100,-- 価格
	50,-- 在庫
	"./images/drink/Cola.jpg",-- 画像ファイルパス
	"Cola.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ---------------------ウーロン茶------------------------
    17,-- 商品ID
	"OolongTea",-- 商品名
	"うーろんちゃ",-- 商品名かな
	"ノンカフェイン。ウーロン茶。500ML", -- 商品詳細
	4,-- カテゴリID
	0,
    0,
    100,-- 価格
	50,-- 在庫
	"./images/drink/OolongTea.jpg",-- 画像ファイルパス
	"OolongTea.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	),(-- ---------------------オレンジジュース--------------------
    18,-- 商品ID
	"OrangeJuice",-- 商品名
	"おれんじじゅーす",-- 商品名かな
	"果汁100％。オレンジジュース。350ML", -- 商品詳細
	4,-- カテゴリID
	0,
    0,
    100,-- 価格
	50,-- 在庫
	"./images/drink/OrangeJuice.jpg",-- 画像ファイルパス
	"OrangeJuice.jpg",-- 画像ファイル名
	now(),-- 発売年月
	"ALATANAPIZZA",-- 発売会社
	1,-- ステータス(0:無効、1:有効)
	NOW(),-- 登録日
	NOW()-- 更新日
	);


    INSERT INTO m_topping(-- --------トッピングマスタテーブルへ-----------
	topping_id,-- トッピングID
	topping_name,-- トッピング名
    msize_price,-- Mサイズ値段
    lsize_price,-- Lサイズ値段
	insert_date,-- 登録日
	update_date-- 更新日
)VALUES
	(1,
	"Tomato",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (2,
	"Shrimp",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (3,
	"Onion",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (4,
	"Corn",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (5,
	"GreenPepper",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (6,
	"Cheese　",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (7,
	"Avocado",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (8,
	"Garlic",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (9,
	"Bacon",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (10,
	"Olive",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (11,
	"Salami",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	),
    (12,
	"Mushroom",
	324,
    486,
	cast('2018-03-01' as date),
	cast('2018-03-01' as date)
	);
