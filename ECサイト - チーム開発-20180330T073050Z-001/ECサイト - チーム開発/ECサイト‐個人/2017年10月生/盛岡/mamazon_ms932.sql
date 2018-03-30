drop database if exists mamazon;
create database mamazon DEFAULT CHARACTER SET utf8;

use mamazon;

create table user_info(id varchar(32) primary key,
						pass varchar(32),
						name varchar(32),
						tel varchar(11),
						mail varchar(255),
						address varchar(255),
						birthday date,
						create_date datetime,
						update_date datetime);

create table goods_info(name varchar(255) primary key,
						img_located varchar(255),
						category enum("fire_extinguisher", "flame_thrower", "seedling"),
						price int,
						stock int,
						create_date datetime,
						update_time datetime);

create table cart_info(owner varchar(32),
						goods_name varchar(255),
						purchase_number int);

create table purchase_history(purchaser varchar(32) NOT NULL,
								goods_name varchar(255),
								goods_price int,
								purchase_number int,
								purchase_date datetime);


INSERT INTO user_info(id, pass, name, tel, mail, address) VALUES
( "f", "f", "me", "0801234567", "sldkfj@sldkfj.cm", "�܂�"),
( "a", "a", "admin", "1234567890", "test@gasdf.com", "����");

INSERT INTO goods_info(name, img_located, category, price, stock, create_date) VALUES
("���ʂ̏��Ί�", "img/���ʂ̏��Ί�.jpg", "fire_extinguisher", 1500, 10, NOW()),
("�u����t���̏��Ί�", "img/�u����t���̏��Ί�.jpg", "fire_extinguisher", 2000, 10, NOW()),
("���Ί핗�̉���", "img/���Ί핗�̉���.jpg", "fire_extinguisher", 12000, 3, NOW()),
("�����\���Ί�", "img/�����\���Ί�.jpg", "fire_extinguisher", 5000, 10, NOW()),
("���ʂ̉Ή����ˊ�", "img/���ʂ̉Ή����ˊ�.jpg", "flame_thrower", 8000, 10, NOW()),
("��r�I���^�ȉΉ����ˊ�", "img/��r�I���^�ȉΉ����ˊ�.jpg", "flame_thrower", 15000, 3, NOW()),
("���o�͉Ή����ˊ�", "img/���o�͉Ή����ˊ�.jpg", "flame_thrower", 28800, 8, NOW()),
("���Z���񈤗p�̉Ή����ˊ�", "img/���Z���񈤗p�̉Ή����ˊ�.jpg", "flame_thrower", 230000, 0, NOW()),
("�����̕c��", "img/�����̕c��.jpg", "seedling", 200, 10, NOW()),
("���ő�����c��", "img/���ő�����c��.jpg", "seedling", 500, 1, NOW()),
("�t�������c��", "img/�t�������c��.jpg", "seedling", 1400, 10, NOW()),
("�͂��", "img/�͂��.jpg", "seedling", 30, 100, NOW());