use asp; -- ��Ҫ��Ӹ�����ϵ�绰�����˵������䡢�����ܱ�����
--------------------------------------------------------------------------------------------------
--------------------------------��     ��     ��     Ϣ-------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE ����ȼ������(
	����ȼ�             char(2)                  not null,
	����ʱ��             int                      not null, -- ��λ����
	�ȼ�����             varchar(300)             not null,
	�Ƿ�����             char(4)                  not null
);
ALTER TABLE ����ȼ������ ADD CONSTRAINT pk_����ȼ� PRIMARY KEY (����ȼ�);
ALTER TABLE ����ȼ������ ADD CONSTRAINT ck_����ȼ������_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
--------------------------------��     ��     ��     ��-------------------------------------------
INSERT INTO ����ȼ������ VALUES ('99', 0, '���ѱ����ý�ֹ��¼', '��');
--------------------------------------------------------------------------------------------------

CREATE TABLE �����¼��(
	�˺�                 varchar(50)              not null,
	����ʱ��             datetime                 not null,
	����ȼ�             char(2)                  not null
);
--------------------------------------------------------------------------------------------------
---------------------------------------Membership-------------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE �����(
	�˺�             varchar(50)                   not null,
	����             varchar(80)                   not null
);
ALTER TABLE ����� ADD CONSTRAINT pk_����� PRIMARY KEY (�˺�);
ALTER TABLE ����� ADD CONSTRAINT df_�����_����_Ĭ��123456 DEFAULT '123456' FOR ����;
------------------------------------��    ��   ��    ��-------------------------------------------
INSERT INTO ����� (�˺�) VALUES ('studentoffice');
INSERT INTO ����� (�˺�) VALUES ('teacheroffice');
INSERT INTO ����� (�˺�) VALUES ('201622111920052');
INSERT INTO ����� (�˺�) VALUES ('200804');
--------------------------------------------------------------------------------------------------

CREATE TABLE ��ݴ����(
	��ݴ���         char(2)                       not null,
	�������         varchar(30)      UNIQUE       not null,
	�Ƿ�����         char(4)                       not null
);
ALTER TABLE ��ݴ���� ADD CONSTRAINT pk_��ݴ���� PRIMARY KEY (��ݴ���);
ALTER TABLE ��ݴ���� ADD CONSTRAINT ck_��ݴ����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
------------------------------------��    ��   ��    ��-------------------------------------------
INSERT INTO ��ݴ���� VALUES ('01', 'ѧ��', '��');
INSERT INTO ��ݴ���� VALUES ('02', '��ʦ', '��');
INSERT INTO ��ݴ���� VALUES ('11', 'ѧ������Ա', '��');
INSERT INTO ��ݴ���� VALUES ('12', '��ʦ����Ա', '��');
--------------------------------------------------------------------------------------------------

CREATE TABLE ��ݶ��ձ�(
	��ݴ���         char(2)                       not null,
	�˺�             varchar(50)      UNIQUE       not null
);
ALTER TABLE ��ݶ��ձ� ADD CONSTRAINT pk_��ݶ��ձ� PRIMARY KEY (�˺�, ��ݴ���);
ALTER TABLE ��ݶ��ձ� ADD CONSTRAINT fk_��ݶ��ձ�_��ݴ����_������� FOREIGN KEY (��ݴ���) REFERENCES ��ݴ���� (��ݴ���);
ALTER TABLE ��ݶ��ձ� ADD CONSTRAINT fk_��ݶ��ձ�_�����_�˺� FOREIGN KEY (�˺�) REFERENCES ����� (�˺�);
------------------------------------��    ��   ӳ    ��-------------------------------------------
INSERT INTO ��ݶ��ձ� VALUES ('11', 'studentoffice');
INSERT INTO ��ݶ��ձ� VALUES ('12', 'teacheroffice');
INSERT INTO ��ݶ��ձ� VALUES ('01', '201622111920052');
INSERT INTO ��ݶ��ձ� VALUES ('02', '200804');
--------------------------------------------------------------------------------------------------

CREATE TABLE ��¼��Ϣ��(
	�˺�                 varchar(50)               not null,
	�豸ID               char(100)                         ,
	�ƶ��豸PIN          char(100)                         ,
	���ε�½���Դ���     int                               ,
	�����ܱ����Ⳣ�Դ��� int                               ,
	ע��ʱ��             datetime                          ,
	�����¼ʱ��         datetime                          ,
	����ǳ�ʱ��         datetime                          ,
	�˺��Ƿ񱻶���       char(4)                           ,
	����ȼ�             char(2)                           ,
	�ⶳʱ��             datetime
);
ALTER TABLE ��¼��Ϣ�� ADD CONSTRAINT pk_��¼��Ϣ�� PRIMARY KEY (�˺�);
ALTER TABLE ��¼��Ϣ�� ADD CONSTRAINT fk_��¼��Ϣ��_�����_�˺� FOREIGN KEY (�˺�) REFERENCES ����� (�˺�);
ALTER TABLE ��¼��Ϣ�� ADD CONSTRAINT fk_��¼��Ϣ��_����ȼ������_����ȼ� FOREIGN KEY (����ȼ�) REFERENCES ����ȼ������ (����ȼ�);
ALTER TABLE ��¼��Ϣ�� ADD CONSTRAINT df_��¼��Ϣ��_�˺��Ƿ񱻶���_Ĭ�Ϸ� DEFAULT '��' FOR �˺��Ƿ񱻶���;
ALTER TABLE ��¼��Ϣ�� ADD CONSTRAINT ck_��¼��Ϣ��_�˺��Ƿ񱻶���_�Ƿ���֤ CHECK (�˺��Ƿ񱻶��� in ('��', '��'));

ALTER TABLE �����¼�� ADD CONSTRAINT pk_�����¼�� PRIMARY KEY (�˺�);
ALTER TABLE �����¼�� ADD CONSTRAINT fk_�����¼��_�����_�˺� FOREIGN KEY (�˺�) REFERENCES ����� (�˺�);
ALTER TABLE �����¼�� ADD CONSTRAINT fk_�����¼��_�˺Ŷ���ʱ���_����ȼ� FOREIGN KEY (����ȼ�) REFERENCES ����ȼ������ (����ȼ�);

GO
CREATE VIEW ����ʱ����ϸ��־��ͼ
AS
SELECT ��¼��Ϣ��.�˺�, ��¼��Ϣ��.�豸ID, ��¼��Ϣ��.�ƶ��豸PIN, ��¼��Ϣ��.���ε�½���Դ���, ��¼��Ϣ��.�����ܱ����Ⳣ�Դ���,
       �����¼��.����ʱ��, ����ȼ������.����ʱ��
