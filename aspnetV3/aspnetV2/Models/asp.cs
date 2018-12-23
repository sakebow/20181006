namespace aspnetV2.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class asp : DbContext
    {
        public asp()
            : base("name=asp3")
        {
        }

        public virtual DbSet<班级代码表> 班级代码表 { get; set; }
        public virtual DbSet<城市代码表> 城市代码表 { get; set; }
        public virtual DbSet<出版社代码表> 出版社代码表 { get; set; }
        public virtual DbSet<登录信息表> 登录信息表 { get; set; }
        public virtual DbSet<冻结等级代码表> 冻结等级代码表 { get; set; }
        public virtual DbSet<冻结记录表> 冻结记录表 { get; set; }
        public virtual DbSet<管理员表> 管理员表 { get; set; }
        public virtual DbSet<国家代码表> 国家代码表 { get; set; }
        public virtual DbSet<户籍代码表> 户籍代码表 { get; set; }
        public virtual DbSet<婚配代码表> 婚配代码表 { get; set; }
        public virtual DbSet<教材代码表> 教材代码表 { get; set; }
        public virtual DbSet<教师表> 教师表 { get; set; }
        public virtual DbSet<教室代码表> 教室代码表 { get; set; }
        public virtual DbSet<教室占用表> 教室占用表 { get; set; }
        public virtual DbSet<街道代码表> 街道代码表 { get; set; }
        public virtual DbSet<课程代码表> 课程代码表 { get; set; }
        public virtual DbSet<课程类型代码表> 课程类型代码表 { get; set; }
        public virtual DbSet<密码表> 密码表 { get; set; }
        public virtual DbSet<民族代码表> 民族代码表 { get; set; }
        public virtual DbSet<区县代码表> 区县代码表 { get; set; }
        public virtual DbSet<上课时间地点对照表> 上课时间地点对照表 { get; set; }
        public virtual DbSet<上课时间段代码表> 上课时间段代码表 { get; set; }
        public virtual DbSet<申请表> 申请表 { get; set; }
        public virtual DbSet<申请材料表> 申请材料表 { get; set; }
        public virtual DbSet<申请等级代码表> 申请等级代码表 { get; set; }
        public virtual DbSet<身份代码表> 身份代码表 { get; set; }
        public virtual DbSet<身份证类别代码表> 身份证类别代码表 { get; set; }
        public virtual DbSet<审核状态代码表> 审核状态代码表 { get; set; }
        public virtual DbSet<省份代码表> 省份代码表 { get; set; }
        public virtual DbSet<文件类型代码表> 文件类型代码表 { get; set; }
        public virtual DbSet<新闻公告表> 新闻公告表 { get; set; }
        public virtual DbSet<性别代码表> 性别代码表 { get; set; }
        public virtual DbSet<选择课程表> 选择课程表 { get; set; }
        public virtual DbSet<学科门类代码表> 学科门类代码表 { get; set; }
        public virtual DbSet<学生表> 学生表 { get; set; }
        public virtual DbSet<学生选课表> 学生选课表 { get; set; }
        public virtual DbSet<学位代码表> 学位代码表 { get; set; }
        public virtual DbSet<学习层次代码表> 学习层次代码表 { get; set; }
        public virtual DbSet<学校代码表> 学校代码表 { get; set; }
        public virtual DbSet<邮政编码代码表> 邮政编码代码表 { get; set; }
        public virtual DbSet<院系代码表> 院系代码表 { get; set; }
        public virtual DbSet<政治面貌代码表> 政治面貌代码表 { get; set; }
        public virtual DbSet<专业代码表> 专业代码表 { get; set; }
        public virtual DbSet<专业类别代码表> 专业类别代码表 { get; set; }
        public virtual DbSet<登陆验证视图> 登陆验证视图 { get; set; }
        public virtual DbSet<登录信息视图> 登录信息视图 { get; set; }
        public virtual DbSet<冻结时间详细日志视图> 冻结时间详细日志视图 { get; set; }
        public virtual DbSet<公告视图> 公告视图 { get; set; }
        public virtual DbSet<管理员视图> 管理员视图 { get; set; }
        public virtual DbSet<教师申请视图> 教师申请视图 { get; set; }
        public virtual DbSet<教师详细信息视图> 教师详细信息视图 { get; set; }
        public virtual DbSet<全部课程教材对照视图> 全部课程教材对照视图 { get; set; }
        public virtual DbSet<详细地址关联视图> 详细地址关联视图 { get; set; }
        public virtual DbSet<新闻视图> 新闻视图 { get; set; }
        public virtual DbSet<选课视图> 选课视图 { get; set; }
        public virtual DbSet<学生申请视图> 学生申请视图 { get; set; }
        public virtual DbSet<学生详细信息视图> 学生详细信息视图 { get; set; }
        public virtual DbSet<学校_院系_专业对照视图> 学校_院系_专业对照视图 { get; set; }
        public virtual DbSet<已选课程信息> 已选课程信息 { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<班级代码表>()
                .Property(e => e.班级代码)
                .IsUnicode(false);

            modelBuilder.Entity<班级代码表>()
                .Property(e => e.班级名称)
                .IsUnicode(false);

            modelBuilder.Entity<班级代码表>()
                .Property(e => e.所在专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<班级代码表>()
                .Property(e => e.班级罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<班级代码表>()
                .Property(e => e.班级罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<班级代码表>()
                .Property(e => e.班级英文名称)
                .IsUnicode(false);

            modelBuilder.Entity<班级代码表>()
                .Property(e => e.班级英文名称大写)
                .IsUnicode(false);

            modelBuilder.Entity<班级代码表>()
                .Property(e => e.班级英文名称小写)
                .IsUnicode(false);

            modelBuilder.Entity<班级代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级代码表>()
                .HasMany(e => e.学生表)
                .WithOptional(e => e.班级代码表)
                .HasForeignKey(e => e.所在班级代码);

            modelBuilder.Entity<城市代码表>()
                .Property(e => e.城市代码)
                .IsUnicode(false);

            modelBuilder.Entity<城市代码表>()
                .Property(e => e.城市名称)
                .IsUnicode(false);

            modelBuilder.Entity<城市代码表>()
                .Property(e => e.城市罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<城市代码表>()
                .Property(e => e.城市罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<城市代码表>()
                .Property(e => e.所在省份代码)
                .IsUnicode(false);

            modelBuilder.Entity<城市代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<城市代码表>()
                .HasMany(e => e.出版社代码表)
                .WithOptional(e => e.城市代码表)
                .HasForeignKey(e => e.出版社所在城市);

            modelBuilder.Entity<城市代码表>()
                .HasMany(e => e.区县代码表)
                .WithRequired(e => e.城市代码表)
                .HasForeignKey(e => e.所在城市代码)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<城市代码表>()
                .HasMany(e => e.学校代码表)
                .WithOptional(e => e.城市代码表)
                .HasForeignKey(e => e.所在城市代码);

            modelBuilder.Entity<出版社代码表>()
                .Property(e => e.出版社代码)
                .IsUnicode(false);

            modelBuilder.Entity<出版社代码表>()
                .Property(e => e.出版社名称)
                .IsUnicode(false);

            modelBuilder.Entity<出版社代码表>()
                .Property(e => e.出版社所在省份)
                .IsUnicode(false);

            modelBuilder.Entity<出版社代码表>()
                .Property(e => e.出版社所在城市)
                .IsUnicode(false);

            modelBuilder.Entity<出版社代码表>()
                .Property(e => e.出版社所在区县)
                .IsUnicode(false);

            modelBuilder.Entity<出版社代码表>()
                .Property(e => e.出版社所在街道)
                .IsUnicode(false);

            modelBuilder.Entity<出版社代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登录信息表>()
                .Property(e => e.账号)
                .IsUnicode(false);

            modelBuilder.Entity<登录信息表>()
                .Property(e => e.设备ID)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登录信息表>()
                .Property(e => e.移动设备PIN)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登录信息表>()
                .Property(e => e.账号是否被冻结)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登录信息表>()
                .Property(e => e.冻结等级)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<冻结等级代码表>()
                .Property(e => e.冻结等级)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<冻结等级代码表>()
                .Property(e => e.等级描述)
                .IsUnicode(false);

            modelBuilder.Entity<冻结等级代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<冻结等级代码表>()
                .HasMany(e => e.冻结记录表)
                .WithRequired(e => e.冻结等级代码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<冻结记录表>()
                .Property(e => e.账号)
                .IsUnicode(false);

            modelBuilder.Entity<冻结记录表>()
                .Property(e => e.冻结等级)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.账号)
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.管理对象代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.所属学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.所属院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.所属专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.国家代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.省份代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.城市代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.区县代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.性别代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.姓名)
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.身份证类别代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.身份证号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<国家代码表>()
                .Property(e => e.国家代码)
                .IsUnicode(false);

            modelBuilder.Entity<国家代码表>()
                .Property(e => e.国家名称)
                .IsUnicode(false);

            modelBuilder.Entity<国家代码表>()
                .Property(e => e.国家罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<国家代码表>()
                .Property(e => e.国家罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<国家代码表>()
                .Property(e => e.国家英文缩写)
                .IsUnicode(false);

            modelBuilder.Entity<国家代码表>()
                .Property(e => e.所在洲代码)
                .IsUnicode(false);

            modelBuilder.Entity<国家代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<国家代码表>()
                .HasMany(e => e.省份代码表)
                .WithRequired(e => e.国家代码表)
                .HasForeignKey(e => e.所在国家代码)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<户籍代码表>()
                .Property(e => e.户籍代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<户籍代码表>()
                .Property(e => e.户籍名称)
                .IsUnicode(false);

            modelBuilder.Entity<户籍代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<婚配代码表>()
                .Property(e => e.婚配代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<婚配代码表>()
                .Property(e => e.婚配情况)
                .IsUnicode(false);

            modelBuilder.Entity<婚配代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教材代码表>()
                .Property(e => e.教材代码)
                .IsUnicode(false);

            modelBuilder.Entity<教材代码表>()
                .Property(e => e.教材名称)
                .IsUnicode(false);

            modelBuilder.Entity<教材代码表>()
                .Property(e => e.教材价格)
                .HasPrecision(10, 2);

            modelBuilder.Entity<教材代码表>()
                .Property(e => e.出版社代码)
                .IsUnicode(false);

            modelBuilder.Entity<教材代码表>()
                .Property(e => e.教材图片路径)
                .IsUnicode(false);

            modelBuilder.Entity<教材代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.教师工号)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.教师姓名)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.身份证类别代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.身份证号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.性别代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.民族代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.学习层次代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.证件照路径)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.个人简介文档路径)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.国家代码)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.省份代码)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.城市代码)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.区县代码)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.街道代码)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.婚配代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.户籍代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.邮政编码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.政治面貌代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.联系电话)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.电子邮箱)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.QQ号码)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.密保问题)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.密保问题答案)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.所在学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.所在院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .HasMany(e => e.选择课程表)
                .WithRequired(e => e.教师表)
                .HasForeignKey(e => e.授课教师账号)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<教师表>()
                .HasMany(e => e.学位代码表)
                .WithMany(e => e.教师表)
                .Map(m => m.ToTable("教师_学位对照表").MapLeftKey("教师工号").MapRightKey("学位代码"));

            modelBuilder.Entity<教室代码表>()
                .Property(e => e.教室代码)
                .IsUnicode(false);

            modelBuilder.Entity<教室代码表>()
                .Property(e => e.教室名称)
                .IsUnicode(false);

            modelBuilder.Entity<教室代码表>()
                .Property(e => e.所在学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<教室代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教室代码表>()
                .HasOptional(e => e.教室占用表)
                .WithRequired(e => e.教室代码表);

            modelBuilder.Entity<教室代码表>()
                .HasMany(e => e.上课时间地点对照表)
                .WithRequired(e => e.教室代码表)
                .HasForeignKey(e => e.上课地点代码)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<教室占用表>()
                .Property(e => e.教室代码)
                .IsUnicode(false);

            modelBuilder.Entity<教室占用表>()
                .Property(e => e.是否占用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教室占用表>()
                .Property(e => e.占用理由)
                .IsUnicode(false);

            modelBuilder.Entity<教室占用表>()
                .Property(e => e.负责人账号)
                .IsUnicode(false);

            modelBuilder.Entity<教室占用表>()
                .Property(e => e.联系方式)
                .IsUnicode(false);

            modelBuilder.Entity<街道代码表>()
                .Property(e => e.街道代码)
                .IsUnicode(false);

            modelBuilder.Entity<街道代码表>()
                .Property(e => e.街道名称)
                .IsUnicode(false);

            modelBuilder.Entity<街道代码表>()
                .Property(e => e.街道罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<街道代码表>()
                .Property(e => e.街道罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<街道代码表>()
                .Property(e => e.所在区县代码)
                .IsUnicode(false);

            modelBuilder.Entity<街道代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<街道代码表>()
                .HasMany(e => e.出版社代码表)
                .WithOptional(e => e.街道代码表)
                .HasForeignKey(e => e.出版社所在街道);

            modelBuilder.Entity<街道代码表>()
                .HasMany(e => e.学校代码表)
                .WithOptional(e => e.街道代码表)
                .HasForeignKey(e => e.所在街道代码);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.课程代码)
                .IsUnicode(false);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.课程名称)
                .IsUnicode(false);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.课程学分)
                .HasPrecision(10, 2);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.课程类型代码)
                .IsUnicode(false);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.课程简介文档路径)
                .IsUnicode(false);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.教材代码)
                .IsUnicode(false);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.所属学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.所属院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.所属专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<课程代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程代码表>()
                .HasMany(e => e.选择课程表)
                .WithRequired(e => e.课程代码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<课程类型代码表>()
                .Property(e => e.课程类型代码)
                .IsUnicode(false);

            modelBuilder.Entity<课程类型代码表>()
                .Property(e => e.课程类型)
                .IsUnicode(false);

            modelBuilder.Entity<课程类型代码表>()
                .HasMany(e => e.课程代码表)
                .WithRequired(e => e.课程类型代码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<密码表>()
                .Property(e => e.账号)
                .IsUnicode(false);

            modelBuilder.Entity<密码表>()
                .Property(e => e.密码)
                .IsUnicode(false);

            modelBuilder.Entity<密码表>()
                .HasOptional(e => e.登录信息表)
                .WithRequired(e => e.密码表);

            modelBuilder.Entity<密码表>()
                .HasOptional(e => e.冻结记录表)
                .WithRequired(e => e.密码表);

            modelBuilder.Entity<密码表>()
                .HasOptional(e => e.管理员表)
                .WithRequired(e => e.密码表);

            modelBuilder.Entity<密码表>()
                .HasMany(e => e.教室占用表)
                .WithOptional(e => e.密码表)
                .HasForeignKey(e => e.负责人账号);

            modelBuilder.Entity<密码表>()
                .HasMany(e => e.申请表)
                .WithRequired(e => e.密码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<密码表>()
                .HasOptional(e => e.学生表)
                .WithRequired(e => e.密码表);

            modelBuilder.Entity<密码表>()
                .HasMany(e => e.身份代码表)
                .WithMany(e => e.密码表)
                .Map(m => m.ToTable("身份对照表").MapLeftKey("账号").MapRightKey("身份代码"));

            modelBuilder.Entity<民族代码表>()
                .Property(e => e.民族代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<民族代码表>()
                .Property(e => e.民族名称)
                .IsUnicode(false);

            modelBuilder.Entity<民族代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<区县代码表>()
                .Property(e => e.区县代码)
                .IsUnicode(false);

            modelBuilder.Entity<区县代码表>()
                .Property(e => e.区县名称)
                .IsUnicode(false);

            modelBuilder.Entity<区县代码表>()
                .Property(e => e.区县罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<区县代码表>()
                .Property(e => e.区县罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<区县代码表>()
                .Property(e => e.所在城市代码)
                .IsUnicode(false);

            modelBuilder.Entity<区县代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<区县代码表>()
                .HasMany(e => e.出版社代码表)
                .WithOptional(e => e.区县代码表)
                .HasForeignKey(e => e.出版社所在区县);

            modelBuilder.Entity<区县代码表>()
                .HasMany(e => e.街道代码表)
                .WithRequired(e => e.区县代码表)
                .HasForeignKey(e => e.所在区县代码)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<区县代码表>()
                .HasMany(e => e.学校代码表)
                .WithOptional(e => e.区县代码表)
                .HasForeignKey(e => e.所在区县代码);

            modelBuilder.Entity<上课时间地点对照表>()
                .Property(e => e.上课时间段代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<上课时间地点对照表>()
                .Property(e => e.上课地点代码)
                .IsUnicode(false);

            modelBuilder.Entity<上课时间段代码表>()
                .Property(e => e.上课时间段代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<上课时间段代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<上课时间段代码表>()
                .HasMany(e => e.上课时间地点对照表)
                .WithRequired(e => e.上课时间段代码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<申请表>()
                .Property(e => e.账号)
                .IsUnicode(false);

            modelBuilder.Entity<申请表>()
                .Property(e => e.申请标题)
                .IsUnicode(false);

            modelBuilder.Entity<申请表>()
                .Property(e => e.申请概述)
                .IsUnicode(false);

            modelBuilder.Entity<申请表>()
                .Property(e => e.申请等级代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<申请表>()
                .Property(e => e.是否需要材料)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<申请表>()
                .Property(e => e.审核状态代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<申请表>()
                .HasOptional(e => e.申请材料表)
                .WithRequired(e => e.申请表);

            modelBuilder.Entity<申请材料表>()
                .Property(e => e.申请材料文件路径)
                .IsUnicode(false);

            modelBuilder.Entity<申请等级代码表>()
                .Property(e => e.申请等级代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<申请等级代码表>()
                .Property(e => e.申请等级)
                .IsUnicode(false);

            modelBuilder.Entity<申请等级代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<身份代码表>()
                .Property(e => e.身份代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<身份代码表>()
                .Property(e => e.身份名称)
                .IsUnicode(false);

            modelBuilder.Entity<身份代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<身份代码表>()
                .HasMany(e => e.管理员表)
                .WithOptional(e => e.身份代码表)
                .HasForeignKey(e => e.管理对象代码);

            modelBuilder.Entity<身份证类别代码表>()
                .Property(e => e.身份证类别代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<身份证类别代码表>()
                .Property(e => e.身份证类别名称)
                .IsUnicode(false);

            modelBuilder.Entity<身份证类别代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<身份证类别代码表>()
                .HasMany(e => e.教师表)
                .WithRequired(e => e.身份证类别代码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<身份证类别代码表>()
                .HasMany(e => e.学生表)
                .WithRequired(e => e.身份证类别代码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<审核状态代码表>()
                .Property(e => e.审核状态代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<审核状态代码表>()
                .Property(e => e.审核状态)
                .IsUnicode(false);

            modelBuilder.Entity<审核状态代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<省份代码表>()
                .Property(e => e.省份代码)
                .IsUnicode(false);

            modelBuilder.Entity<省份代码表>()
                .Property(e => e.省份名称)
                .IsUnicode(false);

            modelBuilder.Entity<省份代码表>()
                .Property(e => e.省份罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<省份代码表>()
                .Property(e => e.省份罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<省份代码表>()
                .Property(e => e.所在国家代码)
                .IsUnicode(false);

            modelBuilder.Entity<省份代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<省份代码表>()
                .HasMany(e => e.城市代码表)
                .WithRequired(e => e.省份代码表)
                .HasForeignKey(e => e.所在省份代码)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<省份代码表>()
                .HasMany(e => e.出版社代码表)
                .WithOptional(e => e.省份代码表)
                .HasForeignKey(e => e.出版社所在省份);

            modelBuilder.Entity<省份代码表>()
                .HasMany(e => e.学校代码表)
                .WithOptional(e => e.省份代码表)
                .HasForeignKey(e => e.所在省份代码);

            modelBuilder.Entity<文件类型代码表>()
                .Property(e => e.文件类型代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<文件类型代码表>()
                .Property(e => e.文件类型名称)
                .IsUnicode(false);

            modelBuilder.Entity<文件类型代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<文件类型代码表>()
                .HasMany(e => e.新闻公告表)
                .WithRequired(e => e.文件类型代码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<新闻公告表>()
                .Property(e => e.标题)
                .IsUnicode(false);

            modelBuilder.Entity<新闻公告表>()
                .Property(e => e.文件路径)
                .IsUnicode(false);

            modelBuilder.Entity<新闻公告表>()
                .Property(e => e.简介)
                .IsUnicode(false);

            modelBuilder.Entity<新闻公告表>()
                .Property(e => e.文件类型代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻公告表>()
                .Property(e => e.是否外部展示)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<性别代码表>()
                .Property(e => e.性别代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<性别代码表>()
                .Property(e => e.性别)
                .IsUnicode(false);

            modelBuilder.Entity<性别代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<性别代码表>()
                .HasMany(e => e.教师表)
                .WithRequired(e => e.性别代码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<性别代码表>()
                .HasMany(e => e.学生表)
                .WithRequired(e => e.性别代码表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<选择课程表>()
                .Property(e => e.选课代码)
                .IsUnicode(false);

            modelBuilder.Entity<选择课程表>()
                .Property(e => e.课程代码)
                .IsUnicode(false);

            modelBuilder.Entity<选择课程表>()
                .Property(e => e.授课教师账号)
                .IsUnicode(false);

            modelBuilder.Entity<选择课程表>()
                .Property(e => e.所属学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<选择课程表>()
                .Property(e => e.所属院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<选择课程表>()
                .Property(e => e.班级名称)
                .IsUnicode(false);

            modelBuilder.Entity<选择课程表>()
                .Property(e => e.班级代码)
                .IsUnicode(false);

            modelBuilder.Entity<选择课程表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<选择课程表>()
                .HasMany(e => e.学生选课表)
                .WithRequired(e => e.选择课程表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<学科门类代码表>()
                .Property(e => e.学科门类代码)
                .IsUnicode(false);

            modelBuilder.Entity<学科门类代码表>()
                .Property(e => e.学科门类)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.学生学号)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.学生姓名)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.身份证类别代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.身份证号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.性别代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.民族代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.证件照片路径)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.国家代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.省份代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.城市代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.区县代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.街道代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.学习层次代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.是否双学位)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.是否转专业)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.所在学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.所在院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.所在专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.所在班级代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.婚配代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.户籍代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.邮政编码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.政治面貌代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.联系电话)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.电子邮箱)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.QQ号码)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.密保问题)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.密保问题答案)
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .HasMany(e => e.学生选课表)
                .WithRequired(e => e.学生表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<学生选课表>()
                .Property(e => e.选课代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生选课表>()
                .Property(e => e.学生学号)
                .IsUnicode(false);

            modelBuilder.Entity<学生选课表>()
                .Property(e => e.学生平时成绩)
                .HasPrecision(10, 2);

            modelBuilder.Entity<学生选课表>()
                .Property(e => e.学生期中成绩)
                .HasPrecision(10, 2);

            modelBuilder.Entity<学生选课表>()
                .Property(e => e.学生期末成绩)
                .HasPrecision(10, 2);

            modelBuilder.Entity<学生选课表>()
                .Property(e => e.学生总成绩)
                .HasPrecision(10, 2);

            modelBuilder.Entity<学生选课表>()
                .Property(e => e.学生期末试卷路径)
                .IsUnicode(false);

            modelBuilder.Entity<学位代码表>()
                .Property(e => e.学位代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学位代码表>()
                .Property(e => e.学位名称)
                .IsUnicode(false);

            modelBuilder.Entity<学习层次代码表>()
                .Property(e => e.学习层次代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学习层次代码表>()
                .Property(e => e.学习层次)
                .IsUnicode(false);

            modelBuilder.Entity<学习层次代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.学校名称)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.所在省份代码)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.所在城市代码)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.所在区县代码)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.所在街道代码)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.学校英文名称)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.学校英文名称大写)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.学校英文名称小写)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.学校罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.学校罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学校代码表>()
                .HasMany(e => e.管理员表)
                .WithOptional(e => e.学校代码表)
                .HasForeignKey(e => e.所属学校代码);

            modelBuilder.Entity<学校代码表>()
                .HasMany(e => e.教师表)
                .WithOptional(e => e.学校代码表)
                .HasForeignKey(e => e.所在学校代码);

            modelBuilder.Entity<学校代码表>()
                .HasMany(e => e.教室代码表)
                .WithRequired(e => e.学校代码表)
                .HasForeignKey(e => e.所在学校代码)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<学校代码表>()
                .HasMany(e => e.课程代码表)
                .WithOptional(e => e.学校代码表)
                .HasForeignKey(e => e.所属学校代码);

            modelBuilder.Entity<学校代码表>()
                .HasMany(e => e.选择课程表)
                .WithOptional(e => e.学校代码表)
                .HasForeignKey(e => e.所属学校代码);

            modelBuilder.Entity<学校代码表>()
                .HasMany(e => e.学生表)
                .WithOptional(e => e.学校代码表)
                .HasForeignKey(e => e.所在学校代码);

            modelBuilder.Entity<学校代码表>()
                .HasMany(e => e.院系代码表)
                .WithRequired(e => e.学校代码表)
                .HasForeignKey(e => e.所在学校代码)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<邮政编码代码表>()
                .Property(e => e.邮政编码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<邮政编码代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .Property(e => e.院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .Property(e => e.院系名称)
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .Property(e => e.所在学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .Property(e => e.院系罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .Property(e => e.院系罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .Property(e => e.院系英文名称)
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .Property(e => e.院系英文名称大写)
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .Property(e => e.院系英文名称小写)
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<院系代码表>()
                .HasMany(e => e.管理员表)
                .WithOptional(e => e.院系代码表)
                .HasForeignKey(e => e.所属院系代码);

            modelBuilder.Entity<院系代码表>()
                .HasMany(e => e.教师表)
                .WithOptional(e => e.院系代码表)
                .HasForeignKey(e => e.所在院系代码);

            modelBuilder.Entity<院系代码表>()
                .HasMany(e => e.课程代码表)
                .WithOptional(e => e.院系代码表)
                .HasForeignKey(e => e.所属院系代码);

            modelBuilder.Entity<院系代码表>()
                .HasMany(e => e.选择课程表)
                .WithOptional(e => e.院系代码表)
                .HasForeignKey(e => e.所属院系代码);

            modelBuilder.Entity<院系代码表>()
                .HasMany(e => e.学生表)
                .WithOptional(e => e.院系代码表)
                .HasForeignKey(e => e.所在院系代码);

            modelBuilder.Entity<院系代码表>()
                .HasMany(e => e.专业代码表)
                .WithRequired(e => e.院系代码表)
                .HasForeignKey(e => e.所在院系代码)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<政治面貌代码表>()
                .Property(e => e.政治面貌代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<政治面貌代码表>()
                .Property(e => e.政治面貌类型)
                .IsUnicode(false);

            modelBuilder.Entity<政治面貌代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.专业名称)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.学科门类代码)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.专业类别代码)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.所在院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.专业罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.专业罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.专业英文名称)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.专业英文名称大写)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.专业英文名称小写)
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<专业代码表>()
                .HasMany(e => e.班级代码表)
                .WithRequired(e => e.专业代码表)
                .HasForeignKey(e => e.所在专业代码)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<专业代码表>()
                .HasMany(e => e.管理员表)
                .WithOptional(e => e.专业代码表)
                .HasForeignKey(e => e.所属专业代码);

            modelBuilder.Entity<专业代码表>()
                .HasMany(e => e.课程代码表)
                .WithOptional(e => e.专业代码表)
                .HasForeignKey(e => e.所属专业代码);

            modelBuilder.Entity<专业代码表>()
                .HasMany(e => e.学生表)
                .WithOptional(e => e.专业代码表)
                .HasForeignKey(e => e.所在专业代码);

            modelBuilder.Entity<专业类别代码表>()
                .Property(e => e.专业类别代码)
                .IsUnicode(false);

            modelBuilder.Entity<专业类别代码表>()
                .Property(e => e.专业类别)
                .IsUnicode(false);

            modelBuilder.Entity<登陆验证视图>()
                .Property(e => e.账号)
                .IsUnicode(false);

            modelBuilder.Entity<登陆验证视图>()
                .Property(e => e.密码)
                .IsUnicode(false);

            modelBuilder.Entity<登陆验证视图>()
                .Property(e => e.身份代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登陆验证视图>()
                .Property(e => e.身份名称)
                .IsUnicode(false);

            modelBuilder.Entity<登录信息视图>()
                .Property(e => e.账号)
                .IsUnicode(false);

            modelBuilder.Entity<登录信息视图>()
                .Property(e => e.设备ID)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登录信息视图>()
                .Property(e => e.移动设备PIN)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登录信息视图>()
                .Property(e => e.账号是否被冻结)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登录信息视图>()
                .Property(e => e.冻结等级)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登录信息视图>()
                .Property(e => e.身份代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<登录信息视图>()
                .Property(e => e.身份名称)
                .IsUnicode(false);

            modelBuilder.Entity<冻结时间详细日志视图>()
                .Property(e => e.账号)
                .IsUnicode(false);

            modelBuilder.Entity<冻结时间详细日志视图>()
                .Property(e => e.设备ID)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<冻结时间详细日志视图>()
                .Property(e => e.移动设备PIN)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告视图>()
                .Property(e => e.标题)
                .IsUnicode(false);

            modelBuilder.Entity<公告视图>()
                .Property(e => e.简介)
                .IsUnicode(false);

            modelBuilder.Entity<公告视图>()
                .Property(e => e.文件路径)
                .IsUnicode(false);

            modelBuilder.Entity<公告视图>()
                .Property(e => e.文件类型名称)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.账号)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.管理对象代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.姓名)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.国家代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.国家名称)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.省份代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.省份名称)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.城市代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.城市名称)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.区县代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.区县名称)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.学校名称)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.院系名称)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.专业名称)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.性别代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.性别)
                .IsUnicode(false);

            modelBuilder.Entity<管理员视图>()
                .Property(e => e.密码)
                .IsUnicode(false);

            modelBuilder.Entity<教师申请视图>()
                .Property(e => e.申请标题)
                .IsUnicode(false);

            modelBuilder.Entity<教师申请视图>()
                .Property(e => e.申请概述)
                .IsUnicode(false);

            modelBuilder.Entity<教师申请视图>()
                .Property(e => e.是否需要材料)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请视图>()
                .Property(e => e.审核状态)
                .IsUnicode(false);

            modelBuilder.Entity<教师申请视图>()
                .Property(e => e.申请等级)
                .IsUnicode(false);

            modelBuilder.Entity<教师申请视图>()
                .Property(e => e.身份名称)
                .IsUnicode(false);

            modelBuilder.Entity<教师申请视图>()
                .Property(e => e.身份代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.教师工号)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.教师姓名)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.身份证类别名称)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.身份证号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.性别)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.证件照路径)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.个人简介文档路径)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.学习层次)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.婚配情况)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.国家名称)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.省份名称)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.城市名称)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.区县名称)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.联系电话)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.QQ号码)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.户籍名称)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.邮政编码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.政治面貌类型)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.密保问题)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.密保问题答案)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.电子邮箱)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.学校名称)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.院系名称)
                .IsUnicode(false);

            modelBuilder.Entity<教师详细信息视图>()
                .Property(e => e.密码)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.课程代码)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.课程名称)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.课程学分)
                .HasPrecision(10, 2);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.课程简介文档路径)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.课程类型代码)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.所属学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.所属院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.所属专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.教材代码)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.教材名称)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.教材价格)
                .HasPrecision(10, 2);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.出版社名称)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.教材图片路径)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.课程类型)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.院系名称)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.学校名称)
                .IsUnicode(false);

            modelBuilder.Entity<全部课程教材对照视图>()
                .Property(e => e.专业名称)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.省份代码)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.省份罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.省份罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.省份名称)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.城市代码)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.城市罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.城市罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.城市名称)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.区县代码)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.区县罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.区县罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<详细地址关联视图>()
                .Property(e => e.区县名称)
                .IsUnicode(false);

            modelBuilder.Entity<新闻视图>()
                .Property(e => e.标题)
                .IsUnicode(false);

            modelBuilder.Entity<新闻视图>()
                .Property(e => e.简介)
                .IsUnicode(false);

            modelBuilder.Entity<新闻视图>()
                .Property(e => e.文件路径)
                .IsUnicode(false);

            modelBuilder.Entity<新闻视图>()
                .Property(e => e.文件类型名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.课程代码)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.授课教师账号)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.所属学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.所属院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.选课代码)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.课程类型代码)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.课程类型)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.教材代码)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.教材名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.教材价格)
                .HasPrecision(10, 2);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.出版社名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.课程学分)
                .HasPrecision(10, 2);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.教材图片路径)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.课程简介文档路径)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.学校名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.院系名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.QQ号码)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.电子邮箱)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.个人简介文档路径)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.教师工号)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.教师姓名)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.联系电话)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.性别)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.学习层次)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.教师所在学校)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.教师所在院系)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.证件照路径)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.国家名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.省份名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.区县名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.城市名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.班级代码)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.班级名称)
                .IsUnicode(false);

            modelBuilder.Entity<选课视图>()
                .Property(e => e.课程名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生申请视图>()
                .Property(e => e.申请标题)
                .IsUnicode(false);

            modelBuilder.Entity<学生申请视图>()
                .Property(e => e.申请概述)
                .IsUnicode(false);

            modelBuilder.Entity<学生申请视图>()
                .Property(e => e.是否需要材料)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生申请视图>()
                .Property(e => e.审核状态)
                .IsUnicode(false);

            modelBuilder.Entity<学生申请视图>()
                .Property(e => e.申请等级)
                .IsUnicode(false);

            modelBuilder.Entity<学生申请视图>()
                .Property(e => e.身份名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生申请视图>()
                .Property(e => e.身份代码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.学生学号)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.学生姓名)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.身份证类别名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.身份证号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.性别)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.证件照片路径)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.学校名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.专业名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.国家名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.省份名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.城市名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.区县名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.学习层次)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.是否双学位)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.是否转专业)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.电子邮箱)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.院系名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.婚配情况)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.户籍名称)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.密码)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.邮政编码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.政治面貌类型)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.联系电话)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.QQ号码)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.密保问题)
                .IsUnicode(false);

            modelBuilder.Entity<学生详细信息视图>()
                .Property(e => e.密保问题答案)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.学校名称)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.学校英文名称)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.学校英文名称大写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.学校英文名称小写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.学校罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.学校罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.院系名称)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.院系英文名称)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.院系英文名称大写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.院系英文名称小写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.院系罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.院系罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.专业名称)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.专业英文名称)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.专业英文名称大写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.专业英文名称小写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.专业罗马拼音大写)
                .IsUnicode(false);

            modelBuilder.Entity<学校_院系_专业对照视图>()
                .Property(e => e.专业罗马拼音小写)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师QQ)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.出版社名称)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师电子邮箱)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师工号)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师国籍)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教材代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教材价格)
                .HasPrecision(10, 2);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教材名称)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教材图片路径)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师所在学校)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师所在院系)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师姓名)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程简介文档路径)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程类型)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程类型代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程学分)
                .HasPrecision(10, 2);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师电话)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.区县名称)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.省份名称)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程所属学校)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程所属院系)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.是否启用)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.授课教师账号)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程所属学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程所属院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师性别)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师简介)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.选课代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师学习层次)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.教师证件照路径)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.是否双学位)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生姓名)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生学号)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生QQ)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生联系电话)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生电子邮箱)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生证件照路径)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生性别)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生所属学校代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生所属学校)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生所属院系代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生所属院系)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生所属专业代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.学生所属专业名称)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.班级代码)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.班级名称)
                .IsUnicode(false);

            modelBuilder.Entity<已选课程信息>()
                .Property(e => e.课程名称)
                .IsUnicode(false);
        }
    }
}
