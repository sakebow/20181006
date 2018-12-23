namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 院系代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 院系代码表()
        {
            管理员表 = new HashSet<管理员表>();
            教师表 = new HashSet<教师表>();
            课程代码表 = new HashSet<课程代码表>();
            选择课程表 = new HashSet<选择课程表>();
            学生表 = new HashSet<学生表>();
            专业代码表 = new HashSet<专业代码表>();
        }

        [Key]
        [StringLength(10)]
        public string 院系代码 { get; set; }

        [Required]
        [StringLength(80)]
        public string 院系名称 { get; set; }

        [Required]
        [StringLength(8)]
        public string 所在学校代码 { get; set; }

        [StringLength(100)]
        public string 院系罗马拼音大写 { get; set; }

        [StringLength(100)]
        public string 院系罗马拼音小写 { get; set; }

        [StringLength(100)]
        public string 院系英文名称 { get; set; }

        [StringLength(100)]
        public string 院系英文名称大写 { get; set; }

        [StringLength(100)]
        public string 院系英文名称小写 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<管理员表> 管理员表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<教师表> 教师表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<课程代码表> 课程代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<选择课程表> 选择课程表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生表> 学生表 { get; set; }

        public virtual 学校代码表 学校代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<专业代码表> 专业代码表 { get; set; }
    }
}
