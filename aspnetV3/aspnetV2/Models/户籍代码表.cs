namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 户籍代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 户籍代码表()
        {
            教师表 = new HashSet<教师表>();
            学生表 = new HashSet<学生表>();
        }

        [Key]
        [StringLength(2)]
        public string 户籍代码 { get; set; }

        [Required]
        [StringLength(20)]
        public string 户籍名称 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<教师表> 教师表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生表> 学生表 { get; set; }
    }
}
