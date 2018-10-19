use asp;
CREATE TABLE ʡ�ݴ����(
	ʡ�ݴ���         int       IDENTITY(1,1)       not null,
	ʡ������         char(50)  UNIQUE              not null
);
ALTER TABLE ʡ�ݴ���� ADD CONSTRAINT pk_ʡ�ݴ���� PRIMARY KEY (ʡ�ݴ���);

CREATE TABLE ���д����(
	���д���         int       IDENTITY(1,1)       not null,
	��������         char(50)                      not null
);
ALTER TABLE ���д���� ADD CONSTRAINT pk_���д���� PRIMARY KEY (���д���);

CREATE TABLE �������(
	������           int       IDENTITY(1,1)       not null,
	������           char(50)                      not null
);
ALTER TABLE ������� ADD CONSTRAINT pk_������� PRIMARY KEY (������);

CREATE TABLE �ֵ������(
	�ֵ�����         int       IDENTITY(1,1)       not null,
	�ֵ�����         char(50)                      not null
);
ALTER TABLE �ֵ������ ADD CONSTRAINT pk_�ֵ������ PRIMARY KEY (�ֵ�����);

CREATE TABLE �ص��(
	ʡ�ݴ���         int                           not null,
	���д���         int                           not null,
	������           int                           not null,
	�ֵ�����         int                           not null
);
ALTER TABLE �ص�� ADD CONSTRAINT pk_�ص�� PRIMARY KEY (ʡ�ݴ���, ���д���, ������, �ֵ�����);
ALTER TABLE �ص�� ADD CONSTRAINT fk_�ص��_ʡ�ݴ��� FOREIGN KEY (ʡ�ݴ���) REFERENCES ʡ�ݴ���� (ʡ�ݴ���);
ALTER TABLE �ص�� ADD CONSTRAINT fk_�ص��_���д��� FOREIGN KEY (���д���) REFERENCES ���д���� (���д���);
ALTER TABLE �ص�� ADD CONSTRAINT fk_�ص��_������   FOREIGN KEY (������)   REFERENCES �������   (������);
ALTER TABLE �ص�� ADD CONSTRAINT fk_�ص��_�ֵ����� FOREIGN KEY (�ֵ�����) REFERENCES �ֵ������ (�ֵ�����);

GO
CREATE VIEW ���������ͼ
AS
SELECT �ص��.ʡ�ݴ���, ʡ������, �ص��.���д���, ��������
FROM ʡ�ݴ����, ���д����, �ص��
WHERE ʡ�ݴ����.ʡ�ݴ��� = �ص��.ʡ�ݴ��� and ���д����.���д��� = �ص��.���д���;
GO

CREATE VIEW ��ϸ��ַ������ͼ
AS
SELECT �ص��.ʡ�ݴ���, ʡ�ݴ����.ʡ������, �ص��.���д���, ���д����.��������, �ص��.������, �������.������, �ص��.�ֵ�����, �ֵ������.�ֵ�����
FROM ʡ�ݴ����, ���д����, �������, �ֵ������, �ص��
WHERE ʡ�ݴ����.ʡ�ݴ��� = �ص��.ʡ�ݴ��� and ���д����.���д��� = �ص��.���д���
                                            and �������.������ = �ص��.������ 
											and �ֵ������.�ֵ����� = �ص��.�ֵ�����
GO

CREATE TABLE �Ա�����(
	�Ա����         int       IDENTITY(1,1)       not null,
	�Ա�             char(20)  UNIQUE              not null
);
ALTER TABLE �Ա����� ADD CONSTRAINT pk_�Ա����� PRIMARY KEY (�Ա����);

CREATE TABLE ���������(
	��������         int       IDENTITY(1,1)       not null,
	��������         char(30)                      not null
);
ALTER TABLE ��������� ADD CONSTRAINT pk_��������� PRIMARY KEY (��������);

CREATE TABLE ���֤�������(
	���֤������   int       IDENTITY(1,1)       not null,
	���֤�������   char(30)  UNIQUE              not null
);
ALTER TABLE ���֤������� ADD CONSTRAINT pk_���֤������� PRIMARY KEY (���֤������);

CREATE TABLE ��������(
	�������         int       IDENTITY(1,1)       not null,
	�������         char(20)  UNIQUE              not null
);
ALTER TABLE �������� ADD CONSTRAINT pk_�������� PRIMARY KEY (�������);

CREATE TABLE Ժϵ�����(
	Ժϵ����         int       IDENTITY(1,1)       not null,
	Ժϵ����         char(50)  UNIQUE              not null
);
ALTER TABLE Ժϵ����� ADD CONSTRAINT pk_Ժϵ���� PRIMARY KEY (Ժϵ����);

CREATE TABLE רҵ�����(
	רҵ����         int       IDENTITY(1,1)       not null,
	רҵ����         char(50)                      not null
);
ALTER TABLE רҵ����� ADD CONSTRAINT pk_רҵ����� PRIMARY KEY (רҵ����);

CREATE TABLE �༶�����(
	�༶����         int       IDENTITY(1,1)       not null,
	�༶����         char(50)                      not null
);
ALTER TABLE �༶����� ADD CONSTRAINT pk_�༶����� PRIMARY KEY (�༶����);

