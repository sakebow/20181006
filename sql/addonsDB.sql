﻿EXEC sp_rename '课程表.obligate1', '教材图片路径'
EXEC sp_rename '课程表.obligate2', '教材出版社'
EXEC sp_rename '课程表.obligate3', '课程类别'


INSERT INTO 新闻表 (新闻标题, 新闻内容, 发布时间, 修改时间) VALUES
('湖北大学被炸了','湖北大学由于失信于学生，从而无法招生走向落寞，最终于2028年10月1日被炸', GETDATE(), GETDATE());


INSERT INTO 公告表 (公告标题, 公告内容, 发布时间, 修改时间) VALUES
('湖北大学和泰国建立友好关系', '湖北大学急于招生，与泰国建立友好关系，甚至推出了一系列性别转换手术学生优惠套餐。近年来，湖北大学招生人数有所好转', GETDATE(), GETDATE());
--DROP TABLE 新闻表;
DROP TABLE 学生_课程表;

SELECT 教材出版社 FROM 课程表

DELETE FROM 课程表 WHERE 课程编号 = 1

ALTER TABLE 课程表 ALTER COLUMN 课程简介 char(6000);

ALTER TABLE 课程表 ALTER COLUMN 课程学分 DECIMAL(10, 2);

DELETE FROM 课程表 WHERE 课程编号 > 0;

INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('线性代数',4,'线性代数是数学的一个分支，它的研究对象是向量，向量空间（或称线性空间），线性变换和有限维的线性方程组。向量空间是现代数学的一个重要课题；因而，线性代数被广泛地应用于抽象代数和泛函分析中；通过解析几何，线性代数得以被具体表示。线性代数的理论已被泛化为算子理论。由于科学研究中的非线性模型通常可以被近似为线性模型，使得线性代数被广泛地应用于自然科学和社会科学中。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('高等数学',4,'广义地说，初等数学之外的数学都是高等数学，也有将中学较深入的代数、几何以及简单的集合论初步、逻辑初步称为中等数学的，将其作为中小学阶段的初等数学与大学阶段的高等数学的过渡。通常认为，高等数学是由微积分学，较深入的代数学、几何学以及它们之间的交叉内容所形成的一门基础学科。主要内容包括：极限、微积分、空间解析几何与线性代数、级数、常微分方程。工科、理科研究生考试的基础科目。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('大学体育',4,'柔力球，篮球，足球，乒乓球，排球，瑜伽，跳绳');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('思想道德修养与法律基础',4,'本书包括上篇思想道德修养和下篇法律基础两部分，两部分内容各成系统又相互渗透、相互联系、相辅相成。 思想道德修养部分主要包括政治、思想、道德、心理素质和学习成才等方面修养的内容。这部分内容针对大学生学习、生活中遇到的诸如政治态度、思想意识、人生理想、伦理道德、心理品质、综合素质等实际问题，从大学生的成长规律和现代社会对人才的要求出发，积极探索大学生健康成长的有效途径，对大学生的身心发展提出全面准确的指导性意见。 法律基础部分涉及到我国社会主义法的基本理论、宪法、民法、行政法、刑法、诉讼法等的各个方面，包括基本概念、基本知识、基本原理、基本法律制度、基本操作方法等。它是学习和理解法的产生和发展的一般规律、法的性质、内容、对象与范围、法律制度与法律规范、法律功能与调查方法的基础性知识。 本教材注重法学理论和知识的思想性、实用性、科学性和针对性的统一，以培养大学生的社会主义法律意识，真正做到学法、懂法、用法、依法办事。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('大学英语',4,'大学英语（1）：旨在紧密结合大学英语的教学实际，反映教与学两方面的要求，满足不同层次读者的需要。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('计算机导论',4,'开设本课程目的是为了使学生掌握信息化社会所必需的计算机基本知识和基本操作技能。通过本课程的学习，培养使学生掌握计算机的硬件基础知识、软件基础知识、网络基础知识以及计算机安全基本常识，培养学生的计算机基本操作能力以及信息检索和利用能力，为学习后续计算机课程奠定基础');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('高级程序语言设计',4,'C语言是一种计算机程序设计语言。它既有高级语言的特点，又具有汇编语言的特点。它可以作为系统设计语言，编写工作系统应用程序，也可以作为应用程序设计语言，编写不依赖计算机硬件的应用程序。因此，它的应用范围广泛。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('应用写作',4,'本课程将通过教师讲授和学生实训的方式展开,主要包括应用文书的界定、党政机关公文、事务文书、日常文书、经济文书、诉讼文书、科技文书、礼仪文书、传播文书等九个专题部分，让学生掌握专业及常用性应用文的特点、格式和基本写作的方法，培养学生应用文写作基本素养和应用写作的方法的能力，为后续的职场专业化写作实践打下良好的基础');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('大学英语（2）',4,'旨在紧密结合大学英语的教学实际，反映教与学两方面的要求，满足不同层次读者的需要。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('高等数学B（2）',4,'广义地说，初等数学之外的数学都是高等数学，也有将中学较深入的代数、几何以及简单的集合论初步、逻辑初步称为中等数学的，将其作为中小学阶段的初等数学与大学阶段的高等数学的过渡。通常认为，高等数学是由微积分学，较深入的代数学、几何学以及它们之间的交叉内容所形成的一门基础学科。主要内容包括：极限、微积分、空间解析几何与线性代数、级数、常微分方程。工科、理科研究生考试的基础科目。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('大学体育（2）',4,'柔力球，篮球，足球，乒乓球，跳绳，排球');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('中国近代史纲要',4,'这门课程通过系统讲授近代以来中国人民抵御外来侵略、争取民族独立、推翻反动统治、实现人民解放以及致力国家繁荣富强和人民共同富裕的历史，帮助学生了解国史、国情，深刻领会历史和人民怎样选择了马克思主义，怎样选择了中国共产党，怎样选择了社会主义道路，从而增强学习实践中国特色社会主义理论体系、坚持中国特色社会主义道路的理论自觉性和政治坚定性。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('软件工程概述',4,'软件工程是研究软件开发维护和软件管理的一门工程科学，本课程是计算机科学与技术专业指导性教学计划规定的教学环节中的一部分，教学目的旨在介绍软件工程的基本原理和主要内容，为学生进一步深入学习与软件工程相关的其他课程如：软件需求过程、软件分析与设计和软件项目管理、软件过程管理等打下坚实的理论基础。同时启发学生把握软件开发过程的基本规律，掌握和运用软件分析、设计的常用方法、软件开发过程的管理方法以及质量保证方法等，来解决软件开发中的实际问题，达到学以致用的目的');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('面向对象程序设计',4,'《面向对象程序设计基础》是计算机软件工程专业本科生的一门专业基础课。面向对象软件开发方法是吸收了软件工程领域有益的概念和有效的方法而发展起来的一种软件开发方法。它集抽象性、封装性、继承性和多态性于一体，可以帮助人们开发出模块化的程序，并体现信息隐蔽、可复用、易修改、易扩充等特性');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('大学英语（3）',4,'教授学生关于英文古代文学作品的知识');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('概率论与数理统计',4,'概率论与数理统计是数学的一个有特色且又十分活跃的分支，一方面，它有别开生面的研究课题，有自己独特的概念和方法，内容丰富，结果深刻;另一方面，它与其他学科又有紧密的联系，是近代数学的重要组成部分。由于它近年来突飞猛进的发展与应用的广泛性，目前已发展成为一门独立的一级学科。概率论与数理统计的理论与方法已广泛应用于工业、农业、军事和科学技术中，如预测和滤波应用于空间技术和自动控制，时间序列分析应用于石油勘测和经济管理，马尔科夫过程与点过程统计分析应用于地震预测等，同时他又向基础学科、工科学科渗透，与其他学科相结合发展成为边缘学科，这是概率论与数理统计发展的一个新趋势');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('大学体育（3）',4,'篮球，足球，排球，乒乓球，羽毛球，网球，跳绳，瑜伽，散打');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('毛泽东思想和中国特色社会主义理论体系概论',4,'其主要任务是帮助学生学习毛泽东思想和中国特色社会主义理论体系的基本内容，帮助学生理解毛泽东思想和中国特色社会主义理论体系是马克思主义的基本原理与中国实际相结合的两次伟大的理论成果，是中国共产党集体智慧的结晶。为了加强高等学校思想政治理论课教学，提高思想政治理论课教学针对性和实效性，我们组织编写了这本《毛泽东思想和中国特色社会主义理论体系概论》一书。本书在编写过程中着力贯彻党的十七大精神，结合学生在学习这门课时遇到的问题，进行重点阐述，增强了思想政治理论课的针对性和实用性。通过本书的学习，培养学生运用马克思主义的立场、观点和方法分析问题、解决问题的能力，增强贯彻党的基本理论、基本路线、基本纲领以及各项方针政策的自觉性、坚定性，积极投身到全面建设小康社会的伟大实践');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('汇编语言程序设计',4,'汇编语言（assembly language）是一种用于电子计算机、微处理器、微控制器或其他可编程器件的低级语言，亦称为符号语言。在汇编语言中，用助记符（Mnemonics）代替机器指令的操作码，用地址符号（Symbol）或标号（Label）代替指令或操作数的地址。在不同的设备中，汇编语言对应着不同的机器语言指令集，通过汇编过程转换成机器指令。普遍地说，特定的汇编语言和特定的机器语言指令集是一一对应的,不同平台之间不可直接移植。 [1] 许多汇编程序为程序开发、汇编控制、辅助调试提供了额外的支持机制。有的汇编语言编程工具经常会提供宏，它们也被称为宏汇编器。汇编语言不像其他大多数的程序设计语言一样被广泛用于程序设计。在今天的实际应用中，它通常被应用在底层，硬件操作和高要求的程序优化的场合。驱动程序、嵌入式操作系统和实时运行程序都需要汇编语言');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('离散数学',4,'《离散数学》课程作为信息类专业的核心基础理论课程, 是现代数学的一个重要分支，主要研究具有离散特征的变量、结构和相互关系, 涉及的内容较广。该课程充分描述了信息科学离散性的特点。通过本课程的学习，不仅能为学生学习计算机、软件、信息科学和通信等后续课程奠定理论基础，而且能培养学生抽象思维能力、严格的逻辑推理和创新能力，为将来从事信息行业的软、硬件应用开发和理论研究打下坚实的理论基础');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('数字逻辑',4,'\阐明数字逻辑电路的基本概念和分析设计方法;由门电路构成逻辑部件的“经典方法”作为一种基本技能训练;加强以全加器、译码器、多路选择器、多路分配器、触发器、寄存器、计数器,以及ROM 、PLA等较复杂逻辑器件来构成更复杂的逻辑部件的分析与设计方法,进而掌握数字系统单元电路的逻辑功能');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('WINDOWS程序设计',4,'本课程是计算机软件专业的一门重要的编程类专业课。C#语言是针对网络技术应用而开发的语言,课程的教学目的是培养学生使用NET平台开发网络应用程序的能力,主要教学内容以应用为主,以语法介绍为辅,主要包括C#语言基本语法、面向对象编程方、C#开发Windows应用程序、C#开发Web应用程序等');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('大学英语（4）',4,'培养学生英文演讲能力');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('大学体育（4）',4,'大学体育（4）篮球，足球，排球，乒乓球，网球，羽毛球，瑜伽，跳绳，散打');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('马克思主义基本原理',4,'该课程是高校本科生必修课，在高校马克思主义理论课中处于基础和核心地位，具有很强的引领、辐射和发散功能。本课程着重讲授马克思主义最基本的原理、最根本的立场观点方法、最显著的特征和最崇高的理想，帮助学生系统掌握马克思主义的物质观、实践观、辩证法、认识论和唯物史观、正确认识资本主义社会和社会主义社会的发展规律，形成科学的世界观、历史观、人生观和价值观，主动学会运用马克思主义世界观和方法论去认识和分析历史与现实问题。确立建设中国特色社会主义的理想信念，为把学生培养成为有理想、有道德、有文化、有纪律的一代新人奠定思想理论基础。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('计算机组成原理',4,'计算机组成原理是计算机专业一门重要的主干课程。课程的任务是使学生掌握计算机组成部件的工作原理、逻辑实现、设计方法及将各部件连接成整机的方法,建立CPU级和硬件系统级的整机概念,培养学生对计算机硬件系统的分析、开发与设计的能力。该课程是计算机硬件系列课程的重要先修基础。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('数据结构',4,'以C++/C语言为基础，重点介绍线性表、栈、对列、树和二叉树等基本数据结构和相关算法、各种检索和排序算法。概要介绍图结构和相关算法。除详细讲授数据基本概念和具体算法外，对每种数据结构给出其C++语言实现，并给出定性或定量的算法分析。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('数据库系统原理：',4,'数据库的理论和方法是信息管理的核心技术和重要基础，是企事业进行信息化建设的重要基础。本课程主要介绍数据库系统的概念、原理及方法，结合典型系统SQL Server进行分析，使学生系统地掌握数据库的基本理论和方法，并能结合实践运用数据库技术开发出满足一定规范的数据库应用系统，其理论性及实用性较强。通过本课程的学习，使学生理解、掌握数据库系统的基本原理，包括：数据库的一些基本概念，各种数据模型的特点，关系数据库的基本概念，SQL语言，关系数据理论，数据库的设计理论、数据库运行控制等；熟悉数据库的一般概念在实际数据库系统Microsoft SQL Server中的实现；掌握数据库应用系统的设计开发方法；了解数据库技术的最新发展和数据库应用的最新进展。其最终目的是培养学生运用数据库技术解决问题的能力，激发学生在此领域中继续学习和研究的愿望，为学习信息系统分析与设计等后续课程以及数据库系统高级课程打下良好基础。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('JAVA 程序设计',4,'方法,Java语言的基本概念、语法和编程方法。以Java语言中的面向对象机制为主线, 通过在学习过程中大量的程序实例和相关练习,理解面向对象的程序设计的思路和方法。培养学生的编程能力。通过理论和实践教学,使学生掌握面向对象的程序设计语言——Java,并培养良好的编程规范意识');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('计算方法',4,'《21世纪高等学校规划教材·电子信息:MATLAB计算方法》以现代数值计算软件MATLAB作为算法实现工具，主要介绍在科学研究和工程技术中常用的数值计算方法。全书共分8章，主要内容包括MATLAB概述、MATLAB程序设计、数值计算的基本概念、非线性方程的数值解法、线性代数方程组的数值解法、插值方法、数值积分、常微分方程的数值解法。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('操作系统',4,'是当代计算机软件系统的核心，是计算机系统的基础和支撑，它管理和控制着计算机系统中的所有软、硬件资源，可以说操作系统是计算机系统的灵魂。操作系统课程是计算机专业学生必须学习和掌握的基础课程, 是计算机应用人员深入了解和使用计算机的必备知识, 是进行系统软件开发的理论基础，也是计算机科学与技术专业的一门理论性和实践性并重的核心主干课程。本课程的目的是使学生掌握现代计算机操作系统的基本原理、基本设计方法及实现技术，具有分析现行操作系统和设计、开发实际操作系统的基本能力');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('WEB程序设计',4,'本课程是计算机科学与技术、信息管理与信息系统、电子商务、软件工程、网络工程等本科专业的专业基础课。通过本课程的学习,掌握网站配置发环境、jQuery、与ASP.NET 4.5结合的C#基础、ASP.NET 4.5页面调试、用服务器控件、用户控件、验证控件、状态管理、LINQ访问数据库、数据绑定控件、用和角色管理、主题、母版、Web部件、网站导航、Microsoft Ajax、Web服务、WC文件处理、MyPetShop综合实例等内容。学完本课程后,学生能应用ASP.NET 4.5写Web应用程序,例如信息发布系统、论坛、留言板、聊天室、博客等。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('J2EE技术',4,'让学生在软件工程理论的基础上,至少掌握企业级开发环境J2EE和。NET中的一种,为将来软件开发打好基础');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('计算机网络',4,'计算机网络是计算机专业学生必修的一门专业基础课和核心课程，它是后续课程《计算机系统安全》、《网络管理技术》、《TCP/IP与网络互联》等理论课程，以及《网络课程设计》等实践教学环节的先行课。《计算机网络》课程的教学，旨在使学生掌握计算机网络的体系结构和流行的参考模型，掌握物理层标准的基本原理和数据通信技术，掌握数据链路层协议的工作原理和常见实例，掌握局域网基本原理和组网方法，掌握广域网基本原理和接入方法，掌握网络互连的基本知识和IP协议的运行机制，掌握传输层协议的工作原理和TCP、UDP协议的运行原理，掌握应用层常见协议和网络服务的工作原理，以及应用系统构架方法，了解计算机网络技术发展的前沿技术，为培养学生在计算机网络系统的规划与构建，网络应用系统的建立与开发等方面能力打下坚实的基础。 ');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('Python程序设计',4,'通过本课程的学习，使得学生能够理解Python的编程模式（命令式编程、函数式编程），熟练运用Python运算符、内置函数以及列表、元组、字典、集合等基本数据类型和相关列表推导式、切片等特性来解决实际问题，熟练掌握Python分支结构、循环结构、函数设计以及类的设计与使用，熟练使用字符串方法，适当了解正则表达式，熟练使用Python读写文本文件，适当了解二进制文件操作，了解Python程序的调试方法，了解Python面向对象程序设计模式，掌握使用Python操作SQLite数据库的方法，掌握Python+pandas进行数据处理的基本用法，掌握使用Python+matplotlib进行数据可视化的用法,同时还应培养学生的代码优化与安全编程意识。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('数据库使用技术',4,'其任务是使学生具备SQL Server数据库的基本理论知识与应用技能,即通过一个实际数据库应用开发推进,使学生在学习解决问题的过程中,学会数据库的应用技术、原理和工具的使用,培学生成为能够胜任生产、服务、技术和管理第一线工作的高素质劳动者和高级技术 应用型人才');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('算法分析与设计',4,'算法设计与分析是计算机应用技术、软件工程、信息与计算科学以及相关专业的一门基础课程。它包含串行、并行;数字、非数字、计算几何等内容。本课程仅包数字、串行算法的部分内容');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('用户界面与设计',4,'用户界面设计是软件工程等专业的一门选修课程。用户界面设计以人机界面学为背景, 算机、艺术设计和心理学等多个学科。本课程主要讲述计算机应用系统中的用户界面设机交互、用户界面设计的过程中要遵循的方法和原则,以及不同用户界面的特点和设计的主要内容有:用户界面及其设计的概念、用户界面设计方法学、用户界面设计的基本人机交互与用户界面设计;文本界面、图形用户界面和Web界面的设计与开发;基于Web的面设计过程及应用系统开发;面向对象的界面设计、MVC模型;可用性的概念及常见测试');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('软件项目管理',4,'本课程论述了软件项目及项目管理的基本概念，涉及从项目的启动、计划、执行到收尾阶段的整个项目生命期的要点。从项目管理的角度，对软件项目开发过程管理和软件项目后期管理的各个环节逐一进行分析。内容包括软件项目管理的概念、软件项目的需求管理、生命周期、可行性研究、人力资源管理、沟通管理、冲突管理、合同管理、时间管理、成本管理、风险管理、质量管理、配置管理、收尾管理等内容。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('信息安全',4,'本课程是网络工程专业学科基础必修课，计算机科学与技术专业的专业限选课，通过本课程的学习，使学生能了解信息安全在信息时代的重要性，培养学生的信息安全防护意识，增强信息系统安全保障能力');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('计算机系统结构',4,'本课程是计算机专业的核心课程之一，主要介绍计算机的系统结构和功能特性。主要内容包括数据表示和指令系统、总线、中断与输入输出系统、存储体系、重叠、流水和向量处理机、阵列处理机、多处理机和其它计算机结构等。通过本课程学习，使学生掌握计算机系统设计思想和设计方法');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('移动互联网开发',4,'通过系统的理论学习和实践，使学生掌握移动Web基本知识；掌握HTML5新技术特性在表单使用、音频和视频应用、Canvas绘图、数据存储以及文件操作处理方面的应用；掌握初步的实验技能，培养学生的科学思维能力、分析计算能力、实验研究能力和科学归纳能力解决问题的能力，为学习后续课程准备必要知识');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('Php程序设计',4,'本课程属于计算机软件开发专业的一门计算机编程语言基础课程，主要学习PHP程序设计语言的知识和应用，具体包括PHP概述、HTML基础、PHP语法基础、流程控制结构、PHP数组、PHP网站开发、MySQL数据库技术和PHP、MySQL数据库编程技术、面向对象技术、PHP安全与加密技术和B2C电子商务网站开发等');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('软件测试',4,'本课程是软件工程专业的专业选修课。其教学目的是通过本课程学习，使学生系统地学习软件测试的基本概念和基本理论，深刻理解和掌握软件测试和软件测试过程的基本方法和基本技术。了解和掌握现代各种新的软件测试技术和主要发展方向。为学生将来从事实际软件测试工作和进一步深入研究打下坚实的理论基础和实践基础');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('编译原理',4,'《编译原理》是计算机科学与技术专业的一门重要基础课。通过对该课程的学习，使学生掌握编译过程中的相关原理和编译技术，让学生能初步进行编译程序的开发和维护，同时促进提高学生开发软件的能力');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('计算机图形学',4,'计算机图形学是研究计算机生成、处理和显示图形的学科。它的重要性体现在人们越来越强烈地需要和谐的人机交互环境：图形用户界面已经成为一个软件的重要组成部分，以图形的方式来表示抽象的概念或数据已经成为信息领域的一个重要发展趋势。通过本课程的学习，使学生掌握计算机图形学的基本原理和基本方法，理解图形绘制的基本算法，学会初步图形程序设计。');
INSERT INTO 课程表(课程名称,课程学分,课程简介) VALUES('LINUX系统与分析',4,'Linux操作系统是一个功能强大而且十分灵活的操作系统，安全行、稳定性好，很少受到病毒和黑客的攻击。本课程系统介绍Linux操作系统的基本操作、讲解系统的安装及配置、系统常用命令的使用，用较多的课时学习系统的图形界面及图形界面下的应用程序的功能及使用方法，特别是对于Linux强大的网络服务功能安排了综合实验来加强应用和动手能力。本课程可以配合操作系统原理课，使学生能理论结合实践');


DROP DATABASE JUNIORASP;

USE JUNIORASP
GO
exec sp_droplogin 'aspnet'

USE JUNIORASP
GO
EXEC sp_dropuser 'aspnet'


INSERT INTO 管理员表(账号, 密码, 管理对象) VALUES('work01', '123456', '教师');