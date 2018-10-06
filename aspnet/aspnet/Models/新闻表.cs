namespace aspnet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 新闻表
    {
        [Key]
        public int 新闻编号 { get; set; }

        [Required]
        [StringLength(50)]
        public string 新闻标题 { get; set; }

        [Required]
        [StringLength(8000)]
        public string 新闻内容 { get; set; }

        public DateTime 发布时间 { get; set; }

        public DateTime? 修改时间 { get; set; }

        [StringLength(100)]
        public string obligate1 { get; set; }

        [StringLength(100)]
        public string obligate2 { get; set; }

        [StringLength(100)]
        public string obligate3 { get; set; }

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

        [StringLength(100)]
        public string obligate11 { get; set; }

        [StringLength(100)]
        public string obligate12 { get; set; }

        [StringLength(100)]
        public string obligate13 { get; set; }

        [StringLength(100)]
        public string obligate14 { get; set; }

        [StringLength(100)]
        public string obligate15 { get; set; }
    }
}
