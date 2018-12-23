namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 选课视图
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 课程代码 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string 授课教师账号 { get; set; }

        [StringLength(8)]
        public string 所属学校代码 { get; set; }

        [StringLength(10)]
        public string 所属院系代码 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        public string 选课代码 { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(5)]
        public string 课程类型代码 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(20)]
        public string 课程类型 { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(50)]
        public string 教材代码 { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(120)]
        public string 教材名称 { get; set; }

        public decimal? 教材价格 { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(120)]
        public string 出版社名称 { get; set; }

        [Key]
        [Column(Order = 9)]
        public decimal 课程学分 { get; set; }

        [StringLength(150)]
        public string 教材图片路径 { get; set; }

        [StringLength(150)]
        public string 课程简介文档路径 { get; set; }

        public int? 课程上课学年 { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(80)]
        public string 学校名称 { get; set; }

        [Key]
        [Column(Order = 11)]
        [StringLength(80)]
        public string 院系名称 { get; set; }

        [StringLength(20)]
        public string QQ号码 { get; set; }

        [StringLength(30)]
        public string 电子邮箱 { get; set; }

        [StringLength(150)]
        public string 个人简介文档路径 { get; set; }

        [Key]
        [Column(Order = 12)]
        [StringLength(50)]
        public string 教师工号 { get; set; }

        [Key]
        [Column(Order = 13)]
        [StringLength(80)]
        public string 教师姓名 { get; set; }

        [StringLength(11)]
        public string 联系电话 { get; set; }

        [Key]
        [Column(Order = 14)]
        [StringLength(16)]
        public string 性别 { get; set; }

        [Key]
        [Column(Order = 15)]
        [StringLength(50)]
        public string 学习层次 { get; set; }

        [Key]
        [Column(Order = 16)]
        [StringLength(80)]
        public string 教师所在学校 { get; set; }

        [Key]
        [Column(Order = 17)]
        [StringLength(80)]
        public string 教师所在院系 { get; set; }

        [StringLength(150)]
        public string 证件照路径 { get; set; }

        [Key]
        [Column(Order = 18)]
        [StringLength(50)]
        public string 国家名称 { get; set; }

        [Key]
        [Column(Order = 19)]
        [StringLength(50)]
        public string 省份名称 { get; set; }

        [Key]
        [Column(Order = 20)]
        [StringLength(50)]
        public string 区县名称 { get; set; }

        [Key]
        [Column(Order = 21)]
        [StringLength(50)]
        public string 城市名称 { get; set; }

        [Key]
        [Column(Order = 22)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int 计划开班人数 { get; set; }

        [StringLength(120)]
        public string 班级代码 { get; set; }

        [StringLength(120)]
        public string 班级名称 { get; set; }

        [Key]
        [Column(Order = 23)]
        [StringLength(100)]
        public string 课程名称 { get; set; }
    }
}
