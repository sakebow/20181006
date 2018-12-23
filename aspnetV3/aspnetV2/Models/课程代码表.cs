namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 课程代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 课程代码表()
        {
            选择课程表 = new HashSet<选择课程表>();
        }

        [Key]
        [StringLength(50)]
        public string 课程代码 { get; set; }

        [Required]
        [StringLength(100)]
        public string 课程名称 { get; set; }

        public decimal 课程学分 { get; set; }

        [Required]
        [StringLength(5)]
        public string 课程类型代码 { get; set; }

        [StringLength(150)]
        public string 课程简介文档路径 { get; set; }

        [StringLength(50)]
        public string 教材代码 { get; set; }

        [StringLength(8)]
        public string 所属学校代码 { get; set; }

        [StringLength(10)]
        public string 所属院系代码 { get; set; }

        [StringLength(20)]
        public string 所属专业代码 { get; set; }

        public int? 课程上课学年 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        public virtual 教材代码表 教材代码表 { get; set; }

        public virtual 课程类型代码表 课程类型代码表 { get; set; }

        public virtual 学校代码表 学校代码表 { get; set; }

        public virtual 院系代码表 院系代码表 { get; set; }

        public virtual 专业代码表 专业代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<选择课程表> 选择课程表 { get; set; }
    }
}
