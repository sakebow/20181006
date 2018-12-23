namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 密码表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 密码表()
        {
            教室占用表 = new HashSet<教室占用表>();
            申请表 = new HashSet<申请表>();
            身份代码表 = new HashSet<身份代码表>();
        }

        [Key]
        [StringLength(50)]
        public string 账号 { get; set; }

        [Required]
        [StringLength(80)]
        public string 密码 { get; set; }

        public virtual 登录信息表 登录信息表 { get; set; }

        public virtual 冻结记录表 冻结记录表 { get; set; }

        public virtual 管理员表 管理员表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<教室占用表> 教室占用表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<申请表> 申请表 { get; set; }

        public virtual 学生表 学生表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<身份代码表> 身份代码表 { get; set; }
    }
}
