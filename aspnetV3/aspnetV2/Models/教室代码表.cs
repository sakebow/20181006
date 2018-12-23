namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 教室代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 教室代码表()
        {
            上课时间地点对照表 = new HashSet<上课时间地点对照表>();
        }

        [Key]
        [StringLength(10)]
        public string 教室代码 { get; set; }

        [Required]
        [StringLength(80)]
        public string 教室名称 { get; set; }

        [Required]
        [StringLength(8)]
        public string 所在学校代码 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        public virtual 学校代码表 学校代码表 { get; set; }

        public virtual 教室占用表 教室占用表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<上课时间地点对照表> 上课时间地点对照表 { get; set; }
    }
}
