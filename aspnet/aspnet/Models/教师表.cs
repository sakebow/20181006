namespace aspnet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 教师表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 教师表()
        {
            教师_课程表 = new HashSet<教师_课程表>();
            教师申请表 = new HashSet<教师申请表>();
        }

        [Key]
        [StringLength(30)]
        public string 教师工号 { get; set; }

        [Required]
        [StringLength(50)]
        public string 姓名 { get; set; }

        [StringLength(80)]
        public string 密码 { get; set; }

        [Required]
        [StringLength(10)]
        public string 性别 { get; set; }

        public DateTime? 出生年月 { get; set; }

        public int 执教年份 { get; set; }

        [StringLength(20)]
        public string 户口类别 { get; set; }

        [StringLength(20)]
        public string 政治面貌 { get; set; }

        [StringLength(10)]
        public string 婚配情况 { get; set; }

        [Required]
        [StringLength(80)]
        public string 学位 { get; set; }

        [Required]
        [StringLength(80)]
        public string 毕业院校 { get; set; }

        [StringLength(5956)]
        public string 简介 { get; set; }

        [StringLength(100)]
        public string 民族 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否为班主任 { get; set; }

        [StringLength(100)]
        public string 管理班级 { get; set; }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<教师_课程表> 教师_课程表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<教师申请表> 教师申请表 { get; set; }
    }
}
