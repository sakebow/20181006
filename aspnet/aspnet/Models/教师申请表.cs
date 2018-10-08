namespace aspnet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 教师申请表
    {
        [Required]
        [StringLength(30)]
        public string 教师工号 { get; set; }

        [Key]
        public int 申请编号 { get; set; }

        [StringLength(500)]
        public string 申请标题 { get; set; }

        [Required]
        [StringLength(6007)]
        public string 申请内容 { get; set; }

        [Required]
        [StringLength(500)]
        public string 申请类别 { get; set; }

        public DateTime 申请时间 { get; set; }

        public short 审核状态 { get; set; }

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

        public virtual 教师表 教师表 { get; set; }
    }
}
