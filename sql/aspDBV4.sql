use asp; -- 需要添加个人联系电话、个人电子邮箱、个人密保问题
--------------------------------------------------------------------------------------------------
--------------------------------异     常     信     息-------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 冻结等级代码表(
	冻结等级             char(2)                  not null,
	冻结时长             int                      not null, -- 单位是天
	等级描述             varchar(300)             not null,
	是否启用             char(4)                  not null
);
ALTER TABLE 冻结等级代码表 ADD CONSTRAINT pk_冻结等级 PRIMARY KEY (冻结等级);
ALTER TABLE 冻结等级代码表 ADD CONSTRAINT ck_冻结等级代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
--------------------------------冻     结     等     级-------------------------------------------
INSERT INTO 冻结等级代码表 VALUES ('99', 0, '您已被永久禁止登录', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 冻结记录表(
	账号                 varchar(50)              not null,
	冻结时间             datetime                 not null,
	冻结等级             char(2)                  not null
);
--------------------------------------------------------------------------------------------------
---------------------------------------Membership-------------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 密码表(
	账号             varchar(50)                   not null,
	密码             varchar(80)                   not null
);
ALTER TABLE 密码表 ADD CONSTRAINT pk_密码表 PRIMARY KEY (账号);
ALTER TABLE 密码表 ADD CONSTRAINT df_密码表_密码_默认123456 DEFAULT '123456' FOR 密码;
------------------------------------账    号   字    段-------------------------------------------
INSERT INTO 密码表 (账号) VALUES ('studentoffice');
INSERT INTO 密码表 (账号) VALUES ('teacheroffice');
INSERT INTO 密码表 (账号) VALUES ('201622111920052');
INSERT INTO 密码表 (账号) VALUES ('200804');
--------------------------------------------------------------------------------------------------

CREATE TABLE 身份代码表(
	身份代码         char(2)                       not null,
	身份名称         varchar(30)      UNIQUE       not null,
	是否启用         char(4)                       not null
);
ALTER TABLE 身份代码表 ADD CONSTRAINT pk_身份代码表 PRIMARY KEY (身份代码);
ALTER TABLE 身份代码表 ADD CONSTRAINT ck_身份代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
------------------------------------身    份   字    段-------------------------------------------
INSERT INTO 身份代码表 VALUES ('01', '学生', '是');
INSERT INTO 身份代码表 VALUES ('02', '教师', '是');
INSERT INTO 身份代码表 VALUES ('11', '学生管理员', '是');
INSERT INTO 身份代码表 VALUES ('12', '教师管理员', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 身份对照表(
	身份代码         char(2)                       not null,
	账号             varchar(50)      UNIQUE       not null
);
ALTER TABLE 身份对照表 ADD CONSTRAINT pk_身份对照表 PRIMARY KEY (账号, 身份代码);
ALTER TABLE 身份对照表 ADD CONSTRAINT fk_身份对照表_身份代码表_身份名称 FOREIGN KEY (身份代码) REFERENCES 身份代码表 (身份代码);
ALTER TABLE 身份对照表 ADD CONSTRAINT fk_身份对照表_密码表_账号 FOREIGN KEY (账号) REFERENCES 密码表 (账号);
------------------------------------身    份   映    射-------------------------------------------
INSERT INTO 身份对照表 VALUES ('11', 'studentoffice');
INSERT INTO 身份对照表 VALUES ('12', 'teacheroffice');
INSERT INTO 身份对照表 VALUES ('01', '201622111920052');
INSERT INTO 身份对照表 VALUES ('02', '200804');
--------------------------------------------------------------------------------------------------

CREATE TABLE 登录信息表(
	账号                 varchar(50)               not null,
	设备ID               char(100)                         ,
	移动设备PIN          char(100)                         ,
	单次登陆尝试次数     int                               ,
	单次密保问题尝试次数 int                               ,
	注册时间             datetime                          ,
	最近登录时间         datetime                          ,
	最近登出时间         datetime                          ,
	账号是否被冻结       char(4)                           ,
	冻结等级             char(2)                           ,
	解冻时间             datetime
);
ALTER TABLE 登录信息表 ADD CONSTRAINT pk_登录信息表 PRIMARY KEY (账号);
ALTER TABLE 登录信息表 ADD CONSTRAINT fk_登录信息表_密码表_账号 FOREIGN KEY (账号) REFERENCES 密码表 (账号);
ALTER TABLE 登录信息表 ADD CONSTRAINT fk_登录信息表_冻结等级代码表_冻结等级 FOREIGN KEY (冻结等级) REFERENCES 冻结等级代码表 (冻结等级);
ALTER TABLE 登录信息表 ADD CONSTRAINT df_登录信息表_账号是否被冻结_默认否 DEFAULT '否' FOR 账号是否被冻结;
ALTER TABLE 登录信息表 ADD CONSTRAINT ck_登录信息表_账号是否被冻结_是否验证 CHECK (账号是否被冻结 in ('是', '否'));

ALTER TABLE 冻结记录表 ADD CONSTRAINT pk_冻结记录表 PRIMARY KEY (账号);
ALTER TABLE 冻结记录表 ADD CONSTRAINT fk_冻结记录表_密码表_账号 FOREIGN KEY (账号) REFERENCES 密码表 (账号);
ALTER TABLE 冻结记录表 ADD CONSTRAINT fk_冻结记录表_账号冻结时间表_冻结等级 FOREIGN KEY (冻结等级) REFERENCES 冻结等级代码表 (冻结等级);

GO
CREATE VIEW 冻结时间详细日志视图
AS
SELECT 登录信息表.账号, 登录信息表.设备ID, 登录信息表.移动设备PIN, 登录信息表.单次登陆尝试次数, 登录信息表.单次密保问题尝试次数,
       冻结记录表.冻结时间, 冻结等级代码表.冻结时长
FROM 登录信息表, 冻结记录表, 冻结等级代码表
WHERE 登录信息表.账号 = 冻结记录表.账号 AND 冻结记录表.冻结等级 = 冻结等级代码表.冻结等级 AND 登录信息表.账号是否被冻结 = '是';
GO

GO
CREATE VIEW 登录信息视图
AS
SELECT 登录信息表.账号, 登录信息表.设备ID, 登录信息表.移动设备PIN, 登录信息表.单次登陆尝试次数, 登录信息表.单次密保问题尝试次数,
	   登录信息表.注册时间, 登录信息表.最近登录时间, 登录信息表.最近登出时间, 登录信息表.账号是否被冻结, 登录信息表.冻结等级,
	   登录信息表.解冻时间, 冻结等级代码表.冻结时长, 身份对照表.身份代码
FROM 登录信息表, 冻结等级代码表, 身份对照表, 身份代码表, 冻结记录表
WHERE 登录信息表.账号 = 冻结记录表.账号 AND 冻结记录表.冻结等级 = 冻结等级代码表.冻结等级 AND 登录信息表.账号 = 身份对照表.账号
										AND 身份对照表.身份代码 = 身份代码表.身份代码;
GO

--------------------------------------------------------------------------------------------------
----------------------------------地    点    信    息--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 邮政编码代码表(
	邮政编码         char(15)    not null,
	是否启用         char(4)     not null
);
ALTER TABLE 邮政编码代码表 ADD CONSTRAINT pk_邮政编码代码表 PRIMARY KEY (邮政编码);
ALTER TABLE 邮政编码代码表 ADD CONSTRAINT ck_邮政编码代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));

