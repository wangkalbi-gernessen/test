set names utf8;
set foreign_key_checks=0;
drop database if exists kokotown;

create database if not exists kokotown;
use kokotown;

drop table if exists m_category;

create table m_category(
	id int primary key not null,					/*ID*/
	category_id int not null unique,				/*カテゴリID*/
	category_name varchar(20) not null unique,		/*カテゴリ名*/
	category_description varchar(100),				/*カテゴリ詳細*/
	insert_date datetime not null,					/*登録日*/
	update_date datetime 							/*更新日*/
);

drop table if exists user_info;

create table user_info(
	id int not null primary key auto_increment,		/*ID*/
	email varchar(32) not null unique,				/*email 兼 ユーザーID*/
--	user_id varchar(16) not null unique,			/*ユーザーID*/
	password varchar(16) not null,					/*パスワード*/
	family_name varchar(32) not null,				/*姓*/
	first_name varchar(32) not null,				/*名*/
	family_name_kana varchar(32) not null,			/*姓 かな*/
	first_name_kana varchar(32) not null,			/*名 かな*/
	sex tinyint not null default 0,					/*性別 0=男性 1=女性*/
	status tinyint not null default 0,				/*0=無効 1=有効*/
	logined tinyint not null default 0,				/*0=未ログイン 1=ログイン*/
	regist_date datetime not null,
	update_time datetime
);

drop table if exists product_info;

create table product_info(
	id int primary key not null auto_increment,
	product_id int not null unique,
	product_name varchar(100) not null unique,
	product_name_kana varchar(100) not null unique,
	product_description varchar(255) not null,
	category_id int not null,
	price int,
	count int,       /* 在庫*/
	image_file_path varchar(100),
	image_file_name varchar(50),
	release_date datetime not null,
	release_company varchar(50),
	status tinyint not null default 0,				/*0=無効 1=有効*/
	regist_date datetime not null,
	update_date datetime,
	foreign key(category_id) references m_category(category_id)
);

drop table if exists cart_info;

create table cart_info(
	id int primary key not null auto_increment,
	email varchar(32),				/*user_infoのemailとfk*/
	temp_user_id varchar(128),
	product_id int not null,						/*product_infoのproduct_idとfk*/
	product_count int not null,
	total_price int not null,
	regist_date datetime not null,
	update_date datetime,
	foreign key(email)references user_info(email),
	foreign key(product_id)references product_info(product_id)
);

drop table if exists purchase_history_info;

create table purchase_history_info(
	id int primary key not null auto_increment,
	email varchar(32) not null,				/*user_infoのemailとfk*/
	product_id int not null,						/*product_infoのproduct_idとfk*/
	product_count int not null,
	price int not null,
	regist_date datetime not null,
	update_date datetime,
	foreign key(email)references user_info(email),
	foreign key(product_id)references product_info(product_id)
);

drop table if exists destination_info;

create table destination_info(
	id int primary key not null auto_increment,
	email varchar(32) not null,				/*user_infoのemailとfk*/
	family_name varchar(32) not null,
	first_name varchar(32) not null,
	family_name_kana varchar(32) not null,
	first_name_kana varchar(32) not null,
	tel_number varchar(13) not null,
	user_address varchar(50) not null,
	regist_date datetime not null,
	update_date datetime,
	foreign key(email)references user_info(email)
);


INSERT INTO m_category(id,category_id,category_name,category_description,insert_date)
VALUES(1,101,"カメラ/時計","カメラ/時計カテゴリです","2018-01-08 11:10:10");
INSERT INTO m_category(id,category_id,category_name,category_description,insert_date)
VALUES(2,102,"車","車カテゴリです","2018-01-08 11:10:10");
INSERT INTO m_category(id,category_id,category_name,category_description,insert_date)
VALUES(3,103,"椅子/ソファー","椅子/ソファーカテゴリです","2018-01-08 11:10:10");
INSERT INTO m_category(id,category_id,category_name,category_description,insert_date)
VALUES(4,104,"靴・帽子","靴・帽子カテゴリです","2018-01-08 11:10:10");
INSERT INTO m_category(id,category_id,category_name,category_description,insert_date)
VALUES(5,105,"サングラス・傘","サングラス・傘カテゴリです","2018-01-08 11:10:10");

