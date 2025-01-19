
# Answer 1
SELECT COUNT(*),CASE WHEN trip_distance <=1 then 'Up to 1 Mile'
				WHEN trip_distance >1 and trip_distance <= 3 then '1 to 3'
				WHEN trip_distance >3 and trip_distance <= 7 then '3 to 7'	
				WHEN trip_distance >7 and trip_distance <= 10 then '7 to 10'	
				ELSE 'Over 10 Miles' END as trip_dist
FROM green_taxi
WHERE date(lpep_pickup_datetime) >= '2019-10-01' and date(lpep_pickup_datetime) < '2019-11-01'
GROUP BY trip_dist



SELECT MAX(trip_distance) as maxi_trip,DATE(lpep_pickup_datetime) as pup
FROM green_taxi
GROUP BY pup
ORDER BY maxi_trip DESC



SELECT SUM(total_amount) as day_total,z."Borough",z."Zone",z."service_zone" 
FROM green_taxi as g 
LEFT JOIN taxi_zones as z
on g."PULocationID" = z."LocationID"
WHERE date(lpep_pickup_datetime) = '2019-10-18'
GROUP BY z."Borough",z."Zone",z."service_zone"
ORDER BY day_total DESC


SELECT MAX(tip_amount) as highest_tip,zd."Borough",zd."Zone",zd."service_zone" 
FROM green_taxi as g 
INNER JOIN taxi_zones as z
on g."PULocationID" = z."LocationID"
INNER JOIN taxi_zones as zd
on g."DOLocationID" = zd."LocationID"
WHERE date(lpep_pickup_datetime) >= '2019-10-01' and date(lpep_pickup_datetime) <= '2019-11-01'
and z."Zone" = 'East Harlem North'
GROUP BY zd."Borough",zd."Zone",zd."service_zone"
ORDER BY highest_tip DESC