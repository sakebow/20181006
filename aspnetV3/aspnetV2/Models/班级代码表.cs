namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 班级代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 班级代码表()
        {
            学生表 = new HashSet<学生表>();
        }

        [Key]
        [StringLength(30)]
        public string 班级代码 { get; set; }

        [Required]
        [StringLength(80)]
        public string 班级名称 { get; set; }

        [Required]
        [StringLength(20)]
        public string 所在专业代码 { get; set; }

        [StringLength(100)]
        public string 班级罗马拼音大写 { get; set; }

        [StringLength(100)]
        public string 班级罗马拼音小写 { get; set; }

        [StringLength(100)]
        public string 班级英文名称 { get; set; }

        [StringLength(100)]
        public string 班级英文名称大写 { get; set; }

        [StringLength(100)]
        public string 班级英文名称小写 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        public virtual 专业代码表 专业代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生表> 学生表 { get; set; }
    }
}