/*カテゴリー１ カメラ/時計 */
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(1,1,"赤のカメラ","あかのかめら","おしゃれなカメラです。",101,25000,10,"./img/camera1.jpg","camera1.jpg","good tomorrow.co.ltd","2018-01-08 11:10:10","2018-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(2,2,"黒と銀のカメラ","くろとぎんのかめら","おしゃれなカメラです。",101,35000,10,"./img/camera2.jpg","camera2.jpg","good tomorrow.co.ltd","2018-01-09 11:10:10","2018-01-09 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(3,3,"黒のカメラ","くろのかめら","おしゃれなカメラです。",101,100000,5,"./img/camera3.jpg","camera3.jpg","good tomorrow.co.ltd","2018-01-10 11:10:10","2018-01-10 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(4,4,"青いカメラ","あおいかめら","おしゃれなカメラです。",101,5000,50,"./img/camera4.jpg","camera4.jpg","good tomorrow.co.ltd","2018-01-11 11:10:10","2018-01-11 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(5,5,"青い腕時計","あおいうでどけい","おしゃれでカッコいい腕時計です。",101,30000,5,"./img/watches1.jpg","watches1.jpg","good tomorrow.co.ltd","2018-02-08 11:10:10","2018-02-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(6,6,"黒い時計","くろいとけい","シンプルで大人な置き時計です。",101,3000,50,"./img/watches2.jpg","watches2.jpg","good tomorrow.co.ltd","2018-02-08 11:10:10","2018-02-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(7,7,"青い時計","あおいとけい","おしゃれで可愛い置き時計です。",101,3000,50,"./img/watches3.jpg","watches3.jpg","good tomorrow.co.ltd","2018-02-08 11:10:10","2018-02-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(8,8,"銀の時計","ぎんのとけい","アンティークぽい置き時計です。",101,3000,50,"./img/watches4.jpg","watches4.jpg","good tomorrow.co.ltd","2018-02-08 11:10:10","2018-02-08 11:10:10");

/*カテゴリー２　クルマ　*/
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(9,9,"赤い車","あかいくるま","赤い最高級車です。",102,9800000,1,"./img/car1.jpg","car1.jpg","good tomorrow.co.ltd","2018-03-08 11:10:10","2018-03-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(10,10,"黄色い車","きいろいくるま","おしゃれでカスタムされた車です。",102,5000000,3,"./img/car2.jpg","car2.jpg","good tomorrow.co.ltd","2018-03-08 11:10:10","2018-03-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(11,11,"青い車","あおいくるま","おしゃれでスタイリッシュなスポーツカーです。",102,7000000,2,"./img/car3.jpg","car3.jpg","good tomorrow.co.ltd","2018-03-08 11:10:10","2018-03-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(12,12,"アメリカの車","あめりかのくるま","良心的な値段のアメリカを象徴する車です。",102,1000000,4,"./img/car4.jpg","car4.jpg","good tomorrow.co.ltd","2018-03-08 11:10:10","2018-03-08 11:10:10");

/*カテゴリー３　椅子/ソファー　*/
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(13,13,"黒い椅子","くろいいす","座ると何かが起こる椅子です。",103,1000,1,"./img/chair1.jpg","chair1.jpg","good tomorrow.co.ltd","2018-04-08 11:10:10","2018-04-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(14,14,"赤い椅子","あかいいす","堂々とした、椅子の中の王様です。",103,100000,5,"./img/chair2.jpg","chair2.jpg","good tomorrow.co.ltd","2018-04-08 11:10:10","2018-04-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(15,15,"黄色い椅子","きいろいいす","チープで座り心地抜群の椅子です。",103,5000,100,"./img/chair3.jpg","chair3.jpg","good tomorrow.co.ltd","2018-04-08 11:10:10","2018-04-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(16,16,"青のソファー","あおのそふぁー","オーソドックスなソファーです。",103,30000,5,"./img/sofa1.jpg","sofa1.jpg","good tomorrow.co.ltd","2018-05-08 11:10:10","2018-05-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(17,17,"黒のソファー","くろのそふぁー","シンプルで大人なソファーです。",103,80000,5,"./img/sofa2.jpg","sofa2.jpg","good tomorrow.co.ltd","2018-05-08 11:10:10","2018-05-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(18,18,"黄色のソファー","きいろのそふぁー","女の子に人気な可愛いソファーです。",103,60000,5,"./img/sofa3.jpg","sofa3.jpg","good tomorrow.co.ltd","2018-05-08 11:10:10","2018-05-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(19,19,"赤のソファー","あかのそふぁー","落ち着いた赤色のソファーです。",103,60000,5,"./img/sofa4.jpg","sofa4.jpg","good tomorrow.co.ltd","2018-05-08 11:10:10","2018-05-08 11:10:10");

/*カテゴリー４　帽子/靴　*/
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(20,20,"麦わら帽子","むぎわらぼうし","夏に大活躍なむぎわら帽子です。",104,5000,50,"./img/hat1.jpg","hat1.jpg","good tomorrow.co.ltd","2019-01-08 11:10:10","2019-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(21,21,"カウボーイハット","かうぼーいはっと","ある特定の人しか似合わない特別なぼうしです。",104,9000,20,"./img/hat2.jpg","hat2.jpg","good tomorrow.co.ltd","2019-01-08 11:10:10","2019-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(22,22,"青い帽子","あおいぼうし","いつでもかぶりたくなる青い帽子です。",104,10000,10,"./img/hat3.jpg","hat3.jpg","good tomorrow.co.ltd","2019-01-08 11:10:10","2019-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(23,23,"青の靴","あおのくつ","青が綺麗なハイヒールです。",104,100000,5,"./img/shoes1.jpg","shoes1.jpg","good tomorrow.co.ltd","2020-01-08 11:10:10","2020-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(24,24,"茶色の靴","ちゃいろのくつ","あなたに彩りをプラスする靴です。",104,25000,50,"./img/shoes2.jpg","shoes2.jpg","good tomorrow.co.ltd","2020-01-08 11:10:10","2020-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(25,25,"黒の靴","くろのくつ","ビンテージ物の靴です。",104,40000,1,"./img/shoes3.jpg","shoes3.jpg","good tomorrow.co.ltd","2020-01-08 11:10:10","2020-01-08 11:10:10");

/*カテゴリー５　サングラス/傘　*/
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(26,26,"～黄色い_サングラス～","きいろいさんぐらす","おしゃれな黄色いサングラスです",105,18000,50,"./img/sunglasses1.jpg","sunglasses1.jpg","good tomorrow.co.ltd","2021-01-08 11:10:10","2021-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(27,27,"青いサングラスuv60%カット","あおいさんぐらすゆーぶいろくじゅっぱーせんとかっと","海のように青いサングラスです。",105,10000,50,"./img/sunglasses2.jpg","sunglasses2.jpg","good tomorrow.co.ltd","2021-01-08 11:10:10","2021-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(28,28,"赤いサングラスver60","あかいさんぐらすばーじょん60","太陽のような綺麗な赤のサングラスです",105,13000,5,"./img/sunglasses3.jpg","sunglasses3.jpg","good tomorrow.co.ltd","2021-01-08 11:10:10","2021-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(29,29,"茶色いサングラスuv60%カット","ちゃいろいさんぐらすゆーぶいろくじゅっぱーせんとかっと","何とも言えない茶色のサングラスです",105,12000,0,"./img/sunglasses4.jpg","sunglasses4.jpg","good tomorrow.co.ltd","2021-01-08 11:10:10","2021-01-08 11:10:10");
INSERT INTO product_info(id,product_id,product_name,product_name_kana,product_description,category_id,price,count,image_file_path,image_file_name,release_company,release_date,regist_date)
VALUES(30,30,"黄色い傘","きいろいかさ","おしゃれで鮮やかな黄色い傘です。",105,3000,500,"./img/umbrella1.jpg","umbrella1.jpg","good tomorrow.co.ltd","2022-01-08 11:10:10","2022-01-08 11:10:10");


INSERT INTO user_info(id,email,password,family_name,first_name,family_name_kana,first_name_kana,sex,status,logined,regist_date)
VALUES(1,"test@test.com","testpass","test","test","てすと","てすと",0,0,1,"2018-01-10 10:17:10");

INSERT INTO user_info(id,email,password,family_name,first_name,family_name_kana,first_name_kana,sex,status,logined,regist_date)
VALUES(2,"aaaa@aaaa.com","aaaapass","aaaa","aaaa","ああああ","ああああ",1,0,1,"2018-01-10 10:17:10");



