DROP TABLE IF EXISTS commercial.provider_features;

CREATE TABLE commercial.provider_features AS

SELECT
    *,

    ROUND(
        "Tot_Drug_Cst" /
        NULLIF("Tot_Clms",0),
        2
    ) AS Cost_Per_Claim,

    ROUND(
        "Tot_Drug_Cst" /
        NULLIF("Tot_Benes",0),
        2
    ) AS Avg_Cost_Per_Beneficiary

FROM commercial.prescribers_provider;


-----------------------------------------------------------------------------



ALTER TABLE commercial.provider_features
ADD COLUMN High_Value_Prescriber VARCHAR(10);

WITH ranked AS
(
SELECT
    "PRSCRBR_NPI",
    NTILE(10) OVER
    (
        ORDER BY "Tot_Drug_Cst" DESC
    ) AS decile
FROM commercial.provider_features
)

UPDATE commercial.provider_features p

SET High_Value_Prescriber='Yes'

FROM ranked r

WHERE

p."PRSCRBR_NPI"=r."PRSCRBR_NPI"

AND r.decile=1;

UPDATE commercial.provider_features

SET High_Value_Prescriber='No'

WHERE High_Value_Prescriber IS NULL;
---------------------------------------------------


ALTER TABLE commercial.provider_features

ADD COLUMN Prescriber_Decile INTEGER;

WITH ranked AS
(
SELECT
"PRSCRBR_NPI",

NTILE(10) OVER
(
ORDER BY "Tot_Drug_Cst" DESC
)

AS decile

FROM commercial.provider_features
)

UPDATE commercial.provider_features p

SET Prescriber_Decile=r.decile

FROM ranked r

WHERE

p."PRSCRBR_NPI"=r."PRSCRBR_NPI";
--------------------------------------------------------------------------------


ALTER TABLE commercial.provider_features

ADD COLUMN High_Prescription_Flag VARCHAR(10);

WITH ranked AS
(
SELECT

"PRSCRBR_NPI",

NTILE(5)

OVER

(
ORDER BY "Tot_Clms" DESC
)

AS bucket

FROM commercial.provider_features

)

UPDATE commercial.provider_features p

SET High_Prescription_Flag='Yes'

FROM ranked r

WHERE

p."PRSCRBR_NPI"=r."PRSCRBR_NPI"

AND bucket=1;

UPDATE commercial.provider_features

SET High_Prescription_Flag='No'

WHERE High_Prescription_Flag IS NULL;

--====================================================
-- DATASET 1 : provider_features
-- Adding Remaining Business Feature Columns
--====================================================
-- Add the columns
ALTER TABLE commercial.provider_features
ADD COLUMN Drug_Cost_Category VARCHAR(20),
ADD COLUMN Prescription_Category VARCHAR(20),
ADD COLUMN Specialty_Group VARCHAR(50);

-- Populate all three columns in a single UPDATE
UPDATE commercial.provider_features
SET

Drug_Cost_Category =
CASE
    WHEN "Tot_Drug_Cst" < 10000 THEN 'Low'
    WHEN "Tot_Drug_Cst" < 100000 THEN 'Medium'
    ELSE 'High'
END,

Prescription_Category =
CASE
    WHEN "Tot_Clms" < 100 THEN 'Low'
    WHEN "Tot_Clms" < 1000 THEN 'Medium'
    ELSE 'High'
END,

Specialty_Group =
CASE
    WHEN "Prscrbr_Type" ILIKE '%Internal%' THEN 'Internal Medicine'
    WHEN "Prscrbr_Type" ILIKE '%Family%' THEN 'Family Medicine'
    WHEN "Prscrbr_Type" ILIKE '%Cardio%' THEN 'Cardiology'
    WHEN "Prscrbr_Type" ILIKE '%Nurse%' THEN 'Nurse Practitioner'
    WHEN "Prscrbr_Type" ILIKE '%Psych%' THEN 'Psychiatry'
    WHEN "Prscrbr_Type" ILIKE '%Pediatric%' THEN 'Pediatrics'
    WHEN "Prscrbr_Type" ILIKE '%Emergency%' THEN 'Emergency Medicine'
    WHEN "Prscrbr_Type" ILIKE '%Orthopedic%' THEN 'Orthopedics'
    WHEN "Prscrbr_Type" ILIKE '%Dermat%' THEN 'Dermatology'
    WHEN "Prscrbr_Type" ILIKE '%Oncology%' THEN 'Oncology'
    ELSE 'Other'
END;

--====================================================
-- DATASET 2 : geography_features
-- Adding  Business Feature Columns
--====================================================

DROP TABLE IF EXISTS commercial.geography_features;

CREATE TABLE commercial.geography_features AS

SELECT
    *,

    ROUND(
        "Tot_Drug_Cst" / NULLIF("Tot_Clms",0),
        2
    ) AS Cost_Per_Claim,

    ROUND(
        "Tot_Drug_Cst" / NULLIF("Tot_Benes",0),
        2
    ) AS Avg_Cost_Per_Beneficiary,

    CASE
        WHEN "Tot_Drug_Cst" < 100000 THEN 'Low'
        WHEN "Tot_Drug_Cst" < 1000000 THEN 'Medium'
        ELSE 'High'
    END AS Drug_Cost_Category,

    CASE
        WHEN "Tot_Clms" < 500 THEN 'Low'
        WHEN "Tot_Clms" < 5000 THEN 'Medium'
        ELSE 'High'
    END AS Prescription_Category,

    CASE
        WHEN "Prscrbr_Geo_Lvl" = 'State' THEN 'State'
        WHEN "Prscrbr_Geo_Lvl" = 'National' THEN 'National'
        ELSE 'Other'
    END AS Geography_Type

