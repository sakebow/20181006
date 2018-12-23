namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 选择课程表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 选择课程表()
        {
            学生选课表 = new HashSet<学生选课表>();
        }

        [Key]
        [StringLength(50)]
        public string 选课代码 { get; set; }

        [Required]
        [StringLength(50)]
        public string 课程代码 { get; set; }

        [Required]
        [StringLength(50)]
        public string 授课教师账号 { get; set; }

        [StringLength(8)]
        public string 所属学校代码 { get; set; }

        [StringLength(10)]
        public string 所属院系代码 { get; set; }

        public int 计划开班人数 { get; set; }

        [StringLength(120)]
        public string 班级名称 { get; set; }

        [StringLength(120)]
        public string 班级代码 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        public virtual 教师表 教师表 { get; set; }

        public virtual 课程代码表 课程代码表 { get; set; }

        public virtual 学校代码表 学校代码表 { get; set; }

        public virtual 院系代码表 院系代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生选课表> 学生选课表 { get; set; }
    }
}
