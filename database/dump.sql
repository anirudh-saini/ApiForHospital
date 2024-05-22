CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES ('hospital1','Apollo Hospitals'),('hospital2','Jawaharlal Nehru Medical College and Hospital'),('hospital3','Indira Gandhi Institute of Medical Sciences (IGIMS)'),('hospital4','AIIMS - All India Institute Of Medical Science');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `id` varchar(36) NOT NULL,
  `psychiatrist_id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `psychiatrist_id` (`psychiatrist_id`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`psychiatrist_id`) REFERENCES `psychiatrist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES ('patient-1','psychiatrist-1','Aishwarya Rao','1234 MG Road, Bangalore, Karnataka','aishwaryarao@abc.com','+91 9123456780','Aish1234','https://cloudstorage.in/image/image-id0'),('patient-10','psychiatrist-10','Anusha Khan','78 Sarojini Nagar, Delhi','anushakhan@abc.com','+91 9903456789','Anusha678','https://cloudstorage.in/image/image-id9'),('patient-11','psychiatrist-11','Sameer Gupta','101 Connaught Place, Delhi','sameergupta@abc.com','+91 9012345678','Sameer789','https://cloudstorage.in/image/image-id10'),('patient-12','psychiatrist-12','Shweta Varma','34 Hiranandani Gardens, Mumbai, Maharashtra','shwetavarma@abc.com','+91 9123456790','Shweta890','https://cloudstorage.in/image/image-id11'),('patient-13','psychiatrist-13','Rakesh Menon','67 Versova, Mumbai, Maharashtra','rakeshmenon@abc.com','+91 9234567890','Rakesh123','https://cloudstorage.in/image/image-id12'),('patient-14','psychiatrist-14','Pallavi Mehta','89 Vashi, Navi Mumbai, Maharashtra','pallavimehta@abc.com','+91 9345678901','Pallavi345','https://cloudstorage.in/image/image-id13'),('patient-15','psychiatrist-15','Arnav Kulkarni','12 Koregaon Park, Pune, Maharashtra','arnavkulkarni@abc.com','+91 9456789012','Arnav4567','https://cloudstorage.in/image/image-id14'),('patient-16','psychiatrist-16','Priyanka Shah','34 Kalyani Nagar, Pune, Maharashtra','priyankashah@abc.com','+91 9567890123','Priyanka9','https://cloudstorage.in/image/image-id15'),('patient-17','psychiatrist-17','Rohan Roy','56 Salt Lake, Kolkata, West Bengal','rohanroy@abc.com','+91 9678901234','Rohan1234','https://cloudstorage.in/image/image-id16'),('patient-18','psychiatrist-18','Tanvi Iyer','78 Bistupur, Jamshedpur, Jharkhand','tanviiyer@abc.com','+91 9789012345','Tanvi5678','https://cloudstorage.in/image/image-id17'),('patient-19','psychiatrist-19','Anirudh Sinha','90 Ashok Nagar, Ranchi, Jharkhand','anirudhsinha@abc.com','+91 9890123456','Anirudh78','https://cloudstorage.in/image/image-id18'),('patient-2','psychiatrist-2','Vivek Kapoor','56 Park Street, Kolkata, West Bengal','vivekkapoor@abc.com','+91 9876543210','Vivek4567','https://cloudstorage.in/image/image-id1'),('patient-20','psychiatrist-20','Ritu Bhatt','23 Lake Road, Thane, Maharashtra','ritubhatt@abc.com','+91 9901234567','Ritu2345','https://cloudstorage.in/image/image-id19'),('patient-21','psychiatrist-1','Nikhil Verma','45 Link Road, Andheri, Mumbai, Maharashtra','nikhilverma@abc.com','+91 9013456789','Nikhil678','https://cloudstorage.in/image/image-id20'),('patient-22','psychiatrist-2','Aditi Pillai','67 Borivali, Mumbai, Maharashtra','aditipillai@abc.com','+91 9123456789','Aditi9012','https://cloudstorage.in/image/image-id21'),('patient-23','psychiatrist-3','Gaurav Chawla','89 Powai, Mumbai, Maharashtra','gauravchawla@abc.com','+91 9234567801','Gaurav123','https://cloudstorage.in/image/image-id22'),('patient-24','psychiatrist-4','Swati Das','23 Malad, Mumbai, Maharashtra','swatidas@abc.com','+91 9345678902','Swati2345','https://cloudstorage.in/image/image-id23'),('patient-25','psychiatrist-5','Vivek Jain','45 Bandra, Mumbai, Maharashtra','vivekjain@abc.com','+91 9456789013','Vivek4567','https://cloudstorage.in/image/image-id24'),('patient-26','psychiatrist-6','Rashmi Mathur','67 Juhu, Mumbai, Maharashtra','rashmimathur@abc.com','+91 9567890124','Rashmi678','https://cloudstorage.in/image/image-id25'),('patient-27','psychiatrist-7','Pranav Thakur','89 Khar, Mumbai, Maharashtra','pranavthakur@abc.com','+91 9678901235','Pranav901','https://cloudstorage.in/image/image-id26'),('patient-28','psychiatrist-8','Natasha Chauhan','12 Lokhandwala, Andheri, Mumbai, Maharashtra','natashachauhan@abc.com','+91 9789012346','Natasha12','https://cloudstorage.in/image/image-id27'),('patient-29','psychiatrist-9','Ishita Tiwari','34 Oshiwara, Andheri, Mumbai, Maharashtra','ishitatiwari@abc.com','+91 9890123457','Ishita345','https://cloudstorage.in/image/image-id28'),('patient-3','psychiatrist-3','Neha Singh','78 Residency Road, Lucknow, Uttar Pradesh','nehasingh@abc.com','+91 9234567810','Neha7890','https://cloudstorage.in/image/image-id2'),('patient-30','psychiatrist-10','Suman Malhotra','56 Versova, Andheri, Mumbai, Maharashtra','sumanmalhotra@abc.com','+91 9901234568','Suman4567','https://cloudstorage.in/image/image-id29'),('patient-31','psychiatrist-11','Hemant Sethi','78 Juhu, Mumbai, Maharashtra','hemantsethi@abc.com','+91 9012345679','Hemant678','https://cloudstorage.in/image/image-id30'),('patient-32','psychiatrist-12','Anjali Dutta','90 Malad, Mumbai, Maharashtra','anjalidutta@abc.com','+91 9123456791','Anjali901','https://cloudstorage.in/image/image-id31'),('patient-33','psychiatrist-13','Vikas Bhatia','23 Kandivali, Mumbai, Maharashtra','vikasbhatia@abc.com','+91 9234567891','Vikas1234','https://cloudstorage.in/image/image-id32'),('patient-34','psychiatrist-14','Nivedita Bajaj','45 Borivali, Mumbai, Maharashtra','niveditabajaj@abc.com','+91 9345678903','Nivedita1','https://cloudstorage.in/image/image-id33'),('patient-35','psychiatrist-15','Vijay Saluja','67 Vile Parle, Mumbai, Maharashtra','vijaysaluja@abc.com','+91 9456789014','Vijay2345','https://cloudstorage.in/image/image-id34'),('patient-36','psychiatrist-16','Kiran Kaushik','89 Andheri East, Mumbai, Maharashtra','kirankaushik@abc.com','+91 9567890125','Kiran4567','https://cloudstorage.in/image/image-id35'),('patient-37','psychiatrist-17','Siddharth Bose','12 Kurla, Mumbai, Maharashtra','siddharthbose@abc.com','+91 9678901236','Siddharth','https://cloudstorage.in/image/image-id36'),('patient-38','psychiatrist-18','Namita Bhattacharya','34 Ghatkopar, Mumbai, Maharashtra','namitabhattacharya@abc.com','+91 9789012347','Namita567','https://cloudstorage.in/image/image-id37'),('patient-39','psychiatrist-19','Anil Mohan','56 Mulund, Mumbai, Maharashtra','anilmohan@abc.com','+91 9890123458','Anil67890','https://cloudstorage.in/image/image-id38'),('patient-4','psychiatrist-4','Rajiv Patel','101 Gandhi Marg, Ahmedabad, Gujarat','rajivpatel@abc.com','+91 9345678123','Rajiv8901','https://cloudstorage.in/image/image-id3'),('patient-40','psychiatrist-20','Bhavna Ghosh','78 Thane, Mumbai, Maharashtra','bhavnaghosh@abc.com','+91 9901234569','Bhavna123','https://cloudstorage.in/image/image-id39'),('patient-41','psychiatrist-1','Naveen Sehgal','90 Colaba, Mumbai, Maharashtra','naveensehgal@abc.com','+91 9012345680','Naveen234','https://cloudstorage.in/image/image-id40'),('patient-42','psychiatrist-2','Komal Sood','23 Fort, Mumbai, Maharashtra','komalsood@abc.com','+91 9123456792','Komal4567','https://cloudstorage.in/image/image-id41'),('patient-43','psychiatrist-3','Amit Bansal','45 Dadar, Mumbai, Maharashtra','amitbansal@abc.com','+91 9234567892','Amit56789','https://cloudstorage.in/image/image-id42'),('patient-44','psychiatrist-4','Rekha Nambiar','67 Matunga, Mumbai, Maharashtra','rekhanambiar@abc.com','+91 9345678904','Rekha6789','https://cloudstorage.in/image/image-id43'),('patient-45','psychiatrist-5','Piyush Mittal','89 Mahim, Mumbai, Maharashtra','piyushmittal@abc.com','+91 9456789015','Piyush901','https://cloudstorage.in/image/image-id44'),('patient-46','psychiatrist-6','Vidya Menon','12 Wadala, Mumbai, Maharashtra','vidyamenon@abc.com','+91 9567890126','Vidya1234','https://cloudstorage.in/image/image-id45'),('patient-47','psychiatrist-7','Karthik Kothari','34 Sion, Mumbai, Maharashtra','karthikkothari@abc.com','+91 9678901237','Karthik45','https://cloudstorage.in/image/image-id46'),('patient-48','psychiatrist-8','Jaya Fernandes','56 Bandra East, Mumbai, Maharashtra','jayafernandes@abc.com','+91 9789012348','Jaya67890','https://cloudstorage.in/image/image-id47'),('patient-49','psychiatrist-9','Arjun Pandey','78 Bandra West, Mumbai, Maharashtra','arjunpandey@abc.com','+91 9890123459','Arjun1234','https://cloudstorage.in/image/image-id48'),('patient-5','psychiatrist-5','Kiran Reddy','45 Jubilee Hills, Hyderabad, Telangana','kiranreddy@abc.com','+91 9456781234','Kiran9012','https://cloudstorage.in/image/image-id4'),('patient-50','psychiatrist-10','Pooja Shetty','90 Khar East, Mumbai, Maharashtra','poojashetty@abc.com','+91 9901234570','Pooja5678','https://cloudstorage.in/image/image-id49'),('patient-6','psychiatrist-6','Meghna Desai','67 Banjara Hills, Hyderabad, Telangana','meghnadesai@abc.com','+91 9567812345','Meghna123','https://cloudstorage.in/image/image-id5'),('patient-7','psychiatrist-7','Ravi Sharma','89 Civil Lines, Nagpur, Maharashtra','ravisharma@abc.com','+91 9678123456','Ravi2345','https://cloudstorage.in/image/image-id6'),('patient-8','psychiatrist-8','Snehal Joshi','23 MG Road, Pune, Maharashtra','snehaljoshi@abc.com','+91 9781234567','Snehal345','https://cloudstorage.in/image/image-id7'),('patient-9','psychiatrist-9','Deepak Nair','56 Brigade Road, Bangalore, Karnataka','deepaknair@abc.com','+91 9892345678','Deepak567','https://cloudstorage.in/image/image-id8');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psychiatrist`
--

DROP TABLE IF EXISTS `psychiatrist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psychiatrist` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `hospital_id` varchar(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `psychiatrist_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychiatrist`
--

LOCK TABLES `psychiatrist` WRITE;
/*!40000 ALTER TABLE `psychiatrist` DISABLE KEYS */;
INSERT INTO `psychiatrist` VALUES ('psychiatrist-1','Aarav Sharma','hospital1'),('psychiatrist-10','Sana Khan','hospital2'),('psychiatrist-11','Arjun Gupta','hospital3'),('psychiatrist-12','Priya Reddy','hospital4'),('psychiatrist-13','Rajesh Varma','hospital1'),('psychiatrist-14','Kavya Menon','hospital2'),('psychiatrist-15','Neel Patel','hospital3'),('psychiatrist-16','Pooja Shah','hospital4'),('psychiatrist-17','Aakash Roy','hospital1'),('psychiatrist-18','Tara Iyer','hospital2'),('psychiatrist-19','Nikhil Sinha','hospital3'),('psychiatrist-2','Vivaan Patel','hospital2'),('psychiatrist-20','Simran Bhatt','hospital4'),('psychiatrist-3','Diya Rao','hospital3'),('psychiatrist-4','Ananya Mehta','hospital4'),('psychiatrist-5','Ishaan Kapoor','hospital1'),('psychiatrist-6','Mira Desai','hospital2'),('psychiatrist-7','Kabir Singh','hospital3'),('psychiatrist-8','Anika Joshi','hospital4'),('psychiatrist-9','Rohan Verma','hospital1');
/*!40000 ALTER TABLE `psychiatrist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23  1:20:24