CREATE TABLE 国家代码表(
	国家代码         varchar(10)  not null,
	国家名称         varchar(50)  not null,
	国家罗马拼音大写 varchar(200) not null,
	国家罗马拼音小写 varchar(200) not null,
	国家英文缩写     varchar(10)  not null,
	所在洲代码       varchar(10)          ,
	是否启用         char(4)      not null
);
ALTER TABLE 国家代码表 ADD CONSTRAINT ck_国家代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));

CREATE TABLE 省份代码表(
	省份代码         varchar(10)  not null,
	省份名称         varchar(50)  not null,
	省份罗马拼音大写 varchar(200) not null,
	省份罗马拼音小写 varchar(200) not null,
	所在国家代码     varchar(10)  not null,
	是否启用         char(4)      not null
);
ALTER TABLE 省份代码表 ADD CONSTRAINT pk_省份代码表 PRIMARY KEY (省份代码);
ALTER TABLE 省份代码表 ADD CONSTRAINT ck_省份代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
--ALTER TABLE 省份代码表 ADD CONSTRAINT fk_省份代码表_国家代码表_所在国家代码 FOREIGN KEY (所在国家代码) REFERENCES 国家代码表 (国家代码);
----------------------------------省    份    字    段--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 城市代码表(
	城市代码         varchar(10)  not null,
	城市名称         varchar(50)  not null,
	城市罗马拼音大写 varchar(200) not null,
	城市罗马拼音小写 varchar(200) not null,
	所在省份代码     varchar(10)  not null,
	是否启用         char(4)      not null
);
ALTER TABLE 城市代码表 ADD CONSTRAINT pk_城市代码表 PRIMARY KEY (城市代码);
ALTER TABLE 城市代码表 ADD CONSTRAINT fk_城市代码表_省份代码表_所在省份代码 FOREIGN KEY (所在省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 城市代码表 ADD CONSTRAINT ck_城市代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------城    市    字    段--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 区县代码表(
	区县代码         varchar(10)  not null,
	区县名称         varchar(50)  not null,
	区县罗马拼音大写 varchar(200) not null,
	区县罗马拼音小写 varchar(200) not null,
	所在城市代码     varchar(10)  not null,
	是否启用         char(4)      not null
);
ALTER TABLE 区县代码表 ADD CONSTRAINT pk_区县代码表 PRIMARY KEY (区县代码);
ALTER TABLE 区县代码表 ADD CONSTRAINT fk_区县代码表_城市代码表_所在城市代码 FOREIGN KEY (所在城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 区县代码表 ADD CONSTRAINT ck_区县代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------区    县    字    段--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 街道代码表(
	街道代码         varchar(10)  not null,
	街道名称         varchar(50)  not null,
	街道罗马拼音大写 varchar(200) not null,
	街道罗马拼音小写 varchar(200) not null,
	所在区县代码     varchar(10)  not null,
	是否启用         char(4)      not null
);
ALTER TABLE 街道代码表 ADD CONSTRAINT pk_街道代码表 PRIMARY KEY (街道代码);
ALTER TABLE 街道代码表 ADD CONSTRAINT fk_街道代码表_区县代码表_所在区县代码 FOREIGN KEY (所在区县代码) REFERENCES 区县代码表 (区县代码);
ALTER TABLE 街道代码表 ADD CONSTRAINT ck_街道代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));

GO
CREATE VIEW 详细地址关联视图
AS
SELECT 省份代码表.省份代码, 省份代码表.省份罗马拼音大写, 省份代码表.省份罗马拼音小写, 省份代码表.省份名称,
       城市代码表.城市代码, 城市代码表.城市罗马拼音大写, 城市代码表.城市罗马拼音小写, 城市代码表.城市名称,
	   区县代码表.区县代码, 区县代码表.区县罗马拼音大写, 区县代码表.区县罗马拼音小写, 区县代码表.区县名称
FROM 省份代码表, 城市代码表, 区县代码表
WHERE 省份代码表.省份代码 = 城市代码表.所在省份代码 AND 城市代码表.城市代码 = 区县代码表.所在城市代码
GO

