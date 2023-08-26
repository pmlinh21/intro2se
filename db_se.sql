/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `admin_se` (
  `id_admin` int NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `avatar` text,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `admin_se_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `company` (
  `id_company` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `avatar` text,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `address` text,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id_company`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `company_license` (
  `id_company` int NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_company`,`file_path`),
  CONSTRAINT `company_license_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `destination` (
  `id_des` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_des`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guide_attraction` (
  `id_guide` int NOT NULL,
  `id_attraction` int NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `title` text,
  `content` text,
  PRIMARY KEY (`id_guide`,`id_attraction`),
  CONSTRAINT `guide_attraction_ibfk_1` FOREIGN KEY (`id_guide`) REFERENCES `tour_guide` (`id_guide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guide_booking` (
  `id_guidebooking` int NOT NULL AUTO_INCREMENT,
  `id_guidetime` int NOT NULL,
  `id_tourist` int NOT NULL,
  `booking_date` datetime DEFAULT NULL,
  `meeting_point` text,
  `price` float DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_guidebooking`),
  KEY `id_guidetime` (`id_guidetime`),
  KEY `id_tourist` (`id_tourist`),
  CONSTRAINT `guide_booking_ibfk_1` FOREIGN KEY (`id_guidetime`) REFERENCES `guide_time` (`id_guidetime`),
  CONSTRAINT `guide_booking_ibfk_2` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id_tourist`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guide_language` (
  `id_guide` int NOT NULL,
  `id_lang` int NOT NULL,
  PRIMARY KEY (`id_guide`,`id_lang`),
  KEY `id_lang` (`id_lang`),
  CONSTRAINT `guide_language_ibfk_1` FOREIGN KEY (`id_guide`) REFERENCES `tour_guide` (`id_guide`),
  CONSTRAINT `guide_language_ibfk_2` FOREIGN KEY (`id_lang`) REFERENCES `languages` (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guide_license` (
  `id_guide` int NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_guide`,`file_path`),
  CONSTRAINT `guide_license_ibfk_1` FOREIGN KEY (`id_guide`) REFERENCES `tour_guide` (`id_guide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guide_recently` (
  `id_tourist` int NOT NULL,
  `id_guide` int NOT NULL,
  `time_view` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tourist`,`id_guide`),
  KEY `id_guide` (`id_guide`),
  CONSTRAINT `guide_recently_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id_tourist`),
  CONSTRAINT `guide_recently_ibfk_2` FOREIGN KEY (`id_guide`) REFERENCES `tour_guide` (`id_guide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guide_report` (
  `id_tourist` int NOT NULL,
  `id_guide` int NOT NULL,
  `report_date` datetime DEFAULT NULL,
  `content` text,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_tourist`,`id_guide`),
  KEY `id_guide` (`id_guide`),
  CONSTRAINT `guide_report_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id_tourist`),
  CONSTRAINT `guide_report_ibfk_2` FOREIGN KEY (`id_guide`) REFERENCES `tour_guide` (`id_guide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guide_review` (
  `id_guidebooking` int NOT NULL,
  `rating` int DEFAULT NULL,
  `review` text,
  `review_date` datetime DEFAULT NULL,
  `reply` text,
  `reply_date` datetime DEFAULT NULL,
  `report` text,
  `report_date` datetime DEFAULT NULL,
  `report_status` int DEFAULT NULL,
  PRIMARY KEY (`id_guidebooking`),
  CONSTRAINT `guide_review_ibfk_1` FOREIGN KEY (`id_guidebooking`) REFERENCES `guide_booking` (`id_guidebooking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guide_time` (
  `id_guidetime` int NOT NULL AUTO_INCREMENT,
  `id_guide` int NOT NULL,
  `guide_date` date NOT NULL,
  `guide_session` int NOT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_guidetime`),
  KEY `id_guide` (`id_guide`),
  CONSTRAINT `guide_time_ibfk_1` FOREIGN KEY (`id_guide`) REFERENCES `tour_guide` (`id_guide`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `guide_wishlist` (
  `id_tourist` int NOT NULL,
  `id_guide` int NOT NULL,
  PRIMARY KEY (`id_tourist`,`id_guide`),
  KEY `id_guide` (`id_guide`),
  CONSTRAINT `guide_wishlist_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id_tourist`),
  CONSTRAINT `guide_wishlist_ibfk_2` FOREIGN KEY (`id_guide`) REFERENCES `tour_guide` (`id_guide`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `languages` (
  `id_lang` int NOT NULL,
  `lang_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `role` (
  `id_role` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `search_history` (
  `id_tourist` int NOT NULL,
  `id_des` int NOT NULL,
  `time_search` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tourist`,`id_des`),
  KEY `id_des` (`id_des`),
  CONSTRAINT `search_history_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id_tourist`),
  CONSTRAINT `search_history_ibfk_2` FOREIGN KEY (`id_des`) REFERENCES `destination` (`id_des`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tour` (
  `id_tour` int NOT NULL AUTO_INCREMENT,
  `id_company` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_des` int DEFAULT NULL,
  `id_category` int DEFAULT NULL,
  `num_max` int DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `description` text,
  `schedule` varchar(255) DEFAULT NULL,
  `included` varchar(255) DEFAULT NULL,
  `not_included` varchar(255) DEFAULT NULL,
  `ggmap_address` text,
  `price` float DEFAULT NULL,
  `free_cancellation` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_tour`),
  KEY `id_company` (`id_company`),
  KEY `id_des` (`id_des`),
  KEY `id_category` (`id_category`),
  CONSTRAINT `tour_ibfk_1` FOREIGN KEY (`id_company`) REFERENCES `company` (`id_company`),
  CONSTRAINT `tour_ibfk_2` FOREIGN KEY (`id_des`) REFERENCES `destination` (`id_des`),
  CONSTRAINT `tour_ibfk_3` FOREIGN KEY (`id_category`) REFERENCES `tour_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tour_booking` (
  `id_tour_booking` int NOT NULL AUTO_INCREMENT,
  `id_tour` int DEFAULT NULL,
  `id_tourist` int DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `num_tourist` int DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `status` int DEFAULT NULL,
  `free_cancel` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_tour_booking`),
  KEY `id_tourist` (`id_tourist`),
  KEY `id_tour` (`id_tour`),
  CONSTRAINT `tour_booking_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id_tourist`),
  CONSTRAINT `tour_booking_ibfk_2` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id_tour`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tour_category` (
  `id_category` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tour_guide` (
  `id_guide` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) DEFAULT NULL,
  `avatar` text,
  `fullname` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `id_des` int DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `description` text,
  `price_per_session` float DEFAULT NULL,
  `free_cancellation` tinyint(1) DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id_guide`),
  KEY `id_role` (`id_role`),
  KEY `id_des` (`id_des`),
  CONSTRAINT `tour_guide_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`),
  CONSTRAINT `tour_guide_ibfk_2` FOREIGN KEY (`id_des`) REFERENCES `destination` (`id_des`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tour_photo` (
  `id_tour` int NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tour`),
  CONSTRAINT `tour_photo_ibfk_1` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id_tour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tour_recently` (
  `id_tourist` int NOT NULL,
  `id_tour` int NOT NULL,
  `time_view` datetime DEFAULT NULL,
  PRIMARY KEY (`id_tourist`,`id_tour`),
  KEY `id_tour` (`id_tour`),
  CONSTRAINT `tour_recently_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id_tourist`),
  CONSTRAINT `tour_recently_ibfk_2` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id_tour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tour_report` (
  `id_tourist` int NOT NULL,
  `id_tour` int NOT NULL,
  `report_date` datetime DEFAULT NULL,
  `content` text,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id_tourist`,`id_tour`),
  KEY `id_tour` (`id_tour`),
  CONSTRAINT `tour_report_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id_tourist`),
  CONSTRAINT `tour_report_ibfk_2` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id_tour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tour_review` (
  `id_tour_booking` int NOT NULL,
  `rating` int DEFAULT NULL,
  `review` text,
  `review_date` datetime DEFAULT NULL,
  `reply` text,
  `reply_date` datetime DEFAULT NULL,
  `report` text,
  `report_date` datetime DEFAULT NULL,
  `report_status` int DEFAULT NULL,
  PRIMARY KEY (`id_tour_booking`),
  CONSTRAINT `tour_review_ibfk_1` FOREIGN KEY (`id_tour_booking`) REFERENCES `tour_booking` (`id_tour_booking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tour_wishlist` (
  `id_tourist` int NOT NULL,
  `id_tour` int NOT NULL,
  PRIMARY KEY (`id_tourist`,`id_tour`),
  KEY `id_tour` (`id_tour`),
  CONSTRAINT `tour_wishlist_ibfk_1` FOREIGN KEY (`id_tourist`) REFERENCES `tourist` (`id_tourist`),
  CONSTRAINT `tour_wishlist_ibfk_2` FOREIGN KEY (`id_tour`) REFERENCES `tour` (`id_tour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tourist` (
  `id_tourist` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` text,
  `phone` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `id_role` int DEFAULT NULL,
  PRIMARY KEY (`id_tourist`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `tourist_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `admin_se` (`id_admin`, `fullname`, `password`, `email`, `phone`, `birthday`, `gender`, `avatar`, `id_role`) VALUES
(1, 'Nguyen Thanh Vinh', '$2b$10$Iobenova0oQM69.xcRy.seWYUDJ5i7JvXZqRCXEAqjtoWLKMkvqt6', 'thanhvinhnguyen334@gmail.com', '9865365541', '2003-05-13', 0, '1693039097504_shinchan.jpg', 4);
INSERT INTO `admin_se` (`id_admin`, `fullname`, `password`, `email`, `phone`, `birthday`, `gender`, `avatar`, `id_role`) VALUES
(3, 'Tran Mai Li', '$2b$10$kjNJoZQjFY8xe.25YmEaIOZW5TgbUMQK.NWdh.wfPEFXSpmXp1Y7a', 'mailinhbg24@gmail.com', '8138659871', '1988-08-05', 1, '1693039907325_bochan.jpg', 4);
INSERT INTO `admin_se` (`id_admin`, `fullname`, `password`, `email`, `phone`, `birthday`, `gender`, `avatar`, `id_role`) VALUES
(4, 'Ha Cam Ly', '$2b$10$AjfsXew/oaVO5dSNYFzPwedkUuZeFaVzMyrqVzs62p93AktB1ZUIK', 'camlyha39@gmail.com', '9563654781', '1999-11-08', 1, '1693039937684_shin.png', 4);
INSERT INTO `admin_se` (`id_admin`, `fullname`, `password`, `email`, `phone`, `birthday`, `gender`, `avatar`, `id_role`) VALUES
(5, 'Nguyen Thi Huyen Nga', '$2b$10$iX3wc2ZMoiTUtmZUThPDYeKfHp7bHF861sZp.7SR/Mu4GM8CK/F2u', 'huyennganguyenbg@gmail.com', '9788522311', '1989-09-12', 1, 'bochan.jpg', 4);

INSERT INTO `company` (`id_company`, `password`, `avatar`, `name`, `email`, `phone`, `website`, `address`, `id_role`) VALUES
(1, '$2b$10$zO0Csbh.mJ3.C3lFBGY69ukiGkpP51qYVCHkjeYr1jyEQ4gf/QJla', '1691749972197_company1.jpg', 'LD Group', 'ldgroup@gmail.com', '2456369667', 'http://www.ldgroup.vn', '54 Nguyen Tan Ky, Tran Phu ward, Quang Ngai city, Quang Ngai province', 2);
INSERT INTO `company` (`id_company`, `password`, `avatar`, `name`, `email`, `phone`, `website`, `address`, `id_role`) VALUES
(2, '$2b$10$e2HLEslOSnkVMwhADL/5m.HXMwpK5sKZSVRixiWySF2saHieStO5O', '1691750120776_company5.png', 'Cong ty co phan ', 'lelamctcp@gmail.com', '2568878800', 'http://www.d', '106 Building C, Nguyen Cong Tru dormitory, Pho Hue ward, Hai Ba Trung district, Hanoi', 2);
INSERT INTO `company` (`id_company`, `password`, `avatar`, `name`, `email`, `phone`, `website`, `address`, `id_role`) VALUES
(3, '$2b$10$en7K99Jhbi4chCiZdf03j.zACqOSUbYKRxGDPfCDH3odaqMb4YQ8S', '1691750158927_company2.jpg', 'TBC Group', 'tbcvietnam@gmail.com', '245636663', 'www.tbcvietnam.vn', '285B Dinh Bo Linh, Ward 26, Binh Thanh District, HCMC', 2);
INSERT INTO `company` (`id_company`, `password`, `avatar`, `name`, `email`, `phone`, `website`, `address`, `id_role`) VALUES
(4, '$2b$10$eMckPEKCgpnX9fgRLuEvJO7P7hF16JcZiUnvyutyfY8BUejV4RsVu', '1692529325110_attraction_1.jpg', 'Công ty TNHH Ha Lan', 'halangroup@gmail.com', '256966366', 'www.halangroupvn.com', '70 Lo Ren, Group 5, Thuan Trung Hamlet, Hoa Thuan Ward, Cao Lanh City, Dong Thap Province', 2),
(5, '$2b$10$VT.075VLNboN3l3JQOA0tuKtbCXBgWFcad.HS6JDzX1OwPEA5zm6O', '1692966027305_heatmap.png', 'Cong ty Quoc Te Simba Viet Nam', 'simbasimbavietnam@gmail.com', '236878889', 'www.simbavietnam.vn', '26/6 Nguyen Thi Dinh, Phuoc Dan, Ninh Phuoc, Ninh Thuan', 2);

INSERT INTO `company_license` (`id_company`, `file_path`, `status`) VALUES
(1, '1691752381806_company2.jpg', 1);
INSERT INTO `company_license` (`id_company`, `file_path`, `status`) VALUES
(1, '1692966049494_TheSimpsonsFamilyTree.jpg', 2);
INSERT INTO `company_license` (`id_company`, `file_path`, `status`) VALUES
(2, '1692972723006_company4.jpg', 2);
INSERT INTO `company_license` (`id_company`, `file_path`, `status`) VALUES
(3, 'license6.jpg', 2),
(4, 'license7.jpg', 2),
(5, '1692529325230_attraction_3.png', 2);

INSERT INTO `destination` (`id_des`, `name`) VALUES
(1, 'Binh Thuan');
INSERT INTO `destination` (`id_des`, `name`) VALUES
(2, 'Dak Nong');
INSERT INTO `destination` (`id_des`, `name`) VALUES
(3, 'Nghe An');
INSERT INTO `destination` (`id_des`, `name`) VALUES
(4, 'Quang Ninh'),
(5, 'Lao Cai'),
(6, 'Kien Giang'),
(7, 'Nha Trang'),
(8, 'Hue'),
(9, 'Da Lat'),
(10, 'Ninh Thuan');

INSERT INTO `guide_attraction` (`id_guide`, `id_attraction`, `photo_path`, `title`, `content`) VALUES
(1, 1, '1691966385586_attraction_3.png', 'Cua Lo Beach', 'This is a pristine beach with a long stretch of white sand that attracts visitors for swimming, sunbathing, and relaxing.');
INSERT INTO `guide_attraction` (`id_guide`, `id_attraction`, `photo_path`, `title`, `content`) VALUES
(1, 2, '1692527956817_attraction_4.jpg', 'Sa Pa Adventure', 'With majestic landscapes and green valleys, Sapa is an ideal destination for tourists who love trekking and discovering ethnic culture.');
INSERT INTO `guide_attraction` (`id_guide`, `id_attraction`, `photo_path`, `title`, `content`) VALUES
(1, 3, '1693024116777_attraction_2.jpg', 'Dreamy Da Lat', 'With cool climate and charming scenery. The city is famous for its colorful flower gardens, beautiful lakes such as Xuan Huong Lake and Tuyen Lam Lake, and strawberry and dahlia flower gardens.');
INSERT INTO `guide_attraction` (`id_guide`, `id_attraction`, `photo_path`, `title`, `content`) VALUES
(2, 1, 'attraction_2.jpg', 'Phu Quoc Paradise', 'The island is located in Kien Giang province, is a famous destination with beautiful beaches, clear blue sea and white sand'),
(2, 2, 'attraction_3.png', 'Vinh Hy Bay', 'Vinh Hy Bay is located in Ninh Hai district, Ninh Thuan. This is a beautiful bay with clear blue sea and green mountains');

INSERT INTO `guide_booking` (`id_guidebooking`, `id_guidetime`, `id_tourist`, `booking_date`, `meeting_point`, `price`, `status`) VALUES
(1, 1, 1, '2022-01-04 00:00:00', 'Sen Village, Kim Lien, Nam Dan District, Nghe An, Vietnam', 48, 5);
INSERT INTO `guide_booking` (`id_guidebooking`, `id_guidetime`, `id_tourist`, `booking_date`, `meeting_point`, `price`, `status`) VALUES
(2, 2, 2, '2022-02-02 00:00:00', 'Muong Hoa Street, Sa Pa Town, Sa Pa District, Lao Cai Province', 58, 5);
INSERT INTO `guide_booking` (`id_guidebooking`, `id_guidetime`, `id_tourist`, `booking_date`, `meeting_point`, `price`, `status`) VALUES
(3, 3, 1, '2022-04-05 00:00:00', '81D Hoang Van Thu st., Ward 5, Lam Dong Province, Da Lat', 35, 5);
INSERT INTO `guide_booking` (`id_guidebooking`, `id_guidetime`, `id_tourist`, `booking_date`, `meeting_point`, `price`, `status`) VALUES
(4, 4, 4, '2022-05-15 00:00:00', 'Red Ground, An Thoi Town, Phu Quoc District, Kien Giang Province, Phu Quoc District', 88, 5),
(5, 5, 5, '2022-10-01 00:00:00', 'Chau Gia Hotel, Vinh Hy, Ninh Hai, Ninh Thuan Province', 70, 2),
(6, 6, 2, '2023-07-12 00:00:00', '789 Le Loi Road, Vinh Ninh Ward, Hue City, Thua Thien Hue Province', 80, 5),
(7, 7, 1, '2023-07-15 00:00:00', '10 Tran Phu Street, Hoi An Ancient Town, Quang Nam Province', 78, 5),
(8, 8, 8, '2023-07-18 00:00:00', 'Duong Dong Town, Phu Quoc Island, Kien Giang', 120, 5),
(9, 9, 9, '2023-07-20 00:00:00', '20 Tran Phu Street, Loc Tho Ward, Nha Trang City, Khanh Hoa', 90, 5),
(10, 10, 10, '2023-07-25 00:00:00', '45 Nguyen Dinh Chieu Street, Ham Tien Ward, Phan Thiet City, Binh Thuan', 87, 5),
(11, 11, 9, '2023-07-30 00:00:00', 'Son Trach Commune, Bo Trach District, Quang Binh', 56, 5),
(12, 12, 1, '2023-08-03 00:00:00', '30 Fansipan Street, Sapa Town, Lao Cai', 50, 2),
(13, 13, 2, '2023-08-07 00:00:00', '101 Nguyen Hue Street, Ben Nghe Ward, District 1, Ho Chi Minh City', 34, 5),
(14, 14, 2, '2023-08-10 00:00:00', '25 Nguyen Trai Street, Hop Giang Ward, Cao Bang City, Cao Bang', 78, 5),
(15, 15, 3, '2023-08-15 00:00:00', '15 Le Dai Hanh Street, Ward 5, Da Lat City, Lam Dong', 94, 5),
(16, 16, 4, '2023-08-20 00:00:00', 'Hoa Lu District, Ninh Binh Province', 110, 5),
(17, 17, 3, '2023-09-03 00:00:00', '30 Hoa Binh Avenue, An Khanh Ward, Can Tho City, Can Tho', 90, 1),
(18, 18, 2, '2023-09-05 00:00:00', '25 Le Loi Street, Chau Doc City, An Giang', 85, 1),
(19, 19, 1, '2023-09-08 00:00:00', '15 Nguyen Trung Truc Street, Ward 1, Vinh Long City, Vinh Long', 45, 1),
(20, 20, 2, '2023-09-10 00:00:00', '15 Le Loi Street, Ward 5, Ca Mau City, Ca Mau', 108, 1),
(21, 21, 1, '2023-08-26 00:00:00', 'TP HCM', 35, 3);

INSERT INTO `guide_language` (`id_guide`, `id_lang`) VALUES
(1, 1);
INSERT INTO `guide_language` (`id_guide`, `id_lang`) VALUES
(2, 1);
INSERT INTO `guide_language` (`id_guide`, `id_lang`) VALUES
(4, 1);
INSERT INTO `guide_language` (`id_guide`, `id_lang`) VALUES
(5, 1),
(6, 1),
(8, 1),
(9, 1),
(1, 2),
(2, 2),
(6, 2),
(7, 2),
(9, 2);

INSERT INTO `guide_license` (`id_guide`, `file_path`, `status`) VALUES
(1, '1691559607117_luffy.png', 2);
INSERT INTO `guide_license` (`id_guide`, `file_path`, `status`) VALUES
(2, '1691559637123_luffy.png', 2);
INSERT INTO `guide_license` (`id_guide`, `file_path`, `status`) VALUES
(3, '1691559703563_luffy.png', 2);
INSERT INTO `guide_license` (`id_guide`, `file_path`, `status`) VALUES
(4, '1691940718932_attraction_1.jpg', 2),
(5, '1692094726760_license10.jpg', 1),
(6, '1693024435708_license5.jpg', 2),
(7, '1691966385586_attraction_3', 2),
(8, '1692527956817_attraction_4.jpg', 2),
(9, 'attraction_4.jpg', 2),
(10, 'attraction_2.jpg', 2);

INSERT INTO `guide_recently` (`id_tourist`, `id_guide`, `time_view`) VALUES
(1, 1, '2023-10-05 00:00:00');
INSERT INTO `guide_recently` (`id_tourist`, `id_guide`, `time_view`) VALUES
(2, 2, '2023-01-03 00:00:00');
INSERT INTO `guide_recently` (`id_tourist`, `id_guide`, `time_view`) VALUES
(3, 3, '2023-09-05 00:00:00');
INSERT INTO `guide_recently` (`id_tourist`, `id_guide`, `time_view`) VALUES
(4, 4, '2022-05-30 00:00:00'),
(5, 5, '2023-01-27 00:00:00');

INSERT INTO `guide_report` (`id_tourist`, `id_guide`, `report_date`, `content`, `status`) VALUES
(1, 1, '2023-08-20 00:00:00', 'Lack of knowledge about the destination, resulting in inaccurate and incomplete information provided to the tour group.', 1);
INSERT INTO `guide_report` (`id_tourist`, `id_guide`, `report_date`, `content`, `status`) VALUES
(1, 10, '2023-08-24 00:00:00', 'Poor communication skills, including unclear instructions and difficulty engaging with participants.', 1);
INSERT INTO `guide_report` (`id_tourist`, `id_guide`, `report_date`, `content`, `status`) VALUES
(2, 2, '2023-06-03 00:00:00', 'Disrespectful behavior towards participants, including dismissiveness and derogatory remarks.', 2);
INSERT INTO `guide_report` (`id_tourist`, `id_guide`, `report_date`, `content`, `status`) VALUES
(3, 3, '2023-12-05 00:00:00', 'Lack of organization, with deviations from the itinerary without explanation or alternative arrangements.', 1),
(4, 4, '2022-05-06 00:00:00', 'Neglecting safety precautions and failing to provide clear instructions on potential hazards.', 1),
(5, 5, '2023-01-02 00:00:00', 'bad service!!!', 2);

INSERT INTO `guide_review` (`id_guidebooking`, `rating`, `review`, `review_date`, `reply`, `reply_date`, `report`, `report_date`, `report_status`) VALUES
(1, 4, NULL, '2022-02-05 00:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `guide_review` (`id_guidebooking`, `rating`, `review`, `review_date`, `reply`, `reply_date`, `report`, `report_date`, `report_status`) VALUES
(2, 5, 'This guide created a comfortable and fun space for us during the trip. He has good communication skills and knows how to keep the attention of tourists.', '2022-02-28 00:00:00', '', '2022-03-14 00:00:00', '', NULL, NULL);
INSERT INTO `guide_review` (`id_guidebooking`, `rating`, `review`, `review_date`, `reply`, `reply_date`, `report`, `report_date`, `report_status`) VALUES
(3, 5, 'With the ability to create a comfortable and fun environment, while ensuring safety, the guide gave us the best travel experience', '2022-05-05 00:00:00', 'Thank you for sharing your tour guide review. As a guide, I always try my best to bring the best travel experience to my clients.', '2022-05-10 00:00:00', '', NULL, NULL);
INSERT INTO `guide_review` (`id_guidebooking`, `rating`, `review`, `review_date`, `reply`, `reply_date`, `report`, `report_date`, `report_status`) VALUES
(4, 1, 'I feel the tour guide is too bad, has no interest in tourists. I do not think you should continue to be a guide', '2022-06-15 00:00:00', '', NULL, 'The above reviews are completely untrue. I always do my job well. I think the reviewer intentionally insulted me.', '2022-06-20 00:00:00', 1),
(5, 5, 'Our tour guide went above and beyond to accommodate our group\'s needs. They made the tour memorable and fun!', '2022-11-01 00:00:00', '', NULL, '', NULL, NULL),
(6, 4, '', '2023-08-09 00:00:00', '', NULL, '', NULL, NULL),
(7, 4, 'The tour guide\'s storytelling skills were impressive, but there were a few instances where we couldn\'t hear clearly.', '2023-08-01 00:00:00', 'I\'m glad you enjoyed the stories! I\'ll take your feedback into account and ensure better audibility for future tours. Thank you!', '2023-08-12 00:00:00', '', NULL, NULL),
(8, 4, 'The tour guide\'s passion for history and culture was infectious. They made the tour both educational and entertaining!', '2023-08-11 00:00:00', '', NULL, '', NULL, NULL),
(9, 4, '', '2023-08-01 00:00:00', '', NULL, '', NULL, NULL),
(10, 3, 'The tour guide was knowledgeable, but there were moments when they seemed a bit disorganized.', '2023-08-20 00:00:00', 'I apologize for any confusion. I\'ll take your feedback seriously and work on being more organized in my tours. Thank you for bringing this to my attention.', '2023-08-25 00:00:00', '', NULL, NULL),
(11, 5, 'Our tour guide\'s energy and enthusiasm were infectious! They made every stop along the way exciting.', '2023-08-16 00:00:00', 'Your positive energy fuels mine! It was a pleasure guiding you, and I\'m thrilled you enjoyed the experience.', '2023-08-20 00:00:00', '', NULL, NULL),
(12, 2, 'Unfortunately, the tour guide\'s attitude was unprofessional and their explanations were unclear. Disappointed with the experience.', '2023-08-23 00:00:00', 'I\'m truly sorry to hear about your disappointing experience. Your feedback is valuable, and I take full responsibility for falling short. I\'m committed to improving and ensuring a better tour next time. Please accept my apologies.', '2023-08-25 00:00:00', '', NULL, NULL),
(13, 1, 'The tour guide was a disaster. They clearly had no idea about the places we visited. Total waste of time.', '2023-08-20 00:00:00', '', NULL, 'I\'m deeply disappointed to read the above review, as it contains inaccurate and hurtful claims. I take pride in delivering informative and engaging tours, and I have a deep understanding of the places I guide. I suspect this review might be an attempt to tarnish my reputation. I kindly request an investigation to validate the authenticity of such claims.', '2023-08-22 00:00:00', NULL);

INSERT INTO `guide_time` (`id_guidetime`, `id_guide`, `guide_date`, `guide_session`, `is_available`) VALUES
(1, 1, '2022-01-04', 1, 0);
INSERT INTO `guide_time` (`id_guidetime`, `id_guide`, `guide_date`, `guide_session`, `is_available`) VALUES
(2, 2, '2022-02-02', 2, 0);
INSERT INTO `guide_time` (`id_guidetime`, `id_guide`, `guide_date`, `guide_session`, `is_available`) VALUES
(3, 3, '2022-04-05', 3, 0);
INSERT INTO `guide_time` (`id_guidetime`, `id_guide`, `guide_date`, `guide_session`, `is_available`) VALUES
(4, 4, '2022-05-15', 1, 0),
(5, 5, '2022-10-01', 2, 0),
(6, 6, '2023-07-12', 2, 0),
(7, 7, '2023-07-15', 3, 0),
(8, 8, '2023-07-18', 1, 0),
(9, 9, '2023-07-20', 3, 0),
(10, 10, '2023-07-25', 2, 0),
(11, 9, '2023-07-30', 1, 0),
(12, 8, '2023-08-03', 3, 0),
(13, 7, '2023-08-07', 1, 0),
(14, 6, '2023-08-10', 1, 0),
(15, 5, '2023-08-15', 2, 0),
(16, 2, '2023-08-20', 2, 0),
(17, 10, '2023-09-03', 1, 0),
(18, 9, '2023-09-05', 1, 0),
(19, 9, '2023-09-08', 2, 0),
(20, 8, '2023-09-10', 1, 0),
(21, 8, '2023-09-13', 2, 0),
(22, 7, '2023-09-15', 2, 1),
(23, 7, '2023-09-18', 3, 1),
(24, 6, '2023-09-20', 3, 1),
(25, 5, '2023-09-23', 2, 1),
(26, 5, '2023-09-25', 3, 1),
(27, 4, '2023-09-28', 1, 1),
(28, 3, '2023-09-30', 1, 1),
(29, 3, '2023-10-03', 2, 1),
(30, 2, '2023-10-05', 3, 1),
(31, 1, '2023-10-08', 3, 1);

INSERT INTO `guide_wishlist` (`id_tourist`, `id_guide`) VALUES
(1, 1);
INSERT INTO `guide_wishlist` (`id_tourist`, `id_guide`) VALUES
(2, 2);
INSERT INTO `guide_wishlist` (`id_tourist`, `id_guide`) VALUES
(3, 3);
INSERT INTO `guide_wishlist` (`id_tourist`, `id_guide`) VALUES
(4, 4),
(5, 5);

INSERT INTO `languages` (`id_lang`, `lang_name`) VALUES
(1, 'Vietnamese');
INSERT INTO `languages` (`id_lang`, `lang_name`) VALUES
(2, 'English');


INSERT INTO `role` (`id_role`, `name`) VALUES
(1, 'tourist');
INSERT INTO `role` (`id_role`, `name`) VALUES
(2, 'company');
INSERT INTO `role` (`id_role`, `name`) VALUES
(3, 'tour guide');
INSERT INTO `role` (`id_role`, `name`) VALUES
(4, 'admin');

INSERT INTO `search_history` (`id_tourist`, `id_des`, `time_search`) VALUES
(1, 1, '2023-10-02 00:00:00');
INSERT INTO `search_history` (`id_tourist`, `id_des`, `time_search`) VALUES
(2, 4, '2023-02-20 00:00:00');
INSERT INTO `search_history` (`id_tourist`, `id_des`, `time_search`) VALUES
(3, 7, '2023-01-05 00:00:00');
INSERT INTO `search_history` (`id_tourist`, `id_des`, `time_search`) VALUES
(4, 6, '2022-05-24 00:00:00'),
(5, 2, '2023-09-01 00:00:00');

INSERT INTO `tour` (`id_tour`, `id_company`, `name`, `id_des`, `id_category`, `num_max`, `duration`, `description`, `schedule`, `included`, `not_included`, `ggmap_address`, `price`, `free_cancellation`, `is_deleted`) VALUES
(1, 1, 'Mui Ne Freshly Week ', 1, 2, 20, 3, 'With majestic natural beauty and unique culture, Mui Ne Beach is an ideal destination to enjoy vacation and explore Vietnamese culture.', 'https://poe.com/ChatGPT', 'included.pdf', 'not_included.pdf', 'Xuan Thuy Street, Ham Thuan Bac, Binh Thuan', 45, 1, 0);
INSERT INTO `tour` (`id_tour`, `id_company`, `name`, `id_des`, `id_category`, `num_max`, `duration`, `description`, `schedule`, `included`, `not_included`, `ggmap_address`, `price`, `free_cancellation`, `is_deleted`) VALUES
(2, 1, 'Dak Nong Fantasy Tour', 2, 4, 30, 2, 'Dak Nong is an interesting destination for those who love to explore wild nature, learn about local culture and enjoy the peace of the countryside.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Tà Đùng National Park, Dak Plao, Dak Glong, Dak Nong', 65, 1, 0);
INSERT INTO `tour` (`id_tour`, `id_company`, `name`, `id_des`, `id_category`, `num_max`, `duration`, `description`, `schedule`, `included`, `not_included`, `ggmap_address`, `price`, `free_cancellation`, `is_deleted`) VALUES
(3, 1, 'Ninh Binh - The Best Holiday', 7, 3, 35, 2, 'Ninh Binh offers visitors a unique travel experience, combining majestic natural landscapes and long-standing cultural heritage.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Ninh Binh', 54, 0, 0);
INSERT INTO `tour` (`id_tour`, `id_company`, `name`, `id_des`, `id_category`, `num_max`, `duration`, `description`, `schedule`, `included`, `not_included`, `ggmap_address`, `price`, `free_cancellation`, `is_deleted`) VALUES
(4, 1, 'Hoi An', 8, 3, 50, 4, 'With its unique historical and cultural beauty, Hoi An attracts millions of visitors from all over the world and is considered one of the most attractive destinations in Vietnam.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Hoi An, Hue province', 80, 1, 0),
(5, 5, 'Halong Bay Deluxe Day Tour', 4, 1, 20, 5, 'Ha Long Bay is one of the great natural wonders of the world and a famous tourist destination in Vietnam. Located in Quang Ninh province, northern Vietnam, Ha Long Bay was recognized by UNESCO as a World Cultural and Natural Heritage site in 1994.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Halong Bay, Quang Ninh', 52, 0, 0),
(6, 5, 'Mui Ne Freshly Week', 1, 2, 20, 3, 'With majestic natural beauty and unique culture, Mui Ne Beach is an ideal destination to enjoy vacation and explore Vietnamese culture.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Xuan Thuy Street, Ham Thuan Bac, Binh Thuan', 45, 1, 0),
(7, 4, 'Dak Nong Fantasy Tour', 2, 4, 30, 2, 'Dak Nong is an interesting destination for those who love to explore wild nature, learn about local culture and enjoy the peace of the countryside.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Tà Đùng National Park, Dak Plao, Dak Glong, Dak Nong', 65, 1, 0),
(8, 3, 'Ninh Binh - The Best Holiday', 7, 3, 35, 2, 'Ninh Binh offers visitors a unique travel experience, combining majestic natural landscapes and long-standing cultural heritage.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Ninh Binh', 54, 0, 0),
(9, 2, 'Hoi An', 7, 3, 30, 4, 'With its unique historical and cultural beauty, Hoi An attracts millions of visitors from all over the world and is considered one of the most attractive destinations in Vietnam.', 'https://www.google.com/', 'Hotel and breakfast buffet provided', '', 'Hoi An, Hue province', 80, 1, 0),
(10, 1, 'Halong Bay Deluxe Day Tour', 1, 1, 20, 5, 'Ha Long Bay is one of the great natural wonders of the world and a famous tourist destination in Vietnam. Located in Quang Ninh province, northern Vietnam, Ha Long Bay was recognized by UNESCO as a World Cultural and Natural Heritage site in 1994.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Halong Bay, Quang Ninh', 52, 1, 0),
(11, 1, 'Desert Dunes Adventure', 2, 2, 20, 7, 'Dak Nong is an interesting destination for those who love to explore wild nature, learn about local culture and enjoy the peace of the countryside.', 'https://www.google.com/', '', '', 'Binh Thuan', 20, 0, 0),
(12, 2, 'Coastal Serenity Escape', 2, 4, 30, 2, 'Ninh Binh offers visitors a unique travel experience, combining majestic natural landscapes and long-standing cultural heritage.', '', '', '', 'Binh Thuan', 30, 0, 0),
(13, 2, 'Cultural Discovery of Binh Thuan', 5, 4, 15, 2, 'With its unique historical and cultural beauty, Hoi An attracts millions of visitors from all over the world and is considered one of the most attractive destinations in Vietnam.', '', '', '', 'Binh Thuan', 16, 0, 0),
(14, 2, 'Volcanic Treasures Expedition', 1, 4, 20, 5, 'Ha Long Bay is one of the great natural wonders of the world and a famous tourist destination in Vietnam. Located in Quang Ninh province, northern Vietnam, Ha Long Bay was recognized by UNESCO as a World Cultural and Natural Heritage site in 1994.', '', '', '', 'Dak Nong', 36.1, 0, 0),
(15, 2, 'Riverside Retreat Getaway', 2, 2, 40, 6, 'Unwind by the riversides of Dak Nong, where serene waterways and charming villages await. Participate in traditional fishing activities, explore local markets, and enjoy boat rides along picturesque rivers.', '', 'included.pdf', 'not_included.pdf', 'Dak Nong', 400, 1, 0),
(16, 4, 'Cultural Diversity Experience', 2, 3, 15, 5, 'Immerse yourself in the rich ethnic cultures of Dak Nong. Visit minority villages, learn about their traditions, and enjoy cultural performances. Engage with locals, taste authentic cuisine, and gain insights into the region\'s heritage.', '', 'included.pdf', 'not_included.pdf', 'Dak Nong', 350, 1, 0),
(17, 3, 'Historical Trail Expedition', 3, 1, 30, 4, 'Embark on a journey through Nghe An\'s historical sites, including the birthplace of Ho Chi Minh. Trek through scenic landscapes, visit ancient temples, and learn about the revolutionary history of the region.', '', 'included.pdf', 'not_included.pdf', 'Nghe An', 280, 1, 0),
(18, 5, 'Beach and Beyond', 3, 2, 35, 7, 'Enjoy a sun-soaked vacation along Nghe An\'s coastline. Relax on pristine beaches, take part in water sports, and explore nearby islands. Immerse yourself in beachside tranquility and indulge in fresh seafood feasts.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Nghe An', 420, 1, 0),
(19, 4, 'Cultural Mosaic Discovery', 3, 3, 20, 6, 'Immerse yourself in Nghe An\'s diverse cultural tapestry. Visit traditional villages, witness folk performances, and engage with local artisans. Explore the region\'s vibrant markets and savor its culinary delights.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Nghe An', 380, 1, 0),
(20, 5, 'Mystic Caves Expedition', 4, 1, 25, 3, 'Embark on an exhilarating journey through the captivating caves of Quang Ninh. Traverse underground rivers, marvel at stunning stalactite formations, and discover the secrets hidden within the limestone landscapes.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Quang Ninh', 280, 1, 0),
(21, 5, 'Seaside Serenity Retreat', 4, 2, 40, 5, 'Experience ultimate relaxation on the pristine beaches of Quang Ninh. Bask in the sun, swim in turquoise waters, and savor fresh seafood delicacies. Allow the gentle waves to wash away your worries.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Quang Ninh', 350, 0, 0),
(22, 3, 'Cultural Tapestry Exploration', 4, 3, 15, 4, 'Immerse yourself in the rich cultural mosaic of Quang Ninh. Discover ancient pagodas, engage in local craft workshops, and witness vibrant festivals that showcase the region\'s traditions and heritage.', '', 'included.pdf', 'not_included.pdf', 'Quang Ninh', 140, 0, 0),
(23, 4, 'Mountain Summit Adventure', 5, 1, 20, 4, 'Conquer the heights of Lao Cai\'s majestic mountains. Trek through lush forests, navigate challenging terrains, and stand atop breathtaking peaks to witness panoramic vistas that take your breath away.', '', 'included.pdf', 'not_included.pdf', 'Lao Cai', 320, 1, 0),
(24, 5, 'Hill Tribe Cultural Immerse', 5, 3, 15, 5, 'Engage with the diverse hill tribes of Lao Cai. Experience their way of life, join in traditional rituals, and gain insights into their ancient customs. Create lasting connections in the heart of the mountains.', '', 'included.pdf', 'not_included.pdf', 'Lao Cai', 350, 1, 0),
(25, 2, 'Highland Serenity Retreat', 5, 4, 25, 6, 'Find solace in the tranquil highlands of Lao Cai. Stay in cozy lodges nestled amidst rolling hills, enjoy cool mountain air, and explore terraced rice fields that paint a picturesque landscape.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Lao Cai', 280, 0, 0),
(26, 1, 'Island Hopping Adventure', 6, 1, 30, 5, 'Embark on an island-hopping adventure in Kien Giang. Explore pristine islands such as Phu Quoc, Nam Du, and Hon Son. Snorkel in clear waters, relax on sandy beaches, and immerse yourself in the vibrant local culture.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Phu Quoc, Nam Du, Hon Son', 400, 1, 0),
(27, 2, 'Coastal Culture Exploration', 6, 3, 20, 4, 'Immerse yourself in the coastal culture of Kien Giang. Visit traditional fishing villages, witness local handicrafts, and savor seafood feasts while enjoying stunning views of the Gulf of Thailand.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Rach Gia, Ha Tien', 350, 1, 0),
(28, 3, 'Highland to Coast Discovery', 6, 4, 25, 6, 'Experience the diversity of Kien Giang as you journey from highlands to coast. Explore the lush landscapes of Hon Dat, then head to the picturesque beaches of Bai Sao for a perfect blend of adventure and relaxation.', 'https://www.google.com/', 'included.pdf', 'not_included.pdf', 'Hon Dat, Bai Sao', 380, 1, 0),
(29, 2, 'Countryside Cycling Adventure', 7, 1, 15, 3, 'Embark on a cycling adventure through Ninh Binh\'s picturesque countryside. Explore ancient temples, cruise along tranquil rivers, and witness the breathtaking beauty of limestone karsts.', '', 'included.pdf', 'not_included.pdf', 'Tam Coc, Trang An', 280, 1, 0),
(30, 1, 'Cultural Heritage Exploration', 7, 3, 20, 4, 'Immerse yourself in Ninh Binh\'s rich cultural heritage. Visit historic sites like Hoa Lu Ancient Capital, engage with local artisans, and discover the traditions that have shaped the region.', '', 'included.pdf', 'not_included.pdf', 'Hoa Lu, Phat Diem Cathedral', 300, 1, 0),
(31, 4, 'Nature and Tranquility Retreat', 7, 4, 25, 5, 'Find serenity in Ninh Binh\'s tranquil landscapes. Explore lush gardens, experience traditional Vietnamese village life, and take a relaxing boat ride through the stunning scenery of Thung Nham Bird Garden.', '', 'included.pdf', 'not_included.pdf', 'Thung Nham Bird Garden, Van Long Nature Reserve', 350, 0, 0),
(32, 5, 'Historical Marvels Exploration', 8, 3, 20, 4, 'Delve into the historical marvels of Hue, Vietnam\'s imperial city. Visit ancient citadels, explore ornate pagodas, and take a cruise along the Perfume River while discovering the rich heritage of the region.', '', 'included.pdf', 'not_included.pdf', 'Imperial Citadel, Thien Mu Pagoda', 320, 0, 0),
(33, 5, 'Perfum River Sunset Cruise', 8, 2, 25, 5, 'Indulge in riverside tranquility in Hue. Stay in elegant accommodations overlooking the Perfume River, visit charming villages, and experience the fusion of culture, cuisine, and natural beauty.', 'schedule.pdf', 'included.pdf', 'not_included.pdf', 'Perfume River, Lang Co Beach', 325, 1, 0),
(34, 4, 'Cultural Immersion Journey', 8, 3, 15, 3, 'Immerse yourself in the authentic culture of Hue. Participate in traditional craft workshops, engage with local artisans, and enjoy a sensory journey through Hue\'s vibrant markets and street food scene.', 'schedule.pdf', 'included.pdf', 'not_included.pdf', 'Dong Ba Market, Garden Houses', 280, 0, 0),
(35, 3, 'Datannla Adventure Escape', 9, 1, 20, 4, 'Embark on a thrilling highland adventure in Da Lat. Zipline through pine forests, hike to picturesque waterfalls, and experience the adrenaline rush of canyoning in the stunning natural landscapes.', 'schedule.pdf', 'included.pdf', 'not_included.pdf', 'Datanla Waterfall, Langbiang Mountain', 300, 1, 0),
(36, 4, 'Flower Garden Delights', 9, 3, 25, 3, 'Immerse yourself in the enchanting floral landscapes of Da Lat. Explore colorful flower gardens, visit local flower farms, and engage in creative workshops to learn about the art of floral arrangement.', 'schedule.pdf', 'included.pdf', 'not_included.pdf', 'Da Lat Flower Park, Cu Hill', 280, 1, 0),
(37, 2, 'Desert Oasis Adventure', 10, 1, 15, 3, 'Embark on an exhilarating desert adventure in Ninh Thuan. Explore the unique landscapes of sand dunes, try sand sledding, and marvel at the contrasting beauty of the coastal area and arid desert.', 'schedule.pdf', 'included.pdf', 'not_included.pdf', 'Nam Cuong Sand Dunes, Ninh Chu Beach', 280, 1, 0),
(38, 5, 'Coastal Bliss Getaway', 10, 2, 30, 4, 'Experience coastal bliss in Ninh Thuan\'s pristine beaches. Swim in turquoise waters, relax on golden sands, and indulge in local seafood delights while absorbing the laid-back beach atmosphere.', 'schedule.pdf', 'included.pdf', 'not_included.pdf', 'Vinh Hy Bay, Ninh Chu Beach', 110, 0, 0);

INSERT INTO `tour_booking` (`id_tour_booking`, `id_tour`, `id_tourist`, `booking_date`, `start_date`, `end_date`, `num_tourist`, `total_price`, `status`, `free_cancel`) VALUES
(1, 9, 1, '2023-09-24 00:00:00', '2023-10-05 00:00:00', '2023-08-24 00:00:00', 2, 90, 1, 0);
INSERT INTO `tour_booking` (`id_tour_booking`, `id_tour`, `id_tourist`, `booking_date`, `start_date`, `end_date`, `num_tourist`, `total_price`, `status`, `free_cancel`) VALUES
(2, 9, 2, '2023-09-21 00:00:00', '2023-10-05 00:00:00', '2023-10-08 00:00:00', 1, 45, 1, 1);
INSERT INTO `tour_booking` (`id_tour_booking`, `id_tour`, `id_tourist`, `booking_date`, `start_date`, `end_date`, `num_tourist`, `total_price`, `status`, `free_cancel`) VALUES
(3, 13, 3, '2023-09-01 00:00:00', '2023-10-05 00:00:00', '2023-10-08 00:00:00', 3, 135, 1, 0);
INSERT INTO `tour_booking` (`id_tour_booking`, `id_tour`, `id_tourist`, `booking_date`, `start_date`, `end_date`, `num_tourist`, `total_price`, `status`, `free_cancel`) VALUES
(4, 9, 4, '2023-02-05 00:00:00', '2023-03-05 00:00:00', '2023-03-09 00:00:00', 2, 90, 1, 1),
(5, 5, 5, '2023-06-15 00:00:00', '2023-07-01 00:00:00', '2023-07-06 00:00:00', 20, 1040, 1, 1),
(6, 7, 1, '2023-08-20 00:00:00', '2023-08-22 00:00:00', '2023-08-23 00:00:00', 2, 130, 2, 1),
(7, 12, 1, '2023-08-24 20:09:52', '2023-08-25 00:00:00', '2023-08-27 00:00:00', 1, 30, 1, 0),
(8, 32, 2, '2023-07-20 00:00:00', '2023-07-28 00:00:00', '2023-08-02 00:00:00', 3, 640, 1, 1),
(9, 18, 9, '2023-07-22 00:00:00', '2023-08-05 00:00:00', '2023-08-10 00:00:00', 5, 2100, 1, 1),
(10, 25, 5, '2023-07-25 00:00:00', '2023-07-30 00:00:00', '2023-08-04 00:00:00', 8, 2240, 2, 2),
(11, 38, 1, '2023-07-28 00:00:00', '2023-08-10 00:00:00', '2023-08-15 00:00:00', 12, 1320, 1, 2),
(12, 14, 6, '2023-07-30 00:00:00', '2023-08-05 00:00:00', '2023-08-10 00:00:00', 4, 1200, 1, 1),
(13, 4, 10, '2023-08-02 00:00:00', '2023-08-08 00:00:00', '2023-08-13 00:00:00', 2, 160, 1, 1),
(14, 29, 3, '2023-08-05 00:00:00', '2023-08-20 00:00:00', '2023-08-13 00:00:00', 10, 2800, 2, 1),
(15, 11, 8, '2023-08-08 00:00:00', '2023-08-12 00:00:00', '2023-08-18 00:00:00', 4, 1000, 2, 1),
(16, 17, 1, '2023-08-10 00:00:00', '2023-09-05 00:00:00', '2023-09-09 00:00:00', 12, 3360, 3, 1),
(17, 5, 2, '2023-08-12 00:00:00', '2023-09-01 00:00:00', '2023-09-06 00:00:00', 11, 572, 2, 2),
(18, 22, 3, '2023-08-15 00:00:00', '2023-09-10 00:00:00', '2023-09-14 00:00:00', 9, 1260, 2, 1),
(19, 11, 4, '2023-08-18 00:00:00', '2023-09-03 00:00:00', '2023-09-06 00:00:00', 4, 1000, 2, 2),
(20, 33, 5, '2023-08-20 00:00:00', '2023-09-08 00:00:00', '2023-09-13 00:00:00', 8, 2600, 1, 1),
(21, 8, 6, '2023-08-22 00:00:00', '2023-09-06 00:00:00', '2023-09-09 00:00:00', 6, 324, 1, 2),
(22, 27, 7, '2023-08-25 00:00:00', '2023-09-15 00:00:00', '2023-09-19 00:00:00', 2, 700, 1, 1),
(23, 2, 8, '2023-08-28 00:00:00', '2023-09-12 00:00:00', '2023-09-16 00:00:00', 6, 390, 1, 1),
(24, 14, 9, '2023-08-30 00:00:00', '2023-09-05 00:00:00', '2023-09-09 00:00:00', 16, 4800, 1, 1),
(25, 38, 10, '2023-09-02 00:00:00', '2023-09-20 00:00:00', '2023-09-24 00:00:00', 30, 3300, 1, 2),
(26, 2, 1, '2023-08-26 05:22:39', '2023-08-27 00:00:00', '2023-08-28 00:00:00', 2, 130, 3, 1),
(27, 2, 1, '2023-08-26 06:21:12', '2023-08-27 00:00:00', '2023-08-28 00:00:00', 5, 325, 3, 1),
(28, 12, 1, '2023-08-26 07:23:51', '2023-08-27 00:00:00', '2023-08-28 00:00:00', 1, NULL, 1, 0),
(29, 16, 1, '2023-08-26 07:38:31', '2023-08-27 00:00:00', '2023-08-31 00:00:00', 1, NULL, 1, 1);

INSERT INTO `tour_category` (`id_category`, `name`) VALUES
(1, 'adventure');
INSERT INTO `tour_category` (`id_category`, `name`) VALUES
(2, 'beach');
INSERT INTO `tour_category` (`id_category`, `name`) VALUES
(3, 'culture');
INSERT INTO `tour_category` (`id_category`, `name`) VALUES
(4, 'highland');

INSERT INTO `tour_guide` (`id_guide`, `password`, `avatar`, `fullname`, `birthday`, `gender`, `email`, `phone`, `id_des`, `experience`, `description`, `price_per_session`, `free_cancellation`, `id_role`) VALUES
(1, '$2b$10$Qp0ttNq95.ZmSptvOq9RF.mcCZriKPQbdx309JBpdEDEeL9QJIwIG', 'freelancer1.jpg', 'Tran Tung Lam', '1998-12-17', 1, 'tunglamtran.work@gmail.com', '0986537900', 3, '4 years ', 'Although I only have 2 years of experience, I am confident that I have the skills to help you have the ', 20.32, 1, 3);
INSERT INTO `tour_guide` (`id_guide`, `password`, `avatar`, `fullname`, `birthday`, `gender`, `email`, `phone`, `id_des`, `experience`, `description`, `price_per_session`, `free_cancellation`, `id_role`) VALUES
(2, '$2b$10$mtIsej0KWOlTQmQtUE/swO4fdIIbwUaZB348ajTixpPquB0dJsNBu', 'freelancer2.jpg', 'Nguyen My Anh', '1999-07-23', 1, 'myanhanh.work@gmail.com', '0989114225', 5, '3 years', 'With the experience of leading more than 20 tours during the past 3 years, I can lead customers to beautiful tourist locations with colorful stories.', 58, 0, 3);
INSERT INTO `tour_guide` (`id_guide`, `password`, `avatar`, `fullname`, `birthday`, `gender`, `email`, `phone`, `id_des`, `experience`, `description`, `price_per_session`, `free_cancellation`, `id_role`) VALUES
(3, '$2b$10$U.9rVnIxNDCeEApfE5/sDuQul/aMcowtUyE.LVfX/Ao.z1lzIx76K', 'freelancer3.jpg', 'Dao Duy Linh', '2000-05-24', 0, 'duylinhhn@gmail.com', '0836966168', 9, '1 year', 'Good communication, confident about the ability to introduce Vietnam tourism to everyone', 35, 1, 3);
INSERT INTO `tour_guide` (`id_guide`, `password`, `avatar`, `fullname`, `birthday`, `gender`, `email`, `phone`, `id_des`, `experience`, `description`, `price_per_session`, `free_cancellation`, `id_role`) VALUES
(4, '$2b$10$nQpN7ims2fVYDfpU6z6Sw..dZvo9EchJJ9HGkyYDuLlz62NwBk5Kq', 'freelancer4.png', 'Nguyen Tien Dat', '1995-05-08', 0, 'datnguyenbg23@gmail.com', '0989744235', 6, '7 years', 'I am completely confident to help customers have a worthy trip beyond expectations', 88, 1, 3),
(5, '$2b$10$21aoPlIYisgaCphF26iFZu3yERYJXtRgYnb/nt6QrDc7DKEOy604m', 'freelancer5.jpg', 'Do Hung Dung', '2000-04-03', 0, 'dunghunghonm@gmail.com', '0876356866', 10, '4 years', 'Customers will have the best experience on every trip with my companion', 70, 0, 3),
(6, '$2b$10$apK/8C/Brazs/W70yBsNOeCcVW4CmomErpXWdd8lzELgp1hJ9AyWa', '', 'Tran Gia Thinh', '1999-12-26', 1, 'trangiathinh@gmail.com', '0584854957', 4, '2 years', 'Although I only have 2 years of experience, I am confident that I have the skills to help you have the best trip experience possible.', 48, 1, 3),
(7, '$2b$10$sqmhdzANkg6a5sozABQZ2e9YIUwQmbyNDTdjGK.fOs7O9T17TnpjK', '', 'Ly Dang Khoa', '1999-11-08', 1, 'lydangkhoa@gmail.com', '0388928423', 5, '3 years', 'With the experience of leading more than 20 tours during the past 3 years, I can lead customers to beautiful tourist locations with colorful stories.', 58, 0, 3),
(8, '$2b$10$ol3b6JlYF5rEjcpmKhVeBeqV0oT0zLpc7FHg.0kvrCKOS.4QHJnfK', '', 'Nguyen Vu Tuong An', '1999-07-22', 0, 'nguyenvutuongan@gmail.com', '0489248272', 7, '1 year', 'Good communication, confident about the ability to introduce Vietnam tourism to everyone', 35, 1, 3),
(9, '$2b$10$bYLI29rvdEv7N6lR2dpbW.YTA1t.j/HVw4/fyyMKDZlyx0v9qJ6pq', '', 'Lac Thieu Quan', '1999-07-11', 0, 'lacthieuquan@gmail.com', '0382942384', 6, '7 years', 'I am completely confident to help customers have a worthy trip beyond expectations', 88, 1, 3),
(10, '$2b$10$YFZtnUXbiazSA8wB4Ui6BemRVDfnOo8.TOu5GrfS0qGhhxJ4qjBYC', '', 'Nguyen Cao Luan', '2000-06-23', 1, 'nguyencaoluan@gmail.com', '0873647234', 7, '4 years', 'Customers will have the best experience on every trip with my companion', 70, 0, 3);

INSERT INTO `tour_photo` (`id_tour`, `photo_path`) VALUES
(1, '1692966299095_netherland.jpg');
INSERT INTO `tour_photo` (`id_tour`, `photo_path`) VALUES
(2, '1692972765100_company1.jpg');
INSERT INTO `tour_photo` (`id_tour`, `photo_path`) VALUES
(3, 'attraction_1.jpg');
INSERT INTO `tour_photo` (`id_tour`, `photo_path`) VALUES
(4, '1691844062695_attraction_1.jpg'),
(5, 'attraction_3.png'),
(6, 'attraction_2.jpg'),
(9, '1692529476579_attraction_4.jpg'),
(10, 'tour4.jpg'),
(11, 'tour5.jpg'),
(12, '1692529485374_attraction_2.jpg'),
(13, 'attraction_4.jpg'),
(14, 'tour1.jpg'),
(15, 'tour2.jpg'),
(16, 'tour3.jpg'),
(17, 'tour6.jpg'),
(18, 'tour7.jpg'),
(19, 'tour8.jpg'),
(20, 'tour9.jpg'),
(21, 'tour10.jpg');

INSERT INTO `tour_recently` (`id_tourist`, `id_tour`, `time_view`) VALUES
(1, 1, '2023-10-05 00:00:00');
INSERT INTO `tour_recently` (`id_tourist`, `id_tour`, `time_view`) VALUES
(2, 2, '2023-01-03 00:00:00');
INSERT INTO `tour_recently` (`id_tourist`, `id_tour`, `time_view`) VALUES
(3, 3, '2023-09-05 00:00:00');
INSERT INTO `tour_recently` (`id_tourist`, `id_tour`, `time_view`) VALUES
(4, 4, '2023-05-30 00:00:00'),
(5, 5, '2023-01-27 00:00:00');

INSERT INTO `tour_report` (`id_tourist`, `id_tour`, `report_date`, `content`, `status`) VALUES
(1, 1, '2023-08-20 00:00:00', 'The tour did not match the advertised itinerary, with several promised attractions missing or substituted without prior notice.', 1);
INSERT INTO `tour_report` (`id_tourist`, `id_tour`, `report_date`, `content`, `status`) VALUES
(1, 9, '2023-08-24 00:00:00', ' Attempts to address issues and seek assistance during the tour were met with indifference and inadequate customer service.', 1);
INSERT INTO `tour_report` (`id_tourist`, `id_tour`, `report_date`, `content`, `status`) VALUES
(1, 10, '2023-08-20 00:00:00', 'Some staff members displayed unprofessional conduct, including rudeness and a lack of responsiveness to participant needs and concerns.', 1);
INSERT INTO `tour_report` (`id_tourist`, `id_tour`, `report_date`, `content`, `status`) VALUES
(2, 2, '2023-06-03 00:00:00', 'The tour group was excessively large, making it challenging to receive personalized attention and causing delays during the tour.', 2),
(3, 3, '2023-12-05 00:00:00', 'The tour lacked proper time management, leading to rushed visits and limited opportunities to fully explore and appreciate the destinations.', 1),
(4, 4, '2022-05-06 00:00:00', ' The tour guide lacked sufficient knowledge and failed to provide engaging and informative commentary, diminishing the overall tour experience.', 1),
(5, 5, '2023-01-02 00:00:00', 'The provided vehicles were uncomfortable, poorly maintained, and lacked essential amenities, resulting in a subpar travel experience.', 2);

INSERT INTO `tour_review` (`id_tour_booking`, `rating`, `review`, `review_date`, `reply`, `reply_date`, `report`, `report_date`, `report_status`) VALUES
(1, 5, 'Absolutely loved every moment of the tour! From the breathtaking landscapes to the knowledgeable guides, it was an unforgettable experience.', '2022-10-08 00:00:00', 'Thrilled to hear you had a blast on the tour! We\'re here to help you explore more amazing destinations whenever you\'re ready.', '2022-10-12 00:00:00', NULL, NULL, NULL);
INSERT INTO `tour_review` (`id_tour_booking`, `rating`, `review`, `review_date`, `reply`, `reply_date`, `report`, `report_date`, `report_status`) VALUES
(2, 4, 'We are quite satisfied with the trip. However, I think it is necessary to improve the accommodation so that customers can have the best experience', '2023-01-07 00:00:00', 'Your feedback is invaluable to us. We\'ll work on addressing the areas you mentioned and hope to make your next trip even better.', '2023-01-10 00:00:00', '', NULL, NULL);
INSERT INTO `tour_review` (`id_tour_booking`, `rating`, `review`, `review_date`, `reply`, `reply_date`, `report`, `report_date`, `report_status`) VALUES
(3, 5, 'I appreciate the schedule of this trip. It gave me a great journey that I feel is worth the money I spent.', '2023-09-07 00:00:00', 'Thank you for rating us. We are extremely pleased that you had a great experience from our trip.', '2023-09-09 00:00:00', '', NULL, NULL);
INSERT INTO `tour_review` (`id_tour_booking`, `rating`, `review`, `review_date`, `reply`, `reply_date`, `report`, `report_date`, `report_status`) VALUES
(4, 2, 'Bad trip! I will not be back any more.', '2023-03-11 00:00:00', '', NULL, 'We tried to contact support but the customer refuses to resolve the issue and customer reviews are hurting our business.', '2023-03-13 00:00:00', 1),
(5, 4, 'Had an amazing time on the tour. The guides were knowledgeable and the scenery was breathtaking. Definitely recommend!', '2023-07-06 00:00:00', 'Thank you for sharing your wonderful experience! We\'re thrilled to have been a part of your memorable journey.', '2023-07-10 00:00:00', '', NULL, NULL),
(6, 5, 'The tour was decent, but there were some issues with organization. The itinerary could have been better planned.', '2023-08-15 00:00:00', '', NULL, 'We appreciate your feedback and apologize for any inconveniences you faced. We\'re committed to improving our services based on your insights.', '2023-08-18 00:00:00', 1),
(7, 5, 'Absolutely fantastic experience. The tour exceeded all expectations. The guides were friendly, and I can\'t wait to go back!', '2023-08-07 00:00:00', 'Your positive words inspire us to continue delivering exceptional experiences. We can\'t wait to welcome you back for another adventure!', '2023-08-20 00:00:00', '', NULL, NULL),
(8, 4, 'Overall, a great trip. The itinerary was diverse and the tour guides were friendly. Just a few minor issues.', '2023-08-02 00:00:00', 'We\'re glad you enjoyed your time with us! Your kind words motivate us to keep delivering the best travel experiences.', '2023-08-05 00:00:00', '', NULL, NULL);

INSERT INTO `tour_wishlist` (`id_tourist`, `id_tour`) VALUES
(1, 1);
INSERT INTO `tour_wishlist` (`id_tourist`, `id_tour`) VALUES
(2, 2);
INSERT INTO `tour_wishlist` (`id_tourist`, `id_tour`) VALUES
(3, 3);
INSERT INTO `tour_wishlist` (`id_tourist`, `id_tour`) VALUES
(4, 4),
(5, 5);

INSERT INTO `tourist` (`id_tourist`, `fullname`, `password`, `email`, `avatar`, `phone`, `birthday`, `gender`, `id_role`) VALUES
(1, 'Phan My Linh', '$2b$10$zJbRnVDWT58NSKJx5yPAt.RuMdROQtiy4lOIckP1QIWA7vNXAu6HC', 'phmyxlinh@gmail.com', '1691988474465_c.png', '0913256676', '2000-03-17', 0, 1);
INSERT INTO `tourist` (`id_tourist`, `fullname`, `password`, `email`, `avatar`, `phone`, `birthday`, `gender`, `id_role`) VALUES
(2, 'Nguyen Thi Thu Ngan', '$2b$10$.ZIlMP3FGfsXQVk3WOCfe.84JUxOty95hQUXfowAl25eH.vFTfj0m', 'nguyenthithungan2113@gmail.com', '1692850033736_portrait4.jpg', '0856963564', '2001-12-04', 1, 1);
INSERT INTO `tourist` (`id_tourist`, `fullname`, `password`, `email`, `avatar`, `phone`, `birthday`, `gender`, `id_role`) VALUES
(3, 'Bui Ha Quyen ', '$2b$10$2DUlELmaURG2uBwoHBkj9O/UL1XwrdGL0G2PuuZY4cLl9P8.hG4zO', 'haquyenbui1@gmail.com', '1692871625555_portrait2.jpg', '0876935265', '2000-04-12', 1, 1);
INSERT INTO `tourist` (`id_tourist`, `fullname`, `password`, `email`, `avatar`, `phone`, `birthday`, `gender`, `id_role`) VALUES
(4, 'Ha Tram Anh ', '$2b$10$DWMCbTxgm3GJQBPRLo6Ok./FaRgxYsn15zyhpxvf00IIm8YVUYQz.', 'haanhtram457@gmail.com', 'company5.png', '0953264895', '1995-03-12', 0, 1),
(5, 'Tran Tuan Van', '$2b$10$BYQbBNiCf5HmD.scuPdTZ.u6QCuVWOc.kHupk/PgUcV64X4UZpb8O', 'trantuanvan421@gmail.com', 'freelancer5.jpg', '0956324587', '1999-03-16', 0, 1),
(6, 'Tran Thi Mai Oanh', '$2b$10$gjAd4maPrJwGK9wGUAm3Pe.P6ALKvOqQbhnw5YlmpY.D6lpYv7tii', 'tranthimaioanh123@gmail.com', 'license6.jpg', '0785493544', '2002-05-19', 1, 1),
(7, 'Dinh Thi Thu Huyen', '$2b$10$z8.dXTVJeMaDrosheUS87../pedE8IOzxfajGQmsNwg8e5Db/LoMu', 'dinhthithuhuyen456@gmail.com', 'license7.jpg', '0798797923', '2002-08-27', 1, 1),
(8, 'Nguyen Thanh Thao', '$2b$10$0Me0xCxCmK7KrugVmya...HyiNEV.QF3b5S8FvHyt224VBkbxdWei', 'nguyenthanhthao789@gmail.com', 'license8.jpg', '0675398890', '2001-06-23', 1, 1),
(9, 'Tran Ngoc Tran ', '$2b$10$qWibmblY9NUzf6TRb3quIeoY6YMQB8Zzk8vd.7JWv5bbY814GFwcC', 'tranngoctran1357@gmail.com', 'license9.jpg', '0546577588', '2001-11-25', 0, 1),
(10, 'Tran Bao Tran', '$2b$10$YCg6oqcrmXT.HtcJAbo0GesWqC6GB9SMEEFEn.t31h21RsNsPdiVa', 'tranbaotran2k6@gmail.com', 'license10.jpg', '0795668934', '2002-10-06', 0, 1);


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;