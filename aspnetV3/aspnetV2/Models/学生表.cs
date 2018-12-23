namespace aspnetV2.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class 学生表
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public 学生表()
        {
            学生选课表 = new HashSet<学生选课表>();
        }

        [Key]
        [StringLength(50)]
        public string 学生学号 { get; set; }

        [Required]
        [StringLength(80)]
        public string 学生姓名 { get; set; }

        [Required]
        [StringLength(2)]
        public string 身份证类别代码 { get; set; }

        [Required]
        [StringLength(20)]
        public string 身份证号 { get; set; }

        [Required]
        [StringLength(2)]
        public string 性别代码 { get; set; }

        [StringLength(5)]
        public string 民族代码 { get; set; }

        public DateTime? 出生日期 { get; set; }

        [StringLength(150)]
        public string 证件照片路径 { get; set; }

        [StringLength(10)]
        public string 国家代码 { get; set; }

        [StringLength(10)]
        public string 省份代码 { get; set; }

        [StringLength(10)]
        public string 城市代码 { get; set; }

        [StringLength(10)]
        public string 区县代码 { get; set; }

        [StringLength(10)]
        public string 街道代码 { get; set; }

        [StringLength(2)]
        public string 学习层次代码 { get; set; }

        [StringLength(2)]
        public string 是否双学位 { get; set; }

        [StringLength(2)]
        public string 是否转专业 { get; set; }

        [StringLength(8)]
        public string 所在学校代码 { get; set; }

        [StringLength(10)]
        public string 所在院系代码 { get; set; }

        [StringLength(20)]
        public string 所在专业代码 { get; set; }

        [StringLength(30)]
        public string 所在班级代码 { get; set; }

        [StringLength(2)]
        public string 婚配代码 { get; set; }

        [StringLength(2)]
        public string 户籍代码 { get; set; }

        [StringLength(15)]
        public string 邮政编码 { get; set; }

        [StringLength(2)]
        public string 政治面貌代码 { get; set; }

        [StringLength(11)]
        public string 联系电话 { get; set; }

        [StringLength(30)]
        public string 电子邮箱 { get; set; }

        [StringLength(20)]
        public string QQ号码 { get; set; }

        [StringLength(80)]
        public string 密保问题 { get; set; }

        [StringLength(1000)]
        public string 密保问题答案 { get; set; }

        [StringLength(2)]
        public string 是否启用 { get; set; }

        public virtual 班级代码表 班级代码表 { get; set; }

        public virtual 城市代码表 城市代码表 { get; set; }

        public virtual 户籍代码表 户籍代码表 { get; set; }

        public virtual 婚配代码表 婚配代码表 { get; set; }

        public virtual 街道代码表 街道代码表 { get; set; }

        public virtual 密码表 密码表 { get; set; }

        public virtual 民族代码表 民族代码表 { get; set; }

        public virtual 区县代码表 区县代码表 { get; set; }

        public virtual 身份证类别代码表 身份证类别代码表 { get; set; }

        public virtual 省份代码表 省份代码表 { get; set; }

        public virtual 性别代码表 性别代码表 { get; set; }

        public virtual 学习层次代码表 学习层次代码表 { get; set; }

        public virtual 学校代码表 学校代码表 { get; set; }

        public virtual 邮政编码代码表 邮政编码代码表 { get; set; }

        public virtual 院系代码表 院系代码表 { get; set; }

        public virtual 政治面貌代码表 政治面貌代码表 { get; set; }

        public virtual 专业代码表 专业代码表 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<学生选课表> 学生选课表 { get; set; }
    }
}
