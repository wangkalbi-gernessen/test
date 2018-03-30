


set names utf8;
set foreign_key_checks=0;
drop database if exists forrest;

create database if not exists forrest;
use forrest;

/*
 * 会員情報テーブル
 */
drop table if exists user_info;

create table user_info(
id int not null primary key auto_increment,
user_id varchar(16) not null unique,
password varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
sex tinyint default 0,
email varchar(50) not null,
question varchar(255) not null,
answer varchar(255) not null,
status tinyint default 0,
logined tinyint default 0,
regist_date datetime not null,
update_date datetime,
m_flg tinyint default 0
);

/*
 * カテゴリーマスターテーブル
 */
drop table if exists m_category;

create table m_category(
id int primary key not null auto_increment,
category_id int not null unique,
category_name varchar(20) not null unique,
category_description varchar(100),
insert_date datetime not null,
update_date datetime
);

/*
 * 商品情報テーブル
 */
drop table if exists product_info;

create table product_info(
id int not null primary key auto_increment,
product_id int not null unique,
product_name varchar(100) not null unique,
product_name_kana varchar(100) not null unique,
product_description varchar(255) not null,
keywords varchar(255),
category_id int not null,
price int,
stock int,
image_file_path varchar(100),
image_file_name varchar(50) unique,
release_date date not null,
release_company varchar(50),
status tinyint default 0 not null,
regist_date datetime not null,
update_date datetime,
foreign key(category_id) references m_category(category_id)
);

/*
 * カート情報テーブル
 */
drop table if exists cart_info;

create table cart_info(
id int not null primary key auto_increment,
user_id varchar(16) not null,
product_id int not null,
product_count int not null,
price int  not null,
regist_date datetime not null,
update_date datetime,
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
);

/*
 * 購入履歴情報テーブル
 */
drop table if exists purchase_history_info;

create table purchase_history_info(
id int not null primary key auto_increment,
user_id varchar(16) not null,
product_id int not null,
product_count int not null,
price int not null,
regist_date datetime not null,
update_date datetime,
destination_id int,
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
);

/*
 * 宛先情報テーブル
 */
drop table if exists destination_info;

create table destination_info(
id int not null primary key auto_increment,
user_id varchar(16) not null,
family_name varchar(32) not null,
first_name varchar(32) not null,
family_name_kana varchar(32) not null,
first_name_kana varchar(32) not null,
email varchar(50) not null,
tel_number varchar(32) not null,
sex tinyint default 0,
zip varchar(8) not null,
user_address varchar(100) not null,
regist_date datetime not null,
update_date datetime
);

/*
 * お気に入りテーブル
 */
drop table if exists favorite;

create table favorite(
id int primary key not null auto_increment,
user_id varchar(16) not null,
product_id int not null,
insert_date datetime not null
);

/*
 * レビューテーブル
 */
drop table if exists review;

create table review(
id int not null primary key auto_increment,
user_id varchar(16) not null,
product_id int not null ,
title varchar(100) not null,
comment varchar(255) not null,
score int not null,
insert_date datetime not null
);

/*
 * ユーザー情報
 */
INSERT INTO user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,question,answer,regist_date,m_flg)
VALUES("taro","1234","田中","太郎","たなか","たろう","0","1234000000@com","嫌いな食べ物は？","ピーマン",now(),0);

INSERT INTO user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,question,answer,regist_date,m_flg)
VALUES("hanako","1111","山田","花子","やまだ","はなこ","1","11110000000@com","尊敬する人物は？","エジソン",now(),0);

INSERT INTO user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,question,answer,regist_date,m_flg)
VALUES("akiko","0000","平松","晶子","ひらまつ","あきこ","1","00000000000@com","初めて飼ったペットの名前は？","チョコ",now(),0),
("jiro","0000","鈴木","次郎","すずき","じろう","0","00000000000@com","初めて飼ったペットの名前は？","バナナ",now(),0),
("saburo","0000","田中","三郎","たなか","さぶろう","0","00000000000@com","初めて飼ったペットの名前は？","バナナ",now(),0),
("shiro","0000","田中","四郎","たなか","しろう","0","00000000000@com","初めて飼ったペットの名前は？","バナナ",now(),0),
("goro","0000","田中","五郎","たなか","ごろう","0","00000000000@com","初めて飼ったペットの名前は？","バナナ",now(),0),
("yoko","0000","山田","洋子","やまだ","ようこ","1","00000000000@com","初めて飼ったペットの名前は？","バナナ",now(),0),
("sachiko","0000","山田","幸子","やまだ","さちこ","1","00000000000@com","初めて飼ったペットの名前は？","バナナ",now(),0),
("yoshiko","0000","山田","好子","やまだ","よしこ","1","00000000000@com","初めて飼ったペットの名前は？","バナナ",now(),0),
("tamiko","0000","山田","多美子","やまだ","たみこ","1","00000000000@com","初めて飼ったペットの名前は？","バナナ",now(),0);

