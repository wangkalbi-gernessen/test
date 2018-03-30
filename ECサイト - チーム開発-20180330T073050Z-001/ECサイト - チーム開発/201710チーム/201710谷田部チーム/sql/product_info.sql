use yataberyouhin;

insert into product_info(id, product_id, product_name, product_name_kana, product_description, category_id, price, stock, image_file_path, image_file_name, release_date, release_company, status, insert_date, update_date) values
(1,1,"クリスマスとくまの絵本","くりすますとくまのえほん","子供向けのクリスマスとくまの絵本",2,1500,5,"./image/","kumabook.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(2,2,"YataberSoccer12月号","やたばーさっかー12がつごう","サッカーの雑誌Yataber12月号",2,560,5,"./image/","soccerbook.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(3,3,"平安時代の歴史小説 前編","へいあんじだいのれきししょうせつぜんぺん","平安時代の歴史の小説 前編",2,800,5,"./image/","rekishibook.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(4,4,"どうぶつの林 完全攻略本","どうぶつのはやし かんぜんこうりゃくほん","ゲームソフト どうぶつ林の完全攻略本",2,1200,5,"./image/","gamebook.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(5,5,"YATABER×YATABER 15巻","やたばー×やたばー15かん","JOMPCOMICSの少年向けの漫画",2,450,5,"./image/","jompcomics.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(6,6,"谷田部友人帳 最終巻","しょうじょまんがさいしゅうかん","少女向けの漫画",2,450,5,"./image/","girlcomic.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(7,7,"初心者向けJava解説本","しょしんしゃむけじゃばかいせつほん","初心者向けのJava解説本 解説DVD付き",2,2600,5,"./image/","javabook.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(8,8,"上級者向けJava解説本","じょうきゅうしゃむけじゃばかいせつほん","上級者者向けのJava解説本 解説DVD付き",2,2800,5,"./image/","javabook2.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),

(9,9,"青色の圧力IH炊飯器","あおいろのあつりょくIHすいはんき","青色の炊飯器",3,30000,5,"./image/","suihannkiao.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(10,10,"白色の圧力IHの炊飯器","しろいろのあつりょくIHすいはんき","白色の炊飯器",3,30000,5,"./image/","suihankisiro.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(11,11,"黄色の中型冷蔵庫","きいろのちゅうがたれいぞうこ","黄色の冷蔵庫",3,60000,5,"./image/","reizouko(yerrow).jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(12,12,"青色の大型冷蔵庫","あおいろのおおがたれいぞうこ","青色の冷蔵庫",3,80000,5,"./image/","reizouko.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(13,13,"くま型の小さい冷蔵庫","くまがたのちいさいれいぞうこ","くまの形をした冷蔵庫",3,6000,5,"./image/","reizoukokuma.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(14,14,"黒色のパソコン15インチ","くろいろのぱそこん15いんち","黒色のパソコン",3,180000,5,"./image/","pcblack.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(15,15,"赤色のパソコン13インチ","あかいろのぱそこん13いんち","赤色のパソコン",3,150000,5,"./image/","pcred.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(16,16,"白色のパソコン10インチ","しろいろのぱそこん10いんち","白色のパソコン",3,100000,5,"./image/","pcwhite.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),

(17,17,"クリスマステディベア","くりすますてでぃべあ","くまのぬいぐるみのおもちゃ クリスマスver.",4,3000,5,"./image/","nuigurumi.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(18,18,"モノクロなパズルのおもちゃ","ものくろなぱずるのおもちゃ","モノクロなパズルのおもちゃ",4,800,5,"./image/","pazzlemonocro.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(19,19,"カラフルなパズルのおもちゃ","からふるなぱずるのおもちゃ","カラフルなパズルのおもちゃ",4,1000,5,"./image/","pazzle.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(20,20,"くまの育成ゲームソフト","くまのいくせいげーむそふと","くまを飼って育てていくゲームソフト",4,3500,5,"./image/","kumagame.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(21,21,"戦国無双のゲームソフト","れきしのげーむのそふと","話題のの戦国無双のゲームソフト",4,3800,5,"./image/","musougame.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(22,22,"サッカーゲームのソフト","さっかーげーむのそふと","サッカーのゲームソフト",4,3600,5,"./image/","soccergame.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(23,23,"クリスマスツリー 180cm","くりすますつりー180せんちめーとる","180ｃｍの大きなクリスマスツリー 装飾品付き",4,10800,5,"./image/","tree.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date)),
(24,24,"ピンクのクリスマスリース","ぴんくのくりすますりーす","壁にかけられるピンク色のクリスマスリース",4,1800,5,"./image/","ri-su.jpg",cast('2017-12-05' as date),"yataberyouhin",1,NOW(),cast('2017-12-05' as date));
