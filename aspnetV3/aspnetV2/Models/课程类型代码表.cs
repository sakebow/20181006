namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 课程类型代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 课程类型代码表()
        {
            课程代码表 = new HashSet<课程代码表>();
        }

        [Key]
        [StringLength(5)]
        public string 课程类型代码 { get; set; }

        [Required]
        [StringLength(20)]
        public string 课程类型 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<课程代码表> 课程代码表 { get; set; }
    }
}
