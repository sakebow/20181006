namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 已选课程信息
    {
        [StringLength(20)]
        public string 教师QQ { get; set; }

        [Key]
        [Column(Order = 0)]
        [StringLength(120)]
        public string 出版社名称 { get; set; }

        [StringLength(30)]
        public string 教师电子邮箱 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string 教师工号 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        public string 教师国籍 { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(50)]
        public string 教材代码 { get; set; }

        public decimal? 教材价格 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(120)]
        public string 教材名称 { get; set; }

        [StringLength(150)]
        public string 教材图片路径 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(80)]
        public string 教师所在学校 { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(80)]
        public string 教师所在院系 { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(80)]
        public string 教师姓名 { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(50)]
        public string 课程代码 { get; set; }

        [StringLength(150)]
        public string 课程简介文档路径 { get; set; }

        [Key]
        [Column(Order = 9)]
        [StringLength(20)]
        public string 课程类型 { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(5)]
        public string 课程类型代码 { get; set; }

        public int? 课程上课学年 { get; set; }

        [Key]
        [Column(Order = 11)]
        public decimal 课程学分 { get; set; }

        [StringLength(11)]
        public string 教师电话 { get; set; }

        [Key]
        [Column(Order = 12)]
        [StringLength(50)]
        public string 区县名称 { get; set; }

        [Key]
        [Column(Order = 13)]
        [StringLength(50)]
        public string 省份名称 { get; set; }

        [Key]
        [Column(Order = 14)]
        [StringLength(80)]
        public string 课程所属学校 { get; set; }

        [Key]
        [Column(Order = 15)]
        [StringLength(80)]
        public string 课程所属院系 { get; set; }

        [Key]
        [Column(Order = 16)]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [Key]
        [Column(Order = 17)]
        [StringLength(50)]
        public string 授课教师账号 { get; set; }

        [StringLength(8)]
        public string 课程所属学校代码 { get; set; }

        [StringLength(10)]
        public string 课程所属院系代码 { get; set; }

        [Key]
        [Column(Order = 18)]
        [StringLength(16)]
        public string 教师性别 { get; set; }

        [StringLength(150)]
        public string 教师简介 { get; set; }

        [Key]
        [Column(Order = 19)]
        [StringLength(50)]
        public string 选课代码 { get; set; }

        [Key]
        [Column(Order = 20)]
        [StringLength(50)]
        public string 教师学习层次 { get; set; }

        [StringLength(150)]
        public string 教师证件照路径 { get; set; }

        [StringLength(2)]
        public string 是否双学位 { get; set; }

        [Key]
        [Column(Order = 21)]
        [StringLength(80)]
        public string 学生姓名 { get; set; }

        [Key]
        [Column(Order = 22)]
        [StringLength(50)]
        public string 学生学号 { get; set; }

        [StringLength(20)]
        public string 学生QQ { get; set; }

        public DateTime? 出生日期 { get; set; }

        [StringLength(11)]
        public string 学生联系电话 { get; set; }

        [StringLength(30)]
        public string 学生电子邮箱 { get; set; }

        [StringLength(150)]
        public string 学生证件照路径 { get; set; }

        [Key]
        [Column(Order = 23)]
        [StringLength(16)]
        public string 学生性别 { get; set; }

        [Key]
        [Column(Order = 24)]
        [StringLength(8)]
        public string 学生所属学校代码 { get; set; }

        [Key]
        [Column(Order = 25)]
        [StringLength(80)]
        public string 学生所属学校 { get; set; }

        [Key]
        [Column(Order = 26)]
        [StringLength(10)]
        public string 学生所属院系代码 { get; set; }

        [Key]
        [Column(Order = 27)]
        [StringLength(80)]
        public string 学生所属院系 { get; set; }

        [Key]
        [Column(Order = 28)]
        [StringLength(20)]
        public string 学生所属专业代码 { get; set; }

        [Key]
        [Column(Order = 29)]
        [StringLength(80)]
        public string 学生所属专业名称 { get; set; }

        [StringLength(120)]
        public string 班级代码 { get; set; }

        [StringLength(120)]
        public string 班级名称 { get; set; }

        [Key]
        [Column(Order = 30)]
        [StringLength(100)]
        public string 课程名称 { get; set; }
    }
}
