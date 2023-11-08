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
-- Table structure for table `voos`
--

DROP TABLE IF EXISTS `voos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voos` (
  `id_voo` int NOT NULL AUTO_INCREMENT,
  `empresa_voo` enum('LATAM','Azul','Gol') DEFAULT NULL,
  `origem_voo` varchar(40) DEFAULT NULL,
  `destino_voo` varchar(40) DEFAULT NULL,
  `aeroporto_origem` varchar(60) DEFAULT NULL,
  `aeroporto_destino` varchar(50) DEFAULT NULL,
  `hora_decolagem` varchar(10) DEFAULT NULL,
  `hora_pouso` varchar(10) DEFAULT NULL,
  `saida_voo` date DEFAULT NULL,
  `chegada_voo` date DEFAULT NULL,
  `preco_voo` double DEFAULT NULL,
  PRIMARY KEY (`id_voo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voos`
--

LOCK TABLES `voos` WRITE;
/*!40000 ALTER TABLE `voos` DISABLE KEYS */;
INSERT INTO `voos` VALUES (2,'Azul','São Paulo','Recife','Internacional de Guarulhos','Internacional do Guararapes','23:15','01:15','2024-02-01','2024-02-02',752),(3,'LATAM','Belo Horizaonte','Rio de Janeiro','Internacional de Confins','Internacional do Galeão','10:10','11:20','2024-02-05','2024-02-05',650),(4,'Gol','São Paulo','Belo Horizonte','Internacional do Galeão','Internacional de Confins','13:50','15:00','2024-02-15','2024-02-15',582),(5,'Azul','São Paulo - SP','Recife - PE','Internacional de Garulhos','Internacional do Recife/Guararapes','20:00','22:55','2024-02-01','2024-02-01',753),(6,'Azul','Recife - PE','São Paulo - SP','Internacional do Recife/Guararapes','Internacional de Garulhos','15:20','18:05','2024-02-15','2024-02-15',685),(7,'LATAM','Rio de Janeiro - RJ','Belo Horizonte - MG','Internacional do Rio de Janeiro - Galeão','Internacional de Confins - Tancredo Neves','08:45','09:55','2024-02-08','2024-02-08',523),(8,'Gol','Belo Horizonte - MG','Rio de Janeiro - RJ','Internacional de Confins - Tancredo Neves','Internacional do Rio de Janeiro - Galeão','12:30','13:35','2024-01-30','2024-01-30',450);
/*!40000 ALTER TABLE `voos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_preco_pacote` AFTER UPDATE ON `voos` FOR EACH ROW BEGIN
    UPDATE pacotes AS p
    SET p.preco_pacote = (
        (SELECT preco_voo FROM voos WHERE id_voo = p.id_voo_ida) +
        (SELECT preco_voo FROM voos WHERE id_voo = p.id_voo_volta) +
        ((DATEDIFF(p.data_volta_pacote, p.data_ida_pacote) + 1) * (SELECT preco_diaria FROM hoteis WHERE id_hotel = p.id_hotel))
    )
    WHERE p.id_voo_ida = NEW.id_voo OR p.id_voo_volta = NEW.id_voo;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `atualizar_preco_pacote_voo` AFTER UPDATE ON `voos` FOR EACH ROW BEGIN
    -- Atualizar o preço do pacote na tabela pacotes
    UPDATE pacotes AS p
    SET p.preco_pacote = (
        (SELECT preco_voo FROM voos WHERE id_voo = p.id_voo_ida) +
        (SELECT preco_voo FROM voos WHERE id_voo = p.id_voo_volta) +
        ((DATEDIFF(p.data_volta_pacote, p.data_ida_pacote) + 1) * (SELECT preco_diaria FROM hoteis WHERE id_hotel = p.id_hotel))
    )
    WHERE p.id_voo_ida = NEW.id_voo OR p.id_voo_volta = NEW.id_voo;
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
