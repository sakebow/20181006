namespace aspnet.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Teacher : DbContext
    {
        public Teacher()
            : base("name=Teacher")
        {
        }

        public virtual DbSet<公告表> 公告表 { get; set; }
        public virtual DbSet<教师_课程表> 教师_课程表 { get; set; }
        public virtual DbSet<教师表> 教师表 { get; set; }
        public virtual DbSet<教师申请表> 教师申请表 { get; set; }
        public virtual DbSet<课程表> 课程表 { get; set; }
        public virtual DbSet<新闻表> 新闻表 { get; set; }
        public virtual DbSet<学生表> 学生表 { get; set; }
        public virtual DbSet<班级信息> 班级信息 { get; set; }
        public virtual DbSet<学生个人成绩> 学生个人成绩 { get; set; }
        public virtual DbSet<学生平均成绩> 学生平均成绩 { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<公告表>()
                .Property(e => e.公告标题)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.公告内容)
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate11)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate12)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate13)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate14)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate15)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.教师工号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.所在教室)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师_课程表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.教师工号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.姓名)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.密码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.性别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.户口类别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.政治面貌)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.婚配情况)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.学位)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.毕业院校)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.简介)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.民族)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.是否为班主任)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.管理班级)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate11)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate12)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate13)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate14)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .Property(e => e.obligate15)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师表>()
                .HasMany(e => e.教师_课程表)
                .WithRequired(e => e.教师表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<教师表>()
                .HasMany(e => e.教师申请表)
                .WithRequired(e => e.教师表)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.教师工号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.申请标题)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.申请内容)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.申请类别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<教师申请表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.课程名称)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.课程学分)
                .HasPrecision(10, 2);

            modelBuilder.Entity<课程表>()
                .Property(e => e.课程简介)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.教材图片路径)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.教材出版社)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.课程类别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);

            //modelBuilder.Entity<课程表>()
            //    .HasMany(e => e.教师_课程表)
            //    .WithRequired(e => e.课程表)
            //    .WillCascadeOnDelete(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.新闻标题)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.新闻内容)
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate11)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate12)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate13)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate14)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate15)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.姓名)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.性别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.学号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.学院)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.班级)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.身份证号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.密码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.民族)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.籍贯)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.户口类别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.家庭现住址)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.邮政编码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.婚配情况)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.政治面貌)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.学习层次)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.专业方向)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.毕业证书号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.学士证书号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.证件照路径)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate11)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate12)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate13)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate14)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生表>()
                .Property(e => e.obligate15)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.学生姓名)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.学号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.学生性别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.学院)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.专业方向)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.班级)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.民族)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.户口类别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.证件照路径)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.政治面貌)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.教师姓名)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.教师性别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.学位)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.毕业院校)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<班级信息>()
                .Property(e => e.简介)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生个人成绩>()
                .Property(e => e.姓名)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生个人成绩>()
                .Property(e => e.学号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生个人成绩>()
                .Property(e => e.证件照路径)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生个人成绩>()
                .Property(e => e.课程名称)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生个人成绩>()
                .Property(e => e.课程学分)
                .HasPrecision(18, 0);

            modelBuilder.Entity<学生个人成绩>()
                .Property(e => e.课程简介)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生个人成绩>()
                .Property(e => e.学生成绩)
                .HasPrecision(10, 2);

            modelBuilder.Entity<学生个人成绩>()
                .Property(e => e.上课时间)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<学生平均成绩>()
                .Property(e => e.平均成绩)
                .HasPrecision(38, 6);
        }
    }
}
