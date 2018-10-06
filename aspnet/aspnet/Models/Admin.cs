namespace aspnet.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Admin : DbContext
    {
        public Admin()
            : base("name=Admin")
        {
        }

        public virtual DbSet<管理员表> 管理员表 { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<管理员表>()
                .Property(e => e.账号)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.密码)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.管理对象)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<管理员表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
