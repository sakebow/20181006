CREATE TABLE 学生表(
   姓名           char(50)      not null,
   性别           char(10)      not null,
   学号           char(30)      not null,
   学院           char(80),
   班级           char(80),
   出生日期       datetime      not null,
   身份证号       char(50)      not null,
   密码           char(50),
   民族           char(50),
   籍贯           char(100),
   户口类别       char(20),
   家庭现住址     char(300)     not null,
   邮政编码       char(20),
   婚配情况       char(10),
   政治面貌       char(10),
   学习层次       char(20),
   专业方向       char(100),
   入学日期       datetime      not null,
   毕业日期       datetime,
   毕业证书号     char(50),
   学士证书号     char(50),
   证件照路径     char(500),
   obligate1      char(100),
   obligate2      char(100),
   obligate3      char(100),
   obligate4      char(100),
   obligate5      char(100),
   obligate6      char(100),
   obligate7      char(100),
   obligate8      char(100),
   obligate9      char(100),
   obligate10     char(100),
   obligate11     char(100),
   obligate12     char(100),
   obligate13     char(100),
   obligate14     char(100),
   obligate15     char(100)
);
CREATE TABLE 学生_课程表(
   学号           char(30)        not null,
   课程编号       int             not null,
   学生成绩       decimal(10,2),
   所在教室       char(100),
   obligate1      char(100),
   obligate2      char(100),
   obligate3      char(100),
   obligate4      char(100),
   obligate5      char(100),
   obligate6      char(100),
   obligate7      char(100),
   obligate8      char(100),
   obligate9      char(100),
   obligate10     char(100)
);
CREATE TABLE 课程表(
   课程编号       int identity(1,1)    not null,
   课程名称       char(100)            not null,
   课程学分       decimal,
   课程简介       char(5888),
   教材图片路径   char(500),
   教材出版社     char(500),
   课程类别       char(50)             not null,
   obligate1      char(100),
   obligate2      char(100),
   obligate3      char(100),
   obligate4      char(100),
   obligate5      char(100),
   obligate6      char(100),
   obligate7      char(100),
   obligate8      char(100),
   obligate9      char(100),
   obligate10     char(100)
);
CREATE TABLE 课程_时间表(
   课程编号      int        not null,
   上课星期      int        not null,
   上课时间      char(100)   not null,
   上课学年      int        not null,
   上课学期      int        not null,
   obligate1      char(100),
   obligate2      char(100),
   obligate3      char(100),
   obligate4      char(100),
   obligate5      char(100),
   obligate6      char(100),
   obligate7      char(100),
   obligate8      char(100),
   obligate9      char(100),
   obligate10     char(100)
);
CREATE TABLE 教师表(
    教师工号      char(30)      not null,
    姓名          char(50)      not null,
	密码          char(80),
	性别          char(10)      not null,
	出生年月      datetime,
	执教年份      int           not null,
	户口类别      char(20),
	政治面貌      char(20),
	婚配情况      char(10),
	学位          char(80)      not null,
	毕业院校      char(80)      not null,
	简介          char(5956),
	民族          char(100),
	是否为班主任  char(2)       not null,
	管理班级      char(100),
	obligate1     char(100),
    obligate2     char(100),
    obligate3     char(100),
    obligate4     char(100),
    obligate5     char(100),
    obligate6     char(100),
    obligate7     char(100),
    obligate8     char(100),
    obligate9     char(100),
    obligate10    char(100),
    obligate11    char(100),
    obligate12    char(100),
    obligate13    char(100),
    obligate14    char(100),
    obligate15    char(100)
 );
CREATE TABLE 教师_课程表(
    课程编号       int           not null,
	教师工号       char(30)      not null,
	所在教室       char(100),
	obligate1      char(100),
    obligate2      char(100),
    obligate3      char(100),
    obligate4      char(100),
    obligate5      char(100),
    obligate6      char(100),
    obligate7      char(100),
    obligate8      char(100),
    obligate9      char(100),
    obligate10     char(100)
);
CREATE TABLE 学生申请表(
    学号           char(30)             not null,
	申请编号       int identity(1,1)    not null,
	申请标题       char(500),
	申请内容       char(6007)           not null,
	申请类别       char(500)             not null,
	申请时间       datetime             not null,
	审核状态       smallint             not null,
	obligate1      char(100),
    obligate2      char(100),
    obligate3      char(100),
    obligate4      char(100),
    obligate5      char(100),
    obligate6      char(100),
    obligate7      char(100),
    obligate8      char(100),
    obligate9      char(100),
    obligate10     char(100)
);
CREATE TABLE 教师申请表(
    教师工号       char(30)             not null,
	申请编号       int identity(1,1)    not null,
	申请标题       char(500),
	申请内容       char(6007)           not null,
	申请类别       char(500)             not null,
	申请时间       datetime             not null,
	审核状态       smallint             not null,
	obligate1      char(100),
    obligate2      char(100),
    obligate3      char(100),
    obligate4      char(100),
    obligate5      char(100),
    obligate6      char(100),
    obligate7      char(100),
    obligate8      char(100),
    obligate9      char(100),
    obligate10     char(100)
);
CREATE TABLE 管理员表(
    账号           char(20)     not null,
	密码           char(20)     not null,
	管理对象       char(10)      not null,
	obligate1      char(100),
    obligate2      char(100),
    obligate3      char(100),
    obligate4      char(100),
    obligate5      char(100),
    obligate6      char(100),
    obligate7      char(100),
    obligate8      char(100),
    obligate9      char(100),
    obligate10     char(100)
);

