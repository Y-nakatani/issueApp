OP DATABASE IF EXISTS training_db;
DROP USER IF EXISTS training;

CREATE DATABASE training_db;
CREATE ROLE training WITH LOGIN PASSWORD 'training';
GRANT ALL ON DATABASE training_db TO training;

\c training_db;

DROP TABLE IF EXISTS attendance;
CREATE TABLE attendance (
  schedule_id int NOT NULL default '0',
  student_id int NOT NULL default '0',
  attend_status char(10) default NULL,
  description char(40)  default NULL,
  PRIMARY KEY  (schedule_id,student_id)
);

INSERT INTO attendance VALUES (10,1,'YES',''),(10,2,'YES',''),(10,3,'YES',''),(10,4,'NO',''),(10,5,'YES',''),(11,11,'YES',''),(11,12,'YES',''),(11,13,'YES',''),(11,14,'YES',''),(12,2,'NO',''),(12,3,'YES',''),(12,5,'YES',''),(12,7,'YES',''),(12,8,'YES',''),(12,9,'YES',''),(12,15,'YES',''),(12,16,'NO',''),(13,1,'YES',''),(13,3,'YES',''),(13,9,'YES',''),(13,12,'NO',''),(13,13,'YES',''),(14,1,'YES',''),(14,2,'YES',''),(14,3,'YES',''),(14,4,'YES',''),(14,6,'YES',''),(14,7,'YES',''),(14,8,'YES',''),(14,9,'NO',''),(14,13,'YES',''),(14,15,'NO',''),(14,16,'YES',''),(15,1,'ENTRY',''),(15,2,'ENTRY',''),(15,3,'ENTRY',''),(15,4,'ENTRY',''),(15,5,'ENTRY',''),(15,6,'ENTRY',''),(15,7,'ENTRY',''),(15,8,'ENTRY',''),(15,9,'ENTRY',''),(15,11,'ENTRY',''),(16,13,'ENTRY',''),(16,14,'ENTRY',''),(16,15,'ENTRY',''),(16,16,'ENTRY','');

DROP TABLE IF EXISTS course;
CREATE TABLE course (
  course_id varchar(20)  NOT NULL default '',
  course_title varchar(50)  default NULL,
  topic varchar(100)  default NULL,
  day_length int default NULL,
  price int NOT NULL default '0',
  level_id int default NULL,
  category varchar(40)  default NULL,
  PRIMARY KEY  (course_id)
);

INSERT INTO course VALUES ('KDC-MY01','A practical MySQL user level introduction','BASIC MySQL concept and operation',3,120000,'1','DATABASE'),('KDC-MY02','Practical MySQL administration','BASIC MySQL Administration course',5,200000,'2','DATABASE'),('KDC-MY03','Practical MySQL optimization','MySQL performance and turning course',3,150000,'3','DATABASE'),('KDC-UX01','Unix introduction','BASIC Unix introduction course',3,90000,'1','LINUX'),('KDC-LX01','Linux introduction','BASIC Linux introduction course',3,90000,'2','LINUX'),('KDC-LX02','Linux Administration','BASIC Linux Administration  course',5,150000,'3','LINUX'),('KDC-LX03','Linux Network Administration','Linux TCP/IP Network Administration',3,90000,'3','LINUX'),('KDC-LX04','Linux Internet servers','DNS, Web server, mail server and more',3,90000,'3','LINUX'),('KDC-LXLPI01','Linux BASIC -LPI Level1-','Linux training for Certification of LPI level1',3,90000,'2','LINUX'),('KDC-LXLPI02','Linux BASIC -LPI Level2-','Linux training for Certification of LPI level2',5,150000,'3','LINUX'),('KDC-J01','Java programing 1','Object oriented programing training using Java.',3,90000,'1','JAVA'),('KDC-J02','Java programing 2','Advanced topic of Java programing such as GUI.',3,90000,'2','JAVA'),('KDC-J03','Tomcat Administration','Tomcat system administration course.',2,150000,'3','JAVA'),('KDC-J04','Servlet/JSP programming 1','Server/JSP programming on Tomcat.',3,150000,'3','JAVA'),('KDC-J05','Servlet/JSP programming 2','Advanced topic of Servlet/JSP such as Taglib, security',3,150000,'3','JAVA'),('KDC-J06','Data Base Connectivity with Java','programming for DataBase access using JDBC',3,150000,'3','JAVA'),('KDC-W01','HTML/CSS/JavaScript BASIC','creating Web presentation by HTML/CSS/JavaScript',3,90000,'1','WEB'),('KDC-W02','Web Application Development','Develop Web Application by Tomcat, Java and DataBase',5,200000,'4','WEB'),('KDC-NET01','TCP/IP introduction','BASIC TCP/IP concept and operation',2,80000,'1','NETWORK'),('KDC-NET02','IPv6 introduction','BASIC IPv6 concept and operation',2,80000,'3','NETWORK'),('KDC-NET03','Network security','BASIC IP security concept and operation',3,120000,'4','NETWORK'),('KDC-OO01','OpenOffice BASIC','OpenOffice BASIC course',3,90000,'1','APPLICATION'),('KDC-OO02','OpenOffice Advanced','OpenOffice Advanced course',3,90000,'2','APPLICATION');

