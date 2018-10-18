namespace aspnet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 学生个人成绩
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string 姓名 { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(30)]
        public string 学号 { get; set; }

        [StringLength(500)]
        public string 证件照路径 { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(100)]
        public string 课程名称 { get; set; }

        public decimal? 课程学分 { get; set; }

        [StringLength(5888)]
        public string 课程简介 { get; set; }

        public decimal? 学生成绩 { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int 上课星期 { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(100)]
        public string 上课时间 { get; set; }
    }
}
