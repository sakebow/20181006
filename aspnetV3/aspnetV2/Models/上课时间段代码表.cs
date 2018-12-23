namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 上课时间段代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 上课时间段代码表()
        {
            上课时间地点对照表 = new HashSet<上课时间地点对照表>();
        }

        [Key]
        [StringLength(5)]
        public string 上课时间段代码 { get; set; }

        public int 上课开始时间 { get; set; }

        public int 上课结束时间 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<上课时间地点对照表> 上课时间地点对照表 { get; set; }
    }
}
