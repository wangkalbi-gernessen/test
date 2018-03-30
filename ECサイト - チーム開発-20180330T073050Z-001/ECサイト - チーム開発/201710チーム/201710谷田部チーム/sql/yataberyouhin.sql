DROP DATABASE IF EXISTS yataberyouhin;
CREATE DATABASE yataberyouhin CHARACTER SET utf8;

use yataberyouhin;

CREATE TABLE user_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT "ID",
user_id varchar(128) UNIQUE KEY NOT NULL COMMENT "ユーザーID",
password varchar(16) NOT NULL COMMENT "パスワード",
family_name varchar(32) NOT NULL COMMENT "姓",
first_name varchar(32) NOT NULL COMMENT "名",
family_name_kana varchar(32) NOT NULL COMMENT "姓かな",
first_name_kana varchar(32) NOT NULL COMMENT "名かな",
sex tinyint NOT NULL DEFAULT 0 COMMENT "性別",
email varchar(32) NOT NULL COMMENT "メールアドレス",
status tinyint NOT NULL DEFAULT 1 COMMENT "ステータス",
logined tinyint NOT NULL DEFAULT 0 COMMENT "ログインフラグ",
insert_date datetime NOT NULL COMMENT "登録日",
update_date datetime COMMENT "更新日"
) COMMENT "会員情報テーブル";


CREATE TABLE m_category(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT "ID",
category_id int UNIQUE KEY NOT NULL COMMENT "カテゴリID",
category_name varchar(20) UNIQUE KEY NOT NULL COMMENT "カテゴリ名",
category_description varchar(100) COMMENT "登録日",
insert_date datetime NOT NULL COMMENT "更新日",
update_date datetime
) COMMENT "カテゴリマスタテーブル";


CREATE TABLE product_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT "ID",
product_id int UNIQUE KEY NOT NULL COMMENT "商品ID",
product_name varchar(100) UNIQUE KEY NOT NULL COMMENT "商品名",
product_name_kana varchar(100) UNIQUE KEY NOT NULL COMMENT "商品名かな",
product_description varchar(255) NOT NULL COMMENT "商品詳細",
category_id int NOT NULL COMMENT "カテゴリID",
price int COMMENT "価格",
stock int COMMENT "在庫",
image_file_path varchar(100) COMMENT "画像ファイルパス",
image_file_name varchar(50) COMMENT "画像ファイル名",
release_date datetime NOT NULL COMMENT "発売年月",
release_company varchar(50) COMMENT "発売会社",
status tinyint NOT NULL DEFAULT 1 COMMENT "ステータス",
insert_date datetime NOT NULL COMMENT "登録日",
update_date datetime COMMENT "更新日",
FOREIGN KEY(category_id) REFERENCES m_category(category_id) ON UPDATE CASCADE
) COMMENT "商品情報テーブル";


CREATE TABLE cart_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT "ID",
user_id varchar(128) COMMENT "ユーザーID",
temp_user_id varchar(128) COMMENT "仮ユーザーID",
product_id int NOT NULL COMMENT "商品ID",
count int NOT NULL COMMENT "購入個数",
insert_date datetime NOT NULL COMMENT "登録日",
update_date datetime COMMENT "更新日",
FOREIGN KEY(user_id) REFERENCES user_info(user_id) ON UPDATE CASCADE,
FOREIGN KEY(product_id) REFERENCES product_info(product_id) ON UPDATE CASCADE
) COMMENT "カート情報テーブル";


CREATE TABLE destination_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT "ID",
user_id varchar(16) NOT NULL COMMENT "ユーザーID",
family_name varchar(16) NOT NULL COMMENT "姓",
first_name varchar(16) NOT NULL COMMENT "名",
family_name_kana varchar(16) NOT NULL COMMENT "姓かな",
first_name_kana varchar(16) NOT NULL COMMENT "名かな",
email varchar(32) NOT NULL COMMENT "メールアドレス",
tel_number varchar(13) NOT NULL COMMENT "電話番号",
user_address varchar(50) NOT NULL COMMENT "住所",
insert_date datetime NOT NULL COMMENT "登録日",
update_date datetime COMMENT "更新日",
FOREIGN KEY(user_id) REFERENCES user_info(user_id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT "宛先情報テーブル";


CREATE TABLE purchase_history_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT "ID",
user_id varchar(16) NOT NULL COMMENT "ユーザーID",
product_id int NOT NULL COMMENT "商品ID",
count int NOT NULL COMMENT "購入個数",
insert_date datetime NOT NULL COMMENT "登録日",
update_date datetime COMMENT "更新日",
FOREIGN KEY(user_id) REFERENCES user_info(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(product_id) REFERENCES product_info(product_id) ON UPDATE CASCADE
) COMMENT "購入履歴情報テーブル";


CREATE TABLE review_info(
id int PRIMARY KEY NOT NULL AUTO_INCREMENT COMMENT "ID",
user_id varchar(16) NOT NULL COMMENT "ユーザーID",
product_id int NOT NULL COMMENT "商品ID",
evaluation int NOT NULL COMMENT "評価",
review_detail varchar(255) NOT NULL COMMENT "レビュー詳細",
insert_date datetime NOT NULL COMMENT "登録日",
FOREIGN KEY(user_id) REFERENCES user_info(user_id) ON UPDATE CASCADE,
FOREIGN KEY(product_id) REFERENCES product_info(product_id) ON UPDATE CASCADE
) COMMENT "レビュー情報テーブル";

CREATE TABLE contact(
name varchar(255)COMMENT "お問い合わせ名前",
qtype varchar(255)COMMENT "お問い合わせ種類",
content varchar(255))COMMENT "お問い合わせ内容";