FROM ��¼��Ϣ��, �����¼��, ����ȼ������
WHERE ��¼��Ϣ��.�˺� = �����¼��.�˺� AND �����¼��.����ȼ� = ����ȼ������.����ȼ� AND ��¼��Ϣ��.�˺��Ƿ񱻶��� = '��';
GO

GO
CREATE VIEW ��¼��Ϣ��ͼ
AS
SELECT ��¼��Ϣ��.�˺�, ��¼��Ϣ��.�豸ID, ��¼��Ϣ��.�ƶ��豸PIN, ��¼��Ϣ��.���ε�½���Դ���, ��¼��Ϣ��.�����ܱ����Ⳣ�Դ���,
	   ��¼��Ϣ��.ע��ʱ��, ��¼��Ϣ��.�����¼ʱ��, ��¼��Ϣ��.����ǳ�ʱ��, ��¼��Ϣ��.�˺��Ƿ񱻶���, ��¼��Ϣ��.����ȼ�,
	   ��¼��Ϣ��.�ⶳʱ��, ����ȼ������.����ʱ��, ��ݶ��ձ�.��ݴ���
FROM ��¼��Ϣ��, ����ȼ������, ��ݶ��ձ�, ��ݴ����, �����¼��
WHERE ��¼��Ϣ��.�˺� = �����¼��.�˺� AND �����¼��.����ȼ� = ����ȼ������.����ȼ� AND ��¼��Ϣ��.�˺� = ��ݶ��ձ�.�˺�
										AND ��ݶ��ձ�.��ݴ��� = ��ݴ����.��ݴ���;
GO

--------------------------------------------------------------------------------------------------
----------------------------------��    ��    ��    Ϣ--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE ������������(
	��������         char(15)    not null,
	�Ƿ�����         char(4)     not null
);
ALTER TABLE ������������ ADD CONSTRAINT pk_������������ PRIMARY KEY (��������);
ALTER TABLE ������������ ADD CONSTRAINT ck_������������_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));

CREATE TABLE ���Ҵ����(
	���Ҵ���         varchar(10)  not null,
	��������         varchar(50)  not null,
	��������ƴ����д varchar(200) not null,
	��������ƴ��Сд varchar(200) not null,
	����Ӣ����д     varchar(10)  not null,
	�����޴���       varchar(10)          ,
	�Ƿ�����         char(4)      not null
);
ALTER TABLE ���Ҵ���� ADD CONSTRAINT ck_���Ҵ����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));

CREATE TABLE ʡ�ݴ����(
	ʡ�ݴ���         varchar(10)  not null,
	ʡ������         varchar(50)  not null,
	ʡ������ƴ����д varchar(200) not null,
	ʡ������ƴ��Сд varchar(200) not null,
	���ڹ��Ҵ���     varchar(10)  not null,
	�Ƿ�����         char(4)      not null
);
ALTER TABLE ʡ�ݴ���� ADD CONSTRAINT pk_ʡ�ݴ���� PRIMARY KEY (ʡ�ݴ���);
ALTER TABLE ʡ�ݴ���� ADD CONSTRAINT ck_ʡ�ݴ����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
--ALTER TABLE ʡ�ݴ���� ADD CONSTRAINT fk_ʡ�ݴ����_���Ҵ����_���ڹ��Ҵ��� FOREIGN KEY (���ڹ��Ҵ���) REFERENCES ���Ҵ���� (���Ҵ���);
----------------------------------ʡ    ��    ��    ��--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE ���д����(
	���д���         varchar(10)  not null,
	��������         varchar(50)  not null,
	��������ƴ����д varchar(200) not null,
	��������ƴ��Сд varchar(200) not null,
	����ʡ�ݴ���     varchar(10)  not null,
	�Ƿ�����         char(4)      not null
);
ALTER TABLE ���д���� ADD CONSTRAINT pk_���д���� PRIMARY KEY (���д���);
ALTER TABLE ���д���� ADD CONSTRAINT fk_���д����_ʡ�ݴ����_����ʡ�ݴ��� FOREIGN KEY (����ʡ�ݴ���) REFERENCES ʡ�ݴ���� (ʡ�ݴ���);
ALTER TABLE ���д���� ADD CONSTRAINT ck_���д����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
----------------------------------��    ��    ��    ��--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE ���ش����(
	���ش���         varchar(10)  not null,
	��������         varchar(50)  not null,
	��������ƴ����д varchar(200) not null,
	��������ƴ��Сд varchar(200) not null,
	���ڳ��д���     varchar(10)  not null,
	�Ƿ�����         char(4)      not null
);
ALTER TABLE ���ش���� ADD CONSTRAINT pk_���ش���� PRIMARY KEY (���ش���);
ALTER TABLE ���ش���� ADD CONSTRAINT fk_���ش����_���д����_���ڳ��д��� FOREIGN KEY (���ڳ��д���) REFERENCES ���д���� (���д���);
ALTER TABLE ���ش���� ADD CONSTRAINT ck_���ش����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
----------------------------------��    ��    ��    ��--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE �ֵ������(
	�ֵ�����         varchar(10)  not null,
	�ֵ�����         varchar(50)  not null,
	�ֵ�����ƴ����д varchar(200) not null,
	�ֵ�����ƴ��Сд varchar(200) not null,
	�������ش���     varchar(10)  not null,
	�Ƿ�����         char(4)      not null
);
ALTER TABLE �ֵ������ ADD CONSTRAINT pk_�ֵ������ PRIMARY KEY (�ֵ�����);
ALTER TABLE �ֵ������ ADD CONSTRAINT fk_�ֵ������_���ش����_�������ش��� FOREIGN KEY (�������ش���) REFERENCES ���ش���� (���ش���);
ALTER TABLE �ֵ������ ADD CONSTRAINT ck_�ֵ������_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));

GO
CREATE VIEW ��ϸ��ַ������ͼ
AS
SELECT ʡ�ݴ����.ʡ�ݴ���, ʡ�ݴ����.ʡ������ƴ����д, ʡ�ݴ����.ʡ������ƴ��Сд, ʡ�ݴ����.ʡ������,
       ���д����.���д���, ���д����.��������ƴ����д, ���д����.��������ƴ��Сд, ���д����.��������,
	   ���ش����.���ش���, ���ش����.��������ƴ����д, ���ش����.��������ƴ��Сд, ���ش����.��������
FROM ʡ�ݴ����, ���д����, ���ش����
WHERE ʡ�ݴ����.ʡ�ݴ��� = ���д����.����ʡ�ݴ��� AND ���д����.���д��� = ���ش����.���ڳ��д���
GO

