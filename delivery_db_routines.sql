-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: delivery_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Temporary view structure for view `last_mile_view`
--

DROP TABLE IF EXISTS `last_mile_view`;
/*!50001 DROP VIEW IF EXISTS `last_mile_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `last_mile_view` AS SELECT 
 1 AS `shipment_id`,
 1 AS `destination_city`,
 1 AS `partner_id`,
 1 AS `delivery_status`,
 1 AS `last_mile_hours`,
 1 AS `out_for_delivery_time`,
 1 AS `delivered_time`,
 1 AS `distance_km`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `first_mile_view`
--

DROP TABLE IF EXISTS `first_mile_view`;
/*!50001 DROP VIEW IF EXISTS `first_mile_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `first_mile_view` AS SELECT 
 1 AS `shipment_id`,
 1 AS `order_id`,
 1 AS `origin_city`,
 1 AS `partner_id`,
 1 AS `first_mile_hours`,
 1 AS `order_date`,
 1 AS `pickup_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cost_summary_view`
--

DROP TABLE IF EXISTS `cost_summary_view`;
/*!50001 DROP VIEW IF EXISTS `cost_summary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cost_summary_view` AS SELECT 
 1 AS `shipment_id`,
 1 AS `partner_id`,
 1 AS `delivery_status`,
 1 AS `fuel_cost`,
 1 AS `partner_payout`,
 1 AS `return_cost`,
 1 AS `other_costs`,
 1 AS `total_cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `failure_summary_view`
--

DROP TABLE IF EXISTS `failure_summary_view`;
/*!50001 DROP VIEW IF EXISTS `failure_summary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `failure_summary_view` AS SELECT 
 1 AS `shipment_id`,
 1 AS `failure_reason`,
 1 AS `first_mile_or_last_mile`,
 1 AS `partner_id`,
 1 AS `origin_city`,
 1 AS `destination_city`,
 1 AS `delivery_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `partner_performance_view`
--

DROP TABLE IF EXISTS `partner_performance_view`;
/*!50001 DROP VIEW IF EXISTS `partner_performance_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `partner_performance_view` AS SELECT 
 1 AS `partner_id`,
 1 AS `partner_name`,
 1 AS `region`,
 1 AS `partner_type`,
 1 AS `monthly_capacity`,
 1 AS `shipments_handled`,
 1 AS `avg_delivery_time_hours`,
 1 AS `success_rate_pct`,
 1 AS `avg_cost_per_shipment`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `delivery_summary_view`
--

DROP TABLE IF EXISTS `delivery_summary_view`;
/*!50001 DROP VIEW IF EXISTS `delivery_summary_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `delivery_summary_view` AS SELECT 
 1 AS `shipment_id`,
 1 AS `order_id`,
 1 AS `order_date`,
 1 AS `pickup_time`,
 1 AS `processing_center_time`,
 1 AS `dispatch_time`,
 1 AS `out_for_delivery_time`,
 1 AS `delivered_time`,
 1 AS `delivery_status`,
 1 AS `distance_km`,
 1 AS `pickup_time_hours`,
 1 AS `transit_time_hours`,
 1 AS `last_mile_time_hours`,
 1 AS `total_delivery_time_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `last_mile_view`
--

/*!50001 DROP VIEW IF EXISTS `last_mile_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `last_mile_view` AS select `deliveries`.`shipment_id` AS `shipment_id`,`deliveries`.`destination_city` AS `destination_city`,`deliveries`.`partner_id` AS `partner_id`,`deliveries`.`delivery_status` AS `delivery_status`,timestampdiff(HOUR,`deliveries`.`out_for_delivery_time`,`deliveries`.`delivered_time`) AS `last_mile_hours`,`deliveries`.`out_for_delivery_time` AS `out_for_delivery_time`,`deliveries`.`delivered_time` AS `delivered_time`,`deliveries`.`distance_km` AS `distance_km` from `deliveries` where (`deliveries`.`out_for_delivery_time` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `first_mile_view`
--

/*!50001 DROP VIEW IF EXISTS `first_mile_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `first_mile_view` AS select `deliveries`.`shipment_id` AS `shipment_id`,`deliveries`.`order_id` AS `order_id`,`deliveries`.`origin_city` AS `origin_city`,`deliveries`.`partner_id` AS `partner_id`,timestampdiff(HOUR,`deliveries`.`order_date`,`deliveries`.`pickup_time`) AS `first_mile_hours`,`deliveries`.`order_date` AS `order_date`,`deliveries`.`pickup_time` AS `pickup_time` from `deliveries` where (`deliveries`.`pickup_time` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cost_summary_view`
--

/*!50001 DROP VIEW IF EXISTS `cost_summary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cost_summary_view` AS select `d`.`shipment_id` AS `shipment_id`,`d`.`partner_id` AS `partner_id`,`d`.`delivery_status` AS `delivery_status`,coalesce(`c`.`fuel_cost`,0) AS `fuel_cost`,coalesce(`c`.`partner_payout`,0) AS `partner_payout`,coalesce(`c`.`return_cost`,0) AS `return_cost`,coalesce(`c`.`other_costs`,0) AS `other_costs`,(((coalesce(`c`.`fuel_cost`,0) + coalesce(`c`.`partner_payout`,0)) + coalesce(`c`.`return_cost`,0)) + coalesce(`c`.`other_costs`,0)) AS `total_cost` from (`deliveries` `d` left join `costs` `c` on((`d`.`shipment_id` = `c`.`shipment_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `failure_summary_view`
--

/*!50001 DROP VIEW IF EXISTS `failure_summary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `failure_summary_view` AS select `f`.`shipment_id` AS `shipment_id`,`f`.`failure_reason` AS `failure_reason`,`f`.`first_mile_or_last_mile` AS `first_mile_or_last_mile`,`d`.`partner_id` AS `partner_id`,`d`.`origin_city` AS `origin_city`,`d`.`destination_city` AS `destination_city`,`d`.`delivery_status` AS `delivery_status` from (`failure_reasons` `f` left join `deliveries` `d` on((`f`.`shipment_id` = `d`.`shipment_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partner_performance_view`
--

/*!50001 DROP VIEW IF EXISTS `partner_performance_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partner_performance_view` AS select `dp`.`partner_id` AS `partner_id`,`dp`.`partner_name` AS `partner_name`,`dp`.`region` AS `region`,`dp`.`partner_type` AS `partner_type`,`dp`.`monthly_capacity` AS `monthly_capacity`,count(`d`.`shipment_id`) AS `shipments_handled`,round(avg(timestampdiff(HOUR,`d`.`order_date`,`d`.`delivered_time`)),2) AS `avg_delivery_time_hours`,round(((sum((case when (`d`.`delivery_status` = 'Delivered') then 1 else 0 end)) * 100.0) / nullif(count(`d`.`shipment_id`),0)),2) AS `success_rate_pct`,round(avg(`ci`.`total_cost`),2) AS `avg_cost_per_shipment` from ((`delivery_partners` `dp` left join `deliveries` `d` on((`dp`.`partner_id` = `d`.`partner_id`))) left join (select `c`.`shipment_id` AS `shipment_id`,(((coalesce(`c`.`fuel_cost`,0) + coalesce(`c`.`partner_payout`,0)) + coalesce(`c`.`return_cost`,0)) + coalesce(`c`.`other_costs`,0)) AS `total_cost` from `costs` `c`) `ci` on((`ci`.`shipment_id` = `d`.`shipment_id`))) group by `dp`.`partner_id`,`dp`.`partner_name`,`dp`.`region`,`dp`.`partner_type`,`dp`.`monthly_capacity` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `delivery_summary_view`
--

/*!50001 DROP VIEW IF EXISTS `delivery_summary_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `delivery_summary_view` AS select `d`.`shipment_id` AS `shipment_id`,`d`.`order_id` AS `order_id`,`d`.`order_date` AS `order_date`,`d`.`pickup_time` AS `pickup_time`,`d`.`processing_center_time` AS `processing_center_time`,`d`.`dispatch_time` AS `dispatch_time`,`d`.`out_for_delivery_time` AS `out_for_delivery_time`,`d`.`delivered_time` AS `delivered_time`,`d`.`delivery_status` AS `delivery_status`,`d`.`distance_km` AS `distance_km`,(timestampdiff(MINUTE,`d`.`order_date`,`d`.`pickup_time`) / 60) AS `pickup_time_hours`,(timestampdiff(MINUTE,`d`.`pickup_time`,`d`.`out_for_delivery_time`) / 60) AS `transit_time_hours`,(timestampdiff(MINUTE,`d`.`out_for_delivery_time`,`d`.`delivered_time`) / 60) AS `last_mile_time_hours`,(timestampdiff(MINUTE,`d`.`order_date`,`d`.`delivered_time`) / 60) AS `total_delivery_time_hours` from `deliveries` `d` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-23 16:11:05
