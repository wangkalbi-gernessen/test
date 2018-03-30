drop database if exists knit;
create database if not exists knit;

use knit;


drop table if exists user_info;

create table user_info(
id int primary key auto_increment,
user_id varchar(16) unique not null,
password varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
sex tinyint not null default 0,
email varchar(32) not null,
status tinyint not null default 0,
logined tinyint not null default 0,
regist_date datetime not null,
update_date datetime,
admin_flg tinyint not null default 0,
admin_count int not null default 0
);

drop table if exists item_info;

create table item_info(
id int primary key auto_increment,
item_id int unique not null,
item_name varchar(100) unique not null,
item_name_kana varchar(100) unique not null,
item_description varchar(200) not null,
category_id int not null,
price int,
item_stock int not null,
image_file_path varchar(100),
image_file_name varchar(50),
release_date datetime not null,
release_company varchar(50),
status tinyint(1) not null,
regist_date datetime not null,
update_date datetime
);

drop table if exists cart_info;

create table cart_info(
id int not null primary key auto_increment,
user_id varchar(16) not null,
temp_user_id varchar(128),
item_id int not null,
item_count int not null,
price int not null,
regist_date datetime not null,
update_date datetime
);

insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",1,100,1000,NOW());
insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",2,100,1000,NOW());
insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",3,100,1000,NOW());
insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",4,100,1000,NOW());
insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",5,100,1000,NOW());
insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",6,100,1000,NOW());
insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",7,100,1000,NOW());
insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",8,100,1000,NOW());
insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",9,100,1000,NOW());
insert into cart_info(user_id,temp_user_id,item_id,item_count,price,regist_date) values("internous","internous",10,100,1000,NOW());

drop table if exists purchase_history_info;

create table purchase_history_info(
id int not null primary key auto_increment,
user_id varchar(16) not null,
item_id int not null,
item_count int not null,
price int not null,
regist_date datetime not null,
update_date datetime,
order_num varchar(8),
status tinyint(1) not null,
send_flg tinyint not null
);


drop table if exists destination_info;

create table destination_info(
id int not null primary key auto_increment,
user_id varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
email varchar(32) not null,
tel_number varchar(13),
user_address varchar(50),
regist_date datetime not null,
update_date datetime
);

insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values( 'internous','南里','健太','なんり','けんた','nyandy1794@gmail.com','12345678','東京都練馬区','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('internous','桑本','直樹','くわもと','なおき','kuwamoto0721@gmail.com','12345678','東京都墨田区錦糸町','2018-02-06');

insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('kenta','安藤','健太','あんどう','けんた','kenta123@gmail.com','12345678900','東京都安藤区健太宅','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('zirou','松田','次郎','まつだ','じろう','zirou123@gmail.com','12345678900','東京都松田区次郎宅','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('tarou','安永','太郎','やすなが','たろう','tarou123@gmail.com','12345678900','東京都安永区太郎宅','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('saburou','松本','三郎','まつもと','さぶろう','saburou123@gmail.com','12345678900','東京都松本区三郎宅','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('sirou','拳','四郎','けん','しろう','sirou123@gmail.com','12345678900','東京都拳区四郎宅','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('gorou','茂野','五郎','しげの','ごろう','gorou123@gmail.com','12345678900','東京都茂野区五郎宅','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('rokurou','轆轤','六郎','ろくろ','ろくろう','rokurou123@gmail.com','12345678900','東京都轆轤区六郎宅','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('hanako','安藤','花子','あんどう','はなこ','hanako123@gmail.com','12345678900','東京都安藤区花子宅','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('matuko','梅','松子','うめ','まつこ','matuko123@gmail.com','12345678900','東京都梅区松子宅','2018-02-06');
insert into destination_info(user_id,family_name,first_name, family_name_kana,first_name_kana,email,tel_number,user_address,regist_date) values('takeko','梅','竹子','うめ','たけこ','takeko123@gmail.com','12345678900','東京都梅区竹子宅','2018-02-06');


drop table if exists m_category;

create table m_category(
id int not null primary key auto_increment,
category_id int not null unique,
category_name varchar(20) not null unique,
category_description varchar(100),
insert_date datetime not null,
update_date datetime
);

drop table if exists review_transaction;

create table review_transaction(
id int not null primary key auto_increment,
user_id varchar(16),
item_id int not null,
review int not null,
review_body varchar(100),
insert_date datetime not null
);

insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("internous","internous01","南里","健太","なんり","けんた",0,"nyandy1794@gmail.com",1,1,cast("2018-02-05" as date),0);

insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("kenta","kenta123","安藤","健太","あんどう","けんた",0,"kenta123@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("zirou","zirou123","松田","次郎","まつだ","じろう",0,"zirou23@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("tarou","tarou123","安永","太郎","やすなが","たろう",0,"zirou23@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("saburou","saburou123","松本","三郎","まつもと","さぶろう",0,"saburou23@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("sirou","sirou123","拳","四郎","けん","しろう",0,"sirou23@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("gorou","gorou123","茂野","五郎","しげの","ごろう",0,"gorou123@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("rokurou","rokurou123","轆轤","六郎","ろくろ","ろくろう",0,"rokuro123@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("hanako","hanako123","安藤","花子","あんどう","はなこ",1,"rokuro123@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("matuko","matuko123","梅","松子","うめ","まつこ",1,"matuko123@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("takeko","takeko123","梅","竹子","うめ","たけこ",1,"takeko123@gmail.com",1,1,cast("2018-02-19" as date),0);
insert into user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,status,logined,regist_date,admin_flg) values("admin","admin01","管理","者","かんり","しゃ",0,"nyan1794@gmail.com",1,1,cast("2018-02-05" as date),1);



insert into m_category(category_id,category_name,category_description,insert_date) values(1,"トップス","トップスのカテゴリー",NOW());
insert into m_category(category_id,category_name,category_description,insert_date) values(2,"ボトム","ボトムのカテゴリー",NOW());
insert into m_category(category_id,category_name,category_description,insert_date) values(3,"アウター","アウターのカテゴリー",NOW());
insert into m_category(category_id,category_name,category_description,insert_date) values(4,"小物","小物のカテゴリー",NOW());
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(1,"スポーツウェア","すぽーつうぇあ","動きやすいスポーツウェア",1,2500,100,"/knit/images/tops1.jpg","スポーツウェア","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(2,"メンズTシャツ","めんずTしゃつ","紺色のシャツ",1,1200,100,"/knit/images/tops2.jpg","紺色シャツ","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(3,"ワンピース","わんぴーす","薄い青色のワンピース",1,3000,50,"/knit/images/tops3.jpg","ワンピース","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(4,"レディースTシャツ","れでぃーすTしゃつ","灰色のシャツ",1,500,10,"/knit/images/tops4.jpg","レディースシャツ","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(5,"メンズシャツ","めんずしゃつ","シャープに見えるシンプルなシャツ",1,500,222,"/knit/images/tops5.jpg","メンズシャツ","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(6,"ネイビーニット","ねいびーにっと","紺色の落ち着きのあるニット",1,1350,300,"/knit/images/tops6.jpg","ネイビーシャツ","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(7,"レースワンピース","れーすわんぴーす","れーすが派手なワンピース",1,4000,200,"/knit/images/tops7.jpg","レースワンピース","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(8,"花柄ワンピース","はながらわんぴーす","花柄で鮮やかなワンピース",1,3500,15,"/knit/images/tops8.jpg","花柄ワンピース","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(9,"UNDETROZETシャツ","UNDETROZETしゃつ","有名ブランドUNDETROZETのシャツ",1,2500,23,"/knit/images/tops9.jpg","UNDETROZE Tシャツ","2018-02-06","株式会社UNDETROZE",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(10,"メンズ黒Tシャツ","めんずくろTしゃつ","黒いTシャツ",1,750,10,"/knit/images/tops10.jpg","黒いシャツ","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(11,"柄入りピンクワンピース","がらいりぴんくわんぴーす","柄入りのピンクワンピース",1,2500,10,"/knit/images/tops11.jpg","ピンクワンピース","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(12,"レディーススーツズボン","れでぃーすすーつずぼん","スッキリ細く見えるスーツのズボン",2,3500,10,"/knit/images/bottoms1.jpg","レディーススーツズボン","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(13,"デニムミニスカート","でにむみにすかーと","ライトブルーのデニムミニスカート",2,1500,22,"/knit/images/bottoms2.jpg","ボトムミニスカート","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(14,"ネイビーロングスカート","ねいびーろんぐすかーと","紺色のロングスカート",2,1700,24,"/knit/images/bottoms3.jpg","ロングスカート","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(15,"ジーンズ","じーんず","ライトブルーのメンズジーンズ",2,1500,32,"/knit/images/bottoms4.jpg","ジーンズ","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(16,"レディースグレイパンツ","れでぃーすぐれいぱんつ","足が長く見える魔法のズボン",2,2000,24,"/knit/images/bottoms5.jpg","レディースグレイパンツ","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(17,"柄入りロングスカート","がらいりろんぐすかーと","森ガールになりたいあなたにおすすめの一品",2,3000,22,"/knit/images/bottoms6.jpg","ロングスカート","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(18,"Pコート","Pこーと","男女使える黒のPコート",3,4000,27,"/knit/images/outer1.jpg","Pコート","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(19,"レディーストレンチコート","れでぃーすとれんちこーと","ピンク色のかわいいトレンチコート",3,4500,27,"/knit/images/outer2.jpg","トレンチコート","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(20,"ステンカラーコート","すてんからーこーと","首元の毛は狸を使ってるのでとても温かいです。",3,44500,3,"/knit/images/outer3.jpg","ステンカラーコート","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(21,"メンズトレンチコート","めんずとれんちこーと","ブラウンのトレンチコート",3,3500,3,"/knit/images/outer4.jpg","メンズトレンチコート","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(22,"レインウェア","れいんうぇあ","防水性〇機能性〇山ガールになりたいあなた方におすすめのウェアです",3,6500,3,"/knit/images/outer5.jpg","レインウェア","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(23,"ノーカラーコート","のーからーこーと","グレイのノーカラーコート",3,3000,3,"/knit/images/outer6.jpg","ノーカラーコート","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(24,"カジュアルジャケット","かじゅあるじゃけっと","シンプルでおしゃれなジャケット",3,5000,3,"/knit/images/outer7.jpg","ジャケット","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(25,"メンズPコート","めんずPこーと","着心地の良い黒のPコート",3,5000,3,"/knit/images/outer8.jpg","Ｐコート","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(26,"ホンブルク","ほんぶるく","形が崩れにくい赤いホンンブルク型の帽子",4,2500,95,"/knit/images/item4.jpg","ホンブルク","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(27,"ラウンド型眼鏡","らうんどがためがね","知的なイメージが欲しいあなたにおすすめの眼鏡です。",4,3500,100,"/knit/images/item5.jpg","ラウンド型眼鏡","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(28,"ニット帽","にっとぼう","赤いニット帽",4,1500,100,"/knit/images/item6.jpg","ニット帽","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(29,"髪飾り","かみかざり","花の髪飾り",4,5500,100,"/knit/images/item7.jpg","ニット帽","2018-02-06","株式会社South",1,"2018-02-06");
insert into item_info(item_id,item_name,item_name_kana,item_description,category_id,price,item_stock,image_file_path,image_file_name,release_date,release_company,status,regist_date) values(30,"ストール","すとーる","カシミアが使われているのでとても温かいストールです。",4,7500,100,"/knit/images/item8.jpg","ストール","2018-02-06","株式会社South",1,"2018-02-06");