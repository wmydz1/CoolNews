/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - db_news
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_news` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_news`;

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `newsId` int(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `userIP` varchar(40) DEFAULT NULL,
  `commentDate` datetime DEFAULT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

insert  into `t_comment`(`commentId`,`newsId`,`content`,`userIP`,`commentDate`) values (5,104,'是是','127.0.0.1','2014-03-14 09:04:02'),(6,104,'是是','127.0.0.1','2014-03-14 09:04:19'),(7,104,'算法','0:0:0:0:0:0:0:1','2014-04-17 08:35:21'),(8,71,'是','0:0:0:0:0:0:0:1','2014-04-17 08:35:52'),(9,73,'的是速度','0:0:0:0:0:0:0:1','2014-04-17 08:36:01'),(10,104,'das','127.0.0.1','2014-05-12 08:44:43'),(11,104,'da','127.0.0.1','2014-05-12 08:44:45'),(12,104,'dsa','127.0.0.1','2014-05-12 08:44:48');

/*Table structure for table `t_link` */

DROP TABLE IF EXISTS `t_link`;

CREATE TABLE `t_link` (
  `linkId` int(11) NOT NULL AUTO_INCREMENT,
  `linkName` varchar(20) DEFAULT NULL,
  `linkUrl` varchar(40) DEFAULT NULL,
  `linkEmail` varchar(40) DEFAULT NULL,
  `orderNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`linkId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `t_link` */

insert  into `t_link`(`linkId`,`linkName`,`linkUrl`,`linkEmail`,`orderNum`) values (1,'Java1234','http://www.java1234.com','527085608@qq.com',2),(2,'百度','http://www.baidu.com',NULL,1),(3,'CSDN','http://www.csdn.com',NULL,3),(6,'超链2',NULL,NULL,6),(8,'超链4',NULL,NULL,8),(9,'超链5',NULL,NULL,9),(11,'超链7','2','3',2),(14,'开源中国','http://www.oschina.net','123@qq.com',1),(15,'21s','21s','21s',111),(18,'飞哥网','www.feige.com','feige@126.com',100);

/*Table structure for table `t_news` */

DROP TABLE IF EXISTS `t_news`;

CREATE TABLE `t_news` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) DEFAULT NULL,
  `content` text,
  `publishDate` datetime DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `isHead` tinyint(4) DEFAULT NULL,
  `isImage` tinyint(4) DEFAULT NULL,
  `imageName` varchar(20) DEFAULT NULL,
  `isHot` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`newsId`),
  KEY `FK_t_news` (`typeId`),
  CONSTRAINT `FK_t_news` FOREIGN KEY (`typeId`) REFERENCES `t_newstype` (`newsTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

/*Data for the table `t_news` */

insert  into `t_news`(`newsId`,`title`,`content`,`publishDate`,`author`,`typeId`,`click`,`isHead`,`isImage`,`imageName`,`isHot`) values (1,'是是安全性，广泛应用于个人PC、数据中心','Java是一种可以撰写跨平台应用软件的面向对象的程序设计语言，是由Sun Microsystems公司于1995年5月推出的Java程序设计语言和Java平台（即JavaSE, JavaEE, JavaME）的总称。Java 技术具有卓越的通用性、高效性、平台移植性和安全性，广泛应用于个人PC、数据中心、游戏控制台、科学超级计算机、移动电话和互联网，同时拥有全球最大的开发者专业社群。在全球云计算和移动互联网的产业环境下，Java更具备了显著优势和广阔前景。','2013-01-01 00:00:00','222',1,204,1,1,'1a05404f-eda0-477b-b',1),(49,'2133啊','2133444我','2014-03-04 17:23:44','213344',3,5,1,1,'20140304060416.jpg',1),(50,'汪峰是互联网上名副其实的King','<p>不知不觉在百度百家写了很多东西了，多得都吓到自己了，主要是一路写到现在，仍然是文笔幼稚、面目可憎，阿弥陀佛，善哉善哉。</p>\r\n\r\n<p>处于多年的媒体习惯，写东西对我来说不仅仅是满足一己私欲，同时也想借此了解一下网友们口味，美其名曰趋势、指数、习惯。而在这个过程中我真的发现了一点什么。往下看。（括号里为阅读量）</p>\r\n','2014-03-13 15:17:07','小锋',1,1,0,1,'20140313031707.jpg',1),(51,'马来西亚巫师作法再寻失联飞机：这次更奇葩','马航客机MH370失联已经进入第六天了，但搜寻依然没有取得突破性的进展。<br />\r\n此前曾有报道称为了搜寻失联的马航客机，马来西亚不惜用尽各种方法，只要不违反伊斯兰教教义，欢迎任何人参与搜索行动，甚至连马来巫师也不例外。<br />\r\n著名马来巫师伊布拉欣马今（IbrahimMatZin）曾于前日前往吉隆坡国际机场，以透过灵异力量寻找失踪飞机所在位置。他在吉隆坡国际机场入口处祈祷后表示有两种感觉，即飞机还在空中飞或已坠海，但不会坠落在陆地上。<br />\r\n随而昨天，伊布拉欣马今在吉隆坡机场继续做法，这次的道具更加奇葩，除了专门的&ldquo;法器&rdquo;之外还动用了两个椰子，但报道中并未提及这次的结果如何，不知道这次大师会得出什么结论。<br />\r\n<img alt=\"\" src=\"userImage/20140313065252.jpg\" /><br />\r\n<img alt=\"\" src=\"userImage/20140313065421.jpg\" /><br />\r\n<img alt=\"\" src=\"userImage/20140313065432.jpg\" /><br />\r\n<img alt=\"\" src=\"userImage/20140313065443.jpg\" /><br />\r\n<img alt=\"\" src=\"userImage/20140313065452.jpg\" /><br />\r\n&nbsp;','2014-03-13 18:54:57','小锋',2,18,1,1,'20140313065252.jpg',1),(52,'娱乐新闻1','娱乐新闻1','2014-03-13 20:41:24','小锋',1,0,0,1,'20140313084123.jpg',1),(53,'娱乐新闻2','娱乐新闻2','2014-03-13 20:41:58','小锋',1,0,0,0,NULL,1),(64,'娱乐新闻3','娱乐新闻3','2014-03-13 21:18:17','小锋',1,1,0,0,NULL,0),(65,'娱乐新闻4','娱乐新闻4','2014-03-13 21:18:17','小锋',1,0,0,0,NULL,0),(66,'娱乐新闻5','娱乐新闻5','2014-03-13 21:18:17','小锋',1,0,0,0,NULL,0),(67,'娱乐新闻6','娱乐新闻6','2014-03-13 21:18:17','小锋',1,0,0,0,NULL,0),(68,'娱乐新闻7','娱乐新闻7','2014-03-13 21:18:17','小锋',1,0,0,0,NULL,0),(69,'娱乐新闻8','娱乐新闻8','2014-03-13 21:18:17','小锋',1,0,0,0,NULL,0),(71,'政治新闻2','政治新闻8','2014-03-13 22:13:56','小锋',2,3,0,0,NULL,0),(72,'政治新闻3','政治新闻8','2014-03-13 22:13:56','小锋',2,0,0,0,NULL,0),(73,'政治新闻4','政治新闻8','2014-03-13 22:13:56','小锋',2,3,0,0,NULL,0),(74,'政治新闻5','政治新闻8','2014-03-13 22:13:56','小锋',2,1,0,0,NULL,0),(75,'政治新闻6','政治新闻8','2014-03-13 22:13:56','小锋',2,0,0,0,NULL,0),(76,'政治新闻7','政治新闻8','2014-03-13 22:13:56','小锋',2,1,0,0,NULL,0),(77,'政治新闻8','政治新闻8','2014-03-13 22:13:56','小锋',2,0,0,0,NULL,0),(78,'经济新闻1','经济新闻8','2014-03-13 22:14:56','小锋',3,7,0,0,NULL,0),(79,'经济新闻3','经济新闻8','2014-03-13 22:14:56','小锋',3,0,0,0,NULL,0),(80,'经济新闻3','经济新闻8','2014-03-13 22:14:56','小锋',3,0,0,0,NULL,0),(81,'经济新闻4','经济新闻8','2014-03-13 22:14:56','小锋',3,0,0,0,NULL,0),(82,'经济新闻5','经济新闻8','2014-03-13 22:14:56','小锋',3,0,0,0,NULL,0),(83,'经济新闻6','经济新闻8','2014-03-13 22:14:56','小锋',3,0,0,0,NULL,0),(84,'经济新闻7','经济新闻8','2014-03-13 22:14:56','小锋',3,0,0,0,NULL,0),(85,'经济新闻8','经济新闻8','2014-03-13 22:14:56','小锋',3,0,0,0,NULL,0),(86,'文化新闻1','文化新闻8','2014-03-13 22:20:38','小锋',4,0,0,0,NULL,0),(87,'文化新闻4','文化新闻8','2014-03-13 22:20:38','小锋',4,0,0,0,NULL,0),(88,'文化新闻4','文化新闻8','2014-03-13 22:20:38','小锋',4,0,0,0,NULL,0),(89,'文化新闻4','文化新闻8','2014-03-13 22:20:38','小锋',4,0,0,0,NULL,0),(90,'文化新闻5','文化新闻8','2014-03-13 22:20:38','小锋',4,0,0,0,NULL,0),(91,'文化新闻6','文化新闻8','2014-03-13 22:20:38','小锋',4,0,0,0,NULL,0),(92,'文化新闻7','文化新闻8','2014-03-13 22:20:38','小锋',4,0,0,0,NULL,0),(93,'文化新闻8','文化新闻8','2014-03-13 22:20:38','小锋',4,0,0,0,NULL,0),(94,'小道新闻1','小道新闻8','2014-03-13 22:21:03','小锋',5,1,0,0,NULL,0),(95,'小道新闻5','小道新闻8','2014-03-13 22:21:03','小锋',5,1,0,0,NULL,0),(96,'小道新闻5','小道新闻8','2014-03-13 22:21:03','小锋',5,1,0,0,NULL,0),(97,'小道新闻5','小道新闻8','2014-03-13 22:21:03','小锋',5,1,0,0,NULL,0),(98,'小道新闻5','小道新闻8','2014-03-13 22:21:03','小锋',5,1,0,0,NULL,0),(99,'小道新闻6','小道新闻8','2014-03-13 22:21:03','小锋',5,1,0,0,NULL,0),(100,'小道新闻7','小道新闻8','2014-03-13 22:21:03','小锋',5,1,0,0,NULL,0),(101,'小道新闻8','小道新闻8','2014-03-13 22:21:03','小锋',5,1,0,0,NULL,0),(102,'西安幼儿园被指近3年都给孩子吃过药','<p>&nbsp;</p>\r\n<img alt=\"西安幼儿园被指近3年都给孩子吃过药\" src=\"http://img1.gtimg.com/news/pics/hv1/5/34/1542/100277225.jpg\" />\r\n<p>&nbsp;</p>\r\n\r\n<p>一名家长情绪激动</p>\r\n\r\n<p>&nbsp;</p>\r\n<img alt=\"西安幼儿园被指近3年都给孩子吃过药\" src=\"http://img1.gtimg.com/news/pics/hv1/8/34/1542/100277228.jpg\" />\r\n<p>&nbsp;</p>\r\n\r\n<p>家长在幼儿园墙上写下愤怒的语言</p>\r\n\r\n<p>&nbsp;</p>\r\n<img alt=\"西安幼儿园被指近3年都给孩子吃过药\" src=\"http://img1.gtimg.com/news/pics/hv1/6/34/1542/100277226.jpg\" />\r\n<p>&nbsp;</p>\r\n\r\n<p>涉事的幼儿园</p>\r\n\r\n<p>&nbsp;</p>\r\n<img alt=\"西安幼儿园被指近3年都给孩子吃过药\" src=\"http://img1.gtimg.com/news/pics/hv1/7/34/1542/100277227.jpg\" />\r\n<p>&nbsp;</p>\r\n\r\n<p>病毒灵</p>\r\n\r\n<p>西安一家幼儿园被曝在未告知家长的情况下，长期给园内幼儿集体服用抗病毒药物&ldquo;病毒灵&rdquo;。不少孩子被发现存在头晕、腿疼、肚子疼等相同症状，引发众多家长的强烈不满。</p>\r\n\r\n<p>目前，西安市相关部门已开始调查并进行紧急处置，幼儿园园长及相关人员已被警方控制，但关于此事的诸多疑点仍有待解开。</p>\r\n\r\n<p>幼儿园从何时开始给孩子集体服药？给孩子服药出于什么目的？服用这种药物会带来什么样的副作用？西安市有关部门12日对记者称，对于这些问题暂时没有详细的调查结论可以提供。</p>\r\n\r\n<p>□综合新华社电、《华商报》、《<a href=\"http://t.qq.com/xmzkarts#pref=qqcom.keyword\" target=\"_blank\">新民周刊</a>》</p>\r\n\r\n<p><strong>事件 幼儿园私自给幼儿服用&ldquo;病毒灵&rdquo;</strong></p>\r\n\r\n<p>陕西省宋庆龄基金会枫韵幼儿园位于西安市高新区风韵蓝湾小区内，共有690名幼儿。根据家长们的介绍，2007年，幼儿园开园，法人代表孙雪红，院长为赵宝英。</p>\r\n\r\n<p>从2014年3月初开始，陆续有家长发现自己的孩子在幼儿园服用了不明药物。个别有心的家长让孩子将所服的药物带回家中，发现白色药片上面写着&ldquo;ABOB&rdquo;字样，查询后才知道这是一种俗称&ldquo;病毒灵&rdquo;的抗病毒药物。</p>\r\n\r\n<p>根据药物说明，这种药物用于流感病毒及疱疹病毒感染，其不良反应可引起出汗、食欲不振及低血糖等。</p>\r\n\r\n<p>有家长获悉，1999年12月11日国家药监局对地方标准的病毒灵公布停用，理由是效果不确切。还有家长获悉，&ldquo;盐酸吗啉胍片&rdquo;用于小白鼠实验出现小白鼠后代畸形的现象，这更加剧了家长们的担心。</p>\r\n\r\n<p>3月10日，有家长通过微博反映了这一情况，引起众多家长的关注和不满。11日，数十名家长聚集在幼儿园讨要说法，并一度将幼儿园周边道路围堵。</p>\r\n\r\n<p>3月12日上午，记者来到枫韵幼儿园，这里的小操场上正在举行西安市有关部门与家长的沟通会。记者在现场看到，幼儿园多个教室凌乱不堪，医务室内一片狼藉，遍地都是各种文件资料。参加沟通会的许多家长情绪激动，有的人还当场流下眼泪，情绪激动地要求政府部门加大力度处理此事。</p>\r\n\r\n<p><strong>反应 一些男孩子下身红肿、尿不出</strong></p>\r\n\r\n<p>当枫韵幼儿园给幼儿集体服药的秘密被意外发现后，数百名家长闹开了，昌女士这才发现原来自己孩子的症状在这所幼儿园的幼儿中间非常普遍。</p>\r\n\r\n<p>因为给幼儿集体服药的丑闻曝光，3月11日，枫韵幼儿园陷入了瘫痪，家长们集体罢课，并围堵在校门口讨要说法，个别家长因情绪激动围堵附近的道路，被警方带离。</p>\r\n\r\n<p>一位女家长说起这件事情绪激动:&ldquo;千挑万选给孩子找了这家幼儿园，怎么能想到会出这种事情!&rdquo;这位家长说，她的孩子曾说过膝盖疼、腿疼，半夜能疼醒，她觉得肯定是孩子白天跑累了，孩子说肚子疼不想上学，她骂孩子偷懒，以为是孩子不想上学的借口，她没想到，这或许是孩子服药出现的副作用。说到这里，现场十几名家长哭成一片。</p>\r\n\r\n<p>家长们总结了孩子出现的趋同性不良反应:长期便秘、肚子疼、腿疼、出汗、食欲不振。一位家长现场带来了刚刚给孩子做完的体检报告，6岁的孩子被查出肾积水，家长也怀疑是否和服药有关。</p>\r\n\r\n<p><strong>调查 幼儿园近3年都给孩子吃过药</strong></p>\r\n\r\n<p>目前，西安市教育局、食药监局、卫生局、公安局等有关单位组成处置工作小组，进驻幼儿园调查此事。幼儿园业务园长赵宝英、后勤副园长兼保健医生黄林侠被调查人员问话。</p>\r\n\r\n<p>孩子在幼儿园到底吃了多少&ldquo;病毒灵&rdquo;?枫韵幼儿园法人代表孙雪红表示，2012年确实给幼儿吃过&ldquo;病毒灵&rdquo;，当时是禽流感高发期，但在2013年，幼儿园开园务会议时，她明确提出，禽流感已过，必须禁止继续使用&ldquo;病毒灵&rdquo;，没想到，今年保健医生再次给孩子用了这个药。</p>\r\n\r\n<p>3月11日，有家长在幼儿园的医务室找到的几张用药记录显示，2013年3月6日、7日，3月13日、14日、15日，幼儿园给小班、中班和大班的孩子集体服用&ldquo;病毒灵&rdquo;。还有2014年的服药记录，分别是2月13日、14日，3月5日、6日、7日。但幼儿园到底给孩子们服药多长时间，调查组还在调查。</p>\r\n\r\n<p><strong>各方回应</strong></p>\r\n\r\n<p><strong>官方:幼儿服用的&ldquo;病毒灵&rdquo;毒性小</strong></p>\r\n\r\n<p>记者从西安市政府了解到，西安市卫生局组织多家医院的药剂科、神经内科、感染科、呼吸科专家，对枫韵幼儿园给在园儿童服用药品的适应症、禁忌症、疗效、毒副作用等方面进行讨论。</p>\r\n\r\n<p>经专家讨论认为:一是枫韵幼儿园使用的病毒灵为国药准字号药物，药品在有效期内，有儿童服用剂量说明INSERT INTO t_news VALUES(10mg/kg)，为处方用药;二是经讨论及查阅相关文献，预防性用药效果不明显;三是&ldquo;病毒灵&rdquo;的不良反应可引起出汗、食欲不振及低血糖等反应，查阅此药的相关文献及资料，未见其他不良反应;四是在服药方面，日服用量未超过说明书的剂量，单次剂量仅小班孩子略微超量，且服用时间为2-3天，未长时间服用，引起蓄积毒副作用的可能性较小;五是如出现不适症状，建议医学观察。</p>\r\n\r\n<p><strong>家长:专家作出的结论过于草率</strong></p>\r\n\r\n<p>但接受记者采访的多位家长对上述结论并不认可。在3月12日举行的沟通会上，许多家长提出政府部门组织专家作出的结论过于草率，药物对孩子身体是否造成长期性损害不能轻易下结论。一些家长甚至提出在政府出资的情况下自行带孩子进行独立检查，以确定孩子的身体状况。</p>\r\n\r\n<p>对于幼儿园给孩子服药的目的，虽然官方尚无定论，但许多家长有着自己的看法。</p>\r\n\r\n<p>一些家长告诉记者，枫韵幼儿园是一所民办幼儿园，每月收费1100元到1200元左右。按照收费办法，如果幼儿缺勤幼儿园就要给家长退费。如超过十天缺勤，就要退一半的托费。园方为了确保孩子不生病，保证幼儿出勤率，才会给孩子服用这种抗病毒药物。</p>\r\n\r\n<p><strong>事件追问</strong></p>\r\n\r\n<p><strong>幼儿园的1万粒药从哪来的?</strong></p>\r\n\r\n<p>关于药物来源，西安市食品药品监督管理局药品稽查分局负责人表示，3月10日晚，接家长举报后，稽查人员在幼儿园保健室发现一瓶&ldquo;病毒灵&rdquo;，里面只有3粒，当场对药品进行查封，在检查中还发现一张幼儿园购进药品的票据，显示该药是在西安一家药品批发企业批发的，该企业有资质，幼儿园一次批发100瓶，也就是1万粒。</p>\r\n\r\n<p>那么，孩子们服用的药品本身是否安全?该人士表示，多部门对市内一些零售药店里的&ldquo;病毒灵&rdquo;进行了检查，没有发现与幼儿园内同一批次的药，目前在甘肃天水市找到同一批次的&ldquo;病毒灵&rdquo;，正联系对方向西安发货。药品稽查分局收到该药后，将第一时间送往西安市食品药品检验所检验。</p>\r\n\r\n<p><strong>保健医生可以开处方药吗?</strong></p>\r\n\r\n<p>事发后，枫韵幼儿园后勤副园长兼保健医生黄林侠被警方控制。该幼儿园法人代表接受采访时表示，幼儿园的保健医生是有医师资格证的。</p>\r\n\r\n<p>经查，黄林侠目前只能提供一张广东省发的医师资格证的复印件，但按照规定，从业医师必须在从业机构所在地的卫生部门注册后，才有医师资格。据查，黄林侠并没有在雁塔区注册，所以，黄林侠没有给幼儿开处方药的资质，而&ldquo;病毒灵&rdquo;就属于处方药。</p>\r\n\r\n<p>3月10日，不需要任何处方等凭证，记者在含光北路一家药店轻松购买了一瓶&ldquo;病毒灵&rdquo;，处方药是否一定要凭处方购买呢?西安交大二附院儿科教授侯伟表示，按照规定，处方药必须凭借医生处方去药店或医院购买，但在实际中，药店执行不严格，没有处方也能买到处方药。</p>\r\n','2014-03-13 23:00:11','小锋',5,5,0,1,'20140313110011.jpg',1),(103,'昆明火车站暴恐案直击:暴徒见人就砍现场混乱血腥','<img alt=\"\" src=\"userImage/20140313111425.jpg\" /><br />\r\n<br />\r\n　3月1日晚拍摄的昆明火车站一售票大厅外散落的行李INSERT INTO t_news VALUES(手机拍摄)。3月1日晚9时20分，10余名统一着装的暴徒蒙面持刀在云南昆明火车站广场、售票厅等处砍杀无辜群众，截至3月2日1时，暴力案件已造成28名群众遇难、113名群众受伤。公安干警当场击毙5名暴徒，其余暴徒仍在围捕中。新华社记者蔺以光摄<br />\r\n<br />\r\n　　昆明火车站暴力恐怖事件直击<br />\r\n<br />\r\n　　新华网北京３月２日新媒体专电INSERT INTO t_news VALUES(新华社&ldquo;中国网事&rdquo;记者)３月１日晚９时２０分，１０余名统一着装的暴徒蒙面持刀在云南昆明火车站广场、售票厅等处砍杀无辜群众，截至３月２日１时，暴力案件已造成２８名群众遇难、１１３名群众受伤。公安干警当场击毙５名暴徒，其余暴徒仍在围捕中。<br />\r\n<br />\r\n　　云南省政法委认为，这是一起有组织、有计划、严重暴力恐怖袭击事件，性质极其恶劣，并对后续工作进行迅速安排。<br />\r\n<br />\r\n　　暴徒如此残忍，竟在人群密集的车站持刀肆意砍杀无辜群众。人们不禁要问：这些人为什么要这样心狠？<br />\r\n&nbsp;','2014-03-13 23:14:48','小锋',5,14,0,1,'20140313111448.jpg',1),(104,'香港少女穿热裤短裙便利店偷零食被捕2','<img alt=\"\" src=\"userImage/20140314090311.jpg\" style=\"height:338px; width:400px\" /><br />\r\n&nbsp;\r\n<p>　<a href=\"http://www.chinanews.com/\" target=\"_blank\">中新网</a>3月13日电 据香港《文汇报》报道，香港牛头角彩盈鸷发生店铺盗窃案，3名少年男女昨INSERT INTO t_news VALUES(12日)午进入该鸷商场一间便利店，涉嫌扮顾客购物，乘机偷取包括三文治和朱古力饮料等零食，夺门逃走时被职员揭发，警员到场将他们拘捕带署扣查。</p>\r\n\r\n<table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>　　事发昨下午3时许，一名10余岁少年与2名分别穿热裤和短裙、年龄相若的少女，一同走进彩盈鸷商场一间便利店，在货架和雪柜旁徘徊状似选购货物，其间有人涉嫌从货架和雪柜中偷取包括三文治、花生和纸包朱古力饮品等零食，并收藏在衫袋内欲走向店门离开。但该店职员见他们形迹可疑，早已从旁暗中监视，随即将他们截停以及报警求助。</p>\r\n\r\n<p>　　警员接报迅速赶至调查，怀疑3名少年男女涉嫌店铺盗窃，并当场起出赃物，于是将3人拘捕，其间该名少年一度试图发难突围逃走，但终被警员制服，与其余2名少女一并被带署扣查。2</p>\r\n','2014-03-14 09:03:35','小锋',1,44,1,1,'20140313031707.jpg',1),(105,'吊','是是','2014-03-14 09:07:38','小锋',6,2,0,0,NULL,0),(106,'张三中了500万','<p>500万好啊</p>\r\n','2014-05-22 08:57:49','cc',3,1,1,1,'20140522085716.jpg',1),(107,'fdas','<p>dasfads</p>\r\n\r\n<p>dsa<img alt=\"\" src=\"userImage/20140522090035.jpg\" style=\"height:431px; width:500px\" /></p>\r\n','2014-05-22 09:00:54','fda',1,1,0,1,'20140522090054.jpg',0),(108,'111','<p>222</p>\r\n','2014-05-26 07:36:31','2222',1,0,0,0,NULL,0),(109,'2','<p>2</p>\r\n','2014-05-28 07:44:13','2',1,0,0,0,NULL,0),(110,'3','<p>3</p>\r\n','2014-05-28 07:50:58','3',1,0,0,0,NULL,0);

/*Table structure for table `t_newstype` */

DROP TABLE IF EXISTS `t_newstype`;

CREATE TABLE `t_newstype` (
  `newsTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`newsTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_newstype` */

insert  into `t_newstype`(`newsTypeId`,`typeName`) values (1,'娱乐新闻'),(2,'政治新闻'),(3,'经济新闻'),(4,'文化新闻'),(5,'小道新闻'),(6,'屌炸天新闻');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`userId`,`userName`,`password`) values (1,'java1234','123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