DROP TABLE IF EXISTS partner;
CREATE TABLE partner (
  instructor_id char(11)  NOT NULL default '',
  last_name char(30)  default NULL,
  first_name char(30)  default NULL,
  e_mail char(30)  default NULL,
  PRIMARY KEY  (instructor_id)
);

INSERT INTO partner VALUES ('CBT001','Takahashi','Yumiko','ytakahashi@cbt.co.jp'),('HCC001','Sugiyama','Takashi','tsugi@hcc.co.jp'),('HCC002','Yoshiyama','Hikaru','yhikaru@hcc.co.jp'),('SDK001','Maejima','Shigeo','mshigeo@sdk.co.jp'),('SDK002','Kawatani','Toru','toru@sdk.co.jp'),('SDK003','Nabekawa','Teruhiko','tnabekawa@sdk.co.jp'),('BLZ001','Tanikawa','Hisayuki','htanikawa@blz.co.jp');

DROP TABLE IF EXISTS schedule;
CREATE TABLE schedule (
  schedule_id int NOT NULL ,
  schedule_date date default NULL,
  classroom_id int default NULL,
  course_id char(11)  default NULL,
  instructor_id char(11)  default NULL,
  PRIMARY KEY  (schedule_id)
);

INSERT INTO schedule VALUES (10,'2003-07-29',1,'KDC-MY01','KDC005'),(11,'2003-07-29',2,'KDC-LXLPI01','KDC001'),(12,'2003-08-03',1,'KDC-LXLPI02','KDC002'),(13,'2003-08-03',2,'KDC-NET01','KDC004'),(14,'2003-08-17',3,'KDC-NET02','KDC003'),(15,'2003-08-21',3,'KDC-J01','KDC006'),(16,'2003-08-26',2,'KDC-J02','KDC002'),(17,'2003-08-30',1,'KDC-J03','KDC006'),(18,'2003-09-02',2,'KDC-W01','KDC005'),(19,'2003-09-05',1,'KDC-W02','KDC005');


DROP TABLE IF EXISTS student;
CREATE TABLE student (
  student_id int NOT NULL ,
  last_name char(20)  default NULL,
  first_name char(30)  default NULL,
  company char(30)  default NULL,
  tel char(15)  default NULL,
  e_mail char(30)  default NULL,
  PRIMARY KEY  (student_id)
);

INSERT INTO student VALUES (1,'Saito','Ichiro','ABC Software','03-1234-4567','sichiro@abc.com'),(2,'Yamada','Jiro','XYZ Trading Co.','03-5269-9912','jyamada@xyz.co.jp'),(3,'Shimada','Saburo','DEF Visual studio Inc.','0424-78-9256','sshimada@def.co.jp'),(4,'Sasaki','Shiro','NetTech Co.','03-2258-9991','ssasaki@nettech.com'),(5,'Yoshida','Goro','Gemini consulting Co.','042-395-5647','gyoshida@gemini.com'),(7,'Tanaka','Takashi','Platau Computer Systems Co.','03-5215-4562','ttanaka@pcs.com'),(8,'Ikeda','Koji','Global cake Co.','0424-78-9871','kikeda@global.com'),(9,'Smith','John','Fiorina finantial Co.','03-7912-3254','jsmith@fiorina.com'),(10,'Nelson','Mark','Sunrise Communication Inc.','03-4561-3215','mnelson@sunrise.co.jp'),(11,'Thomas','Ken','Unicom solutions Co.','03-5456-9123','kthomas@unicom.com'),(12,'Cood','Sam','ICM Co.','0177-99-4565','csam@icm.co.jp'),(13,'Sakai','Hiro','Carlton music co.','03-6512-7895','hsakai@carleton.co.jp'),(14,'Ishikawa','Yoko','Pragraph line Inc.','03-7899-7895','yishihara@pragraph.co.jp'),(15,'Smith','Kelly','Netdial Co.','045-677-5552','skelly@netdial.co.jp'),(16,'Kasagi','Shinobu','Direct Agency Inc.','0952-56-5511','skasagi@dai.co.jp');


GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO training;

