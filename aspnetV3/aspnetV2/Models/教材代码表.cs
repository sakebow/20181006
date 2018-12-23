namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 教材代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 教材代码表()
        {
            课程代码表 = new HashSet<课程代码表>();
        }

        [Key]
        [StringLength(50)]
        public string 教材代码 { get; set; }

        [Required]
        [StringLength(120)]
        public string 教材名称 { get; set; }

        public decimal? 教材价格 { get; set; }

        [StringLength(50)]
        public string 出版社代码 { get; set; }

        [StringLength(150)]
        public string 教材图片路径 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<课程代码表> 课程代码表 { get; set; }
    }
}