/*
 * 管理者アカウント
 */
INSERT INTO user_info(user_id,password,family_name,first_name,family_name_kana,first_name_kana,sex,email,question,answer,regist_date,m_flg)
VALUES("master","abcd","田中","次郎","たなか","じろう","0","abcd@com","嫌いな食べ物は？","トマト",now(),1),
("master2","abcd","山本","次郎","たなか","じろう","0","abcd@com","嫌いな食べ物は？","トマト",now(),1),
("master3","abcd","木村","次郎","たなか","じろう","0","abcd@com","嫌いな食べ物は？","トマト",now(),1);

/*
 * カテゴリー
 */
INSERT INTO m_category(category_id,category_name,category_description,insert_date)VALUES
(0,"全て","映画、本、音楽",now()),
(1,"映画","見て癒されて笑って気分転換になる、邦画、洋画",now()),
(2,"本","読むと癒される書籍",now()),
(3,"音楽","聴くと癒されるバラード系",now());

/*
 * 商品情報
 */
INSERT INTO product_info(product_id,product_name,product_name_kana,product_description, keywords,category_id,price,stock,image_file_path,image_file_name,release_date,release_company,regist_date)
VALUES
(20180300,"怪盗グルーのミニオン大脱走","かいとうぐるーのみにおんだいだっそう","2017年No.1ヒット洋画アニメーション! 史上最強の新たなライバルの出現! グルーも知らなかった新たな家族の秘密。そしてミニオンたちは・・・タイホ! ?グルーとミニオンの新たな物語がついに始まる! ","ミニオン グルー かいとう みにおん ぐるー 大脱走 だいだっそう minion ",1,3200,20,"./images/minions.jpg","minions.jpg","2018/3/2","Japan",now()),
(20180301,"怪盗グルーのミニオン危機一発","かいとうぐるーのみにおんききいっぱつ","誰もが失いたくない仲間がいる! ! 最強?の仲間、ミニオンたちに史上最大のピンチがやってきた! ?","ミニオン グルー かいとう みにおん ぐるー 危機一発 ききいっぱつ minion",1,1300,20,"./images/minions2.jpg","minions2.jpg","2018/3/2","Japan",now()),
(20180302,"ハリー・ポッターと賢者の石","はりーぽったーとけんじゃのいし","全世界に魔法をかけたファンタジー・アドベンチャーの最高傑作。","J・K・ローリング イギリス クリス・コロンバス はりぽた ハリポタ ハリーポッター はりーぽったー 賢者の石 けんじゃのいし けんじゃ hari-potta- 魔法  まほう ファンタジー",1,3900,20,"./images/harrypotter.jpg","harrypotter.jpg","2018/3/7","Japan",now()),
(20180303,"千と千尋の神隠し","せんとちひろのかみかくし","ジブリがいっぱいCOLLECTION『千と千尋の神隠し』","ジブリ 宮崎駿 アニメ 久石譲 せんとちひろのかみかくし 千と千尋 神隠し せんとちひろ かみかくし ",1,4000,20,"./images/senntochihiro.jpg","senntochihiro.jpg","2018/3/7","Japan",now()),
(20180304,"ホーム・アローン","ほーむあろーん","パリでクリスマスを過ごそうと飛行機に乗り込んだ15人の大家族。だが、飛行機の中で思い出した大事な忘れ物は……8歳のケビンだった! 家に取り残されたケビンは、一人の自由を思う存分楽しんでいたが、そこに2人組の泥棒が現れて……?","クリス・コロンバス カルキン クリスマス ホームアローン ほーむ あろーん ホーム アローン ho-muaro-n ho-muaro-nn",1,4800,20,"./images/homealone.jpg","homealone.jpg","2018/3/8","Japan",now()),
(20180305,"ted","てっど","中年テディベアテッドが日本席巻!2013年異例のミラクルヒット! とうとう家でも俺の映画が観れるぜ! どこだって出没してやるから一緒にモコモコしようぜ!","セス・マクファーレン ふぁんたじー ファンタジー クマ くま べあ てでぃー ベア 実写",1,900,10,"./images/ted.jpg","ted.jpg","2018/3/8","Japan",now()),
(20180306,"ted2","てっど２","世界中でまさかのメガヒットを記録した『テッド』。まさかの続編、また、モフモフしようぜ!!","セス・マクファーレン ファンタジー ふぁんたじー 続編 クマ くま べあ てでぃー ベア 実写 テッド",1,3500,10,"./images/ted2.jpg","ted2.jpg","2018/3/8","Japan",now()),
(20180307,"パディントン","ぱでぃんとん","≪全世界320億円超えのスーパー大ヒット!続編制作も決定の超話題作!≫40カ国以上に翻訳され全世界3500万部の売上を誇るベストセラーを映画化、]この愛すべき小さなクマの笑いと冒険の感動ストーリーに世界が熱狂!","Paddi ngton ポール・キング ファンタジー クマ くま べあ ベア パディ ディン ントン ぱでぃ でぃん んとん ",1,4000,10,"./images/paddington.jpg","paddington.jpg","2018/3/8","Japan",now()),
(20180308,"サマーウォーズ","さまーうぉーず","『時をかける少女』の細田守監督が放つ、劇場アニメーションの最新作『サマーウォーズ』。キャラクターデザイン・貞本義行、脚本・奥寺佐渡子など『時をかける少女』のスタッフが再結集したこの作品は、ふとした事から片田舎の大家族に仲間入りした少年が、突如世界を襲った危機に対して戦いを挑む物語である。","toki kakeru syoujo anime あにめ アニメ 細田 守 ほそだ まもる サマー ウォー さまー うぉー",1,5000,10,"./images/summerwars.jpg","summerwars.jpg","2018/3/8","Japan",now()),
(20180309,"となりのトトロ","となりのととろ","ジブリがいっぱいCOLLECTION『となりのトトロ』","tonari totoro みやざき はやお 宮崎 駿 anime あにめ アニメ ひさいし じょう 久石譲 さんぽ ジブリ じぶり こども",1,4000,10,"./images/totoro.jpg","totoro.jpg","2018/3/8","Japan",now()),
(20180310,"ぐでたま哲学","ぐでたまてつがく","サンリオキャラクター随一の、やる気のない言動が特徴的なたまご「ぐでたま」。その言動が「いちいち胸に刺さる! 」と、じわじわ人気急上昇中。「エラい人にやれと言われて始めた」ツイッターは4か月にしてフォロワー10万人突破! そんな「ぐでたま」の初の単行本がいよいよ誕生。","サンリオ",2,1000,10,"./images/gudetama.jpg","gudetama.jpg","2018/3/8","Japan",now()),
(20180311,"マイペースのススメェー","まいぺーすのすすめぇー","仕事や家族、友だちとの間でちょっと無理したり、頑張りすぎてしまったり…そんなあなたを癒してくれるかわいいヒツジの言葉と数々。2015年気ままに気楽に、マイペースにススメェ~。","写真 平林 美紀 三井 明子",2,1200,10,"./images/mypacenosusume.jpg","mypacenosusume.jpg","2018/3/8","Japan",now()),
(20180312,"ふびん系ネコ ドナドナちゃん","ふびんけいねこどなどなちゃん","人生はおなかもすくけど、大丈夫!!エンタメサイト・サークルリンクで大人気。注目の「ふびん系アイドル」が本になりました。ここでしか読めないかきおろしもいっぱい。","ホシノ ユミコ 4コマ漫画",2,1900,10,"./images/hubinnkeineko.jpg","fubinnkeineko.jpg","2018/3/2","Japan",now()),
(20180313,"星の王子さま","ほしのおうじさま","これまでで最も愛らしく、毅然とした王子さまが、優しい日本語でよみがえります。世界中の子供が、そして大人が読んできた。世紀を越えるベストセラー。","サンテグジュペリ 絵本 フランス",2,600,10,"./images/hosinoouzisama.jpg","hosinoouzisama.jpg","2018/3/8","Japan",now()),
(20180314,"銀河鉄道の夜","ぎんがてつどうのよる","ケンタウル祭の夜、銀河鉄道に乗って旅立ったジョ バンニとカムパネルラの悲しくも美しい夏の夜を幻 想的に描き、宮沢賢治の最高傑作とも称される表題 作「銀河鉄道の 夜」。","カンパネルラ ジョバンニ 自己犠牲 宮沢賢治",2,400,10,"./images/ginngatetudounoyoru.jpg","ginngatetudounoyoru.jpg","2018/3/8","Japan",now()),
(20180315,"十二番目の天使","じゅうにばんめのてんし","野球への愛、思い入れ、友情、勝利の喜び、敗戦のくやしさ…人生、愛、そして勇気をテーマにした、涙なくしては読めない、感動の物語。","オグ マンディーノ アメリカ 野球 人生",2,1200,10,"./images/zyuunibannmenotennshi.jpg","zyuunibannmenotennshi.jpg","2018/3/8","Japan",now()),
(20180316,"世界から猫が消えたなら","せかいからねこがきえたなら","二〇一三年本屋大賞ノミネートの感動作が、待望の文庫化、映画化! ","川村 元気 映画化 ファンタジー 本屋大賞ノミネート 本屋大賞",2,600,10,"./images/sekaineko.jpg","sekaineko.jpg","2018/3/8","Japan",now()),
(20180317,"ぐりとぐら","ぐりとぐら","1963年に「こどものとも」誌上で発表されて以来、日本だけでなく世界各国で愛され続けるふたごの野ネズミ「ぐり」と「ぐら」のお話。","ネズミ 絵本 チップとデール 中川李枝子 山脇百合子 ぐり ぐら ぐりと ぐら  ",2,900,10,"./images/guritogura.jpg","guritogura.jpg","2018/3/8","Japan",now()),
(20180318,"心の休ませ方","こころのやすませかた","悩める現代人をホッとさせたベストセラー人生論、待望の文庫化。","加藤諦三 心理学者 人生論 ベストセラー ",2,500,10,"./images/kokoronoyasumasekata.jpg","kokoronoyasumasekata.jpg","2018/3/8","Japan",now()),
(20180319,"やさしい人","やさしいひと","必要でない物と人を捨てる。無理をしている自分に気づく。仮面をつけて生きてきた過去を消化する。見失った自分の本性を探す。…世の中には、本当のやさしさと偽りのやさしさがある。あなたが幸せになるために必要なのは、「本当のやさしさ」である。","加藤諦三 心理学者 本当のやさしさ 本当の優しさ ",2,500,10,"./images/yasasiihito.jpg","yasasiihito.jpg","2018/3/8","Japan",now()),
(20180320,"REFLECTION","りふれくしょん","Mr.Childrenの新しい音楽の可能性”を探求し続けた2年7ヶ月。濃密な制作期間を経て、遂にNEW ALBUM「REFLECTION」が完成！！全23曲収録の｛Naked｝と厳選14曲収録の｛Drip｝の2形態で発表！！","Mr.Children ミスチル REFLE LECTI TION りふれ れくしょ くしょん ミスター チルドレン みすたー ちるどれん 新しい音楽 可能性",3,3000,10,"./images/refrection.jpg","refrection.jpg","2018/3/8","Japan",now()),
(20180321,"TOKYO GIRL","とうきょうがーる","2017/1/18 (水)より日本テレビで放送される水曜ドラマ『東京タラレバ娘』の主題歌、新曲「TOKYO GIRL」のリリースが決定。カップリングには、PerfumeがCM出演した「Ora2×Perfume くちもとBeauty Project」のCM楽曲となっている「宝石の雨」を収録。","東京タラレバ娘 perfume とうきょう がーる トウキョウ ガール",3,1800,10,"./images/tokyogirl.jpg","tokyogirl.jpg","2018/3/8","Japan",now()),
(20180322,"Just You and I","じゃすとゆーあんどあい","新曲「Just You and I」が、日本テレビ系水曜ドラマ「母になる」主題歌に決定!","安室奈美恵 母になる あむろなみえ",3,1000,10,"./images/justyouandi.jpg","justyouandi.jpg","2018/3/8","Japan",now()),
(20180323,"Hero","ひーろー","新曲「Hero」が2016年NHKリオデジャネイロオリンピック・パラリンピック放送テーマソングに決定! 過去にその年を代表する数々の国民的ソングを生み出した、4年に一度のテーマソング。","リオデジャネイロオリンピック・パラリンピック 安室奈美恵 あむろなみえ 安室 奈美絵 アムロ ナミエ あむろなみえ",3,1000,10,"./images/hero.jpg","hero.jpg","2018/3/8","Japan",now()),
(20180324,"三日月","みかづき","デビュー前からライブでパフォーマンスし、詞の世界観が幅広い層から共感を呼んでいた「三日月」がシングルとしてリリース。「au by KDDI LISMO Music Store」TV-CMソング、NHK報道番組「@ヒューマン」テーマソング。","絢香 あやか",3,2000,10,"./images/mikaduki.jpg","mikaduki.jpg","2018/3/8","Japan",now()),
(20180325,"手をつなぐ理由","てをつなぐりゆう","昨年末日本レコード大賞、日本有線大賞を獲得し、今年、初のドームツアーを開催予定の西野カナがリリースする、2017年第三弾シングル。","手をつ つなぐ 理由 りゆう てをつ 西野 にしの カナ かな 恋愛ソング 第三 シングル 西野カナ ",3,1500,10,"./images/tewotunaguriyuu.jpg","tewotunaguriyuu.jpg","2018/3/8","Japan",now()),
(20180326,"Dear Bride","でぃあぶらいど","ニューアルバム「Just LOVE」がロングヒットを続けている中、今年の秋冬に向けて放つニューシングルは心あたたまるバラードです!","dear bride でぃあ ぶらいど 西野 にしの カナ かな バラード ばらーど ",3,2100,10,"./images/dearbride.jpg","dearbride.jpg","2018/3/8","Japan",now()),
(20180327,"打上花火","うちあげはなび","米津玄師とDAOKO が出会い、「打ち上げ花火、下から見るか? 横から見るか?」とDAOKO が出会った。必然的に出会った彼らが『打上花火』を完成させた。","打上 花火 うちあげ はなび ウチアゲ ハナビ 米津 玄師 よねづ げんし ヨネヅ ゲンシ DAOKO だおこ ダオコ",3,1200,10,"./images/utiagehanabi.jpg","utiagehanabi.jpg","2018/3/8","Japan",now()),
(20180328,"RAIN","れいん","- 魔法は いつか解けると 僕らは知ってる -その一節から始まるこの歌は、SEKAI NO OWARIにしか書けない彼らの目線で、「雨」をモチーフに人生と成長を描く歌。","rain レイン sekai no owari SEKAI NO OWARI 世界の おわり セカオワ せかおわ",3,1200,10,"./images/rain.jpg","rain.jpg","2018/3/8","Japan",now()),
(20180329,"Precious Love","ぷれしゃすらぶ","「ゼクシィ」CMソングで感動の声が続出! EXILE ATSUSHIソロとして初のウェディング・ラブ・バラード「Presious Love」待望のCD化! !","EXILE ATSUSHI ぷれしゃすらぶ ぷれしぁす らぶ プレシャスラブ プレシャス ラブ Precious love Pre cious love Preciouslove ゼクシィ",3,1300,10,"./images/presiouslove.jpg","presiouslove.jpg","2018/3/8","Japan",now());

