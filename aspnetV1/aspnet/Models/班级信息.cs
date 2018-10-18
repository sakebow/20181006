namespace aspnet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 班级信息
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 学生姓名 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(30)]
        public string 学号 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(10)]
        public string 学生性别 { get; set; }

        [StringLength(80)]
        public string 学院 { get; set; }

        [StringLength(100)]
        public string 专业方向 { get; set; }

        [StringLength(80)]
        public string 班级 { get; set; }

        [Key]
        [Column(Order = 3)]
        public DateTime 出生日期 { get; set; }

        [StringLength(50)]
        public string 民族 { get; set; }

        [StringLength(20)]
        public string 户口类别 { get; set; }

        [StringLength(500)]
        public string 证件照路径 { get; set; }

        [StringLength(10)]
        public string 政治面貌 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(50)]
        public string 教师姓名 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(10)]
        public string 教师性别 { get; set; }

        [Key]
        [Column(Order = 6)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int 执教年份 { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(80)]
        public string 学位 { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(80)]
        public string 毕业院校 { get; set; }

        [StringLength(5956)]
        public string 简介 { get; set; }
    }
}
