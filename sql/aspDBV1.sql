CREATE TABLE ѧ����(
   ����           char(50)      not null,
   �Ա�           char(10)      not null,
   ѧ��           char(30)      not null,
   ѧԺ           char(80),
   �༶           char(80),
   ��������       datetime      not null,
   ���֤��       char(50)      not null,
   ����           char(50),
   ����           char(50),
   ����           char(100),
   �������       char(20),
   ��ͥ��סַ     char(300)     not null,
   ��������       char(20),
   �������       char(10),
   ������ò       char(10),
   ѧϰ���       char(20),
   רҵ����       char(100),
   ��ѧ����       datetime      not null,
   ��ҵ����       datetime,
   ��ҵ֤���     char(50),
   ѧʿ֤���     char(50),
   ֤����·��     char(500),
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
CREATE TABLE ѧ��_�γ̱�(
   ѧ��           char(30)        not null,
   �γ̱��       int             not null,
   ѧ���ɼ�       decimal(10,2),
   ���ڽ���       char(100),
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
CREATE TABLE �γ̱�(
   �γ̱��       int identity(1,1)    not null,
   �γ�����       char(100)            not null,
   �γ�ѧ��       decimal,
   �γ̼��       char(5888),
   �̲�ͼƬ·��   char(500),
   �̲ĳ�����     char(500),
   �γ����       char(50)             not null,
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
CREATE TABLE �γ�_ʱ���(
   �γ̱��      int        not null,
   �Ͽ�����      int        not null,
   �Ͽ�ʱ��      char(100)   not null,
   �Ͽ�ѧ��      int        not null,
   �Ͽ�ѧ��      int        not null,
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
CREATE TABLE ��ʦ��(
    ��ʦ����      char(30)      not null,
    ����          char(50)      not null,
	����          char(80),
	�Ա�          char(10)      not null,
	��������      datetime,
	ִ�����      int           not null,
	�������      char(20),
	������ò      char(20),
	�������      char(10),
	ѧλ          char(80)      not null,
	��ҵԺУ      char(80)      not null,
	���          char(5956),
	����          char(100),
	�Ƿ�Ϊ������  char(2)       not null,
	����༶      char(100),
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
CREATE TABLE ��ʦ_�γ̱�(
    �γ̱��       int           not null,
	��ʦ����       char(30)      not null,
	���ڽ���       char(100),
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
CREATE TABLE ѧ�������(
    ѧ��           char(30)             not null,
	������       int identity(1,1)    not null,
	�������       char(500),
	��������       char(6007)           not null,
	�������       char(500)             not null,
	����ʱ��       datetime             not null,
	���״̬       smallint             not null,
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
CREATE TABLE ��ʦ�����(
    ��ʦ����       char(30)             not null,
	������       int identity(1,1)    not null,
	�������       char(500),
	��������       char(6007)           not null,
	�������       char(500)             not null,
	����ʱ��       datetime             not null,
	���״̬       smallint             not null,
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
CREATE TABLE ����Ա��(
    �˺�           char(20)     not null,
	����           char(20)     not null,
	�������       char(10)      not null,
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

CREATE TABLE ���ű�(
	���ű��       int IDENTITY(1, 1) not null,
	���ű���       char(50)           not null,
	��������       varchar(8000)      not null,
	����ʱ��       DATETIME           not null,
	�޸�ʱ��       DATETIME,
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

CREATE TABLE �����(
    ������       int IDENTITY(1, 1) not null,
	�������       char(50)           not null,
	��������       varchar(8000)      not null,
	����ʱ��       DATETIME           not null,
	�޸�ʱ��       DATETIME,
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
----------------���� (2018/9/23) -- ������ + �ս�ة
-----------------------------------------------------------------------------------
--ѧ����ѧ�ţ�
ALTER TABLE ѧ���� ADD CONSTRAINT pk_sid PRIMARY KEY (ѧ��);
--ѧ��_�γ̱��γ̺� + ѧ�ţ�
ALTER TABLE ѧ��_�γ̱� ADD CONSTRAINT pk_scid PRIMARY KEY (�γ̱��, ѧ��);
--�γ̱��γ̱�ţ�
ALTER TABLE �γ̱� ADD CONSTRAINT pk_cid PRIMARY KEY (�γ̱��);
--��ʦ����ʦ���ţ�
ALTER TABLE ��ʦ�� ADD CONSTRAINT pk_tid PRIMARY KEY (��ʦ����);
--��ʦ_�γ̱���ʦ���� + �γ̱�ţ�
ALTER TABLE ��ʦ_�γ̱� ADD CONSTRAINT pk_tcid PRIMARY KEY (��ʦ����, �γ̱��);
--��ʦ����������ţ�
ALTER TABLE ��ʦ����� ADD CONSTRAINT pk_tno PRIMARY KEY (������);
--ѧ������������ţ�
ALTER TABLE ѧ������� ADD CONSTRAINT pk_sno PRIMARY KEY (������);
--���ű����ű�ţ�
ALTER TABLE ���ű� ADD CONSTRAINT pk_news_no PRIMARY KEY (���ű��);
--����������ţ�
ALTER TABLE ����� ADD CONSTRAINT pk_notice_no PRIMARY KEY (������);
------------------------------------------------------------------------------------
---------------���  (2018/9/23)  --  ������ + �ս�ة
------------------------------------------------------------------------------------
--ѧ��_�γ̱�ѧ�ţ� -> ѧ����ѧ�ţ�
ALTER TABLE ѧ��_�γ̱� ADD CONSTRAINT fk_sc_sid FOREIGN KEY (ѧ��) REFERENCES ѧ����(ѧ��);
--ѧ��_�γ̱��γ̱�ţ� -> �γ̱��γ̱�ţ�
ALTER TABLE ѧ��_�γ̱� ADD CONSTRAINT fk_sc_cid FOREIGN KEY (�γ̱��) REFERENCES �γ̱�(�γ̱��);
--��ʦ_�γ̱��γ̱�ţ� -> �γ̱��γ̱�ţ�
ALTER TABLE ��ʦ_�γ̱� ADD CONSTRAINT fk_tc_cid FOREIGN KEY (�γ̱��) REFERENCES �γ̱�(�γ̱��);
--��ʦ_�γ̱���ʦ���ţ� -> ��ʦ����ʦ���ţ�
ALTER TABLE ��ʦ_�γ̱� ADD CONSTRAINT fk_tc_tid FOREIGN KEY (��ʦ����) REFERENCES ��ʦ��(��ʦ����);
--ѧ�������ѧ�ţ� -> ѧ����ѧ�ţ�
ALTER TABLE ѧ������� ADD CONSTRAINT fk_sno FOREIGN KEY (ѧ��) REFERENCES ѧ����(ѧ��);
--��ʦ�������ʦ���ţ� -> ��ʦ����ʦ���ţ�
ALTER TABLE ��ʦ����� ADD CONSTRAINT fk_tno FOREIGN KEY (��ʦ����) REFERENCES ��ʦ��(��ʦ����);
-----------------------------------------------------------------------------------
---------------Ĭ��ֵ  (2018/9/23)  --  ������ + �ս�ة
-----------------------------------------------------------------------------------
--ѧ����
ALTER TABLE ѧ���� ADD CONSTRAINT df_s_pwd DEFAULT '123456' for ����;
ALTER TABLE ѧ���� ADD CONSTRAINT df_s_nation DEFAULT '����' for ����;
ALTER TABLE ѧ���� ADD CONSTRAINT df_s_household DEFAULT '��ũ�廧��' for �������;
ALTER TABLE ѧ���� ADD CONSTRAINT df_s_married DEFAULT 'δ��' for �������;
ALTER TABLE ѧ���� ADD CONSTRAINT df_s_politicstatus DEFAULT '��Ա' for ������ò;
ALTER TABLE ѧ���� ADD CONSTRAINT df_s_hierarchy DEFAULT '����' for ѧϰ���;
--�γ̱�
ALTER TABLE �γ̱� ADD CONSTRAINT df_c_score DEFAULT 0 for �γ�ѧ��;
--��ʦ��
ALTER TABLE ��ʦ�� ADD CONSTRAINT df_t_pwd DEFAULT '123456' for ����;
ALTER TABLE ��ʦ�� ADD CONSTRAINT df_t_household DEFAULT '��ũ�廧��' for �������;
ALTER TABLE ��ʦ�� ADD CONSTRAINT df_t_politicstatus DEFAULT '��Ա' for ������ò;
ALTER TABLE ��ʦ�� ADD CONSTRAINT df_t_married DEFAULT '�ѻ�' for �������;
ALTER TABLE ��ʦ�� ADD CONSTRAINT df_t_nation DEFAULT '����' for ����;
ALTER TABLE ��ʦ�� ADD CONSTRAINT df_t_master DEFAULT '��' for �Ƿ�Ϊ������;
ALTER TABLE ��ʦ�� ADD CONSTRAINT df_t_class DEFAULT '��' for ����༶;
--����Ա��
ALTER TABLE ����Ա�� ADD CONSTRAINT df_sa_pwd DEFAULT '123456' for ����;
-----------------------------------------------------------------------------------
---------------Լ��    (2018/9/23)  -- ������ + �ս�ة
-----------------------------------------------------------------------------------
--ѧ����
ALTER TABLE ѧ���� ADD CONSTRAINT ck_s_sex CHECK (�Ա� IN('��','Ů','��תŮ','Ůת��','��Ůͬ��','δ����'));
ALTER TABLE ѧ���� ADD CONSTRAINT ck_s_household CHECK (������� IN ('ũ�廧��', '��ũ�廧��'));
ALTER TABLE ѧ���� ADD CONSTRAINT ck_s_married CHECK (������� IN ('�ѻ�', 'δ��'));
ALTER TABLE ѧ���� ADD CONSTRAINT ck_s_politicstatus CHECK (������ò IN ('Ⱥ��','�������ɳ�Ա','������Ա','�й���Ա'));
ALTER TABLE ѧ���� ADD CONSTRAINT ck_s_hierarchy CHECK (ѧϰ��� IN ('Сѧ','����','����','ר��','����','�о���','˶ʿ','��ʿ'));
--��ʦ��
ALTER TABLE ��ʦ�� ADD CONSTRAINT ck_t_household CHECK (������� IN ('ũ�廧��', '��ũ�廧��'));
ALTER TABLE ��ʦ�� ADD CONSTRAINT ck_t_politicstatus CHECK (������ò IN ('Ⱥ��','�������ɳ�Ա','������Ա','�й���Ա'));
ALTER TABLE ��ʦ�� ADD CONSTRAINT ck_t_married CHECK (������� IN ('�ѻ�', 'δ��'));
ALTER TABLE ��ʦ�� ADD CONSTRAINT ck_t_master CHECK (�Ƿ�Ϊ������ IN ('��', '��'));
--ѧ��_�γ̱�
ALTER TABLE ѧ��_�γ̱� ADD CONSTRAINT ck_sc_score CHECK (ѧ���ɼ� >= 0 and ѧ���ɼ� <= 100);
--�γ̱�
ALTER TABLE �γ̱� ADD CONSTRAINT ck_c_score CHECK (�γ�ѧ�� >= 0);
ALTER TABLE �γ̱� ADD CONSTRAINT ck_c_type CHECK (�γ���� in ('רѡ��', '���޿�', 'ѡ�޿�'));
--�γ�_ʱ���
ALTER TABLE �γ�_ʱ��� ADD CONSTRAINT ck_ct_term CHECK (�Ͽ�ѧ�� IN (1, 2));
--����Ա��
ALTER TABLE ����Ա�� ADD CONSTRAINT ck_a_object CHECK (������� IN ('ѧ��', '��ʦ'));