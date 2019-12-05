#### 나만의 블로그 만들기 SpringBoot+MyBatis+MySql

- git주소 : <https://github.com/111coding/SpringBoot-MyBatis-MySql-Blog>



#### 1. yml Setting
![ymlSetting](https://postfiles.pstatic.net/MjAxOTEyMDVfNjgg/MDAxNTc1NTQ2ODEzMDkx.GwGOOVkYRwLNcg1kwGoOMhPnHLplg3gTyoQ4mrfCoJEg.KIvW5GBmkjF0Rmus1aRF-818mfAfRJ_bI6d7BDcxWp8g.PNG.halowd/Screenshot_2.png?type=w966)

#### 2. MySql History
```sql
--create USER
create user 'mblog'@'%' identified by 'bitc5600';
GRANT ALL PRIVILEGES ON *.* TO 'mblog'@'%';
create database mblog;
use mblog;

--create TABLE
CREATE TABLE user(
   id int auto_increment primary key,
    username varchar(100) not null unique,
    password varchar(100) not null,
    email varchar(100) not null,
    userProfile varchar(200) ,
    createDate timestamp
) engine=InnoDB default charset=utf8;

ALTER TABLE `mblog`.`user` 
CHANGE COLUMN `userProfile` `userProfile` VARCHAR(200) NULL DEFAULT '/userProfile/default.jpg' ;


CREATE TABLE board(
   id int auto_increment primary key,
    userId int,
    title varchar(100) not null,
    content longtext,
    readCount int default 0,
    createDate timestamp,
    foreign key (userId) references user (id)
) engine=InnoDB default charset=utf8;
```




