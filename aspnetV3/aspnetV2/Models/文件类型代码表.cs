namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 文件类型代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 文件类型代码表()
        {
            新闻公告表 = new HashSet<新闻公告表>();
        }

        [Key]
        [StringLength(2)]
        public string 文件类型代码 { get; set; }

        [Required]
        [StringLength(20)]
        public string 文件类型名称 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<新闻公告表> 新闻公告表 { get; set; }
    }
}
