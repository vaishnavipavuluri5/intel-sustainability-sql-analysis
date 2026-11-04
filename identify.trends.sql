-- Intel Sustainability Impact Analysis
-- Part 3: Identifying Trends and Maximizing Sustainability

-- Objective: Return the total number of devices, the average energy savings, and the average CO₂
-- emissions saved (in tons), grouped by device_type. Report the average CO₂ emissions saved in tons.

WITH device_impact AS (
SELECT
d.device_id,
d.device_type,
d.model_year,
i.energy_savings_yr,
i.co2_saved_kg_yr,
i.region,
2024 - d.model_year AS device_age,
CASE
WHEN 2024 - d.model_year <= 3 THEN 'newer'
WHEN 2024 - d.model_year <= 6 THEN 'mid-age'
ELSE 'older'
END AS device_age_bucket
FROM
intel.device_data AS d
INNER JOIN intel.impact_data AS i ON d.device_id =
i.device_id
)
SELECT
device_type,
COUNT(*) AS total_devices,
AVG(energy_savings_yr) AS avg_energy_savings,
AVG(co2_saved_kg_yr) / 1000.0 AS avg_co2_saved_tons
FROM
device_impact
GROUP BY
device_type;

-- Objective: Returns the total number of devices, the average energy savings, and the average CO₂
-- emissions saved (in tons), now grouped by device_age_bucket.

WITH device_impact AS (
SELECT
d.device_id,
d.device_type,
d.model_year,
i.energy_savings_yr,
i.co2_saved_kg_yr,
i.region,
2024 - d.model_year AS device_age,
CASE
WHEN 2024 - d.model_year <= 3 THEN 'newer'
WHEN 2024 - d.model_year <= 6 THEN 'mid-age'
ELSE 'older'
END AS device_age_bucket
FROM
intel.device_data AS d
INNER JOIN intel.impact_data AS i ON d.device_id =
i.device_id
)
SELECT
device_age_bucket,
COUNT(*) AS total_devices,
AVG(energy_savings_yr) AS avg_energy_savings,
AVG(co2_saved_kg_yr) / 1000.0 AS avg_co2_saved_tons
FROM
device_impact
GROUP BY
device_age_bucket
ORDER BY
CASE
WHEN device_age_bucket = 'newer' THEN 1
WHEN device_age_bucket = 'mid-age' THEN 2
ELSE 3
END

-- Objective: Return the total number of devices, the average energy savings, and the average CO₂
-- emissions saved (in tons), now grouped by region.

WITH device_impact AS (
SELECT
d.device_id,
d.device_type,
d.model_year,
i.energy_savings_yr,
i.co2_saved_kg_yr,
i.region,
2024 - d.model_year AS device_age,
CASE
WHEN 2024 - d.model_year <= 3 THEN 'newer'
WHEN 2024 - d.model_year <= 6 THEN 'mid-age'
ELSE 'older'
END AS device_age_bucket
FROM
intel.device_data AS d
INNER JOIN intel.impact_data AS i ON d.device_id =
i.device_id
)
SELECT
region,
COUNT(*) AS total_devices,
AVG(energy_savings_yr) AS avg_energy_savings,
AVG(co2_saved_kg_yr) / 1000.0 AS avg_co2_saved_tons
FROM
device_impact
GROUP BY
region