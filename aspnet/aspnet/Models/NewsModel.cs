namespace aspnet.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class NewsModel : DbContext
    {
        public NewsModel()
            : base("name=NewsModel")
        {
        }

        public virtual DbSet<公告表> 公告表 { get; set; }
        public virtual DbSet<新闻表> 新闻表 { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<公告表>()
                .Property(e => e.公告标题)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.公告内容)
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate11)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate12)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate13)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate14)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<公告表>()
                .Property(e => e.obligate15)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.新闻标题)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.新闻内容)
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate1)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate2)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate3)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate4)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate5)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate6)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate7)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate8)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate9)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate10)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate11)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate12)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate13)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate14)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<新闻表>()
                .Property(e => e.obligate15)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
