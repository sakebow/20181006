namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 学生详细信息视图
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 学生学号 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(80)]
        public string 学生姓名 { get; set; }

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
        public string 证件照片路径 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(8)]
        public string 学校代码 { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(80)]
        public string 学校名称 { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(20)]
        public string 专业代码 { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(80)]
        public string 专业名称 { get; set; }

        [Key]
        [Column(Order = 9)]
        [StringLength(50)]
        public string 国家名称 { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(50)]
        public string 省份名称 { get; set; }

        [Key]
        [Column(Order = 11)]
        [StringLength(50)]
        public string 城市名称 { get; set; }

        [Key]
        [Column(Order = 12)]
        [StringLength(50)]
        public string 区县名称 { get; set; }

        [Key]
        [Column(Order = 13)]
        [StringLength(50)]
        public string 学习层次 { get; set; }

        [StringLength(2)]
        public string 是否双学位 { get; set; }

        [StringLength(2)]
        public string 是否转专业 { get; set; }

        [StringLength(30)]
        public string 电子邮箱 { get; set; }

        [Key]
        [Column(Order = 14)]
        [StringLength(10)]
        public string 院系代码 { get; set; }

        [Key]
        [Column(Order = 15)]
        [StringLength(80)]
        public string 院系名称 { get; set; }

        [Key]
        [Column(Order = 16)]
        [StringLength(20)]
        public string 婚配情况 { get; set; }

        [Key]
        [Column(Order = 17)]
        [StringLength(20)]
        public string 户籍名称 { get; set; }

        [Key]
        [Column(Order = 18)]
        [StringLength(80)]
        public string 密码 { get; set; }

        [StringLength(15)]
        public string 邮政编码 { get; set; }

        [Key]
        [Column(Order = 19)]
        [StringLength(30)]
        public string 政治面貌类型 { get; set; }

        [StringLength(11)]
        public string 联系电话 { get; set; }

        [StringLength(20)]
        public string QQ号码 { get; set; }

        [StringLength(80)]
        public string 密保问题 { get; set; }

        [StringLength(1000)]
        public string 密保问题答案 { get; set; }
    }
}
