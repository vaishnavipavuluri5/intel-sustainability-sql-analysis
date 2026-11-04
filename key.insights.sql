-- Intel Sustainability Impact Analysis
-- Part 2: Key Insights

-- Objective: Return the total number of devices repurposed,the average age of repurposed devices in 2024,
-- the average estimated energy savings (kWh) from repurposed devices per year, and the total CO₂ emission
-- saved (in tons) from repurposed devices. Report the total CO₂ emissions saved in tons.

WITH device_impact AS (
SELECT
d.*,
i.energy_savings_yr,
i.co2_saved_kg_yr,
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
COUNT(*) AS total_devices,
AVG(device_age) AS avg_device_age,
AVG(energy_savings_yr) AS avg_energy_savings,
SUM(co2_saved_kg_yr) / 1000.0 AS total_co2_saved_tons
FROM
device_impact
