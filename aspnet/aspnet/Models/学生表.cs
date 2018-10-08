namespace aspnet.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 学生表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 学生表()
        {
            学生_课程表 = new HashSet<学生_课程表>();
            学生申请表 = new HashSet<学生申请表>();
        }

        [Required]
        [StringLength(50)]
        public string 姓名 { get; set; }

        [Required]
        [StringLength(10)]
        public string 性别 { get; set; }

        [Key]
        [StringLength(30)]
        public string 学号 { get; set; }

        [StringLength(80)]
        public string 学院 { get; set; }

        [StringLength(80)]
        public string 班级 { get; set; }

        public DateTime 出生日期 { get; set; }

        [Required]
        [StringLength(50)]
        public string 身份证号 { get; set; }

        [StringLength(50)]
        public string 密码 { get; set; }

        [StringLength(50)]
        public string 民族 { get; set; }

        [StringLength(100)]
        public string 籍贯 { get; set; }

        [StringLength(20)]
        public string 户口类别 { get; set; }

        [Required]
        [StringLength(300)]
        public string 家庭现住址 { get; set; }

        [StringLength(20)]
        public string 邮政编码 { get; set; }

        [StringLength(10)]
        public string 婚配情况 { get; set; }

        [StringLength(10)]
        public string 政治面貌 { get; set; }

        [StringLength(20)]
        public string 学习层次 { get; set; }

        [StringLength(100)]
        public string 专业方向 { get; set; }

        public DateTime 入学日期 { get; set; }

        public DateTime? 毕业日期 { get; set; }

        [StringLength(50)]
        public string 毕业证书号 { get; set; }

        [StringLength(50)]
        public string 学士证书号 { get; set; }

        [StringLength(500)]
        public string 证件照路径 { get; set; }

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
        public virtual ICollection<学生_课程表> 学生_课程表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生申请表> 学生申请表 { get; set; }
    }
}
