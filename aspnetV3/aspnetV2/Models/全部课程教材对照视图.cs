namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 全部课程教材对照视图
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 课程代码 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string 课程名称 { get; set; }

        public int? 课程上课学年 { get; set; }

        [Key]
        [Column(Order = 2)]
        public decimal 课程学分 { get; set; }

        [StringLength(150)]
        public string 课程简介文档路径 { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(5)]
        public string 课程类型代码 { get; set; }

        [StringLength(8)]
        public string 所属学校代码 { get; set; }

        [StringLength(10)]
        public string 所属院系代码 { get; set; }

        [StringLength(20)]
        public string 所属专业代码 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(50)]
        public string 教材代码 { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(120)]
        public string 教材名称 { get; set; }

        public decimal? 教材价格 { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(120)]
        public string 出版社名称 { get; set; }

        [StringLength(150)]
        public string 教材图片路径 { get; set; }

        [Key]
        [Column(Order = 7)]
        [StringLength(20)]
        public string 课程类型 { get; set; }

        [Key]
        [Column(Order = 8)]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [Key]
        [Column(Order = 9)]
        [StringLength(80)]
        public string 院系名称 { get; set; }

        [Key]
        [Column(Order = 10)]
        [StringLength(80)]
        public string 学校名称 { get; set; }

        [Key]
        [Column(Order = 11)]
        [StringLength(80)]
        public string 专业名称 { get; set; }
    }
}
