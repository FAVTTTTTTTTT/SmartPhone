-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: smartphone
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbql1m2v2po7hcawonqsgqex88` (`cart_id`),
  KEY `FKclb1c0wg3mofxnpgidib1t987` (`product_id`),
  CONSTRAINT `FKbql1m2v2po7hcawonqsgqex88` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `FKclb1c0wg3mofxnpgidib1t987` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sum` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK64t7ox312pqal3p7fg9o503c2` (`user_id`),
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_chk_1` CHECK ((`sum` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  KEY `FKc7q42e9tu0hslx6w4wxgomhvn` (`product_id`),
  CONSTRAINT `FKc7q42e9tu0hslx6w4wxgomhvn` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,29390000,1,1,2);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'TPHCM','Duy','0866179832','PENDING',29390000,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `detail_desc` mediumtext NOT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `sold` bigint NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'ƒêi·ªán tho·∫°i Samsung Galaxy A35 5G 8GB/256GB','SAMSUNG','1711078092373-samsung-01.png','Samsung Galaxy A35 5G',8490000,100,'8GB/256GB',0,'Phone'),(2,'ƒêi·ªán tho·∫°i iPhone 15 Pro Max 256GB ','IPHONE','1711078452562-iphone-01.png','IPhone 15 Pro Max',29390000,200,'8GB/256GB',0,'Phone'),(3,'ƒêi·ªán tho·∫°i Samsung Galaxy S23 Ultra 5G','SAMSUNG','samsung-galaxy-s23-ultra-xanh-1.jpg','Samsung Galaxy S23 Ultra 5G',23999000,150,'8GB/256GB',0,'Phone'),(4,'M√°y t√≠nh b·∫£ng iPad Pro M4 13 inch WiFi','IPAD','1711079496409-ipad-02.png','iPad Pro M4 13 inch WiFi',37990000,99,'8GB/256GB',0,'IPAD'),(5,'ƒêi·ªán tho·∫°i iPhone 13','IPHONE','1711079954090-iphone13-01.png','IPhone 13',14490000,99,'4GB/128GB',0,'PHONE'),(6,'ƒêi·ªán tho·∫°i Samsung Galaxy M35 5G 8GB/256GB','SAMSUNG','1711080386941-m53-01.png','Samsung Galaxy M35 5G',8490000,99,'8GB/256GB',0,'PHONE'),(7,'M√°y t√≠nh b·∫£ng Samsung Galaxy Tab S9+ 5G 12GB/256GB ','IPAD','1711080787179-padsamsung-02.png','Samsung Galaxy Tab S9+ 5G',25990000,99,'12GB/256GB',0,'IPAD'),(8,'ƒêi·ªán tho·∫°i iPhone 14 Pro Max 128GB','IPHONE','1711080948771-ip14ps-01.png','IPhone 14 Pro Max',26990000,99,'6GB/128GB',0,'PHONE'),(9,'ƒêi·ªán tho·∫°i Samsung Galaxy S23 FE 5G 8GB/256GB','IPHONE','1711081080930-s235gb-03.png','Samsung Galaxy S23 FE 5G',13290000,99,'8GB/256GB',0,'IPHONE'),(10,'M√°y t√≠nh b·∫£ng iPad Air 6 M2 13 inch WiFi 128GB ','IPAD','1711081278418-m6-02.png','M√°y t√≠nh b·∫£ng iPad Air 6 M2 13 inch WiFi 128GB ',21399000,99,'8GB/128GB',0,'IPAD'),(11,'Ti·∫øp n·ªëi th√†nh c√¥ng c·ªßa Galaxy M53 5G, Samsung ti·∫øp t·ª•c tung ra th·ªã tr∆∞·ªùng m·∫´u ƒëi·ªán tho·∫°i Samsung Galaxy M54 5G. L·∫ßn ra m·∫Øt n√†y Samsung ƒë√£ n√¢ng c·∫•p v·ªÅ m·∫∑t hi·ªáu nƒÉng, dung l∆∞·ª£ng pin ƒë·ªìng th·ªùi c·∫£i ti·∫øn v·ªÅ m·∫∑t thi·∫øt k·∫ø gi√∫p ƒëem ƒë·∫øn s·∫£n ph·∫©m t·ªët nh·∫•t cho b·∫°n.','ASUS','1721792312215-samsung-galaxy-m54-den-1.jpg','Samsung Galaxy M54 5G',8000000,100,'8GB/256GB',0,'ASUS');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'It\'s Admin','ADMIN'),(2,'It\'s user','USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('7050f0e8-1564-49c8-968d-3a6f702dd442','29ca3a10-9dfe-4946-b224-534a0675cd8b',1721532267532,1721532307152,2592000,1724124307152,'admin@gmail.com'),('7e846890-0b52-4119-aabe-a45d65552938','7ff8410e-d92a-4527-abd2-635fedf3ce63',1721502489427,1721792778344,2592000,1724384778344,'admin@gmail.com');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('7050f0e8-1564-49c8-968d-3a6f702dd442','email',_binary '¨\Ì\0t\0admin@gmail.com'),('7050f0e8-1564-49c8-968d-3a6f702dd442','fullName',_binary '¨\Ì\0t\0Nguy√™ÃÉn Qu·ªëc  Duy'),('7050f0e8-1564-49c8-968d-3a6f702dd442','id',_binary '¨\Ì\0sr\0java.lang.Long;ã\‰êÃè#\ﬂ\0J\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0\0\0\0'),('7050f0e8-1564-49c8-968d-3a6f702dd442','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '¨\Ì\0t\0UTF-8'),('7050f0e8-1564-49c8-968d-3a6f702dd442','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '¨\Ì\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\Ô∑\»/¢˚\’\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$76a72492-d5ed-4d8d-955e-832fdb7e86da'),('7050f0e8-1564-49c8-968d-3a6f702dd442','SPRING_SECURITY_CONTEXT',_binary '¨\Ì\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$2d126ca7-f263-4c20-af5e-4e770e473b2epsr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0\nsr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('7050f0e8-1564-49c8-968d-3a6f702dd442','SPRING_SECURITY_SAVED_REQUEST',_binary '¨\Ì\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0êt\0\0sr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xpˇˇˇˇ\0\0\0\0\0ppt\0\nJSESSIONIDpt\0 D8A9E788276E7D2186B7D603A3EE9DD9sq\0~\0ˇˇˇˇ\0\0\0\0\0ppt\0SESSIONpt\00MmQxMjZjYTctZjI2My00YzIwLWFmNWUtNGU3NzBlNDczYjJlxsr\0java.util.TreeMap¡ˆ>-%j\Ê\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\Â\Œ\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0átext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0en-US,en;q=0.9xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\0eJSESSIONID=D8A9E788276E7D2186B7D603A3EE9DD9; SESSION=MmQxMjZjYTctZjI2My00YzIwLWFmNWUtNGU3NzBlNDczYjJlxt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\09\"Opera\";v=\"111\", \"Chromium\";v=\"125\", \"Not.A/Brand\";v=\"24\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0documentxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0nonext\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0}Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 OPR/111.0.0.0xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~¯`ú0˘\Ï\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xpˇˇˇˇt\0USq\0~\0t\0enq\0~\0q\0~\0xsq\0~\0Bˇˇˇˇq\0~\0q\0~\0q\0~\0Eq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0t\0expiredur\0[Ljava.lang.String;≠\“V\Á\È{G\0\0xp\0\0\0q\0~\0xpt\0expiredt\0/logoutt\0http://localhost:8080/logoutt\0httpt\0	localhostt\0/logout'),('7050f0e8-1564-49c8-968d-3a6f702dd442','sum',_binary '¨\Ì\0sr\0java.lang.Integer‚†§˜Åá8\0I\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0'),('7e846890-0b52-4119-aabe-a45d65552938','email',_binary '¨\Ì\0t\0admin@gmail.com'),('7e846890-0b52-4119-aabe-a45d65552938','fullName',_binary '¨\Ì\0t\0Nguy√™ÃÉn Qu·ªëc  Duy'),('7e846890-0b52-4119-aabe-a45d65552938','id',_binary '¨\Ì\0sr\0java.lang.Long;ã\‰êÃè#\ﬂ\0J\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0\0\0\0'),('7e846890-0b52-4119-aabe-a45d65552938','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '¨\Ì\0t\0UTF-8'),('7e846890-0b52-4119-aabe-a45d65552938','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '¨\Ì\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\Ô∑\»/¢˚\’\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$8f984cfb-044d-42fb-b65c-c38accb1b11c'),('7e846890-0b52-4119-aabe-a45d65552938','SPRING_SECURITY_CONTEXT',_binary '¨\Ì\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationToken”™(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList¸%1µ\Ïé\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0Ä\À^˜\0L\0cq\0~\0xpsr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$46330afe-df0a-46de-9b27-03252ad33ae1psr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSetÄí—èõÄU\0\0xq\0~\0\nsr\0java.util.TreeSet›òPìï\Ìá[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0admin@gmail.com'),('7e846890-0b52-4119-aabe-a45d65552938','SPRING_SECURITY_SAVED_REQUEST',_binary '¨\Ì\0sr\0Aorg.springframework.security.web.savedrequest.DefaultSavedRequest\0\0\0\0\0\0l\0I\0\nserverPortL\0contextPatht\0Ljava/lang/String;L\0cookiest\0Ljava/util/ArrayList;L\0headerst\0Ljava/util/Map;L\0localesq\0~\0L\0matchingRequestParameterNameq\0~\0L\0methodq\0~\0L\0\nparametersq\0~\0L\0pathInfoq\0~\0L\0queryStringq\0~\0L\0\nrequestURIq\0~\0L\0\nrequestURLq\0~\0L\0schemeq\0~\0L\0\nserverNameq\0~\0L\0servletPathq\0~\0xp\0\0êt\0\0sr\0java.util.ArrayListxÅ\“ô\«aù\0I\0sizexp\0\0\0w\0\0\0sr\09org.springframework.security.web.savedrequest.SavedCookie\0\0\0\0\0\0l\0I\0maxAgeZ\0secureI\0versionL\0commentq\0~\0L\0domainq\0~\0L\0nameq\0~\0L\0pathq\0~\0L\0valueq\0~\0xpˇˇˇˇ\0\0\0\0\0ppt\0SESSIONpt\00NDYzMzBhZmUtZGYwYS00NmRlLTliMjctMDMyNTJhZDMzYWUxxsr\0java.util.TreeMap¡ˆ>-%j\Ê\0L\0\ncomparatort\0Ljava/util/Comparator;xpsr\0*java.lang.String$CaseInsensitiveComparatorw\\}\\P\Â\Œ\0\0xpw\0\0\0t\0acceptsq\0~\0\0\0\0w\0\0\0t\0átext/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7xt\0accept-encodingsq\0~\0\0\0\0w\0\0\0t\0gzip, deflate, br, zstdxt\0accept-languagesq\0~\0\0\0\0w\0\0\0t\0en,vi;q=0.9xt\0\nconnectionsq\0~\0\0\0\0w\0\0\0t\0\nkeep-alivext\0cookiesq\0~\0\0\0\0w\0\0\0t\08SESSION=NDYzMzBhZmUtZGYwYS00NmRlLTliMjctMDMyNTJhZDMzYWUxxt\0hostsq\0~\0\0\0\0w\0\0\0t\0localhost:8080xt\0	sec-ch-uasq\0~\0\0\0\0w\0\0\0t\0@\"Not/A)Brand\";v=\"8\", \"Chromium\";v=\"126\", \"Google Chrome\";v=\"126\"xt\0sec-ch-ua-mobilesq\0~\0\0\0\0w\0\0\0t\0?0xt\0sec-ch-ua-platformsq\0~\0\0\0\0w\0\0\0t\0	\"Windows\"xt\0sec-fetch-destsq\0~\0\0\0\0w\0\0\0t\0documentxt\0sec-fetch-modesq\0~\0\0\0\0w\0\0\0t\0navigatext\0sec-fetch-sitesq\0~\0\0\0\0w\0\0\0t\0nonext\0sec-fetch-usersq\0~\0\0\0\0w\0\0\0t\0?1xt\0upgrade-insecure-requestssq\0~\0\0\0\0w\0\0\0t\01xt\0\nuser-agentsq\0~\0\0\0\0w\0\0\0t\0oMozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36xxsq\0~\0\0\0\0w\0\0\0sr\0java.util.Locale~¯`ú0˘\Ï\0I\0hashcodeL\0countryq\0~\0L\0\nextensionsq\0~\0L\0languageq\0~\0L\0scriptq\0~\0L\0variantq\0~\0xpˇˇˇˇq\0~\0q\0~\0t\0enq\0~\0q\0~\0xsq\0~\0?ˇˇˇˇq\0~\0q\0~\0t\0viq\0~\0q\0~\0xxt\0continuet\0GETsq\0~\0pw\0\0\0t\0expiredur\0[Ljava.lang.String;≠\“V\Á\È{G\0\0xp\0\0\0q\0~\0xpt\0expiredt\0/logoutt\0http://localhost:8080/logoutt\0httpt\0	localhostt\0/logout'),('7e846890-0b52-4119-aabe-a45d65552938','sum',_binary '¨\Ì\0sr\0java.lang.Integer‚†§˜Åá8\0I\0valuexr\0java.lang.NumberÜ¨ïî\‡ã\0\0xp\0\0\0\0');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,'admin@gmail.com','Nguy√™ÃÉn Qu·ªëc  Duy','$2a$10$Gg2Sscgn3jc7vkl2W5OZf.IKDC5PvkkG3nAmyn4DQ1FIKUpe/wnyS',NULL,1),(2,NULL,NULL,'user@gmail.com','Duy Duy','$2a$10$fyzCDPB6hVXePFXRlvwuUuxkNQILFeFCyuRfO45PHPl.jU5qBYPSO',NULL,2),(3,NULL,NULL,'user2@gmail.com','Duy Duy','$2a$10$pNdO9/AWibD26gkbmpEHxOxYle6Xif37a7pm1V1nVFyuVEQWWBPH.',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-24 11:03:59