--------------------------------------------------------------------------------------------------
----------------------------------��    ��    ��    Ϣ--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE �Ա�����(
	�Ա����         char(2)                    not null,
	�Ա�             varchar(16)     UNIQUE     not null,
	�Ƿ�����         char(4)                    not null
);
ALTER TABLE �Ա����� ADD CONSTRAINT pk_�Ա����� PRIMARY KEY (�Ա����);
ALTER TABLE �Ա����� ADD CONSTRAINT ck_�Ա�����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
----------------------------------��    ��    ��    ��--------------------------------------------
INSERT INTO �Ա����� VALUES ('01', '��', '��');
INSERT INTO �Ա����� VALUES ('02', 'Ů', '��');
INSERT INTO �Ա����� VALUES ('10', '�Ա�һ��', '��');
INSERT INTO �Ա����� VALUES ('11', '�Ա�ȷ��', '��');
INSERT INTO �Ա����� VALUES ('12', '���Ա�', '��');
INSERT INTO �Ա����� VALUES ('13', '����', '��');
---------------------------------------------------------------------------------------------------

CREATE TABLE ���������(
	��������         char(2)                       not null,
	��������         varchar(20)      UNIQUE       not null,
	�Ƿ�����         char(4)                       not null
);
ALTER TABLE ��������� ADD CONSTRAINT pk_��������� PRIMARY KEY (��������);
ALTER TABLE ��������� ADD CONSTRAINT ck_���������_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'))
----------------------------------��    ��    ��    ��--------------------------------------------
INSERT INTO ��������� VALUES ('01', 'ũ�廧��', '��');
INSERT INTO ��������� VALUES ('02', '��ũ�廧��', '��');
--------------------------------------------------------------------------------------------------

CREATE TABLE ���֤�������(
	���֤������   char(2)                       not null,
	���֤�������   varchar(50)      UNIQUE       not null,
	�Ƿ�����         char(4)                       not null
);
ALTER TABLE ���֤������� ADD CONSTRAINT pk_���֤������� PRIMARY KEY (���֤������);
ALTER TABLE ���֤������� ADD CONSTRAINT ck_���֤�������_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
-------------------------------��    ��    ֤    ��    ��------------------------------------------
INSERT INTO ���֤������� VALUES ('01', '�������֤', '��');
INSERT INTO ���֤������� VALUES ('00', '��ʱ���֤', '��');
INSERT INTO ���֤������� VALUES ('11', '����֤', '��');
INSERT INTO ���֤������� VALUES ('12', '�侯����֤', '��');
INSERT INTO ���֤������� VALUES ('13', 'ʿ��֤', '��');
INSERT INTO ���֤������� VALUES ('14', '����ѧԱ֤', '��');
INSERT INTO ���֤������� VALUES ('15', '������ְ�ɲ�֤', '��');
INSERT INTO ���֤������� VALUES ('21', '���������ݸɲ�֤�;���ְ��֤', '��');
INSERT INTO ���֤������� VALUES ('31', '����', '��');
INSERT INTO ���֤������� VALUES ('32', '�۰�ͬ������֤', '��');
INSERT INTO ���֤������� VALUES ('33', '�۰ľ��������ڵ�ͨ��֤', '��');
INSERT INTO ���֤������� VALUES ('34', '�л����񹲺͹������۰�ͨ��֤', '��');
INSERT INTO ���֤������� VALUES ('35', '̨�����������½ͨ��֤', '��');
INSERT INTO ���֤������� VALUES ('36', '��½��������̨��ͨ��֤', '��');
INSERT INTO ���֤������� VALUES ('41', '����˾���֤', '��');
INSERT INTO ���֤������� VALUES ('42', '����˳��뾳֤', '��');
INSERT INTO ���֤������� VALUES ('51', '�⽻��֤', '��');
INSERT INTO ���֤������� VALUES ('52', '���¹�֤', '��');
INSERT INTO ���֤������� VALUES ('16', '��Ա֤', '��');
---------------------------------------------------------------------------------------------------

CREATE TABLE ��������(
	�������         char(2)                      not null,
	�������         varchar(20)       UNIQUE     not null,
	�Ƿ�����         char(4)                      not null
);
 ALTER TABLE �������� ADD CONSTRAINT pk_�������� PRIMARY KEY (�������);
 ALTER TABLE �������� ADD CONSTRAINT ck_��������_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
----------------------------------��    ��    ��    ��--------------------------------------------
INSERT INTO �������� VALUES ('01', '�ѻ�', '��');
INSERT INTO �������� VALUES ('02', 'δ��', '��');
--------------------------------------------------------------------------------------------------

CREATE TABLE ��������(
	�������         char(5)                       not null,
	��������         varchar(100)       UNIQUE     not null,
	�Ƿ�����         char(4)                       not null
);
ALTER TABLE �������� ADD CONSTRAINT pk_�������� PRIMARY KEY (�������);
ALTER TABLE �������� ADD CONSTRAINT ck_��������_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
----------------------------------��    ��    ��    ��--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE ������ò�����(
	������ò����     char(2)                       not null,
	������ò����     varchar(30)       UNIQUE      not null,
	�Ƿ�����         char(4)                       not null
);
ALTER TABLE ������ò����� ADD CONSTRAINT pk_������ò����� PRIMARY KEY (������ò����);
ALTER TABLE ������ò����� ADD CONSTRAINT ck_������ò�����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
-----------------------------��    ��    ��    ò    ��    ��-------------------------------------
INSERT INTO ������ò����� VALUES ('90', '�й���Ա', '��');
INSERT INTO ������ò����� VALUES ('80', '�й�Ԥ����Ա', '��');
INSERT INTO ������ò����� VALUES ('70', '������Ա', '��');
INSERT INTO ������ò����� VALUES ('01', '��ﵳԱ', '��');
INSERT INTO ������ò����� VALUES ('02', '������Ա', '��');
INSERT INTO ������ò����� VALUES ('03', '�񽨻�Ա', '��');
INSERT INTO ������ò����� VALUES ('04', '�����Ա', '��');
INSERT INTO ������ò����� VALUES ('05', 'ũ������Ա', '��');
INSERT INTO ������ò����� VALUES ('06', '�¹�����Ա', '��');
INSERT INTO ������ò����� VALUES ('07', '����ѧ����Ա', '��');
INSERT INTO ������ò����� VALUES ('08', '̨����Ա', '��');
INSERT INTO ������ò����� VALUES ('60', '�޵���������ʿ', '��');
INSERT INTO ������ò����� VALUES ('50', 'Ⱥ��', '��');
--------------------------------------------------------------------------------------------------

