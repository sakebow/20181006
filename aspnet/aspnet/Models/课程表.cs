namespace aspnet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 课程表
    {
        [Key]
        public int 课程编号 { get; set; }

        [Required]
        [StringLength(20)]
        public string 课程名称 { get; set; }

        public decimal? 课程学分 { get; set; }

        [StringLength(1000)]
        public string 课程简介 { get; set; }

        [StringLength(100)]
        public string 教材图片路径 { get; set; }

        [StringLength(100)]
        public string 教材出版社 { get; set; }

        [StringLength(100)]
        public string 课程类别 { get; set; }

        [StringLength(100)]
        public string obligate4 { get; set; }

        [StringLength(100)]
        public string obligate5 { get; set; }

        [StringLength(100)]
        public string obligate6 { get; set; }

        [StringLength(100)]
        public string obligate7 { get; set; }

        [StringLength(100)]
        public string obligate8 { get; set; }

        [StringLength(100)]
        public string obligate9 { get; set; }

        [StringLength(100)]
        public string obligate10 { get; set; }
    }
}