FROM commercial.prescribers_geography;


--====================================================
-- DATASET 3 : spending_features
-- Adding  Business Feature Columns
--====================================================

DROP TABLE IF EXISTS commercial.spending_features;

CREATE TABLE commercial.spending_features AS

SELECT
    *,

    CASE
        WHEN "Tot_Spndng_2024" < 1000000 THEN 'Low'
        WHEN "Tot_Spndng_2024" < 10000000 THEN 'Medium'
        ELSE 'High'
    END AS Spending_Category,

    CASE
        WHEN "Tot_Clms_2024" < 1000 THEN 'Low'
        WHEN "Tot_Clms_2024" < 10000 THEN 'Medium'
        ELSE 'High'
    END AS Claim_Category,

    ROUND(
        "Tot_Spndng_2024" / NULLIF("Tot_Clms_2024",0),
        2
    ) AS Cost_Per_Claim_2024,

    ROUND(
        "Tot_Spndng_2024" / NULLIF("Tot_Benes_2024",0),
        2
    ) AS Cost_Per_Beneficiary_2024

FROM commercial.drug_spending;



----------------------------------------------------
-- Dataset 3 : Market Share %
----------------------------------------------------

ALTER TABLE commercial.spending_features
ADD COLUMN Market_Share_Pct NUMERIC(10,2);

WITH total_spending AS
(
    SELECT SUM("Tot_Spndng_2024") AS total_spending
    FROM commercial.spending_features
)

UPDATE commercial.spending_features s
SET Market_Share_Pct =
ROUND(
    ("Tot_Spndng_2024" / t.total_spending) * 100,
    2
)
FROM total_spending t;

----------------------------------------------------
-- Dataset 3 : Spending Growth Flag
----------------------------------------------------

ALTER TABLE commercial.spending_features
ADD COLUMN Spending_Growth_Flag VARCHAR(20);

UPDATE commercial.spending_features
SET Spending_Growth_Flag =
CASE
    WHEN "Chg_Avg_Spnd_Per_Dsg_Unt_23_24" > 0 THEN 'Growing'
    WHEN "Chg_Avg_Spnd_Per_Dsg_Unt_23_24" < 0 THEN 'Declining'
    ELSE 'Stable'
END;


----------------------------------------------------
-- Dataset 3 : High Cost Drug Flag
----------------------------------------------------

ALTER TABLE commercial.spending_features
ADD COLUMN High_Cost_Drug_Flag VARCHAR(5);

WITH ranked AS
(
    SELECT
        "Brnd_Name",
        NTILE(5) OVER
        (
            ORDER BY "Tot_Spndng_2024" DESC
        ) AS bucket
    FROM commercial.spending_features
)

UPDATE commercial.spending_features s
SET High_Cost_Drug_Flag = 'Yes'
FROM ranked r
WHERE s."Brnd_Name" = r."Brnd_Name"
AND r.bucket = 1;

UPDATE commercial.spending_features
SET High_Cost_Drug_Flag = 'No'
WHERE High_Cost_Drug_Flag IS NULL;


----------------------------------------------------
-- Dataset 2 : High Prescription Area
----------------------------------------------------

ALTER TABLE commercial.geography_features
ADD COLUMN High_Prescription_Area VARCHAR(5);

WITH ranked AS
(
    SELECT
        "Prscrbr_Geo_Desc",
        NTILE(5) OVER
        (
            ORDER BY "Tot_Clms" DESC
        ) AS bucket
    FROM commercial.geography_features
)

UPDATE commercial.geography_features g
SET High_Prescription_Area = 'Yes'
FROM ranked r
WHERE g."Prscrbr_Geo_Desc" = r."Prscrbr_Geo_Desc"
AND r.bucket = 1;

UPDATE commercial.geography_features
SET High_Prescription_Area = 'No'
WHERE High_Prescription_Area IS NULL;


-------------------------------------------------

ALTER TABLE commercial.provider_features
ADD COLUMN High_Cost_Prescriber_Flag VARCHAR(10);

UPDATE commercial.provider_features
SET High_Cost_Prescriber_Flag =
CASE
    WHEN "Tot_Drug_Cst" >= 100000 THEN 'Yes'
    ELSE 'No'
END;
-------------------------------------------------

ALTER TABLE commercial.spending_features
ADD COLUMN Market_Share_Percentage NUMERIC;

UPDATE commercial.spending_features
SET Market_Share_Percentage =
ROUND(
    ("Tot_Spndng_2024" * 100.0) /
    (
        SELECT SUM("Tot_Spndng_2024")
        FROM commercial.spending_features
    ),
2);


ALTER TABLE commercial.geography_features
ADD COLUMN State_Spending_Tier VARCHAR(20);

UPDATE commercial.geography_features
SET State_Spending_Tier =
CASE
    WHEN "Tot_Drug_Cst" < 100000 THEN 'Low'
    WHEN "Tot_Drug_Cst" < 1000000 THEN 'Medium'
    ELSE 'High'
END;
