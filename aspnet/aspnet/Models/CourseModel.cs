namespace aspnet.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class CourseModel : DbContext
    {
        public CourseModel()
            : base("name=CourseModel")
        {
        }

        public virtual DbSet<课程表> 课程表 { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<课程表>()
                .Property(e => e.课程名称)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.课程学分)
                .HasPrecision(18, 0);

            modelBuilder.Entity<课程表>()
                .Property(e => e.课程简介)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.教材图片路径)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.教材出版社)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.课程类别)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<课程表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
