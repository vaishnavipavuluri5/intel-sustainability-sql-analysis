# intel-sustainability-sql-analysis

**Project Overview**

This project analyzes simulated Intel device repurposing data to evaluate the potential environmental impact of extending device lifespans.

Using SQL, I investigated estimated energy savings and CO_2 emissions reductions across different device types, ages, and geographical regions.

Objective: Identify opportunities to optimize deviced repurposing strategies and maximize environmental benefits. 

Context: I completed this project as part of the Global Career Accelerator's Coding for Data program. The dataset is simulated for educational purposes.

**Tools & Technical Skills**

Language: SQL
Data Preparation: INNER JOIN, Common Table Expressions (CTEs)
Data Analysis: COUNT, AVG, SUM, GROUP BY, ORDER BY
Conditional Logic: CASE WHEN
Further SQL: Window functions, PARTITION BY
Analytical Skills: Sustainability analysis, data interpretation, data-driven reccomendations

**Dataset Overview**

The project uses two related tables:

intel.device_data: Device identifiers, device types, and manufacturing years

intel.impact_data: Estimated energy savings, CO_2 reductions, and regional information

The data was accessed through a SQL environment provided by Global Career Accelerator and is not included in this repository.

**Key Findings**

Devices analyzed: 601,740

Average device age: 3.52 years

Average annual energy savings per device: 25.74 kWh

Estimated total annual energy savings: 15.49 million kWh

Estimated annual CO₂ reductions: 6,768.42 metric tons

**Device Age Analysis**

Newer devices (0–3 years): 317,191 devices, averaging 19.07 kWh saved per device annually.

Mid-age devices (4–6 years): 264,310 devices, averaging 32.04 kWh saved per device annually.

Older devices (7+ years): 20,239 devices, averaging 48.02 kWh saved per device annually.

Although newer devices accounted for the largest portion of repurposed devices, older devices provided the highest average estimated energy savings per device.

**Device Type and Regional Analysis**

Laptops contributed the largest share of estimated energy savings and CO₂ reductions across all three regions.

Asia had the highest average estimated CO₂ savings per repurposed device.

North America contributed the highest total estimated CO₂ savings due to its larger number of repurposed devices.

**Recommendations**

Based on these findings, I recommend prioritizing opportunities to repurpose more mid-age and older devices that remain functional.

Older devices demonstrate higher estimated energy savings per device, while mid-age devices provide a balance between environmental benefits and greater availability.

Future analysis could incorporate repair, transportation, and maintenance costs to evaluate the environmental benefits achieved per dollar spent.

**Repository Contents**

The sql/ folder contains SQL queries covering data preparation, overall sustainability impact, device age trends, and regional analysis.

The findings.md file provides a more detailed analysis of the results and business recommendations.

**Limitations**

This project uses simulated educational data rather than Intel's actual operational data. The reported environmental impacts are estimates. The original datasets are not publicly available, so the SQL queries cannot be reproduced without access to the program's data environment.