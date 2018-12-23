namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 国家代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 国家代码表()
        {
            管理员表 = new HashSet<管理员表>();
            省份代码表 = new HashSet<省份代码表>();
        }

        [Key]
        [StringLength(10)]
        public string 国家代码 { get; set; }

        [Required]
        [StringLength(50)]
        public string 国家名称 { get; set; }

        [Required]
        [StringLength(200)]
        public string 国家罗马拼音大写 { get; set; }

        [Required]
        [StringLength(200)]
        public string 国家罗马拼音小写 { get; set; }

        [Required]
        [StringLength(10)]
        public string 国家英文缩写 { get; set; }

        [StringLength(10)]
        public string 所在洲代码 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<管理员表> 管理员表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<省份代码表> 省份代码表 { get; set; }
    }
}
