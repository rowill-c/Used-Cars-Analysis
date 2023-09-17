```sql
Create Table UsedCars (year string, make_name string, model_name string, body_type string, transmission string, listing_color string, price string, is_new string, owner_count string, latitude string, longitude string);


CREATE EXTERNAL TABLE UsedCars (year string, make_name string, model_name string, body_type string, transmission string, listing_color string, price string, is_new string, owner_count string, latitude string, longitude string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
LOCATION '/user/joshuakoa/used_cars_data.csv';
TBLPROPERTIES ('skip.header.line.count'='1');

CREATE EXTERNAL TABLE if not exists time_zone_map (
 time_zone string,
 country string,
 notes string )
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE
LOCATION '/user/jwoo5/tmp/data/tables/time_zone_map'

CREATE EXTERNAL TABLE UsedCarsTest (year string, make_name string, model_name string, body_type string, transmission string, listing_color string, price string, is_new string, owner_count string, latitude string, longitude string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES ('skip.header.line.count'='1');

LOCATION '/user/joshuakoa/itversity/used_cars_data.csv';


unzip archive.zip
hdfs dfs -mkdir usedcars
hdfs dfs -moveFromLocal used_cars_data.csv /user/joshuakoa/usedcars

create database joshuakoa_usedcarstest_db;
use joshuakoa_usedcarstest_db;

load data inpath 'usedcars/used_cars_data.csv' into table usedcars;

!connect jdbc:hive2://bigdai-nov-bdcsce-1:2181,bigdai-nov-bdcsce-2:2181,bigdai-nov-bdcsce-3:2181/;serviceDiscoveryMode=zooKeeper;zooKeeperNamespace=hiveserver2?tez.queue.name=interactive  bdcsce_admin




//
CREATE EXTERNAL TABLE usedcardata (vin STRING, back_legroom STRING, bed STRING, bed_height STRING, bed_length STRING, body_type STRING,
 
cabin STRING, city STRING, city_fuel_economy STRING, combine_fuel_economy STRING, daysonmarket STRING, dealer_zip STRING, description STRING,

engine_cylinders STRING, engine_displacement STRING, engine_type STRING, exterior_color STRING, fleet STRING, frame_damaged STRING, franchise_dealer STRING, 

franchise_make STRING, front_legroom STRING, fuel_tank_volume STRING, fuel_type STRING, has_accidents STRING, height STRING, highway_fuel_economy STRING, horsepower STRING, 

interior_color STRING, isCab STRING, is_certifed STRING, is_cpo STRING, is_new STRING, is_oemcpo STRING, latitude STRING, length STRING, listed_date STRING, 


listing_color STRING, listing_id STRING,

longitude STRING, main_picture_url STRING, major_options STRING, make_name STRING, maximum_seating STRING, mileage STRING, model_name STRING, owner_count STRING, 

power STRING, price STRING, salvage STRING, savings_amount STRING, seller_rating STRING, sp_id STRING, sp_name STRING, theft_title STRING, torque STRING,

transmission STRING, transmission_display STRING, trim_id STRING, trim_name STRING, vehicle_damage_category STRING, wheel_system STRING, wheel_system_display STRING,

wheelbase STRING, width STRING, year INT)

ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'

STORED AS TEXTFILE

LOCATION '/user/jkoa/usedcars'

TBLPROPERTIES ('skip.header.line.count'='1');

//
select make_name, model_name, price FROM usedcartestfinal
	 order by make_name, model_name, price
     limit 10;
	 
select make_name, price, savings, city FROM usedcartestfinal
WHERE city = losangeles
order by savings
limit 10;
 
insert overwrite directory '/user/kdelat15/usedcars/'
row format delimited fields terminated by ','
SELECT sp_id, sp_name, AVG(savings_amount) AS Average_Savings FROM usedcartestfinal
GROUP BY sp_id, sp_name
ORDER BY Average_Savings DESC
LIMIT 1000;

$ hdfs dfs -get usedcars/000000_0 avg_savings.csv
psftp: open kdelat15@xx.xxx.xxx
ls
get avg_savings.csv

	
	
Select make_name, price from usedcartestfinal

	
	
//

```
