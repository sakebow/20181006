namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 教师详细信息视图
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 教师工号 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(80)]
        public string 教师姓名 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        public string 身份证类别名称 { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(20)]
        public string 身份证号 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(16)]
        public string 性别 { get; set; }

        public DateTime? 出生日期 { get; set; }

        [StringLength(150)]
        public string 证件照路径 { get; set; }

        [StringLength(150)]
        public string 个人简介文档路径 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(50)]
        public string 学习层次 { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(20)]
        public string 婚配情况 { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(50)]
        public string 国家名称 { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(50)]
        public string 省份名称 { get; set; }

        [Key]
        [Column(Order = 9)]
        [StringLength(50)]
        public string 城市名称 { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(50)]
        public string 区县名称 { get; set; }

        [StringLength(11)]
        public string 联系电话 { get; set; }

        [StringLength(20)]
        public string QQ号码 { get; set; }

        [Key]
        [Column(Order = 11)]
        [StringLength(20)]
        public string 户籍名称 { get; set; }

        [StringLength(15)]
        public string 邮政编码 { get; set; }

        [Key]
        [Column(Order = 12)]
        [StringLength(30)]
        public string 政治面貌类型 { get; set; }

        [StringLength(80)]
        public string 密保问题 { get; set; }

        [StringLength(1000)]
        public string 密保问题答案 { get; set; }

        [StringLength(30)]
        public string 电子邮箱 { get; set; }

        [Key]
        [Column(Order = 13)]
        [StringLength(8)]
        public string 学校代码 { get; set; }

        [Key]
        [Column(Order = 14)]
        [StringLength(80)]
        public string 学校名称 { get; set; }

        [Key]
        [Column(Order = 15)]
        [StringLength(10)]
        public string 院系代码 { get; set; }

        [Key]
        [Column(Order = 16)]
        [StringLength(80)]
        public string 院系名称 { get; set; }

        [Key]
        [Column(Order = 17)]
        [StringLength(80)]
        public string 密码 { get; set; }
    }
}
