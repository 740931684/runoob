create database music;


--用户表
create table user(
id int primary key auto_increment,
name VARCHAR(20) NOT NULL ,
user INT not null,
password int not null
);


--用户试听表
create table user_listen(
id int PRIMARY key auto_increment,
user int not null,
music_name VARCHAR(100) not null,
address VARCHAR(300),
unique(user,music_name)
);



--歌单列表
create table music_list(
music_type VARCHAR(100) not null,
picture VARCHAR(300) not null,
topic VARCHAR(100) not null,
detail VARCHAR(1500) not null,
author VARCHAR(50) not null,
music_flag int
);


--歌单里的歌曲
create table music_detail_music(
id int PRIMARY key auto_increment,
music_flag int not null,
music_name VARCHAR(100) not null,
music_type VARCHAR(50)
);



--收藏歌单
create table collect(
user int not null,
music_type VARCHAR(50)not null,
picture VARCHAR(300) not null,
topic VARCHAR(100) not null,
introduced VARCHAR(100) not null,
music_flag int not null,
unique(user,music_flag)
);