CREATE TABLE 新闻表(
	新闻编号       int IDENTITY(1, 1) not null,
	新闻标题       char(50)           not null,
	新闻内容       varchar(8000)      not null,
	发布时间       DATETIME           not null,
	修改时间       DATETIME,
	obligate1      char(100),
    obligate2      char(100),
    obligate3      char(100),
    obligate4      char(100),
    obligate5      char(100),
    obligate6      char(100),
    obligate7      char(100),
    obligate8      char(100),
    obligate9      char(100),
    obligate10     char(100),
	obligate11     char(100),
	obligate12     char(100),
	obligate13     char(100),
	obligate14     char(100),
	obligate15     char(100)
);

CREATE TABLE 公告表(
    公告编号       int IDENTITY(1, 1) not null,
	公告标题       char(50)           not null,
	公告内容       varchar(8000)      not null,
	发布时间       DATETIME           not null,
	修改时间       DATETIME,
	obligate1      char(100),
    obligate2      char(100),
    obligate3      char(100),
    obligate4      char(100),
    obligate5      char(100),
    obligate6      char(100),
    obligate7      char(100),
    obligate8      char(100),
    obligate9      char(100),
    obligate10     char(100),
	obligate11     char(100),
	obligate12     char(100),
	obligate13     char(100),
	obligate14     char(100),
	obligate15     char(100)
);
-----------------------------------------------------------------------------------
----------------主键 (2018/9/23) -- 柳景兴 + 陶锦丞
-----------------------------------------------------------------------------------
--学生表（学号）
ALTER TABLE 学生表 ADD CONSTRAINT pk_sid PRIMARY KEY (学号);
--学生_课程表（课程号 + 学号）
ALTER TABLE 学生_课程表 ADD CONSTRAINT pk_scid PRIMARY KEY (课程编号, 学号);
--课程表（课程编号）
ALTER TABLE 课程表 ADD CONSTRAINT pk_cid PRIMARY KEY (课程编号);
--教师表（教师工号）
ALTER TABLE 教师表 ADD CONSTRAINT pk_tid PRIMARY KEY (教师工号);
--教师_课程表（教师工号 + 课程编号）
ALTER TABLE 教师_课程表 ADD CONSTRAINT pk_tcid PRIMARY KEY (教师工号, 课程编号);
--教师申请表（申请编号）
ALTER TABLE 教师申请表 ADD CONSTRAINT pk_tno PRIMARY KEY (申请编号);
--学生申请表（申请编号）
ALTER TABLE 学生申请表 ADD CONSTRAINT pk_sno PRIMARY KEY (申请编号);
--新闻表（新闻编号）
ALTER TABLE 新闻表 ADD CONSTRAINT pk_news_no PRIMARY KEY (新闻编号);
--公告表（公告编号）
ALTER TABLE 公告表 ADD CONSTRAINT pk_notice_no PRIMARY KEY (公告编号);
------------------------------------------------------------------------------------
---------------外键  (2018/9/23)  --  柳景兴 + 陶锦丞
------------------------------------------------------------------------------------
--学生_课程表（学号） -> 学生表（学号）
ALTER TABLE 学生_课程表 ADD CONSTRAINT fk_sc_sid FOREIGN KEY (学号) REFERENCES 学生表(学号);
--学生_课程表（课程编号） -> 课程表（课程编号）
ALTER TABLE 学生_课程表 ADD CONSTRAINT fk_sc_cid FOREIGN KEY (课程编号) REFERENCES 课程表(课程编号);
--教师_课程表（课程编号） -> 课程表（课程编号）
ALTER TABLE 教师_课程表 ADD CONSTRAINT fk_tc_cid FOREIGN KEY (课程编号) REFERENCES 课程表(课程编号);
--教师_课程表（教师工号） -> 教师表（教师工号）
ALTER TABLE 教师_课程表 ADD CONSTRAINT fk_tc_tid FOREIGN KEY (教师工号) REFERENCES 教师表(教师工号);
--学生申请表（学号） -> 学生表（学号）
ALTER TABLE 学生申请表 ADD CONSTRAINT fk_sno FOREIGN KEY (学号) REFERENCES 学生表(学号);
--教师申请表（教师工号） -> 教师表（教师工号）
ALTER TABLE 教师申请表 ADD CONSTRAINT fk_tno FOREIGN KEY (教师工号) REFERENCES 教师表(教师工号);
-----------------------------------------------------------------------------------
---------------默认值  (2018/9/23)  --  柳景兴 + 陶锦丞
-----------------------------------------------------------------------------------
--学生表
ALTER TABLE 学生表 ADD CONSTRAINT df_s_pwd DEFAULT '123456' for 密码;
ALTER TABLE 学生表 ADD CONSTRAINT df_s_nation DEFAULT '汉族' for 民族;
ALTER TABLE 学生表 ADD CONSTRAINT df_s_household DEFAULT '非农村户口' for 户口类别;
ALTER TABLE 学生表 ADD CONSTRAINT df_s_married DEFAULT '未婚' for 婚配情况;
ALTER TABLE 学生表 ADD CONSTRAINT df_s_politicstatus DEFAULT '团员' for 政治面貌;
ALTER TABLE 学生表 ADD CONSTRAINT df_s_hierarchy DEFAULT '本科' for 学习层次;
--课程表
ALTER TABLE 课程表 ADD CONSTRAINT df_c_score DEFAULT 0 for 课程学分;
--教师表
ALTER TABLE 教师表 ADD CONSTRAINT df_t_pwd DEFAULT '123456' for 密码;
ALTER TABLE 教师表 ADD CONSTRAINT df_t_household DEFAULT '非农村户口' for 户口类别;
ALTER TABLE 教师表 ADD CONSTRAINT df_t_politicstatus DEFAULT '党员' for 政治面貌;
ALTER TABLE 教师表 ADD CONSTRAINT df_t_married DEFAULT '已婚' for 婚配情况;
ALTER TABLE 教师表 ADD CONSTRAINT df_t_nation DEFAULT '汉族' for 民族;
ALTER TABLE 教师表 ADD CONSTRAINT df_t_master DEFAULT '否' for 是否为班主任;
ALTER TABLE 教师表 ADD CONSTRAINT df_t_class DEFAULT '无' for 管理班级;
--管理员表
ALTER TABLE 管理员表 ADD CONSTRAINT df_sa_pwd DEFAULT '123456' for 密码;
-----------------------------------------------------------------------------------
---------------约束    (2018/9/23)  -- 柳景兴 + 陶锦丞
-----------------------------------------------------------------------------------
--学生表
ALTER TABLE 学生表 ADD CONSTRAINT ck_s_sex CHECK (性别 IN('男','女','男转女','女转男','男女同体','未鉴定'));
ALTER TABLE 学生表 ADD CONSTRAINT ck_s_household CHECK (户口类别 IN ('农村户口', '非农村户口'));
ALTER TABLE 学生表 ADD CONSTRAINT ck_s_married CHECK (婚配情况 IN ('已婚', '未婚'));
ALTER TABLE 学生表 ADD CONSTRAINT ck_s_politicstatus CHECK (政治面貌 IN ('群众','民主党派成员','共青团员','中共党员'));
ALTER TABLE 学生表 ADD CONSTRAINT ck_s_hierarchy CHECK (学习层次 IN ('小学','初中','高中','专科','本科','研究生','硕士','博士'));
--教师表
ALTER TABLE 教师表 ADD CONSTRAINT ck_t_household CHECK (户口类别 IN ('农村户口', '非农村户口'));
ALTER TABLE 教师表 ADD CONSTRAINT ck_t_politicstatus CHECK (政治面貌 IN ('群众','民主党派成员','共青团员','中共党员'));
ALTER TABLE 教师表 ADD CONSTRAINT ck_t_married CHECK (婚配情况 IN ('已婚', '未婚'));
ALTER TABLE 教师表 ADD CONSTRAINT ck_t_master CHECK (是否为班主任 IN ('是', '否'));
--学生_课程表
ALTER TABLE 学生_课程表 ADD CONSTRAINT ck_sc_score CHECK (学生成绩 >= 0 and 学生成绩 <= 100);
--课程表
ALTER TABLE 课程表 ADD CONSTRAINT ck_c_score CHECK (课程学分 >= 0);
ALTER TABLE 课程表 ADD CONSTRAINT ck_c_type CHECK (课程类别 in ('专选课', '必修课', '选修课'));
--课程_时间表
ALTER TABLE 课程_时间表 ADD CONSTRAINT ck_ct_term CHECK (上课学期 IN (1, 2));
--管理员表
ALTER TABLE 管理员表 ADD CONSTRAINT ck_a_object CHECK (管理对象 IN ('学生', '教师'));