/*
 * カート情報
 */
INSERT INTO cart_info(user_id,product_id,product_count,price,regist_date)VALUES("taro",20180302,1,3900,now());

/*
 *
 * 購入履歴
 */
INSERT INTO purchase_history_info(user_id,product_id,product_count,price,regist_date)VALUES("taro",20180302,1,3900,now());


INSERT INTO destination_info(user_id,family_name,first_name,family_name_kana,first_name_kana,email,tel_number,zip,user_address,regist_date)VALUES("taro","田中","太郎","たなか","たろう","1234@com","0901234567",1000013,"東京都千代田区霞が関3-6-15",now());

/*
 * レビュー
 */
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("taro",20180310,"噂通り","読みがいのある作品でした。",5,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("hanako",20180310,"口コミを見て買ってみたが","あまり自分には合わないかも、読んでてねむくなりました。",2,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("akiko",20180310,"配送がひどい","届いたときには本が汚れていました。二度とここでは買いません。本当は★0にしたいけどないから1",1,now());

INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("akiko",20180303,"なんか","微妙",1,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("akiko",20180303,"普通","友達に勧められて見ましたが普通でした。",3,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("taro",20180303,"何度も見てます。","何度見ても飽きない世界観です！",5,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("taro",20180303,"続きを見たいです。","これからのストーリが気になります。",4,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("hanako",20180303,"ジブリシリーズは最高！","特にこの作品は好きになりました。今度聖地巡礼しに台湾に行ってきたいと思います。",5,now());

INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("akiko",20180320,"大好きです！","今回もとても良かったです！！",5,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("taro",20180320,"ファンです。","何回も聴いています。",5,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("hanako",20180320,"聴いてみました。","良い曲でした。",4,now());

INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("hanako",20180306,"最高！","愛嬌があるクマでした。",4,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("akiko",20180306,"普通に","爆笑しました。面白かったです。",5,now());
INSERT INTO review(user_id,product_id,title,comment,score,insert_date)VALUES("taro",20180306,"前作に続いて面白い！","三作目は作らないのでしょうか？今作も最高だったので続きを作って欲しいです。",5,now());