CREATE TABLE ѧϰ��δ����(
	ѧϰ��δ���     char(2)                      not null,
	ѧϰ���         varchar(50)      UNIQUE      not null,
	�Ƿ�����         char(4)                      not null
);
ALTER TABLE ѧϰ��δ���� ADD CONSTRAINT pk_ѧϰ��δ���� PRIMARY KEY (ѧϰ��δ���);
ALTER TABLE ѧϰ��δ���� ADD CONSTRAINT ck_ѧϰ��δ����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
------------------------------------ѧ    ��   ��    ��-------------------------------------------
INSERT INTO ѧϰ��δ���� VALUES ('10', 'Сѧ', '��');
INSERT INTO ѧϰ��δ���� VALUES ('20', '����', '��');
INSERT INTO ѧϰ��δ���� VALUES ('30', '��ר', '��');
INSERT INTO ѧϰ��δ���� VALUES ('40', '����', '��');
INSERT INTO ѧϰ��δ���� VALUES ('50', 'ר��', '��');
INSERT INTO ѧϰ��δ���� VALUES ('51', '����', '��');
INSERT INTO ѧϰ��δ���� VALUES ('60', '˶ʿ�о���', '��');
INSERT INTO ѧϰ��δ���� VALUES ('70', '��ʿ�о���', '��');
--------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------
----------------------------------ѧ    У    ��    Ϣ--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE ѧУ�����(
	ѧУ����         varchar(8)                    not null,
	ѧУ����         varchar(80)                   not null,
	����ʡ�ݴ���     varchar(10)                           ,
	���ڳ��д���     varchar(10)                           ,
	�������ش���     varchar(10)                           ,
	���ڽֵ�����     varchar(10)                           ,
	ѧУӢ������     varchar(10)                           ,
	ѧУӢ�����ƴ�д varchar(100)                          ,
	ѧУӢ������Сд varchar(100)                          ,
	ѧУ����ƴ����д varchar(100)                          ,
	ѧУ����ƴ��Сд varchar(100)                          ,
	�Ƿ�����         char(4)
);
ALTER TABLE ѧУ����� ADD CONSTRAINT pk_ѧУ����� PRIMARY KEY (ѧУ����);
ALTER TABLE ѧУ����� ADD CONSTRAINT ck_ѧУ�����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
ALTER TABLE ѧУ����� ADD CONSTRAINT fk_ѧУ�����_ʡ�ݴ����_����ʡ�ݴ��� FOREIGN KEY (����ʡ�ݴ���) REFERENCES ʡ�ݴ���� (ʡ�ݴ���);
ALTER TABLE ѧУ����� ADD CONSTRAINT fk_ѧУ�����_���д����_���ڳ��д��� FOREIGN KEY (���ڳ��д���) REFERENCES ���д���� (���д���);
ALTER TABLE ѧУ����� ADD CONSTRAINT fk_ѧУ�����_���ش����_�������ش��� FOREIGN KEY (�������ش���) REFERENCES ���ش���� (���ش���);
ALTER TABLE ѧУ����� ADD CONSTRAINT fk_ѧУ�����_�ֵ������_���ڽֵ����� FOREIGN KEY (���ڽֵ�����) REFERENCES �ֵ������ (�ֵ�����);
----------------------------------ѧ    У    ��    ��--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE Ժϵ�����(
	Ժϵ����         varchar(10)                   not null,
	Ժϵ����         varchar(80)                   not null,
	����ѧУ����     varchar(8)                            ,
	Ժϵ����ƴ����д varchar(100)                          ,
	Ժϵ����ƴ��Сд varchar(100)                          ,
	ԺϵӢ������     varchar(100)                          ,
	ԺϵӢ�����ƴ�д varchar(100)                          ,
	ԺϵӢ������Сд varchar(100)                          ,
	�Ƿ�����         char(4)
);
ALTER TABLE Ժϵ����� ADD CONSTRAINT pk_Ժϵ����� PRIMARY KEY (Ժϵ����);
ALTER TABLE Ժϵ����� ADD CONSTRAINT fk_Ժϵ�����_ѧУ�����_����ѧУ���� FOREIGN KEY (����ѧУ����) REFERENCES ѧУ����� (ѧУ����);
ALTER TABLE Ժϵ����� ADD CONSTRAINT ck_Ժϵ�����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
----------------------------------Ժ    ϵ    ��    ��--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE רҵ����� (
	רҵ����         varchar(10)                   not null,
	רҵ����         varchar(80)                   not null,
	����Ժϵ����     varchar(10)                   not null,
	רҵ����ƴ����д varchar(100)                          ,
	רҵ����ƴ��Сд varchar(100)                          ,
	רҵӢ������     varchar(100)                          ,
	רҵӢ�����ƴ�д varchar(100)                          ,
	רҵӢ������Сд varchar(100)                          ,
	�Ƿ�����         char(4)
);
ALTER TABLE רҵ����� ADD CONSTRAINT pk_רҵ����� PRIMARY KEY (רҵ����);
ALTER TABLE רҵ����� ADD CONSTRAINT fk_רҵ�����_Ժϵ�����_����Ժϵ���� FOREIGN KEY (����Ժϵ����) REFERENCES Ժϵ����� (Ժϵ����);
ALTER TABLE רҵ����� ADD CONSTRAINT ck_רҵ�����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
----------------------------------ר    ҵ    ��    ��--------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE �༶�����(
	�༶����         varchar(10)                   not null,
	�༶����         varchar(80)                   not null,
	����רҵ����     varchar(10)                   not null,
	�༶����ƴ����д varchar(100)                          ,
	�༶����ƴ��Сд varchar(100)                          ,
	�༶Ӣ������     varchar(100)                          ,
	�༶Ӣ�����ƴ�д varchar(100)                          ,
	�༶Ӣ������Сд varchar(100)                          ,
	�Ƿ�����         char(4)
);
ALTER TABLE �༶����� ADD CONSTRAINT pk_�༶����� PRIMARY KEY (�༶����);
ALTER TABLE �༶����� ADD CONSTRAINT fk_�༶�����_רҵ�����_����רҵ���� FOREIGN KEY (����רҵ����) REFERENCES רҵ����� (רҵ����);
ALTER TABLE �༶����� ADD CONSTRAINT ck_�༶�����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� IN ('��', '��'));
----------------------------------��    ��    ��    ��--------------------------------------------
--------------------------------------------------------------------------------------------------

GO
CREATE VIEW ʡ��_����_����_�ֵ�_ѧУ_Ժϵ_רҵ_�༶������ͼ
AS
SELECT ѧУ�����.ѧУ����, ѧУ�����.ѧУ����, ѧУ�����.ѧУӢ������, ѧУ�����.ѧУ����ƴ����д, ѧУ�����.ѧУ����ƴ��Сд,
       ѧУ�����.ѧУӢ�����ƴ�д, ѧУ�����.���ڳ��д���, ѧУ�����.�������ش���, ѧУ�����.���ڽֵ�����,
	   ʡ�ݴ����.ʡ�ݴ���, ���д����.��������, ���ش����.��������, �ֵ������.�ֵ�����,
       Ժϵ�����.Ժϵ����, Ժϵ�����.Ժϵ����, Ժϵ�����.ԺϵӢ������, Ժϵ�����.ԺϵӢ�����ƴ�д, Ժϵ�����.ԺϵӢ������Сд,
       Ժϵ�����.Ժϵ����ƴ����д, Ժϵ�����.Ժϵ����ƴ��Сд,
	   רҵ�����.רҵ����, רҵ�����.רҵ����, רҵ�����.רҵӢ������, רҵ�����.רҵӢ�����ƴ�д, רҵ�����.רҵӢ������Сд,
	   רҵ�����.רҵ����ƴ����д, רҵ�����.רҵ����ƴ��Сд,
	   �༶�����.�༶����, �༶�����.�༶����, �༶�����.�༶����ƴ����д, �༶�����.�༶����ƴ��Сд
FROM ѧУ�����, ʡ�ݴ����, ���д����, ���ش����, �ֵ������, Ժϵ�����, רҵ�����, �༶�����
WHERE ѧУ�����.����ʡ�ݴ��� = ʡ�ݴ����.ʡ�ݴ��� AND ѧУ�����.���ڳ��д��� = ���д����.���д���
													AND ѧУ�����.�������ش��� = ���ش����.���ش���
													AND ѧУ�����.���ڽֵ����� = �ֵ������.�ֵ�����
													AND Ժϵ�����.����ѧУ���� = ѧУ�����.ѧУ����
													AND רҵ�����.����Ժϵ���� = Ժϵ�����.Ժϵ����
													AND �༶�����.����רҵ���� = רҵ�����.רҵ����;
GO

CREATE TABLE ���Ҵ����(
	���Ҵ���         varchar(10)                   not null,
	��������         varchar(80)                   not null,
	����ѧУ����     varchar(8)                    not null,
	�Ƿ�����         char(4)                       not null
);
ALTER TABLE ���Ҵ���� ADD CONSTRAINT pk_���Ҵ���� PRIMARY KEY (���Ҵ���);
ALTER TABLE ���Ҵ���� ADD CONSTRAINT ck_���Ҵ����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
ALTER TABLE ���Ҵ���� ADD CONSTRAINT fk_���Ҵ����_����ѧУ�����_����ѧУ���� FOREIGN KEY (����ѧУ����) REFERENCES ѧУ����� (ѧУ����);

CREATE TABLE ����ռ�ñ�(
	���Ҵ���         varchar(10)                   not null,
	�Ƿ�ռ��         char(4)                       not null,
	ռ�ÿ�ʼʱ��     datetime                              ,
	ռ�ý���ʱ��     datetime                              ,
	�������˺�       varchar(50)
);
ALTER TABLE ����ռ�ñ� ADD CONSTRAINT pk_����ռ�ñ� PRIMARY KEY (���Ҵ���);
ALTER TABLE ����ռ�ñ� ADD CONSTRAINT fk_����ռ�ñ�_���Ҵ����_���Ҵ��� FOREIGN KEY (���Ҵ���) REFERENCES ���Ҵ���� (���Ҵ���);
ALTER TABLE ����ռ�ñ� ADD CONSTRAINT ck_����ռ�ñ�_�Ƿ�ռ��_�Ƿ���֤ CHECK (�Ƿ�ռ�� in ('��', '��'));
ALTER TABLE ����ռ�ñ� ADD CONSTRAINT fk_����ռ�ñ�_�����_�������˺� FOREIGN KEY (�������˺�) REFERENCES ����� (�˺�);

