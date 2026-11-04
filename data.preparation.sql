-- Intel Sustainability Impact Analysis
-- Part 1: Organizing and Understanding the Data

-- Objective: Join device information with environmental impact data.

SELECT
*
FROM
intel.device_data AS d
INNER JOIN intel.impact_data AS i ON d.device_id =
i.device_id

-- Objective: Add a new column called device_age calculated by subtracting the model_year from 2024. 

SELECT
*,
2024 - model_year AS device_age
FROM
intel.device_data AS d
INNER JOIN intel.impact_data AS i ON d.device_id =
i.device_id

-- Objective: Order data by model_year (oldest to newest).

SELECT
*,
2024 - model_year AS device_age
FROM
intel.device_data AS d
INNER JOIN intel.impact_data AS i ON d.device_id =
i.device_id
ORDER BY d.model_year ASC

-- Objective: Bucket the device_age, adding a device_age_bucket column to the data, as follows:

-- WHEN the device_age is less than or equalto 3, device_age_bucket should be “newer”
-- WHEN the device_age is greater than 3 but less than or equalto 6, device_age_bucket should be “mid-age”
-- WHEN the device_age is greater than 6, device_age_bucket should be “older”

SELECT
*,
2024 - model_year AS device_age,
CASE
WHEN 2024 - d.model_year <= 3 THEN 'newer'
WHEN 2024 - d.model_year <= 6 THEN 'mid-age'
ELSE 'older'
END AS device_age_bucket
FROM
intel.device_data AS d
INNER JOIN intel.impact_data AS i ON d.device_id =
i.device_id
ORDER BY d.model_year ASC


