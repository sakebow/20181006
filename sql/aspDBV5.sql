use asp;
--------------------------------------------------------------------------------------------------
--------------------------------异     常     信     息-------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 冻结等级代码表(
	冻结等级             char(2)                  not null,
	冻结时长             int                      not null, -- 单位是天
	等级描述             varchar(300)             not null,
	是否启用             char(2)                  not null
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
INSERT INTO 密码表 (账号) VALUES ('10512student');
INSERT INTO 密码表 (账号) VALUES ('10512teacher');
INSERT INTO 密码表 (账号) VALUES ('201622111920052');
INSERT INTO 密码表 (账号) VALUES ('200804');
INSERT INTO 密码表 (账号) VALUES ('201622111920287');

INSERT INTO 密码表 (账号) VALUES ('201622111920001');
INSERT INTO 密码表 (账号) VALUES ('201622111920002');
INSERT INTO 密码表 (账号) VALUES ('201622111920003');
INSERT INTO 密码表 (账号) VALUES ('201622111920004');
INSERT INTO 密码表 (账号) VALUES ('201622111920005');
INSERT INTO 密码表 (账号) VALUES ('201622111920006');
INSERT INTO 密码表 (账号) VALUES ('201622111920007');
INSERT INTO 密码表 (账号) VALUES ('201622111920008');
INSERT INTO 密码表 (账号) VALUES ('201622111920009');
INSERT INTO 密码表 (账号) VALUES ('201622111920010');
INSERT INTO 密码表 (账号) VALUES ('201622111920011');
INSERT INTO 密码表 (账号) VALUES ('201622111920012');
INSERT INTO 密码表 (账号) VALUES ('201622111920022');

INSERT INTO 密码表 (账号) VALUES ('200805');
INSERT INTO 密码表 (账号) VALUES ('200806');
INSERT INTO 密码表 (账号) VALUES ('200807');
INSERT INTO 密码表 (账号) VALUES ('200808');
INSERT INTO 密码表 (账号) VALUES ('200809');
INSERT INTO 密码表 (账号) VALUES ('200810');

--SELECT * FROM 密码表;
--------------------------------------------------------------------------------------------------

CREATE TABLE 身份代码表(
	身份代码         char(2)                       not null,
	身份名称         varchar(30)      UNIQUE       not null,
	是否启用         char(2)                       not null
);
ALTER TABLE 身份代码表 ADD CONSTRAINT pk_身份代码表 PRIMARY KEY (身份代码);
ALTER TABLE 身份代码表 ADD CONSTRAINT ck_身份代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
------------------------------------身    份   字    段-------------------------------------------
INSERT INTO 身份代码表 VALUES ('01', '学生', '是');
INSERT INTO 身份代码表 VALUES ('02', '教师', '是');
INSERT INTO 身份代码表 VALUES ('11', '学生管理员', '是');
INSERT INTO 身份代码表 VALUES ('12', '教师管理员', '是');
--------------------------------------------------------------------------------------------------
--SELECT * FROM 身份对照表;
CREATE TABLE 身份对照表(
	身份代码         char(2)                       not null,
	账号             varchar(50)                   not null -- 这里不能是UNIQUE！
);
ALTER TABLE 身份对照表 ADD CONSTRAINT pk_身份对照表 PRIMARY KEY (账号, 身份代码);
ALTER TABLE 身份对照表 ADD CONSTRAINT fk_身份对照表_身份代码表_身份名称 FOREIGN KEY (身份代码) REFERENCES 身份代码表 (身份代码);
ALTER TABLE 身份对照表 ADD CONSTRAINT fk_身份对照表_密码表_账号 FOREIGN KEY (账号) REFERENCES 密码表 (账号);
------------------------------------身    份   映    射-------------------------------------------
INSERT INTO 身份对照表 VALUES ('11', '10512student');
INSERT INTO 身份对照表 VALUES ('12', '10512teacher');
INSERT INTO 身份对照表 VALUES ('01', '201622111920052');
INSERT INTO 身份对照表 VALUES ('02', '200804');

INSERT INTO 身份对照表 VALUES ('01', '201622111920001');
INSERT INTO 身份对照表 VALUES ('01', '201622111920002');
INSERT INTO 身份对照表 VALUES ('01', '201622111920003');
INSERT INTO 身份对照表 VALUES ('01', '201622111920004');
INSERT INTO 身份对照表 VALUES ('01', '201622111920005');
INSERT INTO 身份对照表 VALUES ('01', '201622111920006');
INSERT INTO 身份对照表 VALUES ('01', '201622111920007');
INSERT INTO 身份对照表 VALUES ('01', '201622111920008');
INSERT INTO 身份对照表 VALUES ('01', '201622111920009');
INSERT INTO 身份对照表 VALUES ('01', '201622111920010');
INSERT INTO 身份对照表 VALUES ('01', '201622111920011');
INSERT INTO 身份对照表 VALUES ('01', '201622111920012');
INSERT INTO 身份对照表 VALUES ('01', '201622111920022');

INSERT INTO 身份对照表 VALUES ('02', '200805');
INSERT INTO 身份对照表 VALUES ('02', '200806');
INSERT INTO 身份对照表 VALUES ('02', '200807');
INSERT INTO 身份对照表 VALUES ('02', '200808');
INSERT INTO 身份对照表 VALUES ('02', '200809');
INSERT INTO 身份对照表 VALUES ('02', '200810');
--------------------------------------------------------------------------------------------------

GO
CREATE VIEW 登陆验证视图
AS
SELECT 密码表.账号, 密码表.密码, 身份代码表.身份代码, 身份代码表.身份名称
FROM 密码表, 身份代码表, 身份对照表
WHERE 密码表.账号 = 身份对照表.账号 AND 身份对照表.身份代码 = 身份代码表.身份代码 AND 身份代码表.是否启用 = '是';
GO

--SELECT * FROM 登陆验证视图;

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
	   登录信息表.解冻时间, 冻结等级代码表.冻结时长, 身份对照表.身份代码, 身份代码表.身份名称
FROM 登录信息表, 冻结等级代码表, 身份对照表, 身份代码表, 冻结记录表
WHERE 登录信息表.账号 = 冻结记录表.账号 AND 冻结记录表.冻结等级 = 冻结等级代码表.冻结等级 AND 登录信息表.账号 = 身份对照表.账号
										AND 身份对照表.身份代码 = 身份代码表.身份代码;
GO

--------------------------------------------------------------------------------------------------
----------------------------------地    点    信    息--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 邮政编码代码表(
	邮政编码         char(15)    not null,
	是否启用         char(2)     not null
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
	是否启用         char(2)      not null
);
ALTER TABLE 国家代码表 ADD CONSTRAINT pk_国家代码表 PRIMARY KEY (国家代码);
ALTER TABLE 国家代码表 ADD CONSTRAINT ck_国家代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------国    家    字    段--------------------------------------------
INSERT INTO 国家代码表 VALUES ('457', '中华人民共和国', 'ZHONGHUARENMINGONGHEGUO', 'zhonghuarenmingongheguo', 'CHN', '', '是');
--------------------------------------------------------------------------------------------------
CREATE TABLE 省份代码表(
	省份代码         varchar(10)  not null,
	省份名称         varchar(50)  not null,
	省份罗马拼音大写 varchar(200) not null,
	省份罗马拼音小写 varchar(200) not null,
	所在国家代码     varchar(10)  not null,
	是否启用         char(2)      not null
);
ALTER TABLE 省份代码表 ADD CONSTRAINT pk_省份代码表 PRIMARY KEY (省份代码);
ALTER TABLE 省份代码表 ADD CONSTRAINT ck_省份代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 省份代码表 ADD CONSTRAINT fk_省份代码表_国家代码表_所在国家代码 FOREIGN KEY (所在国家代码) REFERENCES 国家代码表 (国家代码);
----------------------------------省    份    字    段--------------------------------------------
INSERT INTO 省份代码表  VALUES ('420000', '湖北省', 'hubeisheng', 'HUBEISHENG', '457', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 城市代码表(
	城市代码         varchar(10)  not null,
	城市名称         varchar(50)  not null,
	城市罗马拼音大写 varchar(200) not null,
	城市罗马拼音小写 varchar(200) not null,
	所在省份代码     varchar(10)  not null,
	是否启用         char(2)      not null
);
ALTER TABLE 城市代码表 ADD CONSTRAINT pk_城市代码表 PRIMARY KEY (城市代码);
ALTER TABLE 城市代码表 ADD CONSTRAINT fk_城市代码表_省份代码表_所在省份代码 FOREIGN KEY (所在省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 城市代码表 ADD CONSTRAINT ck_城市代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------城    市    字    段--------------------------------------------
INSERT INTO 城市代码表  VALUES ('420100', '武汉', 'WUHAN', 'wuhan', '420000', '是');
INSERT INTO 城市代码表  VALUES ('420200', '黄石', 'HUANGSHI', 'huangshi', '420000', '是');
INSERT INTO 城市代码表  VALUES ('420300', '十堰', 'SHIYAN', 'shiyan', '420000', '是');
INSERT INTO 城市代码表  VALUES ('420500', '宜昌', 'YICHANG', 'yichang', '420000', '是');
INSERT INTO 城市代码表  VALUES ('420600', '襄阳', 'XINAGYANG', 'xiangyang', '420000', '是');
INSERT INTO 城市代码表  VALUES ('420700', '鄂州', 'EZHOU', 'ezhou', '420000', '是');
INSERT INTO 城市代码表  VALUES ('420800', '荆门', 'JINGMEN', 'jingmen', '420000', '是');
INSERT INTO 城市代码表  VALUES ('420900', '孝感', 'XIAOGAN', 'xiaogan', '420000', '是');
INSERT INTO 城市代码表  VALUES ('421000', '荆州', 'JINGZHOU', 'jingzhou', '420000', '是');
INSERT INTO 城市代码表  VALUES ('421100', '黄冈', 'HUANGGANG', 'huanggang', '420000', '是');
INSERT INTO 城市代码表  VALUES ('421200', '咸宁', 'XIANNING', 'xianning', '420000', '是');
INSERT INTO 城市代码表  VALUES ('421300', '随州', 'SUIZHOU', 'suizhou', '420000', '是');
INSERT INTO 城市代码表  VALUES ('422800', '恩施自治区', 'ENSHIZIZHIQU', 'enshizizhiqu', '420000', '是');
INSERT INTO 城市代码表  VALUES ('429000', '省直辖县级行政区', 'SHENGZHIXIAXIANJIXINGZHENGQU', 'shengzhixiaxianjixingzhengqu', '420000', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 区县代码表(
	区县代码         varchar(10)  not null,
	区县名称         varchar(50)  not null,
	区县罗马拼音大写 varchar(200) not null,
	区县罗马拼音小写 varchar(200) not null,
	所在城市代码     varchar(10)  not null,
	是否启用         char(2)      not null
);
ALTER TABLE 区县代码表 ADD CONSTRAINT pk_区县代码表 PRIMARY KEY (区县代码);
ALTER TABLE 区县代码表 ADD CONSTRAINT fk_区县代码表_城市代码表_所在城市代码 FOREIGN KEY (所在城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 区县代码表 ADD CONSTRAINT ck_区县代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------区    县    字    段--------------------------------------------
INSERT INTO 区县代码表  VALUES ('420102', '江岸区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420103', '江汉区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420104', '硚口区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420105', '汉阳区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420106', '武昌区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420107', '青山区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420111', '洪山区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420112', '东西湖区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420113', '汉南区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420114', '蔡甸区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420115', '江夏区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420116', '黄陂区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420117', '新洲区', '', '', '420100', '是');
INSERT INTO 区县代码表  VALUES ('420201', '市辖区', '', '', '420200', '是');
INSERT INTO 区县代码表  VALUES ('420202', '黄石港区', '', '', '420200', '是');
INSERT INTO 区县代码表  VALUES ('420203', '西塞山区', '', '', '420200', '是');
INSERT INTO 区县代码表  VALUES ('420204', '下陆区', '', '', '420200', '是');
INSERT INTO 区县代码表  VALUES ('420205', '铁山区', '', '', '420200', '是');
INSERT INTO 区县代码表  VALUES ('420222', '阳新县', '', '', '420200', '是');
INSERT INTO 区县代码表  VALUES ('420281', '大冶市', '', '', '420200', '是');
INSERT INTO 区县代码表  VALUES ('420301', '市辖区', '', '', '420300', '是');
INSERT INTO 区县代码表  VALUES ('420302', '茅箭区', '', '', '420300', '是');
INSERT INTO 区县代码表  VALUES ('420303', '张湾区', '', '', '420300', '是');
INSERT INTO 区县代码表  VALUES ('420304', '郧阳区', '', '', '420300', '是');
INSERT INTO 区县代码表  VALUES ('420322', '郧西县', '', '', '420300', '是');
INSERT INTO 区县代码表  VALUES ('420323', '竹山县', '', '', '420300', '是');
INSERT INTO 区县代码表  VALUES ('420324', '竹溪县', '', '', '420300', '是');
INSERT INTO 区县代码表  VALUES ('420325', '房县', '', '', '420300', '是');
INSERT INTO 区县代码表  VALUES ('420381', '丹江口市', '', '', '420300', '是');
INSERT INTO 区县代码表  VALUES ('420501', '市辖区', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420502', '西陵区', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420503', '伍家岗区', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420504', '点军区', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420505', '猇亭区', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420506', '夷陵区', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420525', '远安县', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420526', '兴山县', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420527', '秭归县', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420528', '长阳土家族自治县', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420529', '五峰山土家族自治县', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420581', '宜都市', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420582', '当阳市', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420583', '枝江市', '', '', '420500', '是');
INSERT INTO 区县代码表  VALUES ('420601', '市辖区', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420602', '襄城区', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420606', '樊城区', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420607', '襄州区', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420624', '南漳县', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420625', '谷城县', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420626', '保康县', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420682', '老河口市', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420683', '枣阳市', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420684', ' 宜城市 ', '', '', '420600', '是');
INSERT INTO 区县代码表  VALUES ('420701', '市辖区', '', '', '420700', '是');
INSERT INTO 区县代码表  VALUES ('420702', '梁子湖区', '', '', '420700', '是');
INSERT INTO 区县代码表  VALUES ('420703', '华容区', '', '', '420700', '是');
INSERT INTO 区县代码表  VALUES ('420704', '鄂城区', '', '', '420700', '是');
INSERT INTO 区县代码表  VALUES ('420801', '市辖区', '', '', '420800', '是');
INSERT INTO 区县代码表  VALUES ('420802', '东宝区', '', '', '420800', '是');
INSERT INTO 区县代码表  VALUES ('420804', '掇刀区', '', '', '420800', '是');
INSERT INTO 区县代码表  VALUES ('420821', '京山县', '', '', '420800', '是');
INSERT INTO 区县代码表  VALUES ('420822', '沙洋县', '', '', '420800', '是');
INSERT INTO 区县代码表  VALUES ('420881', '钟祥市', '', '', '420800', '是');
INSERT INTO 区县代码表  VALUES ('420901', '市辖区', '', '', '420900', '是');
INSERT INTO 区县代码表  VALUES ('420902', '孝南区', '', '', '420900', '是');
INSERT INTO 区县代码表  VALUES ('420921', '孝昌县', '', '', '420900', '是');
INSERT INTO 区县代码表  VALUES ('420922', '大悟县', '', '', '420900', '是');
INSERT INTO 区县代码表  VALUES ('420923', '云梦县', '', '', '420900', '是');
INSERT INTO 区县代码表  VALUES ('420981', '应城市', '', '', '420900', '是');
INSERT INTO 区县代码表  VALUES ('420982', '安陆市', '', '', '420900', '是');
INSERT INTO 区县代码表  VALUES ('420984', '汉川市', '', '', '420900', '是');
INSERT INTO 区县代码表  VALUES ('421001', '市辖区', '', '', '421000', '是');
INSERT INTO 区县代码表  VALUES ('421002', '沙市区', '', '', '421000', '是');
INSERT INTO 区县代码表  VALUES ('421003', '荆州区', '', '', '421000', '是');
INSERT INTO 区县代码表  VALUES ('421022', '公安县', '', '', '421000', '是');
INSERT INTO 区县代码表  VALUES ('421023', '监利县', '', '', '421000', '是');
INSERT INTO 区县代码表  VALUES ('421024', '江陵县', '', '', '421000', '是');
INSERT INTO 区县代码表  VALUES ('421081', '石首市', '', '', '421000', '是');
INSERT INTO 区县代码表  VALUES ('421083', '洪湖市', '', '', '421000', '是');
INSERT INTO 区县代码表  VALUES ('421088', '松滋市', '', '', '421000', '是');
INSERT INTO 区县代码表  VALUES ('421101', '市辖区', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421102', '黄州区', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421121', '团风县', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421122', '红安县', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421123', '罗田县', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421124', '英山县', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421125', '浠水县', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421126', '蕲春县', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421127', '黄梅县', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421181', '麻城市', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421182', '武穴市', '', '', '421100', '是');
INSERT INTO 区县代码表  VALUES ('421201', '市辖区', '', '', '421200', '是');
INSERT INTO 区县代码表  VALUES ('421202', '咸安区', '', '', '421200', '是');
INSERT INTO 区县代码表  VALUES ('421221', '嘉鱼县', '', '', '421200', '是');
INSERT INTO 区县代码表  VALUES ('421222', '通城县', '', '', '421200', '是');
INSERT INTO 区县代码表  VALUES ('421223', '崇阳县', '', '', '421200', '是');
INSERT INTO 区县代码表  VALUES ('421224', '通山县', '', '', '421200', '是');
INSERT INTO 区县代码表  VALUES ('421281', '赤壁市', '', '', '421200', '是');
INSERT INTO 区县代码表  VALUES ('421301', '市辖区', '', '', '421300', '是');
INSERT INTO 区县代码表  VALUES ('421303', '曾都区', '', '', '421300', '是');
INSERT INTO 区县代码表  VALUES ('421321', '随县', '', '', '421300', '是');
INSERT INTO 区县代码表  VALUES ('421381', '广水市', '', '', '421300', '是');
INSERT INTO 区县代码表  VALUES ('422801', '恩施市', '', '', '422800', '是');
INSERT INTO 区县代码表  VALUES ('422802', '利川市', '', '', '422800', '是');
INSERT INTO 区县代码表  VALUES ('422822', '建始县', '', '', '422800', '是');
INSERT INTO 区县代码表  VALUES ('422823', '巴东县', '', '', '422800', '是');
INSERT INTO 区县代码表  VALUES ('422825', '宣恩县', '', '', '422800', '是');
INSERT INTO 区县代码表  VALUES ('422826', '咸丰县', '', '', '422800', '是');
INSERT INTO 区县代码表  VALUES ('422827', '来凤县', '', '', '422800', '是');
INSERT INTO 区县代码表  VALUES ('422828', '鹤峰县', '', '', '422800', '是');
INSERT INTO 区县代码表  VALUES ('429004', '仙桃市', '', '', '429000', '是');
INSERT INTO 区县代码表  VALUES ('429005', '潜江市', '', '', '429000', '是');
INSERT INTO 区县代码表  VALUES ('429006', '天门市', '', '', '429000', '是');
INSERT INTO 区县代码表  VALUES ('429021', '神农架林区', '', '', '429000', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 街道代码表(
	街道代码         varchar(10)  not null,
	街道名称         varchar(50)  not null,
	街道罗马拼音大写 varchar(200) not null,
	街道罗马拼音小写 varchar(200) not null,
	所在区县代码     varchar(10)  not null,
	是否启用         char(2)      not null
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

--SELECT * FROM 详细地址关联视图; -- OK

--------------------------------------------------------------------------------------------------
----------------------------------个    人    信    息--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 性别代码表(
	性别代码         char(2)                    not null,
	性别             varchar(16)     UNIQUE     not null,
	是否启用         char(2)                    not null
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
	是否启用         char(2)                       not null
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
	是否启用         char(2)                       not null
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
	是否启用         char(2)                      not null
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
	是否启用         char(2)                       not null
);
ALTER TABLE 民族代码表 ADD CONSTRAINT pk_民族代码表 PRIMARY KEY (民族代码);
ALTER TABLE 民族代码表 ADD CONSTRAINT ck_民族代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------民    族    字    段--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE 政治面貌代码表(
	政治面貌代码     char(2)                       not null,
	政治面貌类型     varchar(30)       UNIQUE      not null,
	是否启用         char(2)                       not null
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
	是否启用         char(2)                      not null
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

CREATE TABLE 学位代码表(
	学位代码         char(5)                      not null,
	学位名称         varchar(200)                 not null
);
ALTER TABLE 学位代码表 ADD CONSTRAINT pk_学位代码表 PRIMARY KEY (学位代码);
----------------------------------学    位    字    段--------------------------------------------
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
	是否启用         char(2)                       not null
);
ALTER TABLE 学校代码表 ADD CONSTRAINT pk_学校代码表 PRIMARY KEY (学校代码);
ALTER TABLE 学校代码表 ADD CONSTRAINT ck_学校代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 学校代码表 ADD CONSTRAINT fk_学校代码表_省份代码表_所在省份代码 FOREIGN KEY (所在省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 学校代码表 ADD CONSTRAINT fk_学校代码表_城市代码表_所在城市代码 FOREIGN KEY (所在城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 学校代码表 ADD CONSTRAINT fk_学校代码表_区县代码表_所在区县代码 FOREIGN KEY (所在区县代码) REFERENCES 区县代码表 (区县代码);
ALTER TABLE 学校代码表 ADD CONSTRAINT fk_学校代码表_街道代码表_所在街道代码 FOREIGN KEY (所在街道代码) REFERENCES 街道代码表 (街道代码);
----------------------------------学    校    字    段--------------------------------------------
INSERT INTO 学校代码表 (学校代码, 学校名称, 是否启用) VALUES ('10512', '湖北大学', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 院系代码表(
	院系代码         varchar(10)                   not null,
	院系名称         varchar(80)                   not null,
	所在学校代码     varchar(8)                    not null,
	院系罗马拼音大写 varchar(100)                          ,
	院系罗马拼音小写 varchar(100)                          ,
	院系英文名称     varchar(100)                          ,
	院系英文名称大写 varchar(100)                          ,
	院系英文名称小写 varchar(100)                          ,
	是否启用         char(2)                       not null
);
ALTER TABLE 院系代码表 ADD CONSTRAINT pk_院系代码表 PRIMARY KEY (院系代码);
ALTER TABLE 院系代码表 ADD CONSTRAINT fk_院系代码表_学校代码表_所在学校代码 FOREIGN KEY (所在学校代码) REFERENCES 学校代码表 (学校代码);
ALTER TABLE 院系代码表 ADD CONSTRAINT ck_院系代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------院    系    字    段--------------------------------------------
INSERT INTO 院系代码表 (院系代码, 院系名称, 所在学校代码, 是否启用) VALUES ('1051201', '计算机与信息工程学院', '10512', '是');
INSERT INTO 院系代码表 (院系代码, 院系名称, 所在学校代码, 是否启用) VALUES ('1051202', '历史与文化学院', '10512', '是');
INSERT INTO 院系代码表 (院系代码, 院系名称, 所在学校代码, 是否启用) VALUES ('1051203', '外国语学院', '10512', '是');
INSERT INTO 院系代码表 (院系代码, 院系名称, 所在学校代码, 是否启用) VALUES ('1051204', '教育学院', '10512', '是');
INSERT INTO 院系代码表 (院系代码, 院系名称, 所在学校代码, 是否启用) VALUES ('1051205', '材料学院', '10512', '是');
INSERT INTO 院系代码表 (院系代码, 院系名称, 所在学校代码, 是否启用) VALUES ('1051206', '体育学院', '10512', '是');
INSERT INTO 院系代码表 (院系代码, 院系名称, 所在学校代码, 是否启用) VALUES ('1051207', '数学与计算机学院', '10512', '是');
INSERT INTO 院系代码表 (院系代码, 院系名称, 所在学校代码, 是否启用) VALUES ('1051208', '新闻传播学院', '10512', '是');
INSERT INTO 院系代码表 (院系代码, 院系名称, 所在学校代码, 是否启用) VALUES ('1051209', '艺术学院', '10512', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 学科门类代码表(
	学科门类代码     varchar(50)                   not null,
	学科门类         varchar(50)                   not null
);
ALTER TABLE 学科门类代码表 ADD CONSTRAINT pk_学科门类代码表 PRIMARY KEY (学科门类代码);
INSERT INTO 学科门类代码表 VALUES ('08', '工学');
INSERT INTO 学科门类代码表 VALUES ('07', '理学');
INSERT INTO 学科门类代码表 VALUES ('06', '历史学');
INSERT INTO 学科门类代码表 VALUES ('03', '法学');
INSERT INTO 学科门类代码表 VALUES ('12', '管理学');
INSERT INTO 学科门类代码表 VALUES ('04', '教育学');
INSERT INTO 学科门类代码表 VALUES ('10', '医学');
INSERT INTO 学科门类代码表 VALUES ('05', '文学');
INSERT INTO 学科门类代码表 VALUES ('13', '艺术学');
INSERT INTO 学科门类代码表 VALUES ('01', '哲学');
INSERT INTO 学科门类代码表 VALUES ('02', '经济学');

CREATE TABLE 专业类别代码表(
	专业类别代码     varchar(50)                   not null,
	专业类别         varchar(50)                   not null
);
ALTER TABLE 专业类别代码表 ADD CONSTRAINT pk_专业门类代码表 PRIMARY KEY (专业类别代码);

CREATE TABLE 专业代码表 (
	专业代码         varchar(20)                   not null,
	专业名称         varchar(80)                   not null,
	学科门类代码     varchar(50)                           ,
	专业类别代码     varchar(50)                           ,
	所在院系代码     varchar(10)                   not null,
	专业罗马拼音大写 varchar(100)                          ,
	专业罗马拼音小写 varchar(100)                          ,
	专业英文名称     varchar(100)                          ,
	专业英文名称大写 varchar(100)                          ,
	专业英文名称小写 varchar(100)                          ,
	是否启用         char(2)                       not null
);
ALTER TABLE 专业代码表 ADD CONSTRAINT pk_专业代码表 PRIMARY KEY (专业代码);
ALTER TABLE 专业代码表 ADD CONSTRAINT fk_专业代码表_院系代码表_所在院系代码 FOREIGN KEY (所在院系代码) REFERENCES 院系代码表 (院系代码);
ALTER TABLE 专业代码表 ADD CONSTRAINT ck_专业代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 专业代码表 ADD CONSTRAINT fk_专业代码表_学科门类代码表_学科门类代码
									  FOREIGN KEY (学科门类代码) REFERENCES 学科门类代码表 (学科门类代码);
ALTER TABLE 专业代码表 ADD CONSTRAINT fk_专业代码表_专业类别代码表_专业类别代码
									  FOREIGN KEY (专业类别代码) REFERENCES 专业类别代码表 (专业类别代码);
----------------------------------专    业    字    段--------------------------------------------
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120101', '计算机科学与技术', '1051201', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120102', '软件工程', '1051201', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120103', '软件工程产业计划', '1051201', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120104', '电子信息', '1051201', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120201', '历史学', '1051202', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120301', '英语', '1051203', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120302', '法语', '1051203', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120303', '日语', '1051203', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120304', '葡萄牙语', '1051203', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120401', '教育心理学', '1051204', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120402', '学前教育', '1051204', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120501', '材料物理', '1051205', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120502', '材料化学', '1051205', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120601', '健美操', '1051206', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120602', '足球', '1051206', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120603', '篮球', '1051206', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120604', '羽毛球', '1051206', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120605', '网球', '1051206', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120606', '跳绳', '1051206', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120701', '理论数学', '1051207', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120702', '计算机数学', '1051207', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120703', '应用数学', '1051207', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120801', '广告学', '1051208', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120802', '传播学', '1051208', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120901', '素描', '1051209', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120902', '水彩', '1051209', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120903', '雕塑', '1051209', '是');
INSERT INTO 专业代码表 (专业代码, 专业名称, 所在院系代码, 是否启用) VALUES ('105120904', '现代艺术', '1051209', '是');
--------------------------------------------------------------------------------------------------

GO
CREATE VIEW 学校_院系_专业对照视图
AS
SELECT 学校代码表.学校代码, 学校代码表.学校名称, 学校代码表.学校英文名称, 学校代码表.学校英文名称大写, 学校代码表.学校英文名称小写,
	   学校代码表.学校罗马拼音大写, 学校代码表.学校罗马拼音小写,
	   院系代码表.院系代码, 院系代码表.院系名称, 院系代码表.院系英文名称, 院系代码表.院系英文名称大写, 院系代码表.院系英文名称小写,
	   院系代码表.院系罗马拼音大写, 院系代码表.院系罗马拼音小写,
	   专业代码表.专业代码, 专业代码表.专业名称, 专业代码表.专业英文名称, 专业代码表.专业英文名称大写, 专业代码表.专业英文名称小写,
	   专业代码表.专业罗马拼音大写, 专业代码表.专业罗马拼音小写
FROM 专业代码表, 院系代码表, 学校代码表
WHERE 学校代码表.学校代码 = 院系代码表.所在学校代码 AND 院系代码表.院系代码 = 专业代码表.所在院系代码;
GO

--SELECT * FROM 学校_院系_专业对照视图;
--DROP VIEW 学校_院系_专业对照视图;

CREATE TABLE 班级代码表(
	班级代码         varchar(30)                   not null,
	班级名称         varchar(80)                   not null,
	所在专业代码     varchar(20)                   not null,
	班级罗马拼音大写 varchar(100)                          ,
	班级罗马拼音小写 varchar(100)                          ,
	班级英文名称     varchar(100)                          ,
	班级英文名称大写 varchar(100)                          ,
	班级英文名称小写 varchar(100)                          ,
	是否启用         char(2)                       not null
);
ALTER TABLE 班级代码表 ADD CONSTRAINT pk_班级代码表 PRIMARY KEY (班级代码);
ALTER TABLE 班级代码表 ADD CONSTRAINT fk_班级代码表_专业代码表_所在专业代码 FOREIGN KEY (所在专业代码) REFERENCES 专业代码表 (专业代码);
ALTER TABLE 班级代码表 ADD CONSTRAINT ck_班级代码表_是否启用_是否验证 CHECK (是否启用 IN ('是', '否'));

CREATE TABLE 教室代码表(
	教室代码         varchar(10)                   not null,
	教室名称         varchar(80)                   not null,
	所在学校代码     varchar(8)                    not null,
	是否启用         char(2)                       not null
);
ALTER TABLE 教室代码表 ADD CONSTRAINT pk_教室代码表 PRIMARY KEY (教室代码);
ALTER TABLE 教室代码表 ADD CONSTRAINT ck_教室代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 教室代码表 ADD CONSTRAINT fk_教室代码表_所在学校代码表_所在学校代码 FOREIGN KEY (所在学校代码) REFERENCES 学校代码表 (学校代码);
----------------------------------班    级    字    段--------------------------------------------
INSERT INTO 教室代码表 VALUES ('04101X', '教四101', '10512', '是');
INSERT INTO 教室代码表 VALUES ('04102X', '教四102', '10512', '是');
INSERT INTO 教室代码表 VALUES ('04103X', '教四103', '10512', '是');
--------------------------------------------------------------------------------------------------

CREATE TABLE 教室占用表(
	教室代码         varchar(10)                   not null,
	是否占用         char(4)                       not null,
	占用开始时间     datetime                              ,
	占用结束时间     datetime                              ,
	占用理由         varchar(2000)                         ,
	参与人数         int                                   ,
	负责人账号       varchar(50)                           ,
	联系方式         varchar(50)                   not null
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
	民族代码          char(5)                              ,
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
	是否双学位        char(2)                              ,
	是否转专业        char(2)                              ,
	所在学校代码      varchar(8)                           ,
	所在院系代码      varchar(10)                          ,
	所在专业代码      varchar(20)                          ,
	所在班级代码      varchar(30)                          ,
--其他杂项信息
	婚配代码          char(2)                              ,
	户籍代码          char(2)                              ,
	邮政编码          char(15)                             ,
	政治面貌代码      char(2)                              ,
	联系电话          char(11)                             ,
	电子邮箱          varchar(30)                          ,
	QQ号码            varchar(20)                          ,
	密保问题          varchar(80)                          ,
	密保问题答案      varchar(1000)                        ,
	是否启用          char(2)
);
ALTER TABLE 学生表 ADD CONSTRAINT pk_学生表 PRIMARY KEY (学生学号);
ALTER TABLE 学生表 ADD CONSTRAINT fk_学生表_密码表_账号 FOREIGN KEY (学生学号) REFERENCES 密码表 (账号);
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
ALTER TABLE 学生表 ADD CONSTRAINT ck_学生表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------学    生    字    段--------------------------------------------
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920052', '柳景兴', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920287', '王晨旭', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920001', '孙涛', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920002', '袁嘉豪', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920003', '李雨', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920004', '许子健', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920005', '不知道', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920006', '很奇怪', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920007', '没头脑', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920008', '不高兴', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920009', '付凯文', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920010', '陶锦丞', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920011', '夏傲霜', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920012', '田雨', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051201', '105120102',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
INSERT INTO 学生表
(学生学号, 学生姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 是否双学位, 是否转专业, 所在学校代码, 所在院系代码, 所在专业代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('201622111920022', '刘楚雄', '01', '421022199805070013', '01', '51', '否', '否', '10512', '1051206', '105120601',
'01', '01', '50', '17720525862', '719878756@qq.com', '719878756', '你好吗？', '我很好！', '是', '457', '420000', '429000', '429021');
--------------------------------------------------------------------------------------------------

--SELECT * FROM 学生详细信息视图;
--SELECT * FROM 学生表;
GO
CREATE VIEW 学生详细信息视图 
AS
SELECT 学生表.学生学号, 学生表.学生姓名, 身份证类别代码表.身份证类别名称, 学生表.身份证号, 性别代码表.性别, 学生表.出生日期,
	   学生表.证件照片路径, 学校代码表.学校代码, 学校代码表.学校名称, 专业代码表.专业代码, 专业代码表.专业名称,
	   国家代码表.国家名称, 省份代码表.省份名称, 城市代码表.城市名称, 区县代码表.区县名称, 学习层次代码表.学习层次, 学生表.是否双学位,
	   学生表.是否转专业, 学生表.电子邮箱, 院系代码表.院系代码, 院系代码表.院系名称,
	   婚配代码表.婚配情况, 户籍代码表.户籍名称, 密码表.密码,
	   学生表.邮政编码, 政治面貌代码表.政治面貌类型, 学生表.联系电话, 学生表.QQ号码, 学生表.密保问题, 学生表.密保问题答案
FROM 学生表, 身份证类别代码表, 国家代码表, 省份代码表, 城市代码表, 区县代码表, 性别代码表, 学习层次代码表, 婚配代码表, 户籍代码表,
	 政治面貌代码表, 学校代码表, 院系代码表, 专业代码表, 密码表
WHERE 学生表.身份证类别代码 = 身份证类别代码表.身份证类别代码 AND 学生表.性别代码 = 性别代码表.性别代码
															  AND 国家代码表.国家代码 = 学生表.国家代码
															  AND 学生表.省份代码 = 省份代码表.省份代码
															  AND 学生表.城市代码 = 城市代码表.城市代码
															  AND 学生表.区县代码 = 区县代码表.区县代码
															  AND 学生表.学习层次代码 = 学习层次代码表.学习层次代码
															  AND 学生表.婚配代码 = 婚配代码表.婚配代码
															  AND 学生表.户籍代码 = 户籍代码表.户籍代码
															  AND 学生表.政治面貌代码 = 政治面貌代码表.政治面貌代码
															  AND 学生表.所在学校代码 = 学校代码表.学校代码
															  AND 学生表.所在院系代码 = 院系代码表.院系代码
															  AND 学生表.所在专业代码 = 专业代码表.专业代码
															  AND 密码表.账号 = 学生表.学生学号
															  AND 学生表.是否启用 = '是';
GO

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
	民族代码          char(5)                              ,
	出生日期          DATETIME                             ,
	学习层次代码      char(2)                              ,
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
	QQ号码            varchar(20)                          ,
	密保问题          varchar(80)                          ,
	密保问题答案      varchar(1000)                        ,
	是否启用          char(2)                              ,
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
ALTER TABLE 教师表 ADD CONSTRAINT ck_教师表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------教    师    字    段--------------------------------------------
INSERT INTO 教师表
(教师工号, 教师姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 所在学校代码, 所在院系代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('200804', '曾诚', '01', '421022199805070013', '01', '51', '10512', '1051201',
'01', '01', '50', '13667259938', 'webzc@qq.com', '628176', 'zc是什么', '曾诚', '是', '457', '420000', '429000', '429021');
INSERT INTO 教师表
(教师工号, 教师姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 所在学校代码, 所在院系代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('200805', '吕顺应', '01', '421022199805070013', '01', '51', '10512', '1051201',
'01', '01', '50', '13667259938', 'webzc@qq.com', '628176', 'zc是什么', '曾诚', '是', '457', '420000', '429000', '429021');
INSERT INTO 教师表
(教师工号, 教师姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 所在学校代码, 所在院系代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('200806', '袁世凯', '01', '421022199805070013', '01', '51', '10512', '1051201',
'01', '01', '50', '13667259938', 'webzc@qq.com', '628176', 'zc是什么', '曾诚', '是', '457', '420000', '429000', '429021');
INSERT INTO 教师表
(教师工号, 教师姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 所在学校代码, 所在院系代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('200807', '孙中山', '01', '421022199805070013', '01', '51', '10512', '1051201',
'01', '01', '50', '13667259938', 'webzc@qq.com', '628176', 'zc是什么', '曾诚', '是', '457', '420000', '429000', '429021');
INSERT INTO 教师表
(教师工号, 教师姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 所在学校代码, 所在院系代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('200808', '胡蜀山', '01', '421022199805070013', '01', '51', '10512', '1051201',
'01', '01', '50', '13667259938', 'webzc@qq.com', '628176', 'zc是什么', '曾诚', '是', '457', '420000', '429000', '429021');
INSERT INTO 教师表
(教师工号, 教师姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 所在学校代码, 所在院系代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('200809', '正方桥', '01', '421022199805070013', '01', '51', '10512', '1051201',
'01', '01', '50', '13667259938', 'webzc@qq.com', '628176', 'zc是什么', '曾诚', '是', '457', '420000', '429000', '429021');
INSERT INTO 教师表
(教师工号, 教师姓名, 身份证类别代码, 身份证号, 性别代码, 学习层次代码, 所在学校代码, 所在院系代码,
婚配代码, 户籍代码, 政治面貌代码, 联系电话, 电子邮箱, QQ号码, 密保问题, 密保问题答案, 是否启用, 国家代码, 省份代码, 城市代码, 区县代码) VALUES
('200810', '？？？', '01', '421022199805070013', '01', '51', '10512', '1051201',
'01', '01', '50', '13667259938', 'webzc@qq.com', '628176', 'zc是什么', '曾诚', '是', '457', '420000', '429000', '429021');
--------------------------------------------------------------------------------------------------

--SELECT * FROM 教师详细信息视图;

GO
CREATE VIEW 教师详细信息视图
AS
SELECT 教师表.教师工号, 教师表.教师姓名, 身份证类别代码表.身份证类别名称, 教师表.身份证号, 性别代码表.性别, 教师表.出生日期,
	   教师表.证件照路径, 教师表.个人简介文档路径, 学习层次代码表.学习层次, 婚配代码表.婚配情况,
	   国家代码表.国家名称, 省份代码表.省份名称, 城市代码表.城市名称, 区县代码表.区县名称, 教师表.联系电话, 教师表.QQ号码,
	   户籍代码表.户籍名称, 教师表.邮政编码, 政治面貌代码表.政治面貌类型, 教师表.密保问题, 教师表.密保问题答案, 教师表.电子邮箱,
	   学校代码表.学校代码, 学校代码表.学校名称, 院系代码表.院系代码 , 院系代码表.院系名称, 密码表.密码
FROM 教师表, 身份证类别代码表, 国家代码表, 省份代码表, 城市代码表, 区县代码表, 户籍代码表, 政治面貌代码表, 性别代码表,
	 学习层次代码表, 婚配代码表, 学校代码表, 院系代码表, 密码表
WHERE 教师表.身份证类别代码 = 身份证类别代码表.身份证类别代码 AND 教师表.国家代码 = 国家代码表.国家代码 AND 教师表.省份代码 = 省份代码表.省份代码
															  AND 教师表.性别代码 = 性别代码表.性别代码 AND 教师表.政治面貌代码 = 政治面貌代码表.政治面貌代码
															  AND 教师表.学习层次代码 = 学习层次代码表.学习层次代码 AND 教师表.户籍代码 = 户籍代码表.户籍代码
															  AND 教师表.婚配代码 = 婚配代码表.婚配代码
															  AND 教师表.所在学校代码 = 学校代码表.学校代码
															  AND 教师表.所在院系代码 = 院系代码表.院系代码
															  AND 教师表.城市代码 = 城市代码表.城市代码
															  AND 教师表.区县代码 = 区县代码表.区县代码
															  AND 密码表.账号 = 教师表.教师工号
															  AND 教师表.是否启用 = '是';
GO

CREATE TABLE 教师_学位对照表(
	教师工号          varchar(50)                  not null,
	学位代码          char(5)                      not null
);
ALTER TABLE 教师_学位对照表 ADD CONSTRAINT pk_教师_学位对照表 PRIMARY KEY (教师工号, 学位代码);
ALTER TABLE 教师_学位对照表 ADD CONSTRAINT fk_教师_学位对照表_教师表_教师工号 FOREIGN KEY (教师工号) REFERENCES 教师表 (教师工号);
ALTER TABLE 教师_学位对照表 ADD CONSTRAINT fk_教师_学位对照表_学位代码表_学位代码 FOREIGN KEY (学位代码) REFERENCES 学位代码表 (学位代码);

--------------------------------------------------------------------------------------------------
----------------------------------课    程    信    息--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 出版社代码表(
	出版社代码        varchar(50)                  not null,
	出版社名称        varchar(120)                 not null,
	出版社所在省份    varchar(10)                          ,
	出版社所在城市    varchar(10)                          ,
	出版社所在区县    varchar(10)                          ,
	出版社所在街道    varchar(10)                          ,
	是否启用          char(2)
);
ALTER TABLE 出版社代码表 ADD CONSTRAINT pk_出版社代码表 PRIMARY KEY (出版社代码);
ALTER TABLE 出版社代码表 ADD CONSTRAINT fk_出版社代码表_省份代码表_出版社所在省份
										FOREIGN KEY (出版社所在省份) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 出版社代码表 ADD CONSTRAINT fk_出版社代码表_城市代码表_出版社所在城市
										FOREIGN KEY (出版社所在城市) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 出版社代码表 ADD CONSTRAINT fk_出版社代码表_区县代码表_出版社所在区县
										FOREIGN KEY (出版社所在区县) REFERENCES 区县代码表 (区县代码);
ALTER TABLE 出版社代码表 ADD CONSTRAINT fk_出版社代码表_街道代码表_出版社所在街道
										FOREIGN KEY (出版社所在街道) REFERENCES 街道代码表 (街道代码);
ALTER TABLE 出版社代码表 ADD CONSTRAINT ck_出版社代码表_是否启用_是否验证 CHECK (是否启用 IN ('是', '否'));
--------------------------------出    版    社    字    段----------------------------------------
INSERT INTO 出版社代码表 (出版社代码, 出版社名称) VALUES ('198006qhdx', '清华大学出版社');
INSERT INTO 出版社代码表 (出版社代码, 出版社名称) VALUES ('195405gdjy', '高等教育出版社');
INSERT INTO 出版社代码表 (出版社代码, 出版社名称) VALUES ('197912shwy', '上海外语教育出版社');
INSERT INTO 出版社代码表 (出版社代码, 出版社名称) VALUES ('1954tjdxsx', '同济大学数学系');
INSERT INTO 出版社代码表 (出版社代码, 出版社名称) VALUES ('19550zgrm', '中国人民大学出版社');
--------------------------------------------------------------------------------------------------
CREATE TABLE 教材代码表(
	教材代码          varchar(50)                  not null,
	教材名称          varchar(120)                 not null,
	教材价格          decimal(10, 2)                       ,
	出版社代码        varchar(50)                          ,
	教材图片路径      varchar(150)                         ,
	是否启用          char(2)                      not null
);
ALTER TABLE 教材代码表 ADD CONSTRAINT pk_教材代码表 PRIMARY KEY (教材代码);
ALTER TABLE 教材代码表 ADD CONSTRAINT ck_教材代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 教材代码表 ADD CONSTRAINT df_教材代码表_教材价格_默认0 DEFAULT (0) FOR 教材价格;
INSERT INTO 教材代码表 VALUES ('195405gdjygdsx02b', '高等数学B（2）', 45, '195405gdjy', '由高等教育出版社出版的高等数学B（2）.jpg', '是');
INSERT INTO 教材代码表 VALUES ('195405gdjygdsx01b', '高等数学B（1）', 45, '195405gdjy', '由高等教育出版社出版的高等数学B（1）.jpg', '是');
INSERT INTO 教材代码表 VALUES ('195405gdjygjyycxsj', '高级语言程序设计', 90, '195405gdjy', '由高等教育出版社出版的高级程序语言设计.jpg', '是');
INSERT INTO 教材代码表 VALUES ('198006qhdxjsff', '计算方法', 30, '198006qhdx', '由清华大学出版社出版的计算方法.jpg', '是');
INSERT INTO 教材代码表 VALUES ('198006qhdxjsjdl', '计算机导论', 30, '198006qhdx', '由清华大学出版社出版的计算机导论.jpg', '是');


CREATE TABLE 课程类型代码表(
	课程类型代码 varchar(5) not null,
	课程类型     varchar(20)not null
);
ALTER TABLE 课程类型代码表 ADD CONSTRAINT pk_课程类型代码表 PRIMARY KEY (课程类型代码);
INSERT INTO 课程类型代码表 VALUES ('01', '专业必修课');
INSERT INTO 课程类型代码表 VALUES ('02', '专业选修课');
INSERT INTO 课程类型代码表 VALUES ('03', '公共必修课');
INSERT INTO 课程类型代码表 VALUES ('04', '公共选修课');

CREATE TABLE 课程代码表(
	课程代码          varchar(50)                  not null,
	课程名称          varchar(100)                 not null,
	课程学分          decimal(10,2)                not null,
	课程类型代码      varchar(5)                   not null,
	课程简介文档路径  varchar(150)                         ,
	教材代码          varchar(50)                          ,
	所属学校代码      varchar(8)                           ,
	所属院系代码      varchar(10)                          ,
	所属专业代码      varchar(20)                          ,
	课程上课学年      int                                  ,
	是否启用          char(2)                      not null
);
ALTER TABLE 课程代码表 ADD CONSTRAINT pk_课程代码表 PRIMARY KEY (课程代码);
ALTER TABLE 课程代码表 ADD CONSTRAINT fk_课程代码表_教材代码表_教材代码 FOREIGN KEY (教材代码) REFERENCES 教材代码表 (教材代码);
ALTER TABLE 课程代码表 ADD CONSTRAINT ck_课程代码表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
ALTER TABLE 课程代码表 ADD CONSTRAINT df_课程代码表_课程学分 DEFAULT 0 FOR 课程学分;
ALTER TABLE 课程代码表 ADD CONSTRAINT ck_课程代码表_课程上课学年_只能填入1到8 CHECK (课程上课学年 in (1, 2, 3, 4, 5, 6, 7, 8));
ALTER TABLE 课程代码表 ADD CONSTRAINT fk_课程代码表_学校代码表_学校代码 FOREIGN KEY (所属学校代码) REFERENCES 学校代码表 (学校代码);
ALTER TABLE 课程代码表 ADD CONSTRAINT fk_课程代码表_院系代码表_院系代码 FOREIGN KEY (所属院系代码) REFERENCES 院系代码表 (院系代码);
ALTER TABLE 课程代码表 ADD CONSTRAINT fk_课程代码表_专业代码表_专业代码 FOREIGN KEY (所属专业代码) REFERENCES 专业代码表 (专业代码);
ALTER TABLE 课程代码表 ADD CONSTRAINT fk_课程代码表_课程类型代码表_课程类型代码
									  FOREIGN KEY (课程类型代码) REFERENCES 课程类型代码表 (课程类型代码);
----------------------------------------------------------------------------------------------
INSERT INTO 课程代码表
(课程代码, 课程名称, 课程学分, 课程类型代码, 教材代码, 所属学校代码, 是否启用) VALUES
('03195405gdjygdsx02b', '高等数学B（2）', 4, '03', '195405gdjygdsx02b', '10512', '是');
INSERT INTO 课程代码表
(课程代码, 课程名称, 课程学分, 课程类型代码, 教材代码, 所属学校代码, 所属院系代码, 是否启用) VALUES
('01198006qhdxjsjdl', '计算机导论', 4, '01', '198006qhdxjsjdl', '10512', '1051201', '是');
INSERT INTO 课程代码表
(课程代码, 课程名称, 课程学分, 课程类型代码, 教材代码, 所属学校代码, 所属院系代码, 所属专业代码, 是否启用) VALUES
('02195405gdjygjyycxsj', '高级语言程序设计', 4, '02', '195405gdjygjyycxsj', '10512', '1051201', '105120102', '是');
INSERT INTO 课程代码表
(课程代码, 课程名称, 课程学分, 课程类型代码, 教材代码, 所属学校代码, 所属院系代码, 所属专业代码, 是否启用) VALUES
('04198006qhdxjsjdl', '计算机原理', 6, '04', '198006qhdxjsjdl', '10512', '1051201', '105120102', '是');
----------------------------------------------------------------------------------------------

GO
CREATE VIEW 全部课程教材对照视图
AS
SELECT 课程代码表.课程代码, 课程代码表.课程名称, 课程代码表.课程上课学年, 课程代码表.课程学分, 课程代码表.课程简介文档路径,
	   课程代码表.课程类型代码, 课程代码表.所属学校代码, 课程代码表.所属院系代码, 课程代码表.所属专业代码,
	   教材代码表.教材代码, 教材代码表.教材名称, 教材代码表.教材价格, 出版社代码表.出版社名称, 教材代码表.教材图片路径,
	   课程类型代码表.课程类型, 课程代码表.是否启用, 院系代码表.院系名称, 学校代码表.学校名称, 专业代码表.专业名称
FROM 课程代码表, 教材代码表, 出版社代码表, 课程类型代码表, 学校代码表, 院系代码表, 专业代码表
WHERE 课程代码表.教材代码 = 教材代码表.教材代码 AND 教材代码表.出版社代码 = 出版社代码表.出版社代码
												AND 课程类型代码表.课程类型代码 = 课程代码表.课程类型代码
												AND 课程代码表.所属学校代码 = 学校代码表.学校代码
												AND 课程代码表.所属院系代码 = 院系代码表.院系代码
												AND 课程代码表.所属专业代码 = 专业代码表.专业代码
GO

--SELECT * FROM 全部课程教材对照视图;

CREATE TABLE 上课时间段代码表(
	上课时间段代码     char(5)                      not null,
	上课开始时间       int                          not null, -- 单位 - 节
	上课结束时间       int                          not null, -- 单位 - 节
	是否启用           char(2)                      not null
);
ALTER TABLE 上课时间段代码表 ADD CONSTRAINT pk_上课时间段代码表 PRIMARY KEY (上课时间段代码);
ALTER TABLE 上课时间段代码表 ADD CONSTRAINT ck_上课时间段代码表_是否启用_是否验证 CHECK (是否启用 IN ('是', '否'));

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
CREATE TABLE 选择课程表(
	选课代码           varchar(50)                  not null,
	课程代码           varchar(50)                  not null,
	授课教师账号       varchar(50)                  not null,
	所属学校代码       varchar(8)                           ,
	所属院系代码       varchar(10)                          ,	
	计划开班人数       int                          not null,
	班级名称           varchar(120)                         ,
	班级代码           varchar(120)                         ,
	是否启用           char(2)                      not null
);
ALTER TABLE 选择课程表 ADD CONSTRAINT pk_选择课程表 PRIMARY KEY (选课代码);
ALTER TABLE 选择课程表 ADD CONSTRAINT fk_选择课程表_课程代码表_课程代码 FOREIGN KEY (课程代码) REFERENCES 课程代码表 (课程代码);
ALTER TABLE 选择课程表 ADD CONSTRAINT fk_选择课程表_教师表_授课教师账号 FOREIGN KEY (授课教师账号) REFERENCES 教师表 (教师工号);
ALTER TABLE 选择课程表 ADD CONSTRAINT fk_选择课程表_学校代码表_所属学校代码 FOREIGN KEY (所属学校代码) REFERENCES 学校代码表 (学校代码);
ALTER TABLE 选择课程表 ADD CONSTRAINT fk_选择课程表_院系代码表_所属院系代码 FOREIGN KEY (所属院系代码) REFERENCES 院系代码表 (院系代码);
ALTER TABLE 选择课程表 ADD CONSTRAINT ck_选择课程表_是否启用_是否验证 CHECK (是否启用 in ('是', '否'));
----------------------------------待    选    信    息--------------------------------------------
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120203195405gdjygdsx02b200804', '03195405gdjygdsx02b', '200804', '10512', '1051202', 40, '是');
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120101198006qhdxjsjdl200804', '01198006qhdxjsjdl', '200804', '10512', '1051201', 30, '是');
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120402195405gdjygjyycxsj200804', '02195405gdjygjyycxsj', '200804', '10512', '1051204', 45, '是');
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120604198006qhdxjsjdl200804', '04198006qhdxjsjdl', '200804', '10512', '1051206', 90, '是');

INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120203195405gdjygdsx02b200805', '03195405gdjygdsx02b', '200805', '10512', '1051202', 40, '是');
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120101198006qhdxjsjdl200805', '01198006qhdxjsjdl', '200805', '10512', '1051201', 30, '是');
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120402195405gdjygjyycxsj200805', '02195405gdjygjyycxsj', '200805', '10512', '1051204', 45, '是');
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120604198006qhdxjsjdl200805', '04198006qhdxjsjdl', '200805', '10512', '1051206', 90, '是');

INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120203195405gdjygdsx02b200806', '03195405gdjygdsx02b', '200806', '10512', '1051202', 40, '是');
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120101198006qhdxjsjdl200806', '01198006qhdxjsjdl', '200806', '10512', '1051201', 30, '是');
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120402195405gdjygjyycxsj200806', '02195405gdjygjyycxsj', '200806', '10512', '1051204', 45, '是');
INSERT INTO 选择课程表 (选课代码, 课程代码, 授课教师账号, 所属学校代码, 所属院系代码, 计划开班人数, 是否启用) VALUES ('105120604198006qhdxjsjdl200806', '04198006qhdxjsjdl', '200806', '10512', '1051206', 90, '是');
--------------------------------------------------------------------------------------------------

GO
CREATE VIEW 选课视图 -- 最好只为一个界面服务
AS
SELECT 选择课程表.课程代码, 选择课程表.授课教师账号, 选择课程表.所属学校代码, 选择课程表.所属院系代码, 选择课程表.选课代码,
	   选择课程表.是否启用, 全部课程教材对照视图.课程类型代码, 全部课程教材对照视图.课程类型, 全部课程教材对照视图.教材代码,
	   全部课程教材对照视图.教材名称, 全部课程教材对照视图.教材价格, 全部课程教材对照视图.出版社名称, 全部课程教材对照视图.课程学分,
	   全部课程教材对照视图.教材图片路径, 全部课程教材对照视图.课程简介文档路径, 全部课程教材对照视图.课程上课学年,
	   学校代码表.学校名称, 院系代码表.院系名称, 教师详细信息视图.QQ号码, 教师详细信息视图.电子邮箱, 教师详细信息视图.个人简介文档路径,
	   教师详细信息视图.教师工号, 教师详细信息视图.教师姓名, 教师详细信息视图.联系电话, 教师详细信息视图.性别, 教师详细信息视图.学习层次,
	   教师详细信息视图.学校名称 AS 教师所在学校, 教师详细信息视图.院系名称 AS 教师所在院系, 教师详细信息视图.证件照路径,
	   教师详细信息视图.国家名称, 教师详细信息视图.省份名称, 教师详细信息视图.区县名称, 教师详细信息视图.城市名称,
	   选择课程表.计划开班人数, 选择课程表.班级代码, 选择课程表.班级名称, 全部课程教材对照视图.课程名称
FROM 选择课程表, 全部课程教材对照视图, 学校代码表, 院系代码表, 教师详细信息视图
WHERE 选择课程表.授课教师账号 = 教师详细信息视图.教师工号 AND 选择课程表.课程代码 = 全部课程教材对照视图.课程代码
														  AND 选择课程表.所属学校代码 = 学校代码表.学校代码
														  AND 选择课程表.所属院系代码 = 院系代码表.院系代码;
GO
--DROP VIEW 学生详细信息视图;
--SELECT * FROM 选择课程表;
--SELECT * FROM 选课视图;
--SELECT * FROM 课程代码表

CREATE TABLE 学生选课表(
	选课代码           varchar(50)                  not null,
	学生学号           varchar(50)                  not null,
	学生平时成绩       decimal(10, 2)                       ,
	学生期中成绩       decimal(10, 2)                       ,
	学生期末成绩       decimal(10, 2)                       ,
	学生总成绩         decimal(10, 2)                       ,
	学生期末试卷路径   varchar(120)
);
ALTER TABLE 学生选课表 ADD CONSTRAINT pk_学生选课表 PRIMARY KEY (选课代码, 学生学号);
ALTER TABLE 学生选课表 ADD CONSTRAINT fk_学生选课表_学生表_学生学号 FOREIGN KEY (学生学号) REFERENCES 学生表 (学生学号);
ALTER TABLE 学生选课表 ADD CONSTRAINT fk_学生选课表_选择课程表_选课代码 FOREIGN KEY (选课代码) REFERENCES 选择课程表 (选课代码);
ALTER TABLE 学生选课表 ADD CONSTRAINT df_学生选课表_学生平时成绩_默认值为零 DEFAULT 0 FOR 学生平时成绩;
ALTER TABLE 学生选课表 ADD CONSTRAINT df_学生选课表_学生期中成绩_默认值为零 DEFAULT 0 FOR 学生期中成绩;
ALTER TABLE 学生选课表 ADD CONSTRAINT df_学生选课表_学生期末成绩_默认值为零 DEFAULT 0 FOR 学生期末成绩;
ALTER TABLE 学生选课表 ADD CONSTRAINT df_学生选课表_学生总成绩_默认值为零 DEFAULT 0 FOR 学生总成绩;
----------------------------------待    选    信    息--------------------------------------------
INSERT INTO 学生选课表 (选课代码, 学生学号) VALUES ('105120203195405gdjygdsx02b200804', '201622111920001');
INSERT INTO 学生选课表 (选课代码, 学生学号) VALUES ('105120101198006qhdxjsjdl200804', '201622111920002');
INSERT INTO 学生选课表 (选课代码, 学生学号) VALUES ('105120402195405gdjygjyycxsj200804', '201622111920001');
INSERT INTO 学生选课表 (选课代码, 学生学号) VALUES ('105120604198006qhdxjsjdl200804', '201622111920002');
--------------------------------------------------------------------------------------------------

GO
CREATE VIEW 已选课程信息
AS
SELECT 选课视图.QQ号码 AS 教师QQ, 选课视图.出版社名称, 选课视图.电子邮箱 AS 教师电子邮箱, 选课视图.教师工号,
	   选课视图.国家名称 AS 教师国籍, 选课视图.教材代码, 选课视图.教材价格, 选课视图.教材名称, 选课视图.教材图片路径,
	   选课视图.教师所在学校, 选课视图.教师所在院系, 选课视图.教师姓名, 选课视图.课程代码, 选课视图.课程简介文档路径,
	   选课视图.课程类型, 选课视图.课程类型代码, 选课视图.课程上课学年, 选课视图.课程学分, 选课视图.联系电话 AS 教师电话,
	   选课视图.区县名称, 选课视图.省份名称, 选课视图.学校名称 AS 课程所属学校, 选课视图.院系名称 AS 课程所属院系, 
	   选课视图.是否启用, 选课视图.授课教师账号, 选课视图.所属学校代码 AS 课程所属学校代码, 选课视图.所属院系代码 AS 课程所属院系代码,
	   选课视图.性别 AS 教师性别, 选课视图.个人简介文档路径 AS 教师简介,
	   选课视图.选课代码, 选课视图.学习层次 AS 教师学习层次, 选课视图.证件照路径 AS 教师证件照路径, 学生详细信息视图.是否双学位,
	   学生详细信息视图.学生姓名, 学生详细信息视图.学生学号, 学生详细信息视图.QQ号码 AS 学生QQ, 学生详细信息视图.出生日期,
	   学生详细信息视图.联系电话 AS 学生联系电话, 学生详细信息视图.电子邮箱 AS 学生电子邮箱,
	   学生详细信息视图.证件照片路径 AS 学生证件照路径, 学生详细信息视图.性别 AS 学生性别, 学生详细信息视图.学校代码 AS 学生所属学校代码,
	   学生详细信息视图.学校名称 AS 学生所属学校, 学生详细信息视图.院系代码 AS 学生所属院系代码,
	   学生详细信息视图.院系名称 AS 学生所属院系, 学生详细信息视图.专业代码 AS 学生所属专业代码,
	   学生详细信息视图.专业名称 AS 学生所属专业名称, 选课视图.班级代码, 选课视图.班级名称, 选课视图.课程名称
FROM 学生详细信息视图, 选课视图, 学生选课表
WHERE 选课视图.选课代码 = 学生选课表.选课代码 AND 学生选课表.学生学号 = 学生详细信息视图.学生学号
GO

--SELECT 课程名称 FROM 已选课程信息;

--------------------------------------------------------------------------------------------------
---------------------------------管    理    员    信    息---------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE 管理员表(
	账号           varchar(50)                  not null,
	管理对象代码   char(2)                              ,
	是否启用       char(2)                      not null,
	所属学校代码   varchar(8)                           ,
	所属院系代码   varchar(10)                          ,
	所属专业代码   varchar(20)                          ,
	国家代码       varchar(10)                          ,
	省份代码       varchar(10)                          ,
	城市代码       varchar(10)                          ,
	区县代码       varchar(10)                          ,
	性别代码       char(2)                              ,
	姓名           varchar(50)                          ,
	身份证类别代码 char(2)                              ,
	身份证号       char(20)
);
ALTER TABLE 管理员表 ADD CONSTRAINT pk_管理员表 PRIMARY KEY (账号);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_密码表_账号 FOREIGN KEY (账号) REFERENCES 密码表 (账号);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_身份代码表_身份代码 FOREIGN KEY (管理对象代码) REFERENCES 身份代码表 (身份代码);
ALTER TABLE 管理员表 ADD CONSTRAINT ck_管理员表_是否启用_是否验证 CHECK (是否启用 IN ('是', '否'));
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_学校代码表_学校代码 FOREIGN KEY (所属学校代码) REFERENCES 学校代码表 (学校代码);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_院系代码表_所属院系代码 FOREIGN KEY (所属院系代码) REFERENCES 院系代码表 (院系代码);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_专业代码表_专业代码 FOREIGN KEY (所属专业代码) REFERENCES 专业代码表 (专业代码);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_国家代码表_国家代码 FOREIGN KEY (国家代码) REFERENCES 国家代码表 (国家代码);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_省份代码表_省份代码 FOREIGN KEY (省份代码) REFERENCES 省份代码表 (省份代码);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_城市代码表_城市代码 FOREIGN KEY (城市代码) REFERENCES 城市代码表 (城市代码);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_区县代码表_区县代码 FOREIGN KEY (区县代码) REFERENCES 区县代码表 (区县代码);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_性别代码表_性别代码 FOREIGN KEY (性别代码) REFERENCES 性别代码表 (性别代码);
ALTER TABLE 管理员表 ADD CONSTRAINT fk_管理员表_身份证类别代码表_身份证类别代码 FOREIGN KEY (身份证类别代码) REFERENCES 身份证类别代码表 (身份证类别代码);
---------------------------------管    理    员    字    段---------------------------------------
INSERT INTO 管理员表
(账号, 管理对象代码, 是否启用, 所属学校代码, 所属院系代码, 所属专业代码, 国家代码, 省份代码, 城市代码, 区县代码, 性别代码, 身份证类别代码)
VALUES
('10512student', '01', '是', '10512', '1051201', '105120101', '457', '420000', '429000', '429021', '02', '01');
INSERT INTO 管理员表
(账号, 管理对象代码, 是否启用, 所属学校代码, 所属院系代码, 国家代码, 省份代码, 城市代码, 区县代码, 性别代码, 身份证类别代码) VALUES
('10512teacher', '02', '是', '10512', '1051201', '457', '420000', '429000', '429021', '13', '52');
--------------------------------------------------------------------------------------------------

GO
CREATE VIEW 管理员视图
AS
SELECT 管理员表.账号, 管理员表.是否启用, 管理员表.管理对象代码, 管理员表.姓名,
	   国家代码表.国家代码, 国家代码表.国家名称, 省份代码表.省份代码, 省份代码表.省份名称,
	   城市代码表.城市代码, 城市代码表.城市名称, 区县代码表.区县代码, 区县代码表.区县名称,
	   学校代码表.学校代码, 学校代码表.学校名称, 院系代码表.院系代码, 院系代码表.院系名称,
	   专业代码表.专业代码, 专业代码表.专业名称, 性别代码表.性别代码, 性别代码表.性别,
	   密码表.密码
FROM 管理员表, 国家代码表, 省份代码表, 城市代码表, 区县代码表, 学校代码表, 院系代码表, 专业代码表, 性别代码表, 密码表
WHERE 管理员表.账号 = 密码表.账号 AND 管理员表.所属学校代码 = 学校代码表.学校代码 AND 管理员表.所属院系代码 = 院系代码表.院系代码
								  AND 管理员表.所属专业代码 = 专业代码表.专业代码 AND 管理员表.国家代码 = 国家代码表.国家代码
								  AND 管理员表.省份代码 = 省份代码表.省份代码 AND 管理员表.城市代码 = 城市代码表.城市代码
								  AND 管理员表.区县代码 = 区县代码表.区县代码 AND 管理员表.性别代码 = 性别代码表.性别代码;
GO

--SELECT * FROM 管理员视图;

CREATE TABLE 文件类型代码表(
	文件类型代码  char(2)                      not null,
	文件类型名称  varchar(20)                  not null,
	是否启用      char(2)                      not null
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
	是否外部展示  char(2)                      not null
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
	是否启用          char(2)                      not null
);
ALTER TABLE 申请等级代码表 ADD CONSTRAINT pk_申请等级代码表 PRIMARY KEY (申请等级代码);
ALTER TABLE 申请等级代码表 ADD CONSTRAINT ck_申请等级代码表_是否启用_是否验证 CHECK (是否启用 IN ('是', '否'));

CREATE TABLE 审核状态代码表(
	审核状态代码      char(3)                      not null,
	审核状态          varchar(30)                  not null,
	是否启用          char(2)                      not null
);
ALTER TABLE 审核状态代码表 ADD CONSTRAINT pk_审核状态代码表 PRIMARY KEY (审核状态代码);
ALTER TABLE 审核状态代码表 ADD CONSTRAINT ck_审核状态代码表 CHECK (是否启用 IN ('是', '否'));
-----------------------------------审    核    状    态-------------------------------------------
INSERT INTO 审核状态代码表 VALUES ('001', '已通过', '是');
INSERT INTO 审核状态代码表 VALUES ('002', '未通过', '是');
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
