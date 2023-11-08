-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: agencia
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `pacotes`
--

DROP TABLE IF EXISTS `pacotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacotes` (
  `id_pacote` int NOT NULL AUTO_INCREMENT,
  `id_voo_ida` int DEFAULT NULL,
  `id_voo_volta` int DEFAULT NULL,
  `id_hotel` int DEFAULT NULL,
  `destino_pacote` varchar(40) DEFAULT NULL,
  `origem_pacote` varchar(40) DEFAULT NULL,
  `data_ida_pacote` date DEFAULT NULL,
  `data_volta_pacote` date DEFAULT NULL,
  `preco_pacote` double DEFAULT NULL,
  `dias_pacote` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_pacote`),
  KEY `id_voo_ida` (`id_voo_ida`),
  KEY `id_voo_volta` (`id_voo_volta`),
  KEY `pacotes_ibfk_3_idx` (`id_hotel`),
  CONSTRAINT `pacotes_ibfk_1` FOREIGN KEY (`id_voo_ida`) REFERENCES `voos` (`id_voo`),
  CONSTRAINT `pacotes_ibfk_2` FOREIGN KEY (`id_voo_volta`) REFERENCES `voos` (`id_voo`),
  CONSTRAINT `pacotes_ibfk_3` FOREIGN KEY (`id_hotel`) REFERENCES `hoteis` (`id_hotel`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacotes`
--

LOCK TABLES `pacotes` WRITE;
/*!40000 ALTER TABLE `pacotes` DISABLE KEYS */;
INSERT INTO `pacotes` VALUES (1,2,4,3,'Rio de Janeiro','Belo Horizonte','2024-02-05','2024-02-15',2984,11),(2,2,4,2,'Maragogi','São Paulo','2024-02-01','2024-02-10',3334,10),(4,5,6,6,'São Paulo - SP','Recife - PE','2024-02-01','2024-02-15',5332,15),(5,8,7,1,'Belo Horizonte - MG','Rio de Janeiro - RJ','2024-01-30','2024-02-08',2478,10);
/*!40000 ALTER TABLE `pacotes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calcular_preco_pacote` BEFORE INSERT ON `pacotes` FOR EACH ROW BEGIN
    DECLARE preco_voo_ida REAL;
    DECLARE preco_voo_volta REAL;
    DECLARE preco_diaria_hotel REAL;

    -- Obter o preço do voo de ida
    SELECT preco_voo INTO preco_voo_ida FROM voos WHERE id_voo = NEW.id_voo_ida;

    -- Obter o preço do voo de volta
    SELECT preco_voo INTO preco_voo_volta FROM voos WHERE id_voo = NEW.id_voo_volta;

    -- Obter o preço da diária do hotel
    SELECT preco_diaria INTO preco_diaria_hotel FROM hoteis WHERE id_hotel = NEW.id_hotel;

    -- Calcular o preço do pacote
    SET NEW.preco_pacote = preco_voo_ida + preco_voo_volta + ((DATEDIFF(NEW.data_volta_pacote, NEW.data_ida_pacote) + 1) * preco_diaria_hotel);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calcular_dias_pacote` BEFORE INSERT ON `pacotes` FOR EACH ROW BEGIN
    -- Calcular o preço do pacote
    SET NEW.dias_pacote = DATEDIFF(NEW.data_volta_pacote, NEW.data_ida_pacote) + 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_preco_pacote_voos` BEFORE UPDATE ON `pacotes` FOR EACH ROW BEGIN
    DECLARE preco_voo_ida REAL;
    DECLARE preco_voo_volta REAL;
    DECLARE preco_diaria_hotel REAL;
    
    -- Obter o preço do voo de ida
    SELECT preco_voo INTO preco_voo_ida FROM voos WHERE id_voo = NEW.id_voo_ida;
    
    -- Obter o preço do voo de volta
    SELECT preco_voo INTO preco_voo_volta FROM voos WHERE id_voo = NEW.id_voo_volta;
    
    -- Obter o preço da diária do hotel
    SELECT preco_diaria INTO preco_diaria_hotel FROM hoteis WHERE id_hotel = NEW.id_hotel;
    
    -- Calcular o novo preço do pacote
    SET NEW.preco_pacote = preco_voo_ida + preco_voo_volta + ((DATEDIFF(NEW.data_volta_pacote, NEW.data_ida_pacote) + 1) * preco_diaria_hotel);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_dias_pacote` BEFORE UPDATE ON `pacotes` FOR EACH ROW BEGIN
    -- Calcular dias do pacote
    SET NEW.dias_pacote = DATEDIFF(NEW.data_volta_pacote, NEW.data_ida_pacote) + 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_valor_compra_pacote` AFTER UPDATE ON `pacotes` FOR EACH ROW BEGIN
    -- Atualizar o preço do pacote na tabela pacotes
    UPDATE compras AS c
    SET c.valor_compra = (
        SELECT preco_pacote FROM pacotes WHERE id_pacote = c.id_pacote
    )
    WHERE c.id_pacote = NEW.id_pacote;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-07 22:49:01
