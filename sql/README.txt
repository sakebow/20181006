-- GENERAL
In this folder, there're two sql scripts

-- WHAT'S IN EACH FILE?
All tables, primary keys, foreign keys, along with check and default are defined in "finaltest".
While there's something more might be in need in "addonsDB".

-- HOW TO USE IT?
If you haven't build up your database, just run "finaltest.sql" in your SQL Server.
Although many details haven't completed yet, they are still enough for a student management system.

-- SOMETHING WORTH METHONING
All tables and fields are defined in Chinese. 
You can change thenm into English or any language else as you like
Some of all the fields are useless, you can delete them to fit your requirement

-- UPDATED ON Oct.18th 2018
sql scripts for new version have been uploaded.
All tables and fields are defined in Chinese, too.
Here're changes in new version:
 * 1. field "married" is defined in a single table, because now we have six different sex, including "男", "女", "男转女", "女转男", "男女同体", "未鉴定" in Chinese. Isn't it amazing?
      Before we can just define field "sex" like this:
------------------------------------------------------------------
      CREATE TABLE student(
          sex  char(6)  not null,
      );
      ALTER TABLE student ADD CONSTRAINT ck_student_sex CHECK(sex in ("male", "female"));
------------------------------------------------------------------
      But now everything is different.
      I 'm now not sure how the field will be, so each one like "sex" are defined in a single table for further updated, otherwise I will spend long time to create a new one, which is quite annoying.

 * 2. There're more views.
      In Version1, start a project will pay you a lot time to wait, even up to 10 seconds. That's really a lot time. So I think if it's better to have more views?
      Last winter vacation I joined a project. That time our team ignored the usage of views. We didn't set "class" in teacher table but in student table. Thus forcing us to search across the database when showing teachers' data when opening web pages. When presenting our project, we spend every 10 seconds to show every page of data. That's damn slow for a management system.
