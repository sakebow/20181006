use asp;
CREATE TABLE 省份代码表(
	省份代码         int       IDENTITY(1,1)       not null,
	省份名称         char(50)  UNIQUE              not null
);
ALTER TABLE 省份代码表 ADD CONSTRAINT pk_省份代码表 PRIMARY KEY (省份代码);

CREATE TABLE 城市代码表(
	城市代码         int       IDENTITY(1,1)       not null,
	城市名称         char(50)                      not null
);
ALTER TABLE 城市代码表 ADD CONSTRAINT pk_城市代码表 PRIMARY KEY (城市代码);

CREATE TABLE 区代码表(
	区代码           int       IDENTITY(1,1)       not null,
	区名称           char(50)                      not null
);
ALTER TABLE 区代码表 ADD CONSTRAINT pk_区代码表 PRIMARY KEY (区代码);

CREATE TABLE 街道代码表(
	街道代码         int       IDENTITY(1,1)       not null,
	街道名称         char(50)                      not null
);
ALTER TABLE 街道代码表 ADD CONSTRAINT pk_街道代码表 PRIMARY KEY (街道代码);

CREATE TABLE 地点表(
	省份代码         int                           not null,
	城市代码         int                           not null,
	区代码           int                           not null,
	街道代码         int                           not null
);
ALTER TABLE 地点表 ADD CONSTRAINT pk_地点表 PRIMARY KEY (省份代码, 城市代码, 区代码, 街道代码);
ALTER TABLE 地点表 ADD CONSTRAINT fk_地点表_省份代码 FOREIGN KEY (省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 地点表 ADD CONSTRAINT fk_地点表_城市代码 FOREIGN KEY (城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 地点表 ADD CONSTRAINT fk_地点表_区代码   FOREIGN KEY (区代码)   REFERENCES 区代码表   (区代码);
ALTER TABLE 地点表 ADD CONSTRAINT fk_地点表_街道代码 FOREIGN KEY (街道代码) REFERENCES 街道代码表 (街道代码);

GO
CREATE VIEW 籍贯对照视图
AS
SELECT 地点表.省份代码, 省份名称, 地点表.城市代码, 城市名称
FROM 省份代码表, 城市代码表, 地点表
WHERE 省份代码表.省份代码 = 地点表.省份代码 and 城市代码表.城市代码 = 地点表.城市代码;
GO

CREATE VIEW 详细地址对照视图
AS
SELECT 地点表.省份代码, 省份代码表.省份名称, 地点表.城市代码, 城市代码表.城市名称, 地点表.区代码, 区代码表.区名称, 地点表.街道代码, 街道代码表.街道名称
FROM 省份代码表, 城市代码表, 区代码表, 街道代码表, 地点表
WHERE 省份代码表.省份代码 = 地点表.省份代码 and 城市代码表.城市代码 = 地点表.城市代码
                                            and 区代码表.区代码 = 地点表.区代码 
											and 街道代码表.街道代码 = 地点表.街道代码
GO

CREATE TABLE 性别代码表(
	性别代码         int       IDENTITY(1,1)       not null,
	性别             char(20)  UNIQUE              not null
);
ALTER TABLE 性别代码表 ADD CONSTRAINT pk_性别代码表 PRIMARY KEY (性别代码);

CREATE TABLE 户籍代码表(
	户籍代码         int       IDENTITY(1,1)       not null,
	户籍名称         char(30)                      not null
);
ALTER TABLE 户籍代码表 ADD CONSTRAINT pk_户籍代码表 PRIMARY KEY (户籍代码);

CREATE TABLE 身份证类别代码表(
	身份证类别代码   int       IDENTITY(1,1)       not null,
	身份证类别名称   char(30)  UNIQUE              not null
);
ALTER TABLE 身份证类别代码表 ADD CONSTRAINT pk_身份证类别代码表 PRIMARY KEY (身份证类别代码);

CREATE TABLE 婚配代码表(
	婚配代码         int       IDENTITY(1,1)       not null,
	婚配情况         char(20)  UNIQUE              not null
);
ALTER TABLE 婚配代码表 ADD CONSTRAINT pk_婚配代码表 PRIMARY KEY (婚配代码);

CREATE TABLE 院系代码表(
	院系代码         int       IDENTITY(1,1)       not null,
	院系名称         char(50)  UNIQUE              not null
);
ALTER TABLE 院系代码表 ADD CONSTRAINT pk_院系代码 PRIMARY KEY (院系代码);

CREATE TABLE 专业代码表(
	专业代码         int       IDENTITY(1,1)       not null,
	专业名称         char(50)                      not null
);
ALTER TABLE 专业代码表 ADD CONSTRAINT pk_专业代码表 PRIMARY KEY (专业代码);

CREATE TABLE 班级代码表(
	班级代码         int       IDENTITY(1,1)       not null,
	班级名称         char(50)                      not null
);
ALTER TABLE 班级代码表 ADD CONSTRAINT pk_班级代码表 PRIMARY KEY (班级代码);

CREATE TABLE 院系_专业对照表(
	院系代码         int                           not null,
	专业代码         int                           not null
);
ALTER TABLE 院系_专业对照表 ADD CONSTRAINT pk_院系_专业对照表 PRIMARY KEY (院系代码, 专业代码);
ALTER TABLE 院系_专业对照表 ADD CONSTRAINT fk_院系_专业对照表_院系代码表_院系 FOREIGN KEY (院系代码) REFERENCES 院系代码表 (院系代码);
ALTER TABLE 院系_专业对照表 ADD CONSTRAINT fk_院系_专业对照表_专业代码表_专业 FOREIGN KEY (专业代码) REFERENCES 专业代码表 (专业代码);

CREATE TABLE 专业_班级对照表(
	专业代码         int                           not null,
	班级代码         int                           not null
);
ALTER TABLE 专业_班级对照表 ADD CONSTRAINT pk_专业_班级对照表 PRIMARY KEY (专业代码, 班级代码);
ALTER TABLE 专业_班级对照表 ADD CONSTRAINT fk_专业_班级对照表_专业代码表_专业 FOREIGN KEY (专业代码) REFERENCES 专业代码表 (专业代码);
ALTER TABLE 专业_班级对照表 ADD CONSTRAINT fk_专业_班级对照表_班级代码表_班级 FOREIGN KEY (班级代码) REFERENCES 班级代码表 (班级代码);

GO
CREATE VIEW 院系_专业_班级对照视图
AS
SELECT 院系代码表.院系代码, 院系代码表.院系名称, 专业代码表.专业代码, 专业代码表.专业名称, 班级代码表.班级代码, 班级代码表.班级名称
FROM 院系代码表, 专业代码表, 班级代码表, 院系_专业对照表, 专业_班级对照表
WHERE 院系代码表.院系代码 = 院系_专业对照表.院系代码 and 专业代码表.专业代码 = 院系_专业对照表.专业代码
                                                     and 班级代码表.班级代码 = 专业_班级对照表.班级代码
													 and 专业代码表.专业代码 = 专业_班级对照表.专业代码
GO

CREATE TABLE 民族代码表(
	民族代码         int       IDENTITY(1,1)       not null,
	民族名称         char(100)                     not null
);
ALTER TABLE 民族代码表 ADD CONSTRAINT pk_民族代码表 PRIMARY KEY (民族代码);

CREATE TABLE 邮政编码代码表(
	邮政编码代码     int      IDENTITY(1,1)        not null,
	邮政编码         char(15) UNIQUE               not null
);
ALTER TABLE 邮政编码代码表 ADD CONSTRAINT pk_邮政编码代码表 PRIMARY KEY (邮政编码代码);

CREATE TABLE 政治面貌代码表(
	政治面貌代码     int      IDENTITY(1,1)        not null,
	政治面貌类型     char(30) UNIQUE               not null
);
ALTER TABLE 政治面貌代码表 ADD CONSTRAINT pk_政治面貌代码表 PRIMARY KEY (政治面貌代码);

CREATE TABLE 学习层次代码表(
	学习层次代码     int      IDENTITY(1,1)        not null,
	学习层次         char(50) UNIQUE               not null
);
ALTER TABLE 学习层次代码表 ADD CONSTRAINT pk_学习层次代码表 PRIMARY KEY (学习层次代码);

CREATE TABLE 身份代码表(
	身份代码         int      IDENTITY(1,1)        not null,
	身份名称         char(30) UNIQUE               not null
);
ALTER TABLE 身份代码表 ADD CONSTRAINT pk_身份代码表 PRIMARY KEY (身份代码);

CREATE TABLE 身份对照表(
	身份代码         int       IDENTITY(1,1)       not null,
	账号             char(50)  UNIQUE               not null
);
ALTER TABLE 身份对照表 ADD CONSTRAINT pk_身份对照表 PRIMARY KEY (账号);
ALTER TABLE 身份对照表 ADD CONSTRAINT fk_身份对照表_身份代码表_身份代码 FOREIGN KEY (身份代码) REFERENCES 身份代码表 (身份代码);

CREATE TABLE 密码表(
	账号             char(50)                      not null,
	密码             char(50)                      not null
);
ALTER TABLE 密码表 ADD CONSTRAINT pk_密码表 PRIMARY KEY (账号);
ALTER TABLE 密码表 ADD CONSTRAINT fk_密码表_身份对照表_账号 FOREIGN KEY (账号) REFERENCES 身份对照表(账号);

CREATE TABLE 登入信息表(
	账号              char(50)                      not null,
	ApplicationID     char(100)                             ,
	登入时间          DATETIME                              ,
	rowID             int          IDENTITY(1,1)    not null,
	ROWID_MD5_TOUPPER char(1000)                    not null
);
ALTER TABLE 登入信息表 ADD CONSTRAINT pk_登入信息表 PRIMARY KEY (rowID);
ALTER TABLE 登入信息表 ADD CONSTRAINT fk_登入信息表_身份对照表_账号 FOREIGN KEY (账号) REFERENCES 身份对照表 (账号);

CREATE TABLE 登出信息表(
	账号              char(50)                      not null,
	ApplicationID     char(100)                             ,
	登出时间          DATETIME                              ,
	rowID             int                           not null,
	ROWID_MD5_TOUPPER char(1000)                    not null
);
ALTER TABLE 登出信息表 ADD CONSTRAINT pk_登出信息表 PRIMARY KEY (rowID);
ALTER TABLE 登出信息表 ADD CONSTRAINT fk_登出信息表_登入信息表_rowID FOREIGN KEY (rowID) REFERENCES 登入信息表 (rowID);
ALTER TABLE 登出信息表 ADD CONSTRAINT fk_登出信息表_身份对照表_账号 FOREIGN KEY (账号) REFERENCES 身份对照表 (账号);

GO
CREATE VIEW 登陆信息视图
AS
SELECT 身份对照表.账号, 登入信息表.ApplicationID, 登入信息表.rowID, 登入信息表.ROWID_MD5_TOUPPER, 登入信息表.登入时间, 登出信息表.登出时间
FROM 身份对照表, 登入信息表, 登出信息表
WHERE 登入信息表.ROWID_MD5_TOUPPER = 登出信息表.ROWID_MD5_TOUPPER
GROUP BY 身份对照表.账号, 登入信息表.ApplicationID, 登入信息表.rowID, 登入信息表.ROWID_MD5_TOUPPER, 登入信息表.登入时间, 登出信息表.登出时间
GO

CREATE TABLE 学生表(
--个人基本信息
	学生学号          char(50)                     not null,
	学生姓名          char(80)                     not null,
	身份证类别代码    int                          not null,
	身份证号          char(50)                     not null,
	性别代码          int                          not null,
	民族代码          int                          not null,
	出生日期          DATETIME                             ,
	证件照片路径      char(150)                            ,
--省份城市地区街道信息
	省份代码          int                                  ,
	城市代码          int                                  ,
	区代码            int                                  ,
	街道代码          int                                  ,
--学校相关信息
	学习层次代码      int                                  ,
	班级代码          int                                  ,
	专业代码          int                                  ,
	院系代码          int                                  ,
	是否双学位        int                                  ,
	是否转专业        int                                  ,
--其他杂项信息
	婚配代码          int                                  ,
	户籍代码      int                                  ,
	邮政编码代码      int                                  ,
	政治面貌代码      int
);
--主键
ALTER TABLE 学生表 ADD CONSTRAINT pk_学生表 PRIMARY KEY (学生学号);
--外键
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_身份对照表_账号 FOREIGN KEY (学生学号) REFERENCES 身份对照表 (账号);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_身份证类别代码表_身份证类别代码 FOREIGN KEY (身份证类别代码) REFERENCES 身份证类别代码表 (身份证类别代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_性别代码表_性别代码 FOREIGN KEY (性别代码) REFERENCES 性别代码表 (性别代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_民族代码表_民族代码 FOREIGN KEY (民族代码) REFERENCES 民族代码表 (民族代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_省份代码表_省份代码 FOREIGN KEY (省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_城市代码表_城市代码 FOREIGN KEY (城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_区代码表_区代码     FOREIGN KEY (区代码)   REFERENCES 区代码表   (区代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_街道代码表_街道代码 FOREIGN KEY (街道代码) REFERENCES 街道代码表 (街道代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_学习层次代码_学习层次 FOREIGN KEY (学习层次代码) REFERENCES 学习层次代码表 (学习层次代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_专业代码表_专业代码 FOREIGN KEY (专业代码) REFERENCES 专业代码表 (专业代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_院系代码表_院系代码 FOREIGN KEY (院系代码) REFERENCES 院系代码表 (院系代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_婚配代码表_婚配代码 FOREIGN KEY (婚配代码) REFERENCES 婚配代码表 (婚配代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_户籍代码表_户籍代码 FOREIGN KEY (户籍代码) REFERENCES 户籍代码表 (户籍代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_邮政编码代码表_邮政编码代码 FOREIGN KEY (邮政编码代码) REFERENCES 邮政编码代码表 (邮政编码代码);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_政治面貌代码表_政治面貌代码 FOREIGN KEY (政治面貌代码) REFERENCES 政治面貌代码表 (政治面貌代码);

CREATE TABLE 学生_电子邮件表(
	学生学号          char(50)                     not null,
	电子邮件          char(50)
);
ALTER TABLE 学生_电子邮件表 ADD CONSTRAINT pk_学生_电子邮件表 PRIMARY KEY (学生学号);
ALTER TABLE 学生_电子邮件表 ADD CONSTRAINT fk_学生_电子邮件表_学生表_学生学号 FOREIGN KEY (学生学号) REFERENCES 学生表 (学生学号);

CREATE TABLE 学生_联系电话表(
	学生学号          char(50)                     not null,
	联系电话          char(50)
);
ALTER TABLE 学生_联系电话表 ADD CONSTRAINT pk_学生_联系电话表 PRIMARY KEY (学生学号);
ALTER TABLE 学生_联系电话表 ADD CONSTRAINT fk_学生_联系电话表_学生表_学生学号 FOREIGN KEY (学生学号) REFERENCES 学生表 (学生学号);

CREATE TABLE 班级_学生对照表(
	班级代码          int                          not null,
	学生学号          char(50)                     not null
);
ALTER TABLE 班级_学生对照表 ADD CONSTRAINT pk_班级_学生对照表 PRIMARY KEY (班级代码, 学生学号);
ALTER TABLE 班级_学生对照表 ADD CONSTRAINT fk_班级_学生对照表_班级代码表班_级代码 FOREIGN KEY (班级代码) REFERENCES 班级代码表 (班级代码);
ALTER TABLE 班级_学生对照表 ADD CONSTRAINT fk_班级_学生对照表_学生表_学生学号 FOREIGN KEY (学生学号) REFERENCES 学生表 (学生学号);

GO
CREATE VIEW 班级_学生对照视图
AS
SELECT 院系代码表.院系代码, 院系代码表.院系名称,
       班级代码表.班级代码, 班级代码表.班级名称,
	   专业代码表.专业代码, 专业代码表.专业名称,
	   学生表.学生学号, 学生表.学生姓名
FROM 院系代码表, 班级代码表, 专业代码表, 学生表, 班级_学生对照表
WHERE 班级_学生对照表.学生学号 = 学生表.学生学号 and 学生表.院系代码 = 院系代码表.院系代码
                                                 and 学生表.专业代码 = 专业代码表.专业代码
												 and 学生表.班级代码 = 班级代码表.班级代码
												 and 班级_学生对照表.班级代码 = 班级代码表.班级代码
GO

GO
CREATE VIEW 学生简略信息视图
AS
SELECT 学生表.学生学号, 学生表.学生姓名, 学生表.出生日期, 学生表.证件照片路径, 学生表.是否转专业, 学生表.是否双学位, 学生表.身份证号,
       身份证类别代码表.身份证类别名称, 民族代码表.民族名称, 学习层次代码表.学习层次,
	   院系_专业_班级对照视图.院系名称, 院系_专业_班级对照视图.专业名称, 院系_专业_班级对照视图.班级名称,
	   详细地址对照视图.省份名称, 详细地址对照视图.城市名称, 详细地址对照视图.区名称, 详细地址对照视图.街道名称,
	   婚配代码表.婚配情况, 户籍代码表.户籍名称, 邮政编码代码表.邮政编码, 政治面貌代码表.政治面貌类型
FROM 学生表, 身份证类别代码表, 民族代码表, 学习层次代码表, 院系_专业_班级对照视图, 详细地址对照视图, 婚配代码表, 户籍代码表, 邮政编码代码表, 政治面貌代码表
WHERE 学生表.身份证类别代码 = 身份证类别代码表.身份证类别代码 and 学生表.民族代码 = 民族代码表.民族代码 and 学生表.学习层次代码 = 学习层次代码表.学习层次代码
                                                              and 学生表.院系代码 = 院系_专业_班级对照视图.院系代码 and 学生表.班级代码 = 院系_专业_班级对照视图.班级代码
															  and 学生表.专业代码 = 院系_专业_班级对照视图.专业代码 and 学生表.省份代码 = 详细地址对照视图.省份代码
															  and 学生表.城市代码 = 详细地址对照视图.城市代码 and 学生表.区代码 = 详细地址对照视图.区代码
															  and 学生表.街道代码 = 详细地址对照视图.街道代码 and 学生表.婚配代码 = 婚配代码表.婚配代码
															  and 学生表.户籍代码 = 户籍代码表.户籍代码 and 学生表.邮政编码代码 = 邮政编码代码表.邮政编码代码
															  and 学生表.政治面貌代码 = 政治面貌代码表.政治面貌代码
GO

CREATE TABLE 教师表(
--基本信息
	教师工号          char(50)                     not null,
	教师姓名          char(80)                     not null,
	身份证类别代码    int                          not null,
	身份证号          char(50)                     not null,
	性别代码          int                          not null,
	出生日期          DATETIME                             ,
	个人简介          char(7000)                           ,
--地址信息
	省份代码          int                                  ,
	城市代码          int                                  ,
	区代码            int                                  ,
	街道代码          int                                  ,
--杂项信息
	婚配代码          int                                  ,
	户籍代码          int                                  ,
	证件照路径        char(150)                            ,
	民族代码          int                                  ,
	毕业院校_暂时禁用 char(100)                            ,
	政治面貌代码      int                                  ,
	邮政编码代码      int                                  ,
--校内信息
	院系代码          int                          not null,
);
--主键
ALTER TABLE 教师表 ADD CONSTRAINT pk_教师表 PRIMARY KEY (教师工号);
--外键
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_身份对照表_教师工号 FOREIGN KEY (教师工号) REFERENCES 身份对照表 (账号);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_身份证类别代码表_身份证类别代码 FOREIGN KEY (身份证类别代码) REFERENCES 身份证类别代码表 (身份证类别代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_性别代码表_性别代码 FOREIGN KEY (性别代码) REFERENCES 性别代码表 (性别代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_省份代码表_省份代码 FOREIGN KEY (省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_城市代码表_城市代码 FOREIGN KEY (城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_区代码表_区代码     FOREIGN KEY (区代码)   REFERENCES 区代码表   (区代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_街道代码表_街道代码 FOREIGN KEY (街道代码) REFERENCES 街道代码表 (街道代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_婚配代码表_婚配代码 FOREIGN KEY (婚配代码) REFERENCES 婚配代码表 (婚配代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_户籍代码表_户籍代码 FOREIGN KEY (户籍代码) REFERENCES 户籍代码表 (户籍代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_民族代码表_民族代码 FOREIGN KEY (民族代码) REFERENCES 民族代码表 (民族代码);
ALTER TABLE 教师表 ADD CONSTRAINT fk_教师表_院系代码表_院系代码 FOREIGN KEY (院系代码) REFERENCES 院系代码表 (院系代码);

CREATE TABLE 教师_电子邮件表(
	教师工号          char(50)                     not null,
	电子邮件          char(50)
);
ALTER TABLE 教师_电子邮件表 ADD CONSTRAINT pk_教师_电子邮件表 PRIMARY KEY (教师工号);
ALTER TABLE 教师_电子邮件表 ADD CONSTRAINT fk_教师_电子邮件表_教师表_教师工号 FOREIGN KEY (教师工号) REFERENCES 教师表 (教师工号);

CREATE TABLE 教师_联系电话表(
	教师工号          char(50)                     not null,
	联系电话          char(50)
);
ALTER TABLE 教师_联系电话表 ADD CONSTRAINT pk_教师_联系电话表 PRIMARY KEY (教师工号);
ALTER TABLE 教师_联系电话表 ADD CONSTRAINT fk_教师_联系电话表_教师表_教师工号 FOREIGN KEY (教师工号) REFERENCES 教师表 (教师工号);

CREATE TABLE 学位代码表(
	学位代码          int      IDENTITY(1,1)       not null,
	学位名称          char(1000)                   not null
);
ALTER TABLE 学位代码表 ADD CONSTRAINT pk_学位代码表 PRIMARY KEY (学位代码);

CREATE TABLE 教师_学位对照表(
	教师工号          char(50)                     not null,
	学位代码          int                          not null
);
ALTER TABLE 教师_学位对照表 ADD CONSTRAINT pk_教师_学位对照表 PRIMARY KEY (教师工号, 学位代码);
ALTER TABLE 教师_学位对照表 ADD CONSTRAINT fk_教师_学位对照表_教师工号 FOREIGN KEY (教师工号) REFERENCES 教师表 (教师工号);
ALTER TABLE 教师_学位对照表 ADD CONSTRAINT fk_教师_学位对照表_学位代码 FOREIGN KEY (学位代码) REFERENCES 学位代码表 (学位代码);

CREATE TABLE 班主任表(
	教师工号          char(50)                     not null,
	班级代码          int                          not null
);
ALTER TABLE 班主任表 ADD CONSTRAINT pk_班主任表 PRIMARY KEY (教师工号, 班级代码);
ALTER TABLE 班主任表 ADD CONSTRAINT fk_班主任表_教师表_教师工号 FOREIGN KEY (教师工号) REFERENCES 教师表 (教师工号);
ALTER TABLE 班主任表 ADD CONSTRAINT fk_班主任表_班级代码表_班级代码 FOREIGN KEY (班级代码) REFERENCES 班级代码表 (班级代码);

GO
CREATE VIEW 教师_学位对照视图
AS
SELECT 教师表.教师工号, 教师表.教师姓名, 学位代码表.学位代码, 学位代码表.学位名称
FROM 教师表, 学位代码表, 教师_学位对照表
WHERE 教师表.教师工号 = 教师_学位对照表.教师工号 and 学位代码表.学位代码 = 教师_学位对照表.学位代码
GO

GO
CREATE VIEW 教师简略信息视图
AS
SELECT 教师表.教师工号, 教师表.教师姓名, 教师表.身份证号, 教师表.出生日期, 教师表.证件照路径, 教师表.个人简介,
       详细地址对照视图.省份名称, 详细地址对照视图.城市名称, 详细地址对照视图.区名称, 详细地址对照视图.街道名称, 身份证类别代码表.身份证类别名称,
	   婚配代码表.婚配情况, 户籍代码表.户籍名称, 院系_专业_班级对照视图.院系名称, 民族代码表.民族名称, 性别代码表.性别,
	   政治面貌代码表.政治面貌类型, 邮政编码代码表.邮政编码
FROM 教师表, 详细地址对照视图, 婚配代码表, 户籍代码表, 院系_专业_班级对照视图, 身份证类别代码表, 民族代码表, 性别代码表, 政治面貌代码表, 邮政编码代码表
WHERE 教师表.省份代码 = 详细地址对照视图.省份代码 and 教师表.城市代码 = 详细地址对照视图.城市代码 and 教师表.区代码 = 详细地址对照视图.区代码
												and 教师表.街道代码 = 详细地址对照视图.街道代码 and 教师表.身份证类别代码 = 身份证类别代码表.身份证类别代码
												and 教师表.婚配代码 = 婚配代码表.婚配代码 and 教师表.户籍代码 = 户籍代码表.户籍代码
												and 教师表.院系代码 = 院系_专业_班级对照视图.院系代码 and 教师表.性别代码 = 性别代码表.性别代码
												and 教师表.民族代码 = 民族代码表.民族代码 and 教师表.政治面貌代码 = 政治面貌代码表.政治面貌代码
												and 教师表.邮政编码代码 = 邮政编码代码表.邮政编码代码
GO

CREATE TABLE 课程所在学期表(
	课程所在学期      int         UNIQUE           not null
);
ALTER TABLE 课程所在学期表 ADD CONSTRAINT pk_课程所在学期表 PRIMARY KEY (课程所在学期);

CREATE TABLE 课程持续节数表(
	课程持续节数      int         UNIQUE           not null
);
ALTER TABLE 课程持续节数表 ADD CONSTRAINT pk_课程持续节数表 PRIMARY KEY (课程持续节数);

CREATE TABLE 单节课程长度表(
	单节课程长度      int         UNIQUE           not null
);
ALTER TABLE 单节课程长度表 ADD CONSTRAINT pk_单节课程长度表 PRIMARY KEY (单节课程长度);

CREATE TABLE 课程开始节数表(
	课程开始节数      int         UNIQUE           not null
);
ALTER TABLE 课程开始节数表 ADD CONSTRAINT pk_课程节数时间表 PRIMARY KEY (课程开始节数);

CREATE TABLE 课程上课星期表(
	课程上课星期      int         UNIQUE           not null
);
ALTER TABLE 课程上课星期表 ADD CONSTRAINT pk_课程上课星期表 PRIMARY KEY (课程上课星期);

CREATE TABLE 教室代码表(
	教室代码          int       IDENTITY(1,1)      not null,
	教室名称          char(300)                    not null
);
ALTER TABLE 教室代码表 ADD CONSTRAINT pk_教室代码表 PRIMARY KEY (教室代码);

CREATE TABLE 出版社代码表(
	出版社代码        int       IDENTITY(1,1)      not null,
	出版社名称        int                          not null
);
ALTER TABLE 出版社代码表 ADD CONSTRAINT pk_出版社代码表 PRIMARY KEY (出版社代码);

CREATE TABLE 教材代码表(
	教材代码          int       IDENTITY(1,1)      not null,
	教材名称          char(200)                    not null,
	出版社代码        int                          not null,
	教材图片路径      char(300)                    not null
);
ALTER TABLE 教材代码表 ADD CONSTRAINT pk_教材代码表 PRIMARY KEY (教材代码, 出版社代码);
ALTER TABLE 教材代码表 ADD CONSTRAINT fk_教材代码表_出版社代码表_出版社代码 FOREIGN KEY (出版社代码) REFERENCES 出版社代码表 (出版社代码);

GO
CREATE VIEW 教材简略信息视图
AS
SELECT 教材代码表.教材代码, 教材代码表.教材名称, 出版社代码表.出版社名称, 教材代码表.教材图片路径
FROM 教材代码表, 出版社代码表
WHERE 教材代码表.出版社代码 = 出版社代码表.出版社代码
GO

CREATE TABLE 课程代码表(
	课程代码          int       IDENTITY(1,1)      not null,
	课程名称          char(100)                    not null,
	课程学分          decimal(5,2)                 not null,
	课程简介          char(7800)                   not null,
);
ALTER TABLE 课程代码表 ADD CONSTRAINT pk_课程代码表 PRIMARY KEY (课程代码);

CREATE TABLE 课程_上课时间对照表(
	课程代码          int                          not null,
	课程上课星期      int                          not null,
	课程持续节数      int                          not null,
	课程开始节数      int                          not null,
	课程所在学期      int                          not null
);
ALTER TABLE 课程_上课时间对照表 ADD CONSTRAINT pk_课程_上课时间对照表 PRIMARY KEY (课程代码);
ALTER TABLE 课程_上课时间对照表 ADD CONSTRAINT fk_课程_上课时间对照表_课程代码表_课程代码 FOREIGN KEY (课程代码) REFERENCES 课程代码表(课程代码);
ALTER TABLE 课程_上课时间对照表 ADD CONSTRAINT fk_课程_上课时间对照表_课程上课星期表_课程上课星期 FOREIGN KEY (课程上课星期) REFERENCES 课程上课星期表(课程上课星期);
ALTER TABLE 课程_上课时间对照表 ADD CONSTRAINT fk_课程_上课时间对照表_课程持续节数表_课程持续节数 FOREIGN KEY (课程持续节数) REFERENCES 课程持续节数表(课程持续节数);
ALTER TABLE 课程_上课时间对照表 ADD CONSTRAINT fk_课程_上课时间对照表_课程开始节数表_课程开始节数 FOREIGN KEY (课程开始节数) REFERENCES 课程开始节数表(课程开始节数);

CREATE TABLE 课程_上课教室对照表(
	课程代码          int                          not null,
	教室代码          int                          not null
);
ALTER TABLE 课程_上课教室对照表 ADD CONSTRAINT pk_课程_上课教室对照表 PRIMARY KEY (课程代码);
ALTER TABLE 课程_上课教室对照表 ADD CONSTRAINT fk_课程_上课教室对照表_课程代码表_课程代码 FOREIGN KEY (课程代码) REFERENCES 课程代码表(课程代码);
ALTER TABLE 课程_上课教室对照表 ADD CONSTRAINT fk_课程_上课教室对照表_教室代码表_教室代码 FOREIGN KEY (教室代码) REFERENCES 教室代码表(教室代码);

GO
CREATE VIEW 课程_教室对照视图
AS
SELECT 课程代码表.课程名称, 教室代码表.教室名称, 课程代码表.课程代码, 教室代码表.教室代码
FROM 课程代码表, 教室代码表, 课程_上课教室对照表
WHERE 课程代码表.课程代码 = 课程_上课教室对照表.课程代码 and 教室代码表.教室代码 = 课程_上课教室对照表.教室代码
GO

CREATE TABLE 教师_课程对照表(
	教师工号          char(50)                     not null,
	课程代码          int                          not null
);
ALTER TABLE 教师_课程对照表 ADD CONSTRAINT pk_教师_课程对照表 PRIMARY KEY (教师工号, 课程代码);
ALTER TABLE 教师_课程对照表 ADD CONSTRAINT fk_教师_课程对照表_教师表_教师工号 FOREIGN KEY (教师工号) REFERENCES 教师表 (教师工号);
ALTER TABLE 教师_课程对照表 ADD CONSTRAINT fk_教师_课程对照表_课程代码表_课程代码 FOREIGN KEY (课程代码) REFERENCES 课程代码表 (课程代码);

GO
CREATE VIEW 教师授课对照视图
AS
SELECT 教师表.教师工号, 教师表.教师姓名, 课程_教室对照视图.课程代码, 课程_教室对照视图.课程名称, 课程_教室对照视图.教室代码, 课程_教室对照视图.教室名称
FROM 教师表, 课程_教室对照视图, 教师_课程对照表
WHERE 教师表.教师工号 = 教师_课程对照表.教师工号 and 课程_教室对照视图.课程代码 = 教师_课程对照表.课程代码
GO

CREATE TABLE 学生_课程对照表(
	学生学号          char(50)                     not null,
	课程代码          int                          not null,
	学生成绩          decimal(5,2)                         ,
	学生试卷pdf路径   char(1500)
);
ALTER TABLE 学生_课程对照表 ADD CONSTRAINT pk_学生_课程对照表 PRIMARY KEY (学生学号, 课程代码);
ALTER TABLE 学生_课程对照表 ADD CONSTRAINT fk_学生_课程对照表_学生表_学生学号 FOREIGN KEY (学生学号) REFERENCES 学生表 (学生学号);
ALTER TABLE 学生_课程对照表 ADD CONSTRAINT fk_学生_课程对照表_课程表_课程代码 FOREIGN KEY (课程代码) REFERENCES 课程代码表 (课程代码);

GO
CREATE VIEW 学生上课视图
AS
SELECT 学生表.学生学号, 学生表.学生姓名, 学生表.是否双学位, 学生表.是否转专业, 学生表.身份证号,
       身份证类别代码表.身份证类别名称,
       院系_专业_班级对照视图.院系名称, 院系_专业_班级对照视图.专业名称, 院系_专业_班级对照视图.班级名称,
	   性别代码表.性别, 民族代码表.民族名称, 婚配代码表.婚配情况, 户籍代码表.户籍名称, 政治面貌代码表.政治面貌类型,
	   详细地址对照视图.省份名称, 详细地址对照视图.城市名称, 详细地址对照视图.区名称, 详细地址对照视图.街道名称,
	   课程代码表.课程名称, 课程代码表.课程学分, 课程代码表.课程简介,
	   学生_课程对照表.学生成绩
FROM 学生表, 身份证类别代码表, 院系_专业_班级对照视图, 性别代码表, 民族代码表, 婚配代码表, 户籍代码表, 政治面貌代码表,
     详细地址对照视图, 课程代码表, 学生_课程对照表
WHERE 学生表.学生学号 = 学生_课程对照表.学生学号 and 课程代码表.课程代码 = 学生_课程对照表.课程代码    and 学生表.省份代码 = 详细地址对照视图.省份代码
                                                 and 学生表.城市代码 = 详细地址对照视图.城市代码         and 学生表.区代码 = 详细地址对照视图.区代码
												 and 学生表.街道代码 = 详细地址对照视图.街道名称         and 学生表.身份证类别代码 = 身份证类别代码表.身份证类别代码
												 and 学生表.院系代码 = 院系_专业_班级对照视图.院系代码 and 学生表.专业代码 = 院系_专业_班级对照视图.专业代码
												 and 学生表.班级代码 = 院系_专业_班级对照视图.班级代码 and 学生表.性别代码 = 性别代码表.性别代码
												 and 学生表.民族代码 = 民族代码表.民族代码             and 学生表.婚配代码 = 婚配代码表.婚配代码
												 and 学生表.政治面貌代码 = 政治面貌代码表.政治面貌代码 and 学生表.户籍代码 = 户籍代码表.户籍代码
												 and 学生表.学生学号 = 学生_课程对照表.学生学号
GO

CREATE TABLE 管理员表(
	账号          char(50)                     not null,
	密码          char(50)                     not null,
	管理对象代码  int                     not null
);
ALTER TABLE 管理员表 ADD CONSTRAINT pk_管理员表 PRIMARY KEY (账号);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_身份对照表_账号 FOREIGN KEY (账号) REFERENCES 身份对照表 (账号);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_身份代码表_管理对象代码 FOREIGN KEY (管理对象代码) REFERENCES 身份代码表 (身份代码);

GO
CREATE VIEW 管理员简略信息视图
AS
SELECT 管理员表.账号, 管理员表.密码, 身份代码表.身份名称
FROM 管理员表, 身份代码表
WHERE 管理员表.管理对象代码 = 身份代码表.身份代码
GO

CREATE TABLE 审核状态代码表(
	审核状态代码  int          IDENTITY(1,1)   not null,
	审核状态      char(20)                     not null
);
ALTER TABLE 审核状态代码表 ADD CONSTRAINT pk_审核状态代码表 PRIMARY KEY (审核状态代码);

CREATE TABLE 是否需要材料代码表(
	是否需要材料代码  smallint                     not null,
	是否需要材料      char(20)                     not null
);
ALTER TABLE 是否需要材料代码表 ADD CONSTRAINT pk_是否需要材料代码表 PRIMARY KEY (是否需要材料代码);

CREATE TABLE 申请等级代码表(
	申请等级代码   int         IDENTITY(1,1)    not null,
	申请等级       char(100)                    not null
);
ALTER TABLE 申请等级代码表 ADD CONSTRAINT pk_申请等级代码表 PRIMARY KEY (申请等级代码);

CREATE TABLE 申请表(
	账号              char(50)                     not null,
	申请编号          int          IDENTITY(1,1)   not null,
	申请标题          char(100)                            ,
	申请概述          char(7500)                           ,
	申请等级代码      int                          not null,
	是否需要材料代码  smallint                     not null,
	审核状态代码      int
);
ALTER TABLE 申请表 ADD CONSTRAINT pk_申请表 PRIMARY KEY (申请编号);
ALTER TABLE 申请表 ADD CONSTRAINT fk_申请表_身份对照表_账号 FOREIGN KEY (账号) REFERENCES 身份对照表 (账号);
ALTER TABLE 申请表 ADD CONSTRAINT fk_申请表_审核状态表_审核状态代码 FOREIGN KEY (审核状态代码) REFERENCES 审核状态代码表(审核状态代码);
ALTER TABLE 申请表 ADD CONSTRAINT fk_申请表_申请等级代码表_申请等级代码 FOREIGN KEY (申请等级代码) REFERENCES 申请等级代码表 (申请等级代码);
ALTER TABLE 申请表 ADD CONSTRAINT fk_申请表_是否需要材料代码表_是否需要材料代码 FOREIGN KEY (是否需要材料代码) REFERENCES 是否需要材料代码表 (是否需要材料代码);

CREATE TABLE 申请材料表(
	申请编号      int                          not null,
	申请材料路径  char(1000)
);
ALTER TABLE 申请材料表 ADD CONSTRAINT pk_申请材料表 PRIMARY KEY (申请编号);
ALTER TABLE 申请材料表 ADD CONSTRAINT fk_申请材料表_申请表_申请编号 FOREIGN KEY (申请编号) REFERENCES 申请表 (申请编号);