CREATE TABLE Ժϵ_רҵ���ձ�(
	Ժϵ����         int                           not null,
	רҵ����         int                           not null
);
ALTER TABLE Ժϵ_רҵ���ձ� ADD CONSTRAINT pk_Ժϵ_רҵ���ձ� PRIMARY KEY (Ժϵ����, רҵ����);
ALTER TABLE Ժϵ_רҵ���ձ� ADD CONSTRAINT fk_Ժϵ_רҵ���ձ�_Ժϵ�����_Ժϵ FOREIGN KEY (Ժϵ����) REFERENCES Ժϵ����� (Ժϵ����);
ALTER TABLE Ժϵ_רҵ���ձ� ADD CONSTRAINT fk_Ժϵ_רҵ���ձ�_רҵ�����_רҵ FOREIGN KEY (רҵ����) REFERENCES רҵ����� (רҵ����);

CREATE TABLE רҵ_�༶���ձ�(
	רҵ����         int                           not null,
	�༶����         int                           not null
);
ALTER TABLE רҵ_�༶���ձ� ADD CONSTRAINT pk_רҵ_�༶���ձ� PRIMARY KEY (רҵ����, �༶����);
ALTER TABLE רҵ_�༶���ձ� ADD CONSTRAINT fk_רҵ_�༶���ձ�_רҵ�����_רҵ FOREIGN KEY (רҵ����) REFERENCES רҵ����� (רҵ����);
ALTER TABLE רҵ_�༶���ձ� ADD CONSTRAINT fk_רҵ_�༶���ձ�_�༶�����_�༶ FOREIGN KEY (�༶����) REFERENCES �༶����� (�༶����);

GO
CREATE VIEW Ժϵ_רҵ_�༶������ͼ
AS
SELECT Ժϵ�����.Ժϵ����, Ժϵ�����.Ժϵ����, רҵ�����.רҵ����, רҵ�����.רҵ����, �༶�����.�༶����, �༶�����.�༶����
FROM Ժϵ�����, רҵ�����, �༶�����, Ժϵ_רҵ���ձ�, רҵ_�༶���ձ�
WHERE Ժϵ�����.Ժϵ���� = Ժϵ_רҵ���ձ�.Ժϵ���� and רҵ�����.רҵ���� = Ժϵ_רҵ���ձ�.רҵ����
                                                     and �༶�����.�༶���� = רҵ_�༶���ձ�.�༶����
													 and רҵ�����.רҵ���� = רҵ_�༶���ձ�.רҵ����
GO

CREATE TABLE ��������(
	�������         int       IDENTITY(1,1)       not null,
	��������         char(100)                     not null
);
ALTER TABLE �������� ADD CONSTRAINT pk_�������� PRIMARY KEY (�������);

CREATE TABLE ������������(
	�����������     int      IDENTITY(1,1)        not null,
	��������         char(15) UNIQUE               not null
);
ALTER TABLE ������������ ADD CONSTRAINT pk_������������ PRIMARY KEY (�����������);

CREATE TABLE ������ò�����(
	������ò����     int      IDENTITY(1,1)        not null,
	������ò����     char(30) UNIQUE               not null
);
ALTER TABLE ������ò����� ADD CONSTRAINT pk_������ò����� PRIMARY KEY (������ò����);

CREATE TABLE ѧϰ��δ����(
	ѧϰ��δ���     int      IDENTITY(1,1)        not null,
	ѧϰ���         char(50) UNIQUE               not null
);
ALTER TABLE ѧϰ��δ���� ADD CONSTRAINT pk_ѧϰ��δ���� PRIMARY KEY (ѧϰ��δ���);

CREATE TABLE ��ݴ����(
	��ݴ���         int      IDENTITY(1,1)        not null,
	�������         char(30) UNIQUE               not null
);
ALTER TABLE ��ݴ���� ADD CONSTRAINT pk_��ݴ���� PRIMARY KEY (��ݴ���);

CREATE TABLE ��ݶ��ձ�(
	��ݴ���         int       IDENTITY(1,1)       not null,
	�˺�             char(50)  UNIQUE               not null
);
ALTER TABLE ��ݶ��ձ� ADD CONSTRAINT pk_��ݶ��ձ� PRIMARY KEY (�˺�);
ALTER TABLE ��ݶ��ձ� ADD CONSTRAINT fk_��ݶ��ձ�_��ݴ����_��ݴ��� FOREIGN KEY (��ݴ���) REFERENCES ��ݴ���� (��ݴ���);

CREATE TABLE �����(
	�˺�             char(50)                      not null,
	����             char(50)                      not null
);
ALTER TABLE ����� ADD CONSTRAINT pk_����� PRIMARY KEY (�˺�);
ALTER TABLE ����� ADD CONSTRAINT fk_�����_��ݶ��ձ�_�˺� FOREIGN KEY (�˺�) REFERENCES ��ݶ��ձ�(�˺�);

CREATE TABLE ������Ϣ��(
	�˺�              char(50)                      not null,
	ApplicationID     char(100)                             ,
	����ʱ��          DATETIME                              ,
	rowID             int          IDENTITY(1,1)    not null,
	ROWID_MD5_TOUPPER char(1000)                    not null
);
ALTER TABLE ������Ϣ�� ADD CONSTRAINT pk_������Ϣ�� PRIMARY KEY (rowID);
ALTER TABLE ������Ϣ�� ADD CONSTRAINT fk_������Ϣ��_��ݶ��ձ�_�˺� FOREIGN KEY (�˺�) REFERENCES ��ݶ��ձ� (�˺�);

CREATE TABLE �ǳ���Ϣ��(
	�˺�              char(50)                      not null,
	ApplicationID     char(100)                             ,
	�ǳ�ʱ��          DATETIME                              ,
	rowID             int                           not null,
	ROWID_MD5_TOUPPER char(1000)                    not null
);
ALTER TABLE �ǳ���Ϣ�� ADD CONSTRAINT pk_�ǳ���Ϣ�� PRIMARY KEY (rowID);
ALTER TABLE �ǳ���Ϣ�� ADD CONSTRAINT fk_�ǳ���Ϣ��_������Ϣ��_rowID FOREIGN KEY (rowID) REFERENCES ������Ϣ�� (rowID);
ALTER TABLE �ǳ���Ϣ�� ADD CONSTRAINT fk_�ǳ���Ϣ��_��ݶ��ձ�_�˺� FOREIGN KEY (�˺�) REFERENCES ��ݶ��ձ� (�˺�);

GO
CREATE VIEW ��½��Ϣ��ͼ
AS
SELECT ��ݶ��ձ�.�˺�, ������Ϣ��.ApplicationID, ������Ϣ��.rowID, ������Ϣ��.ROWID_MD5_TOUPPER, ������Ϣ��.����ʱ��, �ǳ���Ϣ��.�ǳ�ʱ��
FROM ��ݶ��ձ�, ������Ϣ��, �ǳ���Ϣ��
WHERE ������Ϣ��.ROWID_MD5_TOUPPER = �ǳ���Ϣ��.ROWID_MD5_TOUPPER
GROUP BY ��ݶ��ձ�.�˺�, ������Ϣ��.ApplicationID, ������Ϣ��.rowID, ������Ϣ��.ROWID_MD5_TOUPPER, ������Ϣ��.����ʱ��, �ǳ���Ϣ��.�ǳ�ʱ��
GO

CREATE TABLE ѧ����(
--���˻�����Ϣ
	ѧ��ѧ��          char(50)                     not null,
	ѧ������          char(80)                     not null,
	���֤������    int                          not null,
	���֤��          char(50)                     not null,
	�Ա����          int                          not null,
	�������          int                          not null,
	��������          DATETIME                             ,
	֤����Ƭ·��      char(150)                            ,
--ʡ�ݳ��е����ֵ���Ϣ
	ʡ�ݴ���          int                                  ,
	���д���          int                                  ,
	������            int                                  ,
	�ֵ�����          int                                  ,
--ѧУ�����Ϣ
	ѧϰ��δ���      int                                  ,
	�༶����          int                                  ,
	רҵ����          int                                  ,
	Ժϵ����          int                                  ,
	�Ƿ�˫ѧλ        int                                  ,
	�Ƿ�תרҵ        int                                  ,
--����������Ϣ
	�������          int                                  ,
	��������      int                                  ,
	�����������      int                                  ,
	������ò����      int
);
--����
ALTER TABLE ѧ���� ADD CONSTRAINT pk_ѧ���� PRIMARY KEY (ѧ��ѧ��);
--���
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_��ݶ��ձ�_�˺� FOREIGN KEY (ѧ��ѧ��) REFERENCES ��ݶ��ձ� (�˺�);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_���֤�������_���֤������ FOREIGN KEY (���֤������) REFERENCES ���֤������� (���֤������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_�Ա�����_�Ա���� FOREIGN KEY (�Ա����) REFERENCES �Ա����� (�Ա����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_��������_������� FOREIGN KEY (�������) REFERENCES �������� (�������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_ʡ�ݴ����_ʡ�ݴ��� FOREIGN KEY (ʡ�ݴ���) REFERENCES ʡ�ݴ���� (ʡ�ݴ���);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_���д����_���д��� FOREIGN KEY (���д���) REFERENCES ���д���� (���д���);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_�������_������     FOREIGN KEY (������)   REFERENCES �������   (������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_�ֵ������_�ֵ����� FOREIGN KEY (�ֵ�����) REFERENCES �ֵ������ (�ֵ�����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_ѧϰ��δ���_ѧϰ��� FOREIGN KEY (ѧϰ��δ���) REFERENCES ѧϰ��δ���� (ѧϰ��δ���);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_רҵ�����_רҵ���� FOREIGN KEY (רҵ����) REFERENCES רҵ����� (רҵ����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_Ժϵ�����_Ժϵ���� FOREIGN KEY (Ժϵ����) REFERENCES Ժϵ����� (Ժϵ����);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_��������_������� FOREIGN KEY (�������) REFERENCES �������� (�������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_���������_�������� FOREIGN KEY (��������) REFERENCES ��������� (��������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_������������_����������� FOREIGN KEY (�����������) REFERENCES ������������ (�����������);
ALTER TABLE ѧ���� ADD CONSTRAINT fk_ѧ����_������ò�����_������ò���� FOREIGN KEY (������ò����) REFERENCES ������ò����� (������ò����);

CREATE TABLE ѧ��_�����ʼ���(
	ѧ��ѧ��          char(50)                     not null,
	�����ʼ�          char(50)
);
ALTER TABLE ѧ��_�����ʼ��� ADD CONSTRAINT pk_ѧ��_�����ʼ��� PRIMARY KEY (ѧ��ѧ��);
ALTER TABLE ѧ��_�����ʼ��� ADD CONSTRAINT fk_ѧ��_�����ʼ���_ѧ����_ѧ��ѧ�� FOREIGN KEY (ѧ��ѧ��) REFERENCES ѧ���� (ѧ��ѧ��);

CREATE TABLE ѧ��_��ϵ�绰��(
	ѧ��ѧ��          char(50)                     not null,
	��ϵ�绰          char(50)
);
ALTER TABLE ѧ��_��ϵ�绰�� ADD CONSTRAINT pk_ѧ��_��ϵ�绰�� PRIMARY KEY (ѧ��ѧ��);
ALTER TABLE ѧ��_��ϵ�绰�� ADD CONSTRAINT fk_ѧ��_��ϵ�绰��_ѧ����_ѧ��ѧ�� FOREIGN KEY (ѧ��ѧ��) REFERENCES ѧ���� (ѧ��ѧ��);

CREATE TABLE �༶_ѧ�����ձ�(
	�༶����          int                          not null,
	ѧ��ѧ��          char(50)                     not null
);
ALTER TABLE �༶_ѧ�����ձ� ADD CONSTRAINT pk_�༶_ѧ�����ձ� PRIMARY KEY (�༶����, ѧ��ѧ��);
ALTER TABLE �༶_ѧ�����ձ� ADD CONSTRAINT fk_�༶_ѧ�����ձ�_�༶������_������ FOREIGN KEY (�༶����) REFERENCES �༶����� (�༶����);
ALTER TABLE �༶_ѧ�����ձ� ADD CONSTRAINT fk_�༶_ѧ�����ձ�_ѧ����_ѧ��ѧ�� FOREIGN KEY (ѧ��ѧ��) REFERENCES ѧ���� (ѧ��ѧ��);

GO
CREATE VIEW �༶_ѧ��������ͼ
AS
SELECT Ժϵ�����.Ժϵ����, Ժϵ�����.Ժϵ����,
       �༶�����.�༶����, �༶�����.�༶����,
	   רҵ�����.רҵ����, רҵ�����.רҵ����,
	   ѧ����.ѧ��ѧ��, ѧ����.ѧ������
FROM Ժϵ�����, �༶�����, רҵ�����, ѧ����, �༶_ѧ�����ձ�
WHERE �༶_ѧ�����ձ�.ѧ��ѧ�� = ѧ����.ѧ��ѧ�� and ѧ����.Ժϵ���� = Ժϵ�����.Ժϵ����
                                                 and ѧ����.רҵ���� = רҵ�����.רҵ����
												 and ѧ����.�༶���� = �༶�����.�༶����
												 and �༶_ѧ�����ձ�.�༶���� = �༶�����.�༶����
GO

GO
CREATE VIEW ѧ��������Ϣ��ͼ
AS
SELECT ѧ����.ѧ��ѧ��, ѧ����.ѧ������, ѧ����.��������, ѧ����.֤����Ƭ·��, ѧ����.�Ƿ�תרҵ, ѧ����.�Ƿ�˫ѧλ, ѧ����.���֤��,
       ���֤�������.���֤�������, ��������.��������, ѧϰ��δ����.ѧϰ���,
	   Ժϵ_רҵ_�༶������ͼ.Ժϵ����, Ժϵ_רҵ_�༶������ͼ.רҵ����, Ժϵ_רҵ_�༶������ͼ.�༶����,
	   ��ϸ��ַ������ͼ.ʡ������, ��ϸ��ַ������ͼ.��������, ��ϸ��ַ������ͼ.������, ��ϸ��ַ������ͼ.�ֵ�����,
	   ��������.�������, ���������.��������, ������������.��������, ������ò�����.������ò����
FROM ѧ����, ���֤�������, ��������, ѧϰ��δ����, Ժϵ_רҵ_�༶������ͼ, ��ϸ��ַ������ͼ, ��������, ���������, ������������, ������ò�����
WHERE ѧ����.���֤������ = ���֤�������.���֤������ and ѧ����.������� = ��������.������� and ѧ����.ѧϰ��δ��� = ѧϰ��δ����.ѧϰ��δ���
                                                              and ѧ����.Ժϵ���� = Ժϵ_רҵ_�༶������ͼ.Ժϵ���� and ѧ����.�༶���� = Ժϵ_רҵ_�༶������ͼ.�༶����
															  and ѧ����.רҵ���� = Ժϵ_רҵ_�༶������ͼ.רҵ���� and ѧ����.ʡ�ݴ��� = ��ϸ��ַ������ͼ.ʡ�ݴ���
															  and ѧ����.���д��� = ��ϸ��ַ������ͼ.���д��� and ѧ����.������ = ��ϸ��ַ������ͼ.������
															  and ѧ����.�ֵ����� = ��ϸ��ַ������ͼ.�ֵ����� and ѧ����.������� = ��������.�������
															  and ѧ����.�������� = ���������.�������� and ѧ����.����������� = ������������.�����������
															  and ѧ����.������ò���� = ������ò�����.������ò����
GO

CREATE TABLE ��ʦ��(
--������Ϣ
	��ʦ����          char(50)                     not null,
	��ʦ����          char(80)                     not null,
	���֤������    int                          not null,
	���֤��          char(50)                     not null,
	�Ա����          int                          not null,
	��������          DATETIME                             ,
	���˼��          char(7000)                           ,
--��ַ��Ϣ
	ʡ�ݴ���          int                                  ,
	���д���          int                                  ,
	������            int                                  ,
	�ֵ�����          int                                  ,
--������Ϣ
	�������          int                                  ,
	��������          int                                  ,
	֤����·��        char(150)                            ,
	�������          int                                  ,
	��ҵԺУ_��ʱ���� char(100)                            ,
	������ò����      int                                  ,
	�����������      int                                  ,
--У����Ϣ
	Ժϵ����          int                          not null,
);
--����
ALTER TABLE ��ʦ�� ADD CONSTRAINT pk_��ʦ�� PRIMARY KEY (��ʦ����);
--���
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_��ݶ��ձ�_��ʦ���� FOREIGN KEY (��ʦ����) REFERENCES ��ݶ��ձ� (�˺�);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_���֤�������_���֤������ FOREIGN KEY (���֤������) REFERENCES ���֤������� (���֤������);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_�Ա�����_�Ա���� FOREIGN KEY (�Ա����) REFERENCES �Ա����� (�Ա����);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_ʡ�ݴ����_ʡ�ݴ��� FOREIGN KEY (ʡ�ݴ���) REFERENCES ʡ�ݴ���� (ʡ�ݴ���);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_���д����_���д��� FOREIGN KEY (���д���) REFERENCES ���д���� (���д���);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_�������_������     FOREIGN KEY (������)   REFERENCES �������   (������);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_�ֵ������_�ֵ����� FOREIGN KEY (�ֵ�����) REFERENCES �ֵ������ (�ֵ�����);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_��������_������� FOREIGN KEY (�������) REFERENCES �������� (�������);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_���������_�������� FOREIGN KEY (��������) REFERENCES ��������� (��������);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_��������_������� FOREIGN KEY (�������) REFERENCES �������� (�������);
ALTER TABLE ��ʦ�� ADD CONSTRAINT fk_��ʦ��_Ժϵ�����_Ժϵ���� FOREIGN KEY (Ժϵ����) REFERENCES Ժϵ����� (Ժϵ����);

CREATE TABLE ��ʦ_�����ʼ���(
	��ʦ����          char(50)                     not null,
	�����ʼ�          char(50)
);
ALTER TABLE ��ʦ_�����ʼ��� ADD CONSTRAINT pk_��ʦ_�����ʼ��� PRIMARY KEY (��ʦ����);
ALTER TABLE ��ʦ_�����ʼ��� ADD CONSTRAINT fk_��ʦ_�����ʼ���_��ʦ��_��ʦ���� FOREIGN KEY (��ʦ����) REFERENCES ��ʦ�� (��ʦ����);

CREATE TABLE ��ʦ_��ϵ�绰��(
	��ʦ����          char(50)                     not null,
	��ϵ�绰          char(50)
);
ALTER TABLE ��ʦ_��ϵ�绰�� ADD CONSTRAINT pk_��ʦ_��ϵ�绰�� PRIMARY KEY (��ʦ����);
ALTER TABLE ��ʦ_��ϵ�绰�� ADD CONSTRAINT fk_��ʦ_��ϵ�绰��_��ʦ��_��ʦ���� FOREIGN KEY (��ʦ����) REFERENCES ��ʦ�� (��ʦ����);

CREATE TABLE ѧλ�����(
	ѧλ����          int      IDENTITY(1,1)       not null,
	ѧλ����          char(1000)                   not null
);
ALTER TABLE ѧλ����� ADD CONSTRAINT pk_ѧλ����� PRIMARY KEY (ѧλ����);

CREATE TABLE ��ʦ_ѧλ���ձ�(
	��ʦ����          char(50)                     not null,
	ѧλ����          int                          not null
);
ALTER TABLE ��ʦ_ѧλ���ձ� ADD CONSTRAINT pk_��ʦ_ѧλ���ձ� PRIMARY KEY (��ʦ����, ѧλ����);
ALTER TABLE ��ʦ_ѧλ���ձ� ADD CONSTRAINT fk_��ʦ_ѧλ���ձ�_��ʦ���� FOREIGN KEY (��ʦ����) REFERENCES ��ʦ�� (��ʦ����);
ALTER TABLE ��ʦ_ѧλ���ձ� ADD CONSTRAINT fk_��ʦ_ѧλ���ձ�_ѧλ���� FOREIGN KEY (ѧλ����) REFERENCES ѧλ����� (ѧλ����);

CREATE TABLE �����α�(
	��ʦ����          char(50)                     not null,
	�༶����          int                          not null
);
ALTER TABLE �����α� ADD CONSTRAINT pk_�����α� PRIMARY KEY (��ʦ����, �༶����);
ALTER TABLE �����α� ADD CONSTRAINT fk_�����α�_��ʦ��_��ʦ���� FOREIGN KEY (��ʦ����) REFERENCES ��ʦ�� (��ʦ����);
ALTER TABLE �����α� ADD CONSTRAINT fk_�����α�_�༶�����_�༶���� FOREIGN KEY (�༶����) REFERENCES �༶����� (�༶����);

GO
CREATE VIEW ��ʦ_ѧλ������ͼ
AS
SELECT ��ʦ��.��ʦ����, ��ʦ��.��ʦ����, ѧλ�����.ѧλ����, ѧλ�����.ѧλ����
FROM ��ʦ��, ѧλ�����, ��ʦ_ѧλ���ձ�
WHERE ��ʦ��.��ʦ���� = ��ʦ_ѧλ���ձ�.��ʦ���� and ѧλ�����.ѧλ���� = ��ʦ_ѧλ���ձ�.ѧλ����
GO

GO
CREATE VIEW ��ʦ������Ϣ��ͼ
AS
SELECT ��ʦ��.��ʦ����, ��ʦ��.��ʦ����, ��ʦ��.���֤��, ��ʦ��.��������, ��ʦ��.֤����·��, ��ʦ��.���˼��,
       ��ϸ��ַ������ͼ.ʡ������, ��ϸ��ַ������ͼ.��������, ��ϸ��ַ������ͼ.������, ��ϸ��ַ������ͼ.�ֵ�����, ���֤�������.���֤�������,
	   ��������.�������, ���������.��������, Ժϵ_רҵ_�༶������ͼ.Ժϵ����, ��������.��������, �Ա�����.�Ա�,
	   ������ò�����.������ò����, ������������.��������
FROM ��ʦ��, ��ϸ��ַ������ͼ, ��������, ���������, Ժϵ_רҵ_�༶������ͼ, ���֤�������, ��������, �Ա�����, ������ò�����, ������������
WHERE ��ʦ��.ʡ�ݴ��� = ��ϸ��ַ������ͼ.ʡ�ݴ��� and ��ʦ��.���д��� = ��ϸ��ַ������ͼ.���д��� and ��ʦ��.������ = ��ϸ��ַ������ͼ.������
												and ��ʦ��.�ֵ����� = ��ϸ��ַ������ͼ.�ֵ����� and ��ʦ��.���֤������ = ���֤�������.���֤������
												and ��ʦ��.������� = ��������.������� and ��ʦ��.�������� = ���������.��������
												and ��ʦ��.Ժϵ���� = Ժϵ_רҵ_�༶������ͼ.Ժϵ���� and ��ʦ��.�Ա���� = �Ա�����.�Ա����
												and ��ʦ��.������� = ��������.������� and ��ʦ��.������ò���� = ������ò�����.������ò����
												and ��ʦ��.����������� = ������������.�����������
GO

CREATE TABLE �γ�����ѧ�ڱ�(
	�γ�����ѧ��      int         UNIQUE           not null
);
ALTER TABLE �γ�����ѧ�ڱ� ADD CONSTRAINT pk_�γ�����ѧ�ڱ� PRIMARY KEY (�γ�����ѧ��);

CREATE TABLE �γ̳���������(
	�γ̳�������      int         UNIQUE           not null
);
ALTER TABLE �γ̳��������� ADD CONSTRAINT pk_�γ̳��������� PRIMARY KEY (�γ̳�������);

CREATE TABLE ���ڿγ̳��ȱ�(
	���ڿγ̳���      int         UNIQUE           not null
);
ALTER TABLE ���ڿγ̳��ȱ� ADD CONSTRAINT pk_���ڿγ̳��ȱ� PRIMARY KEY (���ڿγ̳���);

CREATE TABLE �γ̿�ʼ������(
	�γ̿�ʼ����      int         UNIQUE           not null
);
ALTER TABLE �γ̿�ʼ������ ADD CONSTRAINT pk_�γ̽���ʱ��� PRIMARY KEY (�γ̿�ʼ����);

CREATE TABLE �γ��Ͽ����ڱ�(
	�γ��Ͽ�����      int         UNIQUE           not null
);
ALTER TABLE �γ��Ͽ����ڱ� ADD CONSTRAINT pk_�γ��Ͽ����ڱ� PRIMARY KEY (�γ��Ͽ�����);

CREATE TABLE ���Ҵ����(
	���Ҵ���          int       IDENTITY(1,1)      not null,
	��������          char(300)                    not null
);
ALTER TABLE ���Ҵ���� ADD CONSTRAINT pk_���Ҵ���� PRIMARY KEY (���Ҵ���);

CREATE TABLE ����������(
	���������        int       IDENTITY(1,1)      not null,
	����������        int                          not null
);
ALTER TABLE ���������� ADD CONSTRAINT pk_���������� PRIMARY KEY (���������);

CREATE TABLE �̲Ĵ����(
	�̲Ĵ���          int       IDENTITY(1,1)      not null,
	�̲�����          char(200)                    not null,
	���������        int                          not null,
	�̲�ͼƬ·��      char(300)                    not null
);
ALTER TABLE �̲Ĵ���� ADD CONSTRAINT pk_�̲Ĵ���� PRIMARY KEY (�̲Ĵ���, ���������);
ALTER TABLE �̲Ĵ���� ADD CONSTRAINT fk_�̲Ĵ����_����������_��������� FOREIGN KEY (���������) REFERENCES ���������� (���������);

GO
CREATE VIEW �̲ļ�����Ϣ��ͼ
AS
SELECT �̲Ĵ����.�̲Ĵ���, �̲Ĵ����.�̲�����, ����������.����������, �̲Ĵ����.�̲�ͼƬ·��
FROM �̲Ĵ����, ����������
WHERE �̲Ĵ����.��������� = ����������.���������
GO

CREATE TABLE �γ̴����(
	�γ̴���          int       IDENTITY(1,1)      not null,
	�γ�����          char(100)                    not null,
	�γ�ѧ��          decimal(5,2)                 not null,
	�γ̼��          char(7800)                   not null,
);
ALTER TABLE �γ̴���� ADD CONSTRAINT pk_�γ̴���� PRIMARY KEY (�γ̴���);

CREATE TABLE �γ�_�Ͽ�ʱ����ձ�(
	�γ̴���          int                          not null,
	�γ��Ͽ�����      int                          not null,
	�γ̳�������      int                          not null,
	�γ̿�ʼ����      int                          not null,
	�γ�����ѧ��      int                          not null
);
ALTER TABLE �γ�_�Ͽ�ʱ����ձ� ADD CONSTRAINT pk_�γ�_�Ͽ�ʱ����ձ� PRIMARY KEY (�γ̴���);
ALTER TABLE �γ�_�Ͽ�ʱ����ձ� ADD CONSTRAINT fk_�γ�_�Ͽ�ʱ����ձ�_�γ̴����_�γ̴��� FOREIGN KEY (�γ̴���) REFERENCES �γ̴����(�γ̴���);
ALTER TABLE �γ�_�Ͽ�ʱ����ձ� ADD CONSTRAINT fk_�γ�_�Ͽ�ʱ����ձ�_�γ��Ͽ����ڱ�_�γ��Ͽ����� FOREIGN KEY (�γ��Ͽ�����) REFERENCES �γ��Ͽ����ڱ�(�γ��Ͽ�����);
ALTER TABLE �γ�_�Ͽ�ʱ����ձ� ADD CONSTRAINT fk_�γ�_�Ͽ�ʱ����ձ�_�γ̳���������_�γ̳������� FOREIGN KEY (�γ̳�������) REFERENCES �γ̳���������(�γ̳�������);
ALTER TABLE �γ�_�Ͽ�ʱ����ձ� ADD CONSTRAINT fk_�γ�_�Ͽ�ʱ����ձ�_�γ̿�ʼ������_�γ̿�ʼ���� FOREIGN KEY (�γ̿�ʼ����) REFERENCES �γ̿�ʼ������(�γ̿�ʼ����);

CREATE TABLE �γ�_�Ͽν��Ҷ��ձ�(
	�γ̴���          int                          not null,
	���Ҵ���          int                          not null
);
ALTER TABLE �γ�_�Ͽν��Ҷ��ձ� ADD CONSTRAINT pk_�γ�_�Ͽν��Ҷ��ձ� PRIMARY KEY (�γ̴���);
ALTER TABLE �γ�_�Ͽν��Ҷ��ձ� ADD CONSTRAINT fk_�γ�_�Ͽν��Ҷ��ձ�_�γ̴����_�γ̴��� FOREIGN KEY (�γ̴���) REFERENCES �γ̴����(�γ̴���);
ALTER TABLE �γ�_�Ͽν��Ҷ��ձ� ADD CONSTRAINT fk_�γ�_�Ͽν��Ҷ��ձ�_���Ҵ����_���Ҵ��� FOREIGN KEY (���Ҵ���) REFERENCES ���Ҵ����(���Ҵ���);

GO
CREATE VIEW �γ�_���Ҷ�����ͼ
AS
SELECT �γ̴����.�γ�����, ���Ҵ����.��������, �γ̴����.�γ̴���, ���Ҵ����.���Ҵ���
FROM �γ̴����, ���Ҵ����, �γ�_�Ͽν��Ҷ��ձ�
WHERE �γ̴����.�γ̴��� = �γ�_�Ͽν��Ҷ��ձ�.�γ̴��� and ���Ҵ����.���Ҵ��� = �γ�_�Ͽν��Ҷ��ձ�.���Ҵ���
GO

CREATE TABLE ��ʦ_�γ̶��ձ�(
	��ʦ����          char(50)                     not null,
	�γ̴���          int                          not null
);
ALTER TABLE ��ʦ_�γ̶��ձ� ADD CONSTRAINT pk_��ʦ_�γ̶��ձ� PRIMARY KEY (��ʦ����, �γ̴���);
ALTER TABLE ��ʦ_�γ̶��ձ� ADD CONSTRAINT fk_��ʦ_�γ̶��ձ�_��ʦ��_��ʦ���� FOREIGN KEY (��ʦ����) REFERENCES ��ʦ�� (��ʦ����);
ALTER TABLE ��ʦ_�γ̶��ձ� ADD CONSTRAINT fk_��ʦ_�γ̶��ձ�_�γ̴����_�γ̴��� FOREIGN KEY (�γ̴���) REFERENCES �γ̴���� (�γ̴���);

GO
CREATE VIEW ��ʦ�ڿζ�����ͼ
AS
SELECT ��ʦ��.��ʦ����, ��ʦ��.��ʦ����, �γ�_���Ҷ�����ͼ.�γ̴���, �γ�_���Ҷ�����ͼ.�γ�����, �γ�_���Ҷ�����ͼ.���Ҵ���, �γ�_���Ҷ�����ͼ.��������
FROM ��ʦ��, �γ�_���Ҷ�����ͼ, ��ʦ_�γ̶��ձ�
WHERE ��ʦ��.��ʦ���� = ��ʦ_�γ̶��ձ�.��ʦ���� and �γ�_���Ҷ�����ͼ.�γ̴��� = ��ʦ_�γ̶��ձ�.�γ̴���
GO

CREATE TABLE ѧ��_�γ̶��ձ�(
	ѧ��ѧ��          char(50)                     not null,
	�γ̴���          int                          not null,
	ѧ���ɼ�          decimal(5,2)                         ,
	ѧ���Ծ�pdf·��   char(1500)
);
ALTER TABLE ѧ��_�γ̶��ձ� ADD CONSTRAINT pk_ѧ��_�γ̶��ձ� PRIMARY KEY (ѧ��ѧ��, �γ̴���);
ALTER TABLE ѧ��_�γ̶��ձ� ADD CONSTRAINT fk_ѧ��_�γ̶��ձ�_ѧ����_ѧ��ѧ�� FOREIGN KEY (ѧ��ѧ��) REFERENCES ѧ���� (ѧ��ѧ��);
ALTER TABLE ѧ��_�γ̶��ձ� ADD CONSTRAINT fk_ѧ��_�γ̶��ձ�_�γ̱�_�γ̴��� FOREIGN KEY (�γ̴���) REFERENCES �γ̴���� (�γ̴���);

GO
CREATE VIEW ѧ���Ͽ���ͼ
AS
SELECT ѧ����.ѧ��ѧ��, ѧ����.ѧ������, ѧ����.�Ƿ�˫ѧλ, ѧ����.�Ƿ�תרҵ, ѧ����.���֤��,
       ���֤�������.���֤�������,
       Ժϵ_רҵ_�༶������ͼ.Ժϵ����, Ժϵ_רҵ_�༶������ͼ.רҵ����, Ժϵ_רҵ_�༶������ͼ.�༶����,
	   �Ա�����.�Ա�, ��������.��������, ��������.�������, ���������.��������, ������ò�����.������ò����,
	   ��ϸ��ַ������ͼ.ʡ������, ��ϸ��ַ������ͼ.��������, ��ϸ��ַ������ͼ.������, ��ϸ��ַ������ͼ.�ֵ�����,
	   �γ̴����.�γ�����, �γ̴����.�γ�ѧ��, �γ̴����.�γ̼��,
	   ѧ��_�γ̶��ձ�.ѧ���ɼ�
FROM ѧ����, ���֤�������, Ժϵ_רҵ_�༶������ͼ, �Ա�����, ��������, ��������, ���������, ������ò�����,
     ��ϸ��ַ������ͼ, �γ̴����, ѧ��_�γ̶��ձ�
WHERE ѧ����.ѧ��ѧ�� = ѧ��_�γ̶��ձ�.ѧ��ѧ�� and �γ̴����.�γ̴��� = ѧ��_�γ̶��ձ�.�γ̴���    and ѧ����.ʡ�ݴ��� = ��ϸ��ַ������ͼ.ʡ�ݴ���
                                                 and ѧ����.���д��� = ��ϸ��ַ������ͼ.���д���         and ѧ����.������ = ��ϸ��ַ������ͼ.������
												 and ѧ����.�ֵ����� = ��ϸ��ַ������ͼ.�ֵ�����         and ѧ����.���֤������ = ���֤�������.���֤������
												 and ѧ����.Ժϵ���� = Ժϵ_רҵ_�༶������ͼ.Ժϵ���� and ѧ����.רҵ���� = Ժϵ_רҵ_�༶������ͼ.רҵ����
												 and ѧ����.�༶���� = Ժϵ_רҵ_�༶������ͼ.�༶���� and ѧ����.�Ա���� = �Ա�����.�Ա����
												 and ѧ����.������� = ��������.�������             and ѧ����.������� = ��������.�������
												 and ѧ����.������ò���� = ������ò�����.������ò���� and ѧ����.�������� = ���������.��������
												 and ѧ����.ѧ��ѧ�� = ѧ��_�γ̶��ձ�.ѧ��ѧ��
GO

CREATE TABLE ����Ա��(
	�˺�          char(50)                     not null,
	����          char(50)                     not null,
	����������  int                     not null
);
ALTER TABLE ����Ա�� ADD CONSTRAINT pk_����Ա�� PRIMARY KEY (�˺�);
ALTER TABLE ����Ա�� ADD CONSTRAINT fk_����Ա��_��ݶ��ձ�_�˺� FOREIGN KEY (�˺�) REFERENCES ��ݶ��ձ� (�˺�);
ALTER TABLE ����Ա�� ADD CONSTRAINT fk_����Ա��_��ݴ����_���������� FOREIGN KEY (����������) REFERENCES ��ݴ���� (��ݴ���);

GO
CREATE VIEW ����Ա������Ϣ��ͼ
AS
SELECT ����Ա��.�˺�, ����Ա��.����, ��ݴ����.�������
FROM ����Ա��, ��ݴ����
WHERE ����Ա��.���������� = ��ݴ����.��ݴ���
GO

CREATE TABLE ���״̬�����(
	���״̬����  int          IDENTITY(1,1)   not null,
	���״̬      char(20)                     not null
);
ALTER TABLE ���״̬����� ADD CONSTRAINT pk_���״̬����� PRIMARY KEY (���״̬����);

CREATE TABLE �Ƿ���Ҫ���ϴ����(
	�Ƿ���Ҫ���ϴ���  smallint                     not null,
	�Ƿ���Ҫ����      char(20)                     not null
);
ALTER TABLE �Ƿ���Ҫ���ϴ���� ADD CONSTRAINT pk_�Ƿ���Ҫ���ϴ���� PRIMARY KEY (�Ƿ���Ҫ���ϴ���);

CREATE TABLE ����ȼ������(
	����ȼ�����   int         IDENTITY(1,1)    not null,
	����ȼ�       char(100)                    not null
);
ALTER TABLE ����ȼ������ ADD CONSTRAINT pk_����ȼ������ PRIMARY KEY (����ȼ�����);

CREATE TABLE �����(
	�˺�              char(50)                     not null,
	������          int          IDENTITY(1,1)   not null,
	�������          char(100)                            ,
	�������          char(7500)                           ,
	����ȼ�����      int                          not null,
	�Ƿ���Ҫ���ϴ���  smallint                     not null,
	���״̬����      int
);
ALTER TABLE ����� ADD CONSTRAINT pk_����� PRIMARY KEY (������);
ALTER TABLE ����� ADD CONSTRAINT fk_�����_��ݶ��ձ�_�˺� FOREIGN KEY (�˺�) REFERENCES ��ݶ��ձ� (�˺�);
ALTER TABLE ����� ADD CONSTRAINT fk_�����_���״̬��_���״̬���� FOREIGN KEY (���״̬����) REFERENCES ���״̬�����(���״̬����);
ALTER TABLE ����� ADD CONSTRAINT fk_�����_����ȼ������_����ȼ����� FOREIGN KEY (����ȼ�����) REFERENCES ����ȼ������ (����ȼ�����);
ALTER TABLE ����� ADD CONSTRAINT fk_�����_�Ƿ���Ҫ���ϴ����_�Ƿ���Ҫ���ϴ��� FOREIGN KEY (�Ƿ���Ҫ���ϴ���) REFERENCES �Ƿ���Ҫ���ϴ���� (�Ƿ���Ҫ���ϴ���);

CREATE TABLE ������ϱ�(
	������      int                          not null,
	�������·��  char(1000)
);
ALTER TABLE ������ϱ� ADD CONSTRAINT pk_������ϱ� PRIMARY KEY (������);
ALTER TABLE ������ϱ� ADD CONSTRAINT fk_������ϱ�_�����_������ FOREIGN KEY (������) REFERENCES ����� (������);