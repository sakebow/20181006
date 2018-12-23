namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 冻结等级代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 冻结等级代码表()
        {
            登录信息表 = new HashSet<登录信息表>();
            冻结记录表 = new HashSet<冻结记录表>();
        }

        [Key]
        [StringLength(2)]
        public string 冻结等级 { get; set; }

        public int 冻结时长 { get; set; }

        [Required]
        [StringLength(300)]
        public string 等级描述 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<登录信息表> 登录信息表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<冻结记录表> 冻结记录表 { get; set; }
    }
}
