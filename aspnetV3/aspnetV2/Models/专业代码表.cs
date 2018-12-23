namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 专业代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 专业代码表()
        {
            班级代码表 = new HashSet<班级代码表>();
            管理员表 = new HashSet<管理员表>();
            课程代码表 = new HashSet<课程代码表>();
            学生表 = new HashSet<学生表>();
        }

        [Key]
        [StringLength(20)]
        public string 专业代码 { get; set; }

        [Required]
        [StringLength(80)]
        public string 专业名称 { get; set; }

        [StringLength(50)]
        public string 学科门类代码 { get; set; }

        [StringLength(50)]
        public string 专业类别代码 { get; set; }

        [Required]
        [StringLength(10)]
        public string 所在院系代码 { get; set; }

        [StringLength(100)]
        public string 专业罗马拼音大写 { get; set; }

        [StringLength(100)]
        public string 专业罗马拼音小写 { get; set; }

        [StringLength(100)]
        public string 专业英文名称 { get; set; }

        [StringLength(100)]
        public string 专业英文名称大写 { get; set; }

        [StringLength(100)]
        public string 专业英文名称小写 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<班级代码表> 班级代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<管理员表> 管理员表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<课程代码表> 课程代码表 { get; set; }

        public virtual 学科门类代码表 学科门类代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生表> 学生表 { get; set; }

        public virtual 院系代码表 院系代码表 { get; set; }

        public virtual 专业类别代码表 专业类别代码表 { get; set; }
    }
}