--------------------------------------------------------------------------------------------------
----------------------------------个    人    信    息--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 性别代码表(
	性别代码         char(2)                    not null,
	性别             varchar(16)     UNIQUE     not null,
	是否启用         char(4)                    not null
);
ALTER TABLE 性别代码表 ADD CONSTRAINT pk_性别代码表 PRIMARY KEY (性别代码);
ALTER TABLE 性别代码表 ADD CONSTRAINT ck_性别代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------性    别    字    段--------------------------------------------
INSERT INTO 性别代码表 VALUES ('01', '男', '是');
INSERT INTO 性别代码表 VALUES ('02', '女', '是');
INSERT INTO 性别代码表 VALUES ('10', '性别不一致', '是');
INSERT INTO 性别代码表 VALUES ('11', '性别不确定', '是');
INSERT INTO 性别代码表 VALUES ('12', '跨性别', '是');
INSERT INTO 性别代码表 VALUES ('13', '其他', '是');
---------------------------------------------------------------------------------------------------

CREATE TABLE 户籍代码表(
	户籍代码         char(2)                       not null,
	户籍名称         varchar(20)      UNIQUE       not null,
	是否启用         char(4)                       not null
);
ALTER TABLE 户籍代码表 ADD CONSTRAINT pk_户籍代码表 PRIMARY KEY (户籍代码);
ALTER TABLE 户籍代码表 ADD CONSTRAINT ck_户籍代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'))
----------------------------------户    籍    字    段--------------------------------------------
INSERT INTO 户籍代码表 VALUES ('01', '农村户口', '是');
INSERT INTO 户籍代码表 VALUES ('02', '非农村户口', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 身份证类别代码表(
	身份证类别代码   char(2)                       not null,
	身份证类别名称   varchar(50)      UNIQUE       not null,
	是否启用         char(4)                       not null
);
ALTER TABLE 身份证类别代码表 ADD CONSTRAINT pk_身份证类别代码表 PRIMARY KEY (身份证类别代码);
ALTER TABLE 身份证类别代码表 ADD CONSTRAINT ck_身份证类别代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
-------------------------------身    份    证    字    段------------------------------------------
INSERT INTO 身份证类别代码表 VALUES ('01', '居民身份证', '是');
INSERT INTO 身份证类别代码表 VALUES ('00', '临时身份证', '是');
INSERT INTO 身份证类别代码表 VALUES ('11', '军官证', '是');
INSERT INTO 身份证类别代码表 VALUES ('12', '武警警官证', '是');
INSERT INTO 身份证类别代码表 VALUES ('13', '士兵证', '是');
INSERT INTO 身份证类别代码表 VALUES ('14', '军队学员证', '是');
INSERT INTO 身份证类别代码表 VALUES ('15', '军队文职干部证', '是');
INSERT INTO 身份证类别代码表 VALUES ('21', '军队离退休干部证和军队职工证', '是');
INSERT INTO 身份证类别代码表 VALUES ('31', '护照', '是');
INSERT INTO 身份证类别代码表 VALUES ('32', '港澳同胞回乡证', '是');
INSERT INTO 身份证类别代码表 VALUES ('33', '港澳居民来往内地通行证', '是');
INSERT INTO 身份证类别代码表 VALUES ('34', '中华人民共和国来往港澳通行证', '是');
INSERT INTO 身份证类别代码表 VALUES ('35', '台湾居民来往大陆通行证', '是');
INSERT INTO 身份证类别代码表 VALUES ('36', '大陆居民往来台湾通行证', '是');
INSERT INTO 身份证类别代码表 VALUES ('41', '外国人居留证', '是');
INSERT INTO 身份证类别代码表 VALUES ('42', '外国人出入境证', '是');
INSERT INTO 身份证类别代码表 VALUES ('51', '外交官证', '是');
INSERT INTO 身份证类别代码表 VALUES ('52', '领事馆证', '是');
INSERT INTO 身份证类别代码表 VALUES ('16', '海员证', '是');
---------------------------------------------------------------------------------------------------

CREATE TABLE 婚配代码表(
	婚配代码         char(2)                      not null,
	婚配情况         varchar(20)       UNIQUE     not null,
	是否启用         char(4)                      not null
);
 ALTER TABLE 婚配代码表 ADD CONSTRAINT pk_婚配代码表 PRIMARY KEY (婚配代码);
 ALTER TABLE 婚配代码表 ADD CONSTRAINT ck_婚配代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------婚    配    字    段--------------------------------------------
INSERT INTO 婚配代码表 VALUES ('01', '已婚', '是');
INSERT INTO 婚配代码表 VALUES ('02', '未婚', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 民族代码表(
	民族代码         char(5)                       not null,
	民族名称         varchar(100)       UNIQUE     not null,
	是否启用         char(4)                       not null
);
ALTER TABLE 民族代码表 ADD CONSTRAINT pk_民族代码表 PRIMARY KEY (民族代码);
ALTER TABLE 民族代码表 ADD CONSTRAINT ck_民族代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------民    族    字    段--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 政治面貌代码表(
	政治面貌代码     char(2)                       not null,
	政治面貌类型     varchar(30)       UNIQUE      not null,
	是否启用         char(4)                       not null
);
ALTER TABLE 政治面貌代码表 ADD CONSTRAINT pk_政治面貌代码表 PRIMARY KEY (政治面貌代码);
ALTER TABLE 政治面貌代码表 ADD CONSTRAINT ck_政治面貌代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
-----------------------------政    治    面    貌    字    段-------------------------------------
INSERT INTO 政治面貌代码表 VALUES ('90', '中共党员', '是');
INSERT INTO 政治面貌代码表 VALUES ('80', '中共预备党员', '是');
INSERT INTO 政治面貌代码表 VALUES ('70', '共青团员', '是');
INSERT INTO 政治面貌代码表 VALUES ('01', '民革党员', '是');
INSERT INTO 政治面貌代码表 VALUES ('02', '民盟盟员', '是');
INSERT INTO 政治面貌代码表 VALUES ('03', '民建会员', '是');
INSERT INTO 政治面貌代码表 VALUES ('04', '民进会员', '是');
INSERT INTO 政治面貌代码表 VALUES ('05', '农工党党员', '是');
INSERT INTO 政治面貌代码表 VALUES ('06', '致公党党员', '是');
INSERT INTO 政治面貌代码表 VALUES ('07', '九三学社社员', '是');
INSERT INTO 政治面貌代码表 VALUES ('08', '台盟盟员', '是');
INSERT INTO 政治面貌代码表 VALUES ('60', '无党派民主人士', '是');
INSERT INTO 政治面貌代码表 VALUES ('50', '群众', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 学习层次代码表(
	学习层次代码     char(2)                      not null,
	学习层次         varchar(50)      UNIQUE      not null,
	是否启用         char(4)                      not null
);
ALTER TABLE 学习层次代码表 ADD CONSTRAINT pk_学习层次代码表 PRIMARY KEY (学习层次代码);
ALTER TABLE 学习层次代码表 ADD CONSTRAINT ck_学习层次代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
------------------------------------学    历   字    段-------------------------------------------
INSERT INTO 学习层次代码表 VALUES ('10', '小学', '是');
INSERT INTO 学习层次代码表 VALUES ('20', '初中', '是');
INSERT INTO 学习层次代码表 VALUES ('30', '中专', '是');
INSERT INTO 学习层次代码表 VALUES ('40', '高中', '是');
INSERT INTO 学习层次代码表 VALUES ('50', '专科', '是');
INSERT INTO 学习层次代码表 VALUES ('51', '本科', '是');
INSERT INTO 学习层次代码表 VALUES ('60', '硕士研究生', '是');
INSERT INTO 学习层次代码表 VALUES ('70', '博士研究生', '是');
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
----------------------------------学    校    信    息--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 学校代码表(
	学校代码         varchar(8)                    not null,
	学校名称         varchar(80)                   not null,
	所在省份代码     varchar(10)                           ,
	所在城市代码     varchar(10)                           ,
	所在区县代码     varchar(10)                           ,
	所在街道代码     varchar(10)                           ,
	学校英文名称     varchar(10)                           ,
	学校英文名称大写 varchar(100)                          ,
	学校英文名称小写 varchar(100)                          ,
	学校罗马拼音大写 varchar(100)                          ,
	学校罗马拼音小写 varchar(100)                          ,
	是否启用         char(4)
);
ALTER TABLE 学校代码表 ADD CONSTRAINT pk_学校代码表 PRIMARY KEY (学校代码);
ALTER TABLE 学校代码表 ADD CONSTRAINT ck_学校代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 学校代码表 ADD CONSTRAINT fk_学校代码表_省份代码表_所在省份代码 FOREIGN KEY (所在省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 学校代码表 ADD CONSTRAINT fk_学校代码表_城市代码表_所在城市代码 FOREIGN KEY (所在城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 学校代码表 ADD CONSTRAINT fk_学校代码表_区县代码表_所在区县代码 FOREIGN KEY (所在区县代码) REFERENCES 区县代码表 (区县代码);
ALTER TABLE 学校代码表 ADD CONSTRAINT fk_学校代码表_街道代码表_所在街道代码 FOREIGN KEY (所在街道代码) REFERENCES 街道代码表 (街道代码);
----------------------------------学    校    字    段--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 院系代码表(
	院系代码         varchar(10)                   not null,
	院系名称         varchar(80)                   not null,
	所在学校代码     varchar(8)                            ,
	院系罗马拼音大写 varchar(100)                          ,
	院系罗马拼音小写 varchar(100)                          ,
	院系英文名称     varchar(100)                          ,
	院系英文名称大写 varchar(100)                          ,
	院系英文名称小写 varchar(100)                          ,
	是否启用         char(4)
);
ALTER TABLE 院系代码表 ADD CONSTRAINT pk_院系代码表 PRIMARY KEY (院系代码);
ALTER TABLE 院系代码表 ADD CONSTRAINT fk_院系代码表_学校代码表_所在学校代码 FOREIGN KEY (所在学校代码) REFERENCES 学校代码表 (学校代码);
ALTER TABLE 院系代码表 ADD CONSTRAINT ck_院系代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------院    系    字    段--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 专业代码表 (
	专业代码         varchar(10)                   not null,
	专业名称         varchar(80)                   not null,
	所在院系代码     varchar(10)                   not null,
	专业罗马拼音大写 varchar(100)                          ,
	专业罗马拼音小写 varchar(100)                          ,
	专业英文名称     varchar(100)                          ,
	专业英文名称大写 varchar(100)                          ,
	专业英文名称小写 varchar(100)                          ,
	是否启用         char(4)
);
ALTER TABLE 专业代码表 ADD CONSTRAINT pk_专业代码表 PRIMARY KEY (专业代码);
ALTER TABLE 专业代码表 ADD CONSTRAINT fk_专业代码表_院系代码表_所在院系代码 FOREIGN KEY (所在院系代码) REFERENCES 院系代码表 (院系代码);
ALTER TABLE 专业代码表 ADD CONSTRAINT ck_专业代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------专    业    字    段--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 班级代码表(
	班级代码         varchar(10)                   not null,
	班级名称         varchar(80)                   not null,
	所在专业代码     varchar(10)                   not null,
	班级罗马拼音大写 varchar(100)                          ,
	班级罗马拼音小写 varchar(100)                          ,
	班级英文名称     varchar(100)                          ,
	班级英文名称大写 varchar(100)                          ,
	班级英文名称小写 varchar(100)                          ,
	是否启用         char(4)
);
ALTER TABLE 班级代码表 ADD CONSTRAINT pk_班级代码表 PRIMARY KEY (班级代码);
ALTER TABLE 班级代码表 ADD CONSTRAINT fk_班级代码表_专业代码表_所在专业代码 FOREIGN KEY (所在专业代码) REFERENCES 专业代码表 (专业代码);
ALTER TABLE 班级代码表 ADD CONSTRAINT ck_班级代码表_是否启用_是否验证 CHECK (是否启用 IN ('是', '否'));
----------------------------------班    级    字    段--------------------------------------------
--------------------------------------------------------------------------------------------------

GO
CREATE VIEW 省份_城市_区县_街道_学校_院系_专业_班级对照视图
AS
SELECT 学校代码表.学校代码, 学校代码表.学校名称, 学校代码表.学校英文名称, 学校代码表.学校罗马拼音大写, 学校代码表.学校罗马拼音小写,
       学校代码表.学校英文名称大写, 学校代码表.所在城市代码, 学校代码表.所在区县代码, 学校代码表.所在街道代码,
	   省份代码表.省份代码, 城市代码表.城市名称, 区县代码表.区县名称, 街道代码表.街道名称,
       院系代码表.院系代码, 院系代码表.院系名称, 院系代码表.院系英文名称, 院系代码表.院系英文名称大写, 院系代码表.院系英文名称小写,
       院系代码表.院系罗马拼音大写, 院系代码表.院系罗马拼音小写,
	   专业代码表.专业代码, 专业代码表.专业名称, 专业代码表.专业英文名称, 专业代码表.专业英文名称大写, 专业代码表.专业英文名称小写,
	   专业代码表.专业罗马拼音大写, 专业代码表.专业罗马拼音小写,
	   班级代码表.班级代码, 班级代码表.班级名称, 班级代码表.班级罗马拼音大写, 班级代码表.班级罗马拼音小写
FROM 学校代码表, 省份代码表, 城市代码表, 区县代码表, 街道代码表, 院系代码表, 专业代码表, 班级代码表
WHERE 学校代码表.所在省份代码 = 省份代码表.省份代码 AND 学校代码表.所在城市代码 = 城市代码表.城市代码
													AND 学校代码表.所在区县代码 = 区县代码表.区县代码
													AND 学校代码表.所在街道代码 = 街道代码表.街道代码
													AND 院系代码表.所在学校代码 = 学校代码表.学校代码
													AND 专业代码表.所在院系代码 = 院系代码表.院系代码
													AND 班级代码表.所在专业代码 = 专业代码表.专业代码;
GO

CREATE TABLE 教室代码表(
	教室代码         varchar(10)                   not null,
	教室名称         varchar(80)                   not null,
	所在学校代码     varchar(8)                    not null,
	是否启用         char(4)                       not null
);
ALTER TABLE 教室代码表 ADD CONSTRAINT pk_教室代码表 PRIMARY KEY (教室代码);
ALTER TABLE 教室代码表 ADD CONSTRAINT ck_教室代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 教室代码表 ADD CONSTRAINT fk_教室代码表_所在学校代码表_所在学校代码 FOREIGN KEY (所在学校代码) REFERENCES 学校代码表 (学校代码);

CREATE TABLE 教室占用表(
	教室代码         varchar(10)                   not null,
	是否占用         char(4)                       not null,
	占用开始时间     datetime                              ,
	占用结束时间     datetime                              ,
	负责人账号       varchar(50)
);
ALTER TABLE 教室占用表 ADD CONSTRAINT pk_教室占用表 PRIMARY KEY (教室代码);
ALTER TABLE 教室占用表 ADD CONSTRAINT fk_教室占用表_教室代码表_教室代码 FOREIGN KEY (教室代码) REFERENCES 教室代码表 (教室代码);
ALTER TABLE 教室占用表 ADD CONSTRAINT ck_教室占用表_是否占用_是否验证 CHECK (是否占用 in ('是', '否'));
ALTER TABLE 教室占用表 ADD CONSTRAINT fk_教室占用表_密码表_负责人账号 FOREIGN KEY (负责人账号) REFERENCES 密码表 (账号);

--------------------------------------------------------------------------------------------------
----------------------------------学    生    信    息--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 学生表(
--个人基本信息
	学生学号          varchar(50)                  not null,
	学生姓名          varchar(80)                  not null,
	身份证类别代码    char(2)                      not null,
	身份证号          char(20)                     not null,
	性别代码          char(2)                      not null,
	民族代码          char(5)                      not null,
	出生日期          DATETIME                             ,
	证件照片路径      varchar(150)                         ,
--省份城市地区街道信息
	国家代码          varchar(10)                          ,
	省份代码          varchar(10)                          ,
	城市代码          varchar(10)                          ,
	区县代码          varchar(10)                          ,
	街道代码          varchar(10)                          ,
--学校相关信息
	学习层次代码      char(2)                              ,
	是否双学位        char(4)                              ,
	是否转专业        char(4)                              ,
	所在学校代码      varchar(8)                           ,
	所在院系代码      varchar(10)                          ,
	所在专业代码      varchar(10)                          ,
	所在班级代码      varchar(10)                          ,
--其他杂项信息
	婚配代码          char(2)                              ,
	户籍代码          char(2)                              ,
	邮政编码          char(15)                             ,
	政治面貌代码      char(2)                              ,
	联系电话          char(11)                             ,
	电子邮箱          varchar(30)                          ,
	密保问题          varchar(80)                          ,
	密保问题答案      varchar(1000)
);
ALTER TABLE 学生表 ADD CONSTRAINT pk_学生表 PRIMARY KEY (学生学号);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_身份证类别代码表_身份证类别代码 FOREIGN KEY (身份证类别代码) REFERENCES 身份证类别代码表 (身份证类别代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_性别代码表_性别代码 FOREIGN KEY (性别代码) REFERENCES 性别代码表 (性别代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_民族代码表_民族代码 FOREIGN KEY (民族代码) REFERENCES 民族代码表 (民族代码);
--暂时不加国家的外键
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_省份代码表_省份代码 FOREIGN KEY (省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_城市代码表_城市代码 FOREIGN KEY (城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_区县代码表_区县代码 FOREIGN KEY (区县代码) REFERENCES 区县代码表 (区县代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_街道代码表_街道代码 FOREIGN KEY (街道代码) REFERENCES 街道代码表 (街道代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_学习层次代码表_学习层次代码 FOREIGN KEY (学习层次代码) REFERENCES 学习层次代码表 (学习层次代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_学校代码表_所在学校代码 FOREIGN KEY (所在学校代码) REFERENCES 学校代码表 (学校代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_院系代码表_所在院系代码 FOREIGN KEY (所在院系代码) REFERENCES 院系代码表 (院系代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_专业代码表_所在专业代码 FOREIGN KEY (所在专业代码) REFERENCES 专业代码表 (专业代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_学校代码表_所在班级代码 FOREIGN KEY (所在班级代码) REFERENCES 班级代码表 (班级代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_婚配代码表_婚配代码 FOREIGN KEY (婚配代码) REFERENCES 婚配代码表 (婚配代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_户籍代码表_户籍代码 FOREIGN KEY (户籍代码) REFERENCES 户籍代码表 (户籍代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_邮政编码代码表_邮政编码 FOREIGN KEY (邮政编码) REFERENCES 邮政编码代码表 (邮政编码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_政治面貌代码表_政治面貌代码 FOREIGN KEY (政治面貌代码) REFERENCES 政治面貌代码表 (政治面貌代码);
ALTER TABLE 学生表 ADD CONSTRAINT ck_学生表_是否双学位_是否验证 CHECK (是否双学位 in ('是', '否'));
ALTER TABLE 学生表 ADD CONSTRAINT ck_学生表_是否转专业_是否验证 CHECK (是否转专业 in ('是', '否'));

--------------------------------------------------------------------------------------------------
----------------------------------教    师    信    息--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 教师表(
--基本信息
	教师工号          varchar(50)                  not null,
	教师姓名          varchar(80)                  not null,
	身份证类别代码    char(2)                      not null,
	身份证号          char(20)                     not null,
	性别代码          char(2)                      not null,
	民族代码          char(5)                      not null,
	出生日期          DATETIME                             ,
	证件照路径        varchar(150)                         ,
	个人简介文档路径  varchar(150)                         ,
--省份城市地区街道信息
	国家代码          varchar(10)                          ,
	省份代码          varchar(10)                          ,
	城市代码          varchar(10)                          ,
	区县代码          varchar(10)                          ,
	街道代码          varchar(10)                          ,
 -- 毕业院校          varchar(100)                         ,暂时禁用
--其他杂项信息
	婚配代码          char(2)                              ,
	户籍代码          char(2)                              ,
	邮政编码          char(15)                             ,
	政治面貌代码      char(2)                              ,
	联系电话          char(11)                             ,
	电子邮箱          varchar(30)                          ,
	密保问题          varchar(80)                          ,
	密保问题答案      varchar(1000)                        ,
--校内信息
	所在学校代码      varchar(8)                           ,
	所在院系代码      varchar(10)
);
ALTER TABLE 教师表 ADD CONSTRAINT pk_教师表 PRIMARY KEY (教师工号);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_身份证类别代码表_身份证类别代码 FOREIGN KEY (身份证类别代码) REFERENCES 身份证类别代码表 (身份证类别代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_性别代码表_性别代码 FOREIGN KEY (性别代码) REFERENCES 性别代码表 (性别代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_民族代码表_民族代码 FOREIGN KEY (民族代码) REFERENCES 民族代码表 (民族代码);
--暂时不加国家的外键
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_省份代码表_省份代码 FOREIGN KEY (省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_城市代码表_城市代码 FOREIGN KEY (城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_区县代码表_区县代码 FOREIGN KEY (区县代码) REFERENCES 区县代码表 (区县代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_街道代码表_街道代码 FOREIGN KEY (街道代码) REFERENCES 街道代码表 (街道代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_婚配代码表_婚配代码 FOREIGN KEY (婚配代码) REFERENCES 婚配代码表 (婚配代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_户籍代码表_户籍代码 FOREIGN KEY (户籍代码) REFERENCES 户籍代码表 (户籍代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_邮政编码表_邮政编码 FOREIGN KEY (邮政编码) REFERENCES 邮政编码代码表 (邮政编码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_政治面貌代码表_政治面貌代码 FOREIGN KEY (政治面貌代码) REFERENCES 政治面貌代码表 (政治面貌代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_学校代码表_所在学校代码 FOREIGN KEY (所在学校代码) REFERENCES 学校代码表 (学校代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_院系代码表_所在院系代码 FOREIGN KEY (所在院系代码) REFERENCES 院系代码表 (院系代码);

--------------------------------------------------------------------------------------------------
----------------------------------课    程    信    息--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 教材代码表(
	教材代码          varchar(10)                  not null,
	教材名称          varchar(120)                 not null,
	教材价格          decimal(10, 2)                       ,
	出版社名称        varchar(120)                         ,
	教材图片路径      varchar(150)                         ,
	是否启用          char(4)                      not null
);
ALTER TABLE 教材代码表 ADD CONSTRAINT pk_教材代码表 PRIMARY KEY (教材代码);
ALTER TABLE 教材代码表 ADD CONSTRAINT ck_教材代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 教材代码表 ADD CONSTRAINT df_教材代码表_教材价格_默认0 DEFAULT (0) FOR 教材价格;

CREATE TABLE 课程代码表(
	课程代码          char(10)                     not null,
	课程名称          varchar(100)                 not null,
	课程学分          decimal(10,2)                not null,
	课程简介文档路径  varchar(150)                         ,
	教材代码          varchar(10)                          ,
	所属学校代码      varchar(10)                          ,
	所属院系代码      varchar(10)                          ,
	所属专业代码      varchar(10)                          ,
	课程上课学年      int                                  ,
	是否启用          char(4)                      not null
);
ALTER TABLE 课程代码表 ADD CONSTRAINT pk_课程代码表 PRIMARY KEY (课程代码);
ALTER TABLE 课程代码表 ADD CONSTRAINT fk_课程代码表_教材代码表_教材代码 FOREIGN KEY (教材代码) REFERENCES 教材代码表 (教材代码);
ALTER TABLE 课程代码表 ADD CONSTRAINT ck_课程代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 课程代码表 ADD CONSTRAINT df_课程代码表_课程学分 DEFAULT 0 FOR 课程学分;
ALTER TABLE 课程代码表 ADD CONSTRAINT ck_课程代码表_课程上课学年_只能填入1到8 CHECK (课程上课学年 in (1, 2, 3, 4, 5, 6, 7, 8));
ALTER TABLE 课程代码表 ADD CONSTRAINT fk_课程代码表_课程代码表_课程代码 FOREIGN KEY (课程代码) REFERENCES 课程代码表 (课程代码);

CREATE TABLE 上课时间段代码表(
	上课时间段代码     char(5)                      not null,
	上课开始时间       int                          not null, -- 单位 - 节
	上课结束时间       int                          not null  -- 单位 - 节
);
ALTER TABLE 上课时间段代码表 ADD CONSTRAINT pk_上课时间段代码表 PRIMARY KEY (上课时间段代码);

CREATE TABLE 上课时间地点对照表(
	上课时间段代码     char(5)                      not null,
	上课地点代码       varchar(10)                  not null,
	星期               int                          not null
);
ALTER TABLE 上课时间地点对照表 ADD CONSTRAINT pk_上课时间地点对照表 PRIMARY KEY (上课时间段代码, 上课地点代码);
ALTER TABLE 上课时间地点对照表 ADD CONSTRAINT fk_上课时间地点对照表_上课时间段代码表_上课时间段代码
											  FOREIGN KEY (上课时间段代码) REFERENCES 上课时间段代码表 (上课时间段代码);
ALTER TABLE 上课时间地点对照表 ADD CONSTRAINT fk_上课时间地点对照表_教室代码表_上课地点代码
											  FOREIGN KEY (上课地点代码) REFERENCES 教室代码表 (教室代码);
ALTER TABLE 上课时间地点对照表 ADD CONSTRAINT ck_上课时间地点对照表_星期_限定范围1到7 CHECK (星期 IN (1, 2, 3, 4, 5, 6, 7));

--------------------------------------------------------------------------------------------------
----------------------------------学    生    选    课--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 学生选课表(
	学生学号           varchar(50)                          ,
	课程代码           char(10)                     not null,
	授课教师账号       varchar(50)                  not null,
	学生平时成绩       decimal(10, 2)                       ,
	学生期中成绩       decimal(10, 2)                       ,
	学生期末成绩       decimal(10, 2)                       ,
	学生总成绩         decimal(10, 2)
);
ALTER TABLE 学生选课表 ADD CONSTRAINT pk_学生选课表 PRIMARY KEY (授课教师账号, 课程代码);
ALTER TABLE 学生选课表 ADD CONSTRAINT fk_学生选课表_教师表_授课教师账号 FOREIGN KEY (授课教师账号) REFERENCES 教师表 (教师工号);
ALTER TABLE 学生选课表 ADD CONSTRAINT fk_学生选课表_学生表_学生学号 FOREIGN KEY (学生学号) REFERENCES 学生表 (学生学号);
ALTER TABLE 学生选课表 ADD CONSTRAINT fk_学生选课表_课程代码表_课程代码 FOREIGN KEY (课程代码) REFERENCES 课程代码表 (课程代码);
ALTER TABLE 学生选课表 ADD CONSTRAINT df_学生选课表_学生平时成绩_默认值为零 CHECK (学生平时成绩 IN ('是', '否'));
ALTER TABLE 学生选课表 ADD CONSTRAINT df_学生选课表_学生期中成绩_默认值为零 CHECK (学生期中成绩 IN ('是', '否'));
ALTER TABLE 学生选课表 ADD CONSTRAINT df_学生选课表_学生期末成绩_默认值为零 CHECK (学生期末成绩 IN ('是', '否'));
ALTER TABLE 学生选课表 ADD CONSTRAINT df_学生选课表_学生总成绩_默认值为零 CHECK (学生总成绩 IN ('是', '否'));

GO
CREATE VIEW 班级情况
AS
SELECT 教师表.教师工号, 教师表.教师姓名, 教师表.个人简介文档路径, 教师表.联系电话, 教师表.电子邮箱, 教师表.性别代码,
	   教师表.所在学校代码, 教师表.所在院系代码, 教师表.证件照路径, COUNT(学生选课表.学生学号) AS 选课人数
FROM 教师表, 学生选课表
WHERE 教师表.教师工号 = 学生选课表.授课教师账号
GROUP BY 教师表.教师工号, 教师表.教师姓名, 教师表.个人简介文档路径, 教师表.联系电话, 教师表.电子邮箱, 教师表.性别代码,
	     教师表.所在学校代码, 教师表.所在院系代码, 教师表.证件照路径
GO

--------------------------------------------------------------------------------------------------
---------------------------------管    理    员    信    息---------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 管理员表(
	账号          varchar(50)                  not null,
	管理对象代码  char(2)                      not null,
	是否启用      char(4)                      not null
);
ALTER TABLE 管理员表 ADD CONSTRAINT pk_管理员表 PRIMARY KEY (账号);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_密码表_账号 FOREIGN KEY (账号) REFERENCES 密码表 (账号);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_身份代码表_身份代码 FOREIGN KEY (管理对象代码) REFERENCES 身份代码表 (身份代码);
ALTER TABLE 管理员表 ADD CONSTRAINT ck_管理员表_是否启用_是否验证 CHECK (是否启用 IN ('是', '否'));

CREATE TABLE 文件类型代码表(
	文件类型代码  char(2)                      not null,
	文件类型名称  varchar(20)                  not null,
	是否启用      char(4)                      not null
);
ALTER TABLE 文件类型代码表 ADD CONSTRAINT pk_文件类型代码表 PRIMARY KEY (文件类型代码);
ALTER TABLE 文件类型代码表 ADD CONSTRAINT ck_文件类型代码表_是否启用_是否验证 CHECK (是否启用 IN ('是', '否'));
---------------------------------文      件      类      型---------------------------------------
INSERT INTO 文件类型代码表 VALUES ('00', '新闻', '是');
INSERT INTO 文件类型代码表 VALUES ('10', '公告', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 新闻公告表(
	编号          int       IDENTITY(1, 1)     not null,
	标题          varchar(100)                         ,
	文件路径      varchar(120)                         , -- 在这里保存内容
	简介          varchar(7000)                        , -- 简略信息
	文件类型代码  char(2)                      not null,
	上传时间      DATETIME                     not null,
	修改时间      DATETIME                             ,
	是否外部展示  char(4)                      not null
);
ALTER TABLE 新闻公告表 ADD CONSTRAINT pk_新闻公告表 PRIMARY KEY (编号);
ALTER TABLE 新闻公告表 ADD CONSTRAINT fk_新闻公告表_文件类型代码表_文件类型代码 FOREIGN KEY (文件类型代码) REFERENCES 文件类型代码表 (文件类型代码);
ALTER TABLE 新闻公告表 ADD CONSTRAINT ck_新闻公告表_是否外部显示_是否验证 CHECK (是否外部展示 IN ('是', '否'));

GO
CREATE VIEW 新闻视图
AS
SELECT 新闻公告表.编号, 新闻公告表.标题, 新闻公告表.简介, 新闻公告表.上传时间, 新闻公告表.文件路径, 新闻公告表.修改时间,
       文件类型代码表.文件类型名称
FROM 新闻公告表, 文件类型代码表
WHERE 文件类型代码表.文件类型代码 = 新闻公告表.文件类型代码 AND 新闻公告表.是否外部展示 = '是' AND 文件类型代码表.文件类型名称 = '新闻';
GO

GO
CREATE VIEW 公告视图
AS
SELECT 新闻公告表.编号, 新闻公告表.标题, 新闻公告表.简介, 新闻公告表.上传时间, 新闻公告表.文件路径, 新闻公告表.修改时间,
       文件类型代码表.文件类型名称
FROM 新闻公告表, 文件类型代码表
WHERE 文件类型代码表.文件类型代码 = 新闻公告表.文件类型代码 AND 新闻公告表.是否外部展示 = '是' AND 文件类型代码表.文件类型名称 = '公告';
GO

CREATE TABLE 申请等级代码表(
	申请等级代码      char(5)                      not null,
	申请等级          varchar(30)                  not null,
	是否启用          char(4)                      not null
);
ALTER TABLE 申请等级代码表 ADD CONSTRAINT pk_申请等级代码表 PRIMARY KEY (申请等级代码);
ALTER TABLE 申请等级代码表 ADD CONSTRAINT ck_申请等级代码表_是否启用_是否验证 CHECK (是否启用 IN ('是', '否'));
---------------------------------申      请      等      级---------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 审核状态代码表(
	审核状态代码      char(3)                      not null,
	审核状态          varchar(30)                  not null,
	是否启用          char(4)                      not null
);
ALTER TABLE 审核状态代码表 ADD CONSTRAINT pk_审核状态代码表 PRIMARY KEY (审核状态代码);
ALTER TABLE 审核状态代码表 ADD CONSTRAINT ck_审核状态代码表 CHECK (是否启用 IN ('是', '否'));
-----------------------------------审    核    状    态-------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 申请表(
	账号              varchar(50)                  not null,
	申请编号          int          IDENTITY(1,1)   not null,
	申请标题          varchar(120)                         ,
	申请概述          varchar(7500)                        ,
	申请等级代码      char(5)                      not null,
	是否需要材料      char(2)                      not null,
	审核状态代码      char(3)                      not null
);
ALTER TABLE 申请表 ADD CONSTRAINT pk_申请表 PRIMARY KEY (申请编号);
ALTER TABLE 申请表 ADD CONSTRAINT ck_申请表_是否需要材料_是否验证 CHECK (是否需要材料 IN ('是', '否'));
ALTER TABLE 申请表 ADD CONSTRAINT fk_申请表_密码表_账号 FOREIGN KEY (账号) REFERENCES 密码表 (账号);

CREATE TABLE 申请材料表(
	申请编号           int                          not null,
	申请材料文件路径   varchar(150)
);
ALTER TABLE 申请材料表 ADD CONSTRAINT pk_申请材料表 PRIMARY KEY (申请编号);
ALTER TABLE 申请材料表 ADD CONSTRAINT fk_申请材料表_申请表_申请编号 FOREIGN KEY (申请编号) REFERENCES 申请表 (申请编号);

GO
CREATE VIEW 学生申请视图
AS
SELECT 申请表.申请编号, 申请表.申请标题, 申请表.申请概述, 申请表.是否需要材料,
	   审核状态代码表.审核状态, 申请等级代码表.申请等级, 身份代码表.身份名称, 身份代码表.身份代码
FROM 申请表, 审核状态代码表, 申请等级代码表, 身份代码表, 身份对照表
WHERE 申请表.申请等级代码 = 申请等级代码表.申请等级代码 AND 申请表.审核状态代码 = 审核状态代码表.审核状态代码
														AND 申请表.账号 = 身份对照表.账号
														AND 身份对照表.身份代码 = 身份代码表.身份代码
														AND 身份代码表.身份名称 = '学生';
GO

GO
CREATE VIEW 教师申请视图
AS
SELECT 申请表.申请编号, 申请表.申请标题, 申请表.申请概述, 申请表.是否需要材料,
	   审核状态代码表.审核状态, 申请等级代码表.申请等级, 身份代码表.身份名称, 身份代码表.身份代码
FROM 申请表, 审核状态代码表, 申请等级代码表, 身份代码表, 身份对照表
WHERE 申请表.申请等级代码 = 申请等级代码表.申请等级代码 AND 申请表.审核状态代码 = 审核状态代码表.审核状态代码
														AND 申请表.账号 = 身份对照表.账号
														AND 身份对照表.身份代码 = 身份代码表.身份代码
														AND 身份代码表.身份名称 = '教师';
GO