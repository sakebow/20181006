namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 学生选课表
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 选课代码 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string 学生学号 { get; set; }

        public decimal? 学生平时成绩 { get; set; }

        public decimal? 学生期中成绩 { get; set; }

        public decimal? 学生期末成绩 { get; set; }

        public decimal? 学生总成绩 { get; set; }

        [StringLength(120)]
        public string 学生期末试卷路径 { get; set; }

        public virtual 选择课程表 选择课程表 { get; set; }

        public virtual 学生表 学生表 { get; set; }
    }
}
