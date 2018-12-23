namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 省份代码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 省份代码表()
        {
            城市代码表 = new HashSet<城市代码表>();
            出版社代码表 = new HashSet<出版社代码表>();
            管理员表 = new HashSet<管理员表>();
            教师表 = new HashSet<教师表>();
            学生表 = new HashSet<学生表>();
            学校代码表 = new HashSet<学校代码表>();
        }

        [Key]
        [StringLength(10)]
        public string 省份代码 { get; set; }

        [Required]
        [StringLength(50)]
        public string 省份名称 { get; set; }

        [Required]
        [StringLength(200)]
        public string 省份罗马拼音大写 { get; set; }

        [Required]
        [StringLength(200)]
        public string 省份罗马拼音小写 { get; set; }

        [Required]
        [StringLength(10)]
        public string 所在国家代码 { get; set; }

        [Required]
        [StringLength(2)]
        public string 是否启用 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<城市代码表> 城市代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<出版社代码表> 出版社代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<管理员表> 管理员表 { get; set; }

        public virtual 国家代码表 国家代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<教师表> 教师表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生表> 学生表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学校代码表> 学校代码表 { get; set; }
    }
}
