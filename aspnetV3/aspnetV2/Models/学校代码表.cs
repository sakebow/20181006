namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 学校代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 学校代码表()
        {
            管理员表 = new HashSet<管理员表>();
            教师表 = new HashSet<教师表>();
            教室代码表 = new HashSet<教室代码表>();
            课程代码表 = new HashSet<课程代码表>();
            选择课程表 = new HashSet<选择课程表>();
            学生表 = new HashSet<学生表>();
            院系代码表 = new HashSet<院系代码表>();
        }

        [Key]
        [StringLength(8)]
        public string 学校代码 { get; set; }

        [Required]
        [StringLength(80)]
        public string 学校名称 { get; set; }

        [StringLength(10)]
        public string 所在省份代码 { get; set; }

        [StringLength(10)]
        public string 所在城市代码 { get; set; }

        [StringLength(10)]
        public string 所在区县代码 { get; set; }

        [StringLength(10)]
        public string 所在街道代码 { get; set; }

        [StringLength(10)]
        public string 学校英文名称 { get; set; }

        [StringLength(100)]
        public string 学校英文名称大写 { get; set; }

        [StringLength(100)]
        public string 学校英文名称小写 { get; set; }

        [StringLength(100)]
        public string 学校罗马拼音大写 { get; set; }

        [StringLength(100)]
        public string 学校罗马拼音小写 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        public virtual 城市代码表 城市代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<管理员表> 管理员表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<教师表> 教师表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<教室代码表> 教室代码表 { get; set; }

        public virtual 街道代码表 街道代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<课程代码表> 课程代码表 { get; set; }

        public virtual 区县代码表 区县代码表 { get; set; }

        public virtual 省份代码表 省份代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<选择课程表> 选择课程表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生表> 学生表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<院系代码表> 院系代码表 { get; set; }
    }
}
