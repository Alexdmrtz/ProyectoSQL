-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: project_exilius
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','García','Calle Rivadavia 456, Buenos Aires','+54 9 11 5555 1111','juan.garcia@example.com'),(2,'Luis','Martínez','Av. San Juan 789, Mendoza','+54 9 261 444 6666','luis.martinez@example.com'),(3,'Martina','López','Calle Urquiza 321, Córdoba','+54 9 351 777 9999','martina.lopez@example.com'),(4,'Pedro','Silva','Av. Pellegrini 987, Rosario','+54 9 341 888 0000','pedro.silva@example.com'),(5,'Laura','Torres','Calle Sarmiento 654, Tucumán','+54 9 381 333 2222','laura.torres@example.com'),(6,'Gonzalo','Díaz','Av. 9 de Julio 555, Buenos Aires','+54 9 11 7777 8888','gonzalo.diaz@example.com'),(7,'Marcela','Romero','Calle Italia 147, Mendoza','+54 9 261 999 8888','marcela.romero@example.com'),(8,'Diego','Ramírez','Av. Vélez Sarsfield 222, Córdoba','+54 9 351 222 3333','diego.ramirez@example.com'),(9,'Carolina','Acosta','Calle Colón 789, Rosario','+54 9 341 555 6666','carolina.acosta@example.com'),(10,'Ezequiel','Fernández','Av. Corrientes 987, Buenos Aires','+54 9 11 6666 5555','ezequiel.fernandez@example.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AfterInsertClienteAudit` AFTER INSERT ON `clientes` FOR EACH ROW BEGIN
    SET @mensaje = CONCAT('Nuevo cliente insertado: ', NEW.nombre, ' ', NEW.apellido);
    
    INSERT INTO AuditoriaClientes (id_cliente, accion, fecha_hora, detalles)
    VALUES (NEW.id_cliente, 'Inserción con Mensaje de Auditoría', NOW(), @mensaje);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `compañias`
--

LOCK TABLES `compañias` WRITE;
/*!40000 ALTER TABLE `compañias` DISABLE KEYS */;
INSERT INTO `compañias` VALUES (1,'Seguros Argentinos S.A.','Av. Libertador 1234, Buenos Aires','+54 11 2222 3333','info@segurosargentinos.com'),(2,'Protección Seguros S.R.L.','Calle San Martín 567, Córdoba','+54 351 444 5555','contacto@proteccionseguros.com'),(3,'Rosario Seguros','Av. Colón 789, Rosario','+54 341 666 7777','info@rosarioseguros.com'),(4,'Mendozaseg S.A.','Calle Mitre 147, Mendoza','+54 261 888 9999','contacto@mendozaseg.com'),(5,'Tucumán Seguros','Av. Sarmiento 987, Tucumán','+54 381 222 1111','info@tucumanseguros.com'),(6,'SegurosBA','Av. 9 de Julio 555, Buenos Aires','+54 11 7777 8888','info@segurosba.com'),(7,'Mendoza Protegida','Calle Italia 789, Mendoza','+54 261 444 3333','contacto@mendozaprotegida.com'),(8,'Córdoba Insurance','Av. Vélez Sarsfield 222, Córdoba','+54 351 777 6666','info@cordobainsurance.com'),(9,'Seguros Rosales','Calle Colón 555, Rosario','+54 341 999 8888','info@segurosrosales.com'),(10,'Seguros del Plata','Av. Corrientes 987, Buenos Aires','+54 11 6666 5555','contacto@segurosdelplata.com');
/*!40000 ALTER TABLE `compañias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'2023-01-10',250.00,1),(2,'2023-02-15',180.50,2),(3,'2023-03-20',320.75,3),(4,'2023-04-05',200.30,4),(5,'2023-05-22',150.25,5),(6,'2023-06-18',280.90,6),(7,'2023-07-10',180.60,7),(8,'2023-08-28',150.00,8),(9,'2023-09-20',220.20,9),(10,'2023-10-31',140.80,10);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `polizas`
--

LOCK TABLES `polizas` WRITE;
/*!40000 ALTER TABLE `polizas` DISABLE KEYS */;
INSERT INTO `polizas` VALUES (1,'POL001','2023-01-15','2024-01-15',500.00,1,1,NULL,NULL),(2,'POL002','2023-02-01','2024-02-01',320.50,2,2,NULL,NULL),(3,'POL003','2023-03-10','2024-03-10',650.75,3,3,NULL,NULL),(4,'POL004','2023-04-05','2024-04-05',420.30,4,4,NULL,NULL),(5,'POL005','2023-05-20','2024-05-20',280.25,5,5,NULL,NULL),(6,'POL006','2023-06-12','2024-06-12',580.90,6,6,NULL,NULL),(7,'POL007','2023-07-03','2024-07-03',450.60,7,7,NULL,NULL),(8,'POL008','2023-08-25','2024-08-25',380.00,8,8,NULL,NULL),(9,'POL009','2023-09-18','2024-09-18',520.20,9,9,NULL,NULL),(10,'POL010','2023-10-30','2024-10-30',340.80,10,10,NULL,NULL);
/*!40000 ALTER TABLE `polizas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project_exilius'
--
/*!50003 DROP FUNCTION IF EXISTS `CalcularIVA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcularIVA`(poliza_id INT) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE monto DECIMAL(10, 2);
    DECLARE iva DECIMAL(10, 2);
    SELECT monto_prima INTO monto FROM Polizas WHERE id_poliza = poliza_id;
    SET iva = monto * 0.21; 
    RETURN iva;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `OrdenarTabla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `OrdenarTabla`(IN tabla_nombre VARCHAR(50), IN ordenar_por VARCHAR(50), IN orden VARCHAR(4))
BEGIN
    SET @sql_query = CONCAT('SELECT * FROM ', tabla_nombre, ' ORDER BY ', ordenar_por, ' ', orden);
    PREPARE stmt FROM @sql_query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcessOrders`()
BEGIN
    DECLARE is_empty BOOLEAN;

    -- Verificar si la tabla Polizas está vacía
    SELECT COUNT(*) = 0 INTO is_empty FROM Polizas;

    -- Iniciar una transacción
    START TRANSACTION;

    -- Eliminar registros si no está vacía.
    IF NOT is_empty THEN
        DELETE FROM Polizas WHERE fecha_termino < CURDATE() LIMIT 2;
        SELECT "Se eliminaron registros de la tabla Polizas." AS Message;
    ELSE
        -- Insertar registros si está vacía.
        INSERT INTO Polizas (numero_poliza, fecha_inicio, fecha_termino, monto_prima, cliente_id, tipo_cobertura_id) 
        VALUES 
            ('NuevoNumeroPoliza1', '2023-08-01', '2024-08-01', 1000.00, 1, 1),
            ('NuevoNumeroPoliza2', '2023-09-01', '2024-09-01', 1200.00, 2, 2);
        SELECT "Se insertaron registros en la tabla Polizas." AS Message;
    END IF;

    -- Confirmar o deshacer la transacción
    
    -- ROLLBACK;
    -- COMMIT;
END ;;
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

-- Dump completed on 2023-08-24 23:10:41