--------------------------------------------------------------------------------------------------
----------------------------------ѧ    ��    ��    Ϣ--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE ѧ����(
--���˻�����Ϣ
	ѧ��ѧ��          varchar(50)                  not null,
	ѧ������          varchar(80)                  not null,
	���֤������    char(2)                      not null,
	���֤��          char(20)                     not null,
	�Ա����          char(2)                      not null,
	�������          char(5)                      not null,
	��������          DATETIME                             ,
	֤����Ƭ·��      varchar(150)                         ,
--ʡ�ݳ��е����ֵ���Ϣ
	���Ҵ���          varchar(10)                          ,
	ʡ�ݴ���          varchar(10)                          ,
	���д���          varchar(10)                          ,
	���ش���          varchar(10)                          ,
	�ֵ�����          varchar(10)                          ,
--ѧУ�����Ϣ
	ѧϰ��δ���      char(2)                              ,
	�Ƿ�˫ѧλ        char(4)                              ,
	�Ƿ�תרҵ        char(4)                              ,
	����ѧУ����      varchar(8)                           ,
	����Ժϵ����      varchar(10)                          ,
	����רҵ����      varchar(10)                          ,
	���ڰ༶����      varchar(10)                          ,
--����������Ϣ
	�������          char(2)                              ,
	��������          char(2)                              ,
	��������          char(15)                             ,
	������ò����      char(2)                              ,
	��ϵ�绰          char(11)                             ,
	��������          varchar(30)                          ,
	�ܱ�����          varchar(80)                          ,
	�ܱ������      varchar(1000)
);
ALTER TABLE ѧ���� ADD CONSTRAINT pk_ѧ���� PRIMARY KEY (ѧ��ѧ��);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_���֤�������_���֤������ FOREIGN KEY (���֤������) REFERENCES ���֤������� (���֤������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_�Ա�����_�Ա���� FOREIGN KEY (�Ա����) REFERENCES �Ա����� (�Ա����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_��������_������� FOREIGN KEY (�������) REFERENCES �������� (�������);
--��ʱ���ӹ��ҵ����
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_ʡ�ݴ����_ʡ�ݴ��� FOREIGN KEY (ʡ�ݴ���) REFERENCES ʡ�ݴ���� (ʡ�ݴ���);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_���д����_���д��� FOREIGN KEY (���д���) REFERENCES ���д���� (���д���);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_���ش����_���ش��� FOREIGN KEY (���ش���) REFERENCES ���ش���� (���ش���);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_�ֵ������_�ֵ����� FOREIGN KEY (�ֵ�����) REFERENCES �ֵ������ (�ֵ�����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_ѧϰ��δ����_ѧϰ��δ��� FOREIGN KEY (ѧϰ��δ���) REFERENCES ѧϰ��δ���� (ѧϰ��δ���);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_ѧУ�����_����ѧУ���� FOREIGN KEY (����ѧУ����) REFERENCES ѧУ����� (ѧУ����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_Ժϵ�����_����Ժϵ���� FOREIGN KEY (����Ժϵ����) REFERENCES Ժϵ����� (Ժϵ����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_רҵ�����_����רҵ���� FOREIGN KEY (����רҵ����) REFERENCES רҵ����� (רҵ����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_ѧУ�����_���ڰ༶���� FOREIGN KEY (���ڰ༶����) REFERENCES �༶����� (�༶����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_��������_������� FOREIGN KEY (�������) REFERENCES �������� (�������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_���������_�������� FOREIGN KEY (��������) REFERENCES ��������� (��������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_������������_�������� FOREIGN KEY (��������) REFERENCES ������������ (��������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_������ò�����_������ò���� FOREIGN KEY (������ò����) REFERENCES ������ò����� (������ò����);
ALTER TABLE ѧ���� ADD CONSTRAINT ck_ѧ����_�Ƿ�˫ѧλ_�Ƿ���֤ CHECK (�Ƿ�˫ѧλ in ('��', '��'));
ALTER TABLE ѧ���� ADD CONSTRAINT ck_ѧ����_�Ƿ�תרҵ_�Ƿ���֤ CHECK (�Ƿ�תרҵ in ('��', '��'));

--------------------------------------------------------------------------------------------------
----------------------------------��    ʦ    ��    Ϣ--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE ��ʦ��(
--������Ϣ
	��ʦ����          varchar(50)                  not null,
	��ʦ����          varchar(80)                  not null,
	���֤������    char(2)                      not null,
	���֤��          char(20)                     not null,
	�Ա����          char(2)                      not null,
	�������          char(5)                      not null,
	��������          DATETIME                             ,
	֤����·��        varchar(150)                         ,
	���˼���ĵ�·��  varchar(150)                         ,
--ʡ�ݳ��е����ֵ���Ϣ
	���Ҵ���          varchar(10)                          ,
	ʡ�ݴ���          varchar(10)                          ,
	���д���          varchar(10)                          ,
	���ش���          varchar(10)                          ,
	�ֵ�����          varchar(10)                          ,
 -- ��ҵԺУ          varchar(100)                         ,��ʱ����
--����������Ϣ
	�������          char(2)                              ,
	��������          char(2)                              ,
	��������          char(15)                             ,
	������ò����      char(2)                              ,
	��ϵ�绰          char(11)                             ,
	��������          varchar(30)                          ,
	�ܱ�����          varchar(80)                          ,
	�ܱ������      varchar(1000)                        ,
--У����Ϣ
	����ѧУ����      varchar(8)                           ,
	����Ժϵ����      varchar(10)
);
ALTER TABLE ��ʦ�� ADD CONSTRAINT pk_��ʦ�� PRIMARY KEY (��ʦ����);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_���֤�������_���֤������ FOREIGN KEY (���֤������) REFERENCES ���֤������� (���֤������);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_�Ա�����_�Ա���� FOREIGN KEY (�Ա����) REFERENCES �Ա����� (�Ա����);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_��������_������� FOREIGN KEY (�������) REFERENCES �������� (�������);
--��ʱ���ӹ��ҵ����
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_ʡ�ݴ����_ʡ�ݴ��� FOREIGN KEY (ʡ�ݴ���) REFERENCES ʡ�ݴ���� (ʡ�ݴ���);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_���д����_���д��� FOREIGN KEY (���д���) REFERENCES ���д���� (���д���);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_���ش����_���ش��� FOREIGN KEY (���ش���) REFERENCES ���ش���� (���ش���);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_�ֵ������_�ֵ����� FOREIGN KEY (�ֵ�����) REFERENCES �ֵ������ (�ֵ�����);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_��������_������� FOREIGN KEY (�������) REFERENCES �������� (�������);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_���������_�������� FOREIGN KEY (��������) REFERENCES ��������� (��������);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_���������_�������� FOREIGN KEY (��������) REFERENCES ������������ (��������);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_������ò�����_������ò���� FOREIGN KEY (������ò����) REFERENCES ������ò����� (������ò����);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_ѧУ�����_����ѧУ���� FOREIGN KEY (����ѧУ����) REFERENCES ѧУ����� (ѧУ����);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_Ժϵ�����_����Ժϵ���� FOREIGN KEY (����Ժϵ����) REFERENCES Ժϵ����� (Ժϵ����);

--------------------------------------------------------------------------------------------------
----------------------------------��    ��    ��    Ϣ--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE �̲Ĵ����(
	�̲Ĵ���          varchar(10)                  not null,
	�̲�����          varchar(120)                 not null,
	�̲ļ۸�          decimal(10, 2)                       ,
	����������        varchar(120)                         ,
	�̲�ͼƬ·��      varchar(150)                         ,
	�Ƿ�����          char(4)                      not null
);
ALTER TABLE �̲Ĵ���� ADD CONSTRAINT pk_�̲Ĵ���� PRIMARY KEY (�̲Ĵ���);
ALTER TABLE �̲Ĵ���� ADD CONSTRAINT ck_�̲Ĵ����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
ALTER TABLE �̲Ĵ���� ADD CONSTRAINT df_�̲Ĵ����_�̲ļ۸�_Ĭ��0 DEFAULT (0) FOR �̲ļ۸�;

CREATE TABLE �γ̴����(
	�γ̴���          char(10)                     not null,
	�γ�����          varchar(100)                 not null,
	�γ�ѧ��          decimal(10,2)                not null,
	�γ̼���ĵ�·��  varchar(150)                         ,
	�̲Ĵ���          varchar(10)                          ,
	����ѧУ����      varchar(10)                          ,
	����Ժϵ����      varchar(10)                          ,
	����רҵ����      varchar(10)                          ,
	�γ��Ͽ�ѧ��      int                                  ,
	�Ƿ�����          char(4)                      not null
);
ALTER TABLE �γ̴���� ADD CONSTRAINT pk_�γ̴���� PRIMARY KEY (�γ̴���);
ALTER TABLE �γ̴���� ADD CONSTRAINT fk_�γ̴����_�̲Ĵ����_�̲Ĵ��� FOREIGN KEY (�̲Ĵ���) REFERENCES �̲Ĵ���� (�̲Ĵ���);
ALTER TABLE �γ̴���� ADD CONSTRAINT ck_�γ̴����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� in ('��', '��'));
ALTER TABLE �γ̴���� ADD CONSTRAINT df_�γ̴����_�γ�ѧ�� DEFAULT 0 FOR �γ�ѧ��;
ALTER TABLE �γ̴���� ADD CONSTRAINT ck_�γ̴����_�γ��Ͽ�ѧ��_ֻ������1��8 CHECK (�γ��Ͽ�ѧ�� in (1, 2, 3, 4, 5, 6, 7, 8));
ALTER TABLE �γ̴���� ADD CONSTRAINT fk_�γ̴����_�γ̴����_�γ̴��� FOREIGN KEY (�γ̴���) REFERENCES �γ̴���� (�γ̴���);

CREATE TABLE �Ͽ�ʱ��δ����(
	�Ͽ�ʱ��δ���     char(5)                      not null,
	�Ͽο�ʼʱ��       int                          not null, -- ��λ - ��
	�Ͽν���ʱ��       int                          not null  -- ��λ - ��
);
ALTER TABLE �Ͽ�ʱ��δ���� ADD CONSTRAINT pk_�Ͽ�ʱ��δ���� PRIMARY KEY (�Ͽ�ʱ��δ���);

CREATE TABLE �Ͽ�ʱ��ص���ձ�(
	�Ͽ�ʱ��δ���     char(5)                      not null,
	�Ͽεص����       varchar(10)                  not null,
	����               int                          not null
);
ALTER TABLE �Ͽ�ʱ��ص���ձ� ADD CONSTRAINT pk_�Ͽ�ʱ��ص���ձ� PRIMARY KEY (�Ͽ�ʱ��δ���, �Ͽεص����);
ALTER TABLE �Ͽ�ʱ��ص���ձ� ADD CONSTRAINT fk_�Ͽ�ʱ��ص���ձ�_�Ͽ�ʱ��δ����_�Ͽ�ʱ��δ���
											  FOREIGN KEY (�Ͽ�ʱ��δ���) REFERENCES �Ͽ�ʱ��δ���� (�Ͽ�ʱ��δ���);
ALTER TABLE �Ͽ�ʱ��ص���ձ� ADD CONSTRAINT fk_�Ͽ�ʱ��ص���ձ�_���Ҵ����_�Ͽεص����
											  FOREIGN KEY (�Ͽεص����) REFERENCES ���Ҵ���� (���Ҵ���);
ALTER TABLE �Ͽ�ʱ��ص���ձ� ADD CONSTRAINT ck_�Ͽ�ʱ��ص���ձ�_����_�޶���Χ1��7 CHECK (���� IN (1, 2, 3, 4, 5, 6, 7));

--------------------------------------------------------------------------------------------------
----------------------------------ѧ    ��    ѡ    ��--------------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE ѧ��ѡ�α�(
	ѧ��ѧ��           varchar(50)                          ,
	�γ̴���           char(10)                     not null,
	�ڿν�ʦ�˺�       varchar(50)                  not null,
	ѧ��ƽʱ�ɼ�       decimal(10, 2)                       ,
	ѧ�����гɼ�       decimal(10, 2)                       ,
	ѧ����ĩ�ɼ�       decimal(10, 2)                       ,
	ѧ���ܳɼ�         decimal(10, 2)
);
ALTER TABLE ѧ��ѡ�α� ADD CONSTRAINT pk_ѧ��ѡ�α� PRIMARY KEY (�ڿν�ʦ�˺�, �γ̴���);
ALTER TABLE ѧ��ѡ�α� ADD CONSTRAINT fk_ѧ��ѡ�α�_��ʦ��_�ڿν�ʦ�˺� FOREIGN KEY (�ڿν�ʦ�˺�) REFERENCES ��ʦ�� (��ʦ����);
ALTER TABLE ѧ��ѡ�α� ADD CONSTRAINT fk_ѧ��ѡ�α�_ѧ����_ѧ��ѧ�� FOREIGN KEY (ѧ��ѧ��) REFERENCES ѧ���� (ѧ��ѧ��);
ALTER TABLE ѧ��ѡ�α� ADD CONSTRAINT fk_ѧ��ѡ�α�_�γ̴����_�γ̴��� FOREIGN KEY (�γ̴���) REFERENCES �γ̴���� (�γ̴���);
ALTER TABLE ѧ��ѡ�α� ADD CONSTRAINT df_ѧ��ѡ�α�_ѧ��ƽʱ�ɼ�_Ĭ��ֵΪ�� CHECK (ѧ��ƽʱ�ɼ� IN ('��', '��'));
ALTER TABLE ѧ��ѡ�α� ADD CONSTRAINT df_ѧ��ѡ�α�_ѧ�����гɼ�_Ĭ��ֵΪ�� CHECK (ѧ�����гɼ� IN ('��', '��'));
ALTER TABLE ѧ��ѡ�α� ADD CONSTRAINT df_ѧ��ѡ�α�_ѧ����ĩ�ɼ�_Ĭ��ֵΪ�� CHECK (ѧ����ĩ�ɼ� IN ('��', '��'));
ALTER TABLE ѧ��ѡ�α� ADD CONSTRAINT df_ѧ��ѡ�α�_ѧ���ܳɼ�_Ĭ��ֵΪ�� CHECK (ѧ���ܳɼ� IN ('��', '��'));

GO
CREATE VIEW �༶���
AS
SELECT ��ʦ��.��ʦ����, ��ʦ��.��ʦ����, ��ʦ��.���˼���ĵ�·��, ��ʦ��.��ϵ�绰, ��ʦ��.��������, ��ʦ��.�Ա����,
	   ��ʦ��.����ѧУ����, ��ʦ��.����Ժϵ����, ��ʦ��.֤����·��, COUNT(ѧ��ѡ�α�.ѧ��ѧ��) AS ѡ������
FROM ��ʦ��, ѧ��ѡ�α�
WHERE ��ʦ��.��ʦ���� = ѧ��ѡ�α�.�ڿν�ʦ�˺�
GROUP BY ��ʦ��.��ʦ����, ��ʦ��.��ʦ����, ��ʦ��.���˼���ĵ�·��, ��ʦ��.��ϵ�绰, ��ʦ��.��������, ��ʦ��.�Ա����,
	     ��ʦ��.����ѧУ����, ��ʦ��.����Ժϵ����, ��ʦ��.֤����·��
GO

--------------------------------------------------------------------------------------------------
---------------------------------��    ��    Ա    ��    Ϣ---------------------------------------
--------------------------------------------------------------------------------------------------
CREATE TABLE ����Ա��(
	�˺�          varchar(50)                  not null,
	����������  char(2)                      not null,
	�Ƿ�����      char(4)                      not null
);
ALTER TABLE ����Ա�� ADD CONSTRAINT pk_����Ա�� PRIMARY KEY (�˺�);
ALTER TABLE ����Ա�� ADD CONSTRAINT fk_����Ա��_�����_�˺� FOREIGN KEY (�˺�) REFERENCES ����� (�˺�);
ALTER TABLE ����Ա�� ADD CONSTRAINT fk_����Ա��_��ݴ����_��ݴ��� FOREIGN KEY (����������) REFERENCES ��ݴ���� (��ݴ���);
ALTER TABLE ����Ա�� ADD CONSTRAINT ck_����Ա��_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� IN ('��', '��'));

CREATE TABLE �ļ����ʹ����(
	�ļ����ʹ���  char(2)                      not null,
	�ļ���������  varchar(20)                  not null,
	�Ƿ�����      char(4)                      not null
);
ALTER TABLE �ļ����ʹ���� ADD CONSTRAINT pk_�ļ����ʹ���� PRIMARY KEY (�ļ����ʹ���);
ALTER TABLE �ļ����ʹ���� ADD CONSTRAINT ck_�ļ����ʹ����_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� IN ('��', '��'));
---------------------------------��      ��      ��      ��---------------------------------------
INSERT INTO �ļ����ʹ���� VALUES ('00', '����', '��');
INSERT INTO �ļ����ʹ���� VALUES ('10', '����', '��');
--------------------------------------------------------------------------------------------------

CREATE TABLE ���Ź����(
	���          int       IDENTITY(1, 1)     not null,
	����          varchar(100)                         ,
	�ļ�·��      varchar(120)                         , -- �����ﱣ������
	���          varchar(7000)                        , -- ������Ϣ
	�ļ����ʹ���  char(2)                      not null,
	�ϴ�ʱ��      DATETIME                     not null,
	�޸�ʱ��      DATETIME                             ,
	�Ƿ��ⲿչʾ  char(4)                      not null
);
ALTER TABLE ���Ź���� ADD CONSTRAINT pk_���Ź���� PRIMARY KEY (���);
ALTER TABLE ���Ź���� ADD CONSTRAINT fk_���Ź����_�ļ����ʹ����_�ļ����ʹ��� FOREIGN KEY (�ļ����ʹ���) REFERENCES �ļ����ʹ���� (�ļ����ʹ���);
ALTER TABLE ���Ź���� ADD CONSTRAINT ck_���Ź����_�Ƿ��ⲿ��ʾ_�Ƿ���֤ CHECK (�Ƿ��ⲿչʾ IN ('��', '��'));

GO
CREATE VIEW ������ͼ
AS
SELECT ���Ź����.���, ���Ź����.����, ���Ź����.���, ���Ź����.�ϴ�ʱ��, ���Ź����.�ļ�·��, ���Ź����.�޸�ʱ��,
       �ļ����ʹ����.�ļ���������
FROM ���Ź����, �ļ����ʹ����
WHERE �ļ����ʹ����.�ļ����ʹ��� = ���Ź����.�ļ����ʹ��� AND ���Ź����.�Ƿ��ⲿչʾ = '��' AND �ļ����ʹ����.�ļ��������� = '����';
GO

GO
CREATE VIEW ������ͼ
AS
SELECT ���Ź����.���, ���Ź����.����, ���Ź����.���, ���Ź����.�ϴ�ʱ��, ���Ź����.�ļ�·��, ���Ź����.�޸�ʱ��,
       �ļ����ʹ����.�ļ���������
FROM ���Ź����, �ļ����ʹ����
WHERE �ļ����ʹ����.�ļ����ʹ��� = ���Ź����.�ļ����ʹ��� AND ���Ź����.�Ƿ��ⲿչʾ = '��' AND �ļ����ʹ����.�ļ��������� = '����';
GO

CREATE TABLE ����ȼ������(
	����ȼ�����      char(5)                      not null,
	����ȼ�          varchar(30)                  not null,
	�Ƿ�����          char(4)                      not null
);
ALTER TABLE ����ȼ������ ADD CONSTRAINT pk_����ȼ������ PRIMARY KEY (����ȼ�����);
ALTER TABLE ����ȼ������ ADD CONSTRAINT ck_����ȼ������_�Ƿ�����_�Ƿ���֤ CHECK (�Ƿ����� IN ('��', '��'));
---------------------------------��      ��      ��      ��---------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE ���״̬�����(
	���״̬����      char(3)                      not null,
	���״̬          varchar(30)                  not null,
	�Ƿ�����          char(4)                      not null
);
ALTER TABLE ���״̬����� ADD CONSTRAINT pk_���״̬����� PRIMARY KEY (���״̬����);
ALTER TABLE ���״̬����� ADD CONSTRAINT ck_���״̬����� CHECK (�Ƿ����� IN ('��', '��'));
-----------------------------------��    ��    ״    ̬-------------------------------------------
--------------------------------------------------------------------------------------------------

CREATE TABLE �����(
	�˺�              varchar(50)                  not null,
	������          int          IDENTITY(1,1)   not null,
	�������          varchar(120)                         ,
	�������          varchar(7500)                        ,
	����ȼ�����      char(5)                      not null,
	�Ƿ���Ҫ����      char(2)                      not null,
	���״̬����      char(3)                      not null
);
ALTER TABLE ����� ADD CONSTRAINT pk_����� PRIMARY KEY (������);
ALTER TABLE ����� ADD CONSTRAINT ck_�����_�Ƿ���Ҫ����_�Ƿ���֤ CHECK (�Ƿ���Ҫ���� IN ('��', '��'));
ALTER TABLE ����� ADD CONSTRAINT fk_�����_�����_�˺� FOREIGN KEY (�˺�) REFERENCES ����� (�˺�);

CREATE TABLE ������ϱ�(
	������           int                          not null,
	��������ļ�·��   varchar(150)
);
ALTER TABLE ������ϱ� ADD CONSTRAINT pk_������ϱ� PRIMARY KEY (������);
ALTER TABLE ������ϱ� ADD CONSTRAINT fk_������ϱ�_�����_������ FOREIGN KEY (������) REFERENCES ����� (������);

GO
CREATE VIEW ѧ��������ͼ
AS
SELECT �����.������, �����.�������, �����.�������, �����.�Ƿ���Ҫ����,
	   ���״̬�����.���״̬, ����ȼ������.����ȼ�, ��ݴ����.�������, ��ݴ����.��ݴ���
FROM �����, ���״̬�����, ����ȼ������, ��ݴ����, ��ݶ��ձ�
WHERE �����.����ȼ����� = ����ȼ������.����ȼ����� AND �����.���״̬���� = ���״̬�����.���״̬����
														AND �����.�˺� = ��ݶ��ձ�.�˺�
														AND ��ݶ��ձ�.��ݴ��� = ��ݴ����.��ݴ���
														AND ��ݴ����.������� = 'ѧ��';
GO

GO
CREATE VIEW ��ʦ������ͼ
AS
SELECT �����.������, �����.�������, �����.�������, �����.�Ƿ���Ҫ����,
	   ���״̬�����.���״̬, ����ȼ������.����ȼ�, ��ݴ����.�������, ��ݴ����.��ݴ���
FROM �����, ���״̬�����, ����ȼ������, ��ݴ����, ��ݶ��ձ�
WHERE �����.����ȼ����� = ����ȼ������.����ȼ����� AND �����.���״̬���� = ���״̬�����.���״̬����
														AND �����.�˺� = ��ݶ��ձ�.�˺�
														AND ��ݶ��ձ�.��ݴ��� = ��ݴ����.��ݴ���
														AND ��ݴ����.������� = '��ʦ';
GO