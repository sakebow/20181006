namespace aspnet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 课程表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 课程表()
        {
            学生_课程表 = new HashSet<学生_课程表>();
        }

        [Key]
        public int 课程编号 { get; set; }

        [Required]
        [StringLength(100)]
        public string 课程名称 { get; set; }

        public decimal? 课程学分 { get; set; }

        [StringLength(5888)]
        public string 课程简介 { get; set; }

        [StringLength(500)]
        public string 教材图片路径 { get; set; }

        [StringLength(500)]
        public string 教材出版社 { get; set; }

        [Required]
        [StringLength(50)]
        public string 课程类别 { get; set; }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生_课程表> 学生_课程表 { get; set; }
    }
}
