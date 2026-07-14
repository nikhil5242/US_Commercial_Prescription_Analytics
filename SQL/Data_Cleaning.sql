-- ==========================================
-- 1. CREATE TABLE: prescribers_provider
-- ==========================================
CREATE TABLE commercial.prescribers_provider (
    "PRSCRBR_NPI" VARCHAR(20), -- ID kept as text to keep leading zeros
    "Prscrbr_Last_Org_Name" VARCHAR(255),
    "Prscrbr_First_Name" VARCHAR(255),
    "Prscrbr_MI" VARCHAR(5),
    "Prscrbr_Crdntls" VARCHAR(50),
    "Prscrbr_Ent_Cd" VARCHAR(5),
    "Prscrbr_St1" VARCHAR(255),
    "Prscrbr_St2" VARCHAR(255),
    "Prscrbr_City" VARCHAR(255),
    "Prscrbr_State_Abrvtn" VARCHAR(5),
    "Prscrbr_State_FIPS" VARCHAR(5),
    "Prscrbr_zip5" VARCHAR(10), -- ZIP kept as text to prevent dropping leading zeros
    "Prscrbr_RUCA" NUMERIC,
    "Prscrbr_RUCA_Desc" VARCHAR(255),
    "Prscrbr_Cntry" VARCHAR(50),
    "Prscrbr_Type" VARCHAR(255),
    "Prscrbr_Type_src" VARCHAR(10),
    "Tot_Clms" BIGINT,
    "Tot_30day_Fills" NUMERIC,
    "Tot_Drug_Cst" NUMERIC,
    "Tot_Day_Suply" BIGINT,
    "Tot_Benes" NUMERIC,
    "GE65_Sprsn_Flag" VARCHAR(5),
    "GE65_Tot_Clms" NUMERIC,
    "GE65_Tot_30day_Fills" NUMERIC,
    "GE65_Tot_Drug_Cst" NUMERIC,
    "GE65_Tot_Day_Suply" NUMERIC,
    "GE65_Bene_Sprsn_Flag" VARCHAR(5),
    "GE65_Tot_Benes" NUMERIC,
    "Brnd_Sprsn_Flag" VARCHAR(5),
    "Brnd_Tot_Clms" NUMERIC,
    "Brnd_Tot_Drug_Cst" NUMERIC,
    "Gnrc_Sprsn_Flag" VARCHAR(5),
    "Gnrc_Tot_Clms" NUMERIC,
    "Gnrc_Tot_Drug_Cst" NUMERIC,
    "Othr_Sprsn_Flag" VARCHAR(5),
    "Othr_Tot_Clms" NUMERIC,
    "Othr_Tot_Drug_Cst" NUMERIC,
    "MAPD_Sprsn_Flag" VARCHAR(5),
    "MAPD_Tot_Clms" NUMERIC,
    "MAPD_Tot_Drug_Cst" NUMERIC,
    "PDP_Sprsn_Flag" VARCHAR(5),
    "PDP_Tot_Clms" NUMERIC,
    "PDP_Tot_Drug_Cst" NUMERIC,
    "LIS_Sprsn_Flag" VARCHAR(5),
    "LIS_Tot_Clms" NUMERIC,
    "LIS_Drug_Cst" NUMERIC,
    "NonLIS_Sprsn_Flag" VARCHAR(5),
    "NonLIS_Tot_Clms" NUMERIC,
    "NonLIS_Drug_Cst" NUMERIC,
    "Opioid_Tot_Clms" NUMERIC,
    "Opioid_Tot_Drug_Cst" NUMERIC,
    "Opioid_Tot_Suply" NUMERIC,
    "Opioid_Tot_Benes" NUMERIC,
    "Opioid_Prscrbr_Rate" NUMERIC,
    "Opioid_LA_Tot_Clms" NUMERIC,
    "Opioid_LA_Tot_Drug_Cst" NUMERIC,
    "Opioid_LA_Tot_Suply" NUMERIC,
    "Opioid_LA_Tot_Benes" NUMERIC,
    "Opioid_LA_Prscrbr_Rate" NUMERIC,
    "Antbtc_Tot_Clms" NUMERIC,
    "Antbtc_Tot_Drug_Cst" NUMERIC,
    "Antbtc_Tot_Benes" NUMERIC,
    "Antpsyct_GE65_Sprsn_Flag" VARCHAR(5),
    "Antpsyct_GE65_Tot_Clms" NUMERIC,
    "Antpsyct_GE65_Tot_Drug_Cst" NUMERIC,
    "Antpsyct_GE65_Bene_Suprsn_Flag" VARCHAR(5),
    "Antpsyct_GE65_Tot_Benes" NUMERIC,
    "Bene_Avg_Age" NUMERIC,
    "Bene_Age_LT_65_Cnt" NUMERIC,
    "Bene_Age_65_74_Cnt" NUMERIC,
    "Bene_Age_75_84_Cnt" NUMERIC,
    "Bene_Age_GT_84_Cnt" NUMERIC,
    "Bene_Feml_Cnt" NUMERIC,
    "Bene_Male_Cnt" NUMERIC,
    "Bene_Race_Wht_Cnt" NUMERIC,
    "Bene_Race_Black_Cnt" NUMERIC,
    "Bene_Race_Api_Cnt" NUMERIC,
    "Bene_Race_Hspnc_Cnt" NUMERIC,
    "Bene_Race_Natind_Cnt" NUMERIC,
    "Bene_Race_Othr_Cnt" NUMERIC,
    "Bene_Dual_Cnt" NUMERIC,
    "Bene_Ndual_Cnt" NUMERIC,
    "Bene_Avg_Risk_Scre" NUMERIC
);

-- ==========================================
-- 2. CREATE TABLE: prescribers_geography
-- ==========================================
CREATE TABLE commercial.prescribers_geography (
    "Prscrbr_Geo_Lvl" VARCHAR(50),
    "Prscrbr_Geo_Cd" VARCHAR(20),
    "Prscrbr_Geo_Desc" VARCHAR(255),
    "Brnd_Name" VARCHAR(255),
    "Gnrc_Name" VARCHAR(255),
    "Tot_Prscrbrs" BIGINT,
    "Tot_Clms" BIGINT,
    "Tot_30day_Fills" NUMERIC,
    "Tot_Drug_Cst" NUMERIC,
    "Tot_Benes" NUMERIC,
    "GE65_Sprsn_Flag" VARCHAR(5),
    "GE65_Tot_Clms" NUMERIC,
    "GE65_Tot_30day_Fills" NUMERIC,
    "GE65_Tot_Drug_Cst" NUMERIC,
    "GE65_Bene_Sprsn_Flag" VARCHAR(5),
    "GE65_Tot_Benes" NUMERIC,
    "LIS_Bene_Cst_Shr" NUMERIC,
    "NonLIS_Bene_Cst_Shr" NUMERIC,
    "Opioid_Drug_Flag" VARCHAR(5),
    "Opioid_LA_Drug_Flag" VARCHAR(5),
    "Antbtc_Drug_Flag" VARCHAR(5),
    "Antpsyct_Drug_Flag" VARCHAR(5)
);

-- ==========================================
-- 3. CREATE TABLE: drug_spending
-- ==========================================
CREATE TABLE commercial.drug_spending (
    "Brnd_Name" VARCHAR(255),
    "Gnrc_Name" VARCHAR(255),
    "Tot_Mftr" BIGINT,
    "Mftr_Name" VARCHAR(255),
    "Tot_Spndng_2020" NUMERIC,
    "Tot_Dsg_Unts_2020" NUMERIC,
    "Tot_Clms_2020" NUMERIC,
    "Tot_Benes_2020" NUMERIC,
    "Avg_Spnd_Per_Dsg_Unt_Wghtd_2020" NUMERIC,
    "Avg_Spnd_Per_Clm_2020" NUMERIC,
    "Avg_Spnd_Per_Bene_2020" NUMERIC,
    "Outlier_Flag_2020" NUMERIC,
    "Tot_Spndng_2021" NUMERIC,
    "Tot_Dsg_Unts_2021" NUMERIC,
    "Tot_Clms_2021" NUMERIC,
    "Tot_Benes_2021" NUMERIC,
    "Avg_Spnd_Per_Dsg_Unt_Wghtd_2021" NUMERIC,
    "Avg_Spnd_Per_Clm_2021" NUMERIC,
    "Avg_Spnd_Per_Bene_2021" NUMERIC,
    "Outlier_Flag_2021" NUMERIC,
    "Tot_Spndng_2022" NUMERIC,
    "Tot_Dsg_Unts_2022" NUMERIC,
    "Tot_Clms_2022" NUMERIC,
    "Tot_Benes_2022" NUMERIC,
    "Avg_Spnd_Per_Dsg_Unt_Wghtd_2022" NUMERIC,
    "Avg_Spnd_Per_Clm_2022" NUMERIC,
    "Avg_Spnd_Per_Bene_2022" NUMERIC,
    "Outlier_Flag_2022" NUMERIC,
    "Tot_Spndng_2023" NUMERIC,
    "Tot_Dsg_Unts_2023" NUMERIC,
    "Tot_Clms_2023" NUMERIC,
    "Tot_Benes_2023" NUMERIC,
    "Avg_Spnd_Per_Dsg_Unt_Wghtd_2023" NUMERIC,
    "Avg_Spnd_Per_Clm_2023" NUMERIC,
    "Avg_Spnd_Per_Bene_2023" NUMERIC,
    "Outlier_Flag_2023" NUMERIC,
    "Tot_Spndng_2024" NUMERIC,
    "Tot_Dsg_Unts_2024" NUMERIC,
    "Tot_Clms_2024" BIGINT,
    "Tot_Benes_2024" NUMERIC,
    "Avg_Spnd_Per_Dsg_Unt_Wghtd_2024" NUMERIC,
    "Avg_Spnd_Per_Clm_2024" NUMERIC,
    "Avg_Spnd_Per_Bene_2024" NUMERIC,
    "Outlier_Flag_2024" BIGINT,
    "Chg_Avg_Spnd_Per_Dsg_Unt_23_24" NUMERIC,
    "CAGR_Avg_Spnd_Per_Dsg_Unt_20_24" NUMERIC
);

---------------------------------------------
--1st Updated the data type of some columns 
---------------------------------------------
ALTER TABLE commercial.prescribers_provider ALTER COLUMN "Prscrbr_Type_src" TYPE VARCHAR(255);
ALTER TABLE commercial.prescribers_provider ALTER COLUMN "Prscrbr_State_FIPS" TYPE VARCHAR(255);
ALTER TABLE commercial.prescribers_provider ALTER COLUMN "Prscrbr_zip5" TYPE VARCHAR(255);

----------------------------------------------------
--2nd Printed the count of rows in each dataset 
----------------------------------------------------
SELECT COUNT(*)
FROM commercial.prescribers_provider;

SELECT COUNT(*)
FROM commercial.prescribers_geography;

SELECT COUNT(*)
FROM commercial.drug_spending;

--------------------------------------------------------
--3rd Printed the first 20 rows from each dataset 
--------------------------------------------------------
SELECT *
FROM commercial.prescribers_provider
LIMIT 20;

SELECT *
FROM commercial.prescribers_geography
LIMIT 20;

SELECT *
FROM commercial.drug_spending
LIMIT 20;

-------------------------------------------
--4th Check for the duplicate values
-------------------------------------------
SELECT
    "PRSCRBR_NPI",
    COUNT(*) AS duplicate_count
FROM commercial.prescribers_provider
GROUP BY "PRSCRBR_NPI"
HAVING COUNT(*) > 1;
---------------------------------------------
SELECT
    "Prscrbr_Geo_Desc",
	"Prscrbr_Geo_Lvl",
    "Brnd_Name",
    "Gnrc_Name",
    COUNT(*)
FROM commercial.prescribers_geography
GROUP BY
    "Prscrbr_Geo_Desc",
	"Prscrbr_Geo_Lvl",
    "Brnd_Name",
    "Gnrc_Name"
HAVING COUNT(*) > 1;
---------------------------------------------
SELECT
    "Brnd_Name",
    "Gnrc_Name",
    "Mftr_Name",
    COUNT(*)
FROM commercial.drug_spending
GROUP BY
    "Brnd_Name",
    "Gnrc_Name",
    "Mftr_Name"
HAVING COUNT(*) > 1;


--------------------------------------------------------
--5th Checking for the NULL values in Providers Table 
--------------------------------------------------------
SELECT
COUNT(*) AS null_npi
FROM commercial.prescribers_provider
WHERE "PRSCRBR_NPI" IS NULL;
----------------------------------------

SELECT
COUNT(*) AS null_specialty
FROM commercial.prescribers_provider			--2 Null values
WHERE "Prscrbr_Type" IS NULL;

SELECT *
FROM commercial.prescribers_provider
WHERE "Prscrbr_Type" IS NULL;

DELETE FROM commercial.prescribers_provider
WHERE "Prscrbr_Type" IS NULL OR TRIM("Prscrbr_Type") = '';
----------------------------------------

SELECT
COUNT(*) AS null_state
FROM commercial.prescribers_provider
WHERE "Prscrbr_State_Abrvtn" IS NULL;
----------------------------------------

SELECT
COUNT(*) AS null_claims
FROM commercial.prescribers_provider
WHERE "Tot_Clms" IS NULL;
----------------------------------------

SELECT
COUNT(*) AS null_cost
FROM commercial.prescribers_provider
WHERE "Tot_Drug_Cst" IS NULL;
----------------------------------------

SELECT
COUNT(*) AS null_beneficiaries
FROM commercial.prescribers_provider		---1,45,511 Null vlaues
WHERE "Tot_Benes" IS NULL;

SELECT
    "PRSCRBR_NPI",
    "Tot_Drug_Cst",
    "Tot_Benes",
    CASE
        WHEN "Tot_Benes" IS NULL OR "Tot_Benes" = 0 THEN NULL
        ELSE "Tot_Drug_Cst" / "Tot_Benes"
    END AS "Avg_Cost_Per_Beneficiary"
FROM commercial.prescribers_provider;

------------------------------------------------------------------------------------
--6th Checking for the blank values because some dataset containes Blank Values
-------------------------------------------------------------------------------------
SELECT COUNT(*)
FROM commercial.prescribers_provider
WHERE TRIM("Prscrbr_Type")='';
----------------------------------------
SELECT COUNT(*)
FROM commercial.prescribers_provider
WHERE TRIM("Prscrbr_State_Abrvtn")='';
----------------------------------------

SELECT COUNT(*)
FROM commercial.prescribers_geography
WHERE TRIM("Prscrbr_Geo_Desc")='';
----------------------------------------

SELECT COUNT(*)
FROM commercial.prescribers_geography
WHERE TRIM("Brnd_Name")=''
---------------------------------------

SELECT COUNT(*)
FROM commercial.prescribers_geography
WHERE TRIM("Gnrc_Name")=''
--------------------------------------

SELECT COUNT(*)
FROM commercial.drug_spending
WHERE TRIM("Brnd_Name")=''
--------------------------------------

SELECT COUNT(*)
FROM commercial.drug_spending
WHERE TRIM("Gnrc_Name")=''
--------------------------------------

SELECT COUNT(*)
FROM commercial.drug_spending
WHERE TRIM("Mftr_Name")=''

-----------------------------------------------------------
--Check for the NULL Values For Dataset Geography
-----------------------------------------------------------

SELECT 
    COUNT(*) FILTER (WHERE "Prscrbr_Geo_Desc" IS NULL) AS null_geo_description,---NULL Value
    COUNT(*) FILTER (WHERE "Brnd_Name" IS NULL) AS null_brand,
    COUNT(*) FILTER (WHERE "Gnrc_Name" IS NULL) AS null_generic,
    COUNT(*) FILTER (WHERE "Tot_Clms" IS NULL) AS null_claims,
    COUNT(*) FILTER (WHERE "Tot_Drug_Cst" IS NULL) AS null_cost,
    COUNT(*) FILTER (WHERE "Tot_Prscrbrs" IS NULL) AS null_prescribers
FROM commercial.prescribers_geography;

DELETE FROM commercial.prescribers_geography
WHERE "Prscrbr_Geo_Desc" IS NULL OR TRIM("Prscrbr_Geo_Desc") = '';


SELECT 
    COUNT(*) FILTER (WHERE "Prscrbr_Geo_Desc" IS NULL) AS null_geo_description
FROM commercial.prescribers_geography;

-----------------------------------------------------------
--Check for the NULL Values For Dataset Spending
-----------------------------------------------------------

SELECT 
    COUNT(*) FILTER (WHERE "Brnd_Name" IS NULL) AS null_brand,
    COUNT(*) FILTER (WHERE "Gnrc_Name" IS NULL) AS null_generic,
    COUNT(*) FILTER (WHERE "Mftr_Name" IS NULL) AS null_manufacturer,
    COUNT(*) FILTER (WHERE "Tot_Spndng_2024" IS NULL) AS null_spending_2024,
    COUNT(*) FILTER (WHERE "Tot_Clms_2024" IS NULL) AS null_claims_2024,
    COUNT(*) FILTER (WHERE "Tot_Benes_2024" IS NULL) AS null_beneficiaries_2024------NULL Values
FROM commercial.drug_spending;

SELECT
    "Brnd_Name",
    "Gnrc_Name",
    "Tot_Spndng_2024",
    "Tot_Benes_2024",
    CASE
        WHEN "Tot_Benes_2024" IS NULL OR "Tot_Benes_2024" = 0 THEN NULL
        ELSE "Tot_Spndng_2024" / "Tot_Benes_2024"
    END AS "Avg_Spending_Per_Beneficiary_2024"
FROM commercial.drug_spending
LIMIT 20;

---------------------------------------------------------------------------
--7th Checking for the Invalid number values 
---------------------------------------------------------------------------
--for Provider
SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Clms" < 0;

SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Drug_Cst" < 0;

SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Benes" < 0;
--------------------------------------
--For Geography
SELECT 'Negative Claims' AS issue_type, * FROM commercial.prescribers_geography 
WHERE "Tot_Clms" < 0
UNION ALL
SELECT 'Negative Costs' AS issue_type, * FROM commercial.prescribers_geography 
WHERE "Tot_Drug_Cst" < 0
UNION ALL
SELECT 'Negative Prescribers' AS issue_type, * FROM commercial.prescribers_geography 
WHERE "Tot_Prscrbrs" < 0;
----------------------------------------
--For Spending 

SELECT 'Negative Spending 2024' AS issue_type, * FROM commercial.drug_spending 
WHERE "Tot_Spndng_2024" < 0
UNION ALL
SELECT 'Negative Claims 2024' AS issue_type, * FROM commercial.drug_spending 
WHERE "Tot_Clms_2024" < 0
UNION ALL
SELECT 'Negative Beneficiaries 2024' AS issue_type, * FROM commercial.drug_spending 
WHERE "Tot_Benes_2024" < 0;

-----------------------------------------------------------
--8th Checking for the Distinct Categories 
-----------------------------------------------------------
SELECT DISTINCT "Prscrbr_State_Abrvtn"
FROM commercial.prescribers_provider
ORDER BY 1;

SELECT DISTINCT "Prscrbr_Type"
FROM commercial.prescribers_provider
ORDER BY 1;

SELECT DISTINCT "Mftr_Name"
FROM commercial.drug_spending
ORDER BY 1;

-----------------------------------------------------
--9th Checking numeric ranges 
------------------------------------------------------
--providers
SELECT
MIN("Tot_Clms") AS min_claims,
MAX("Tot_Clms") AS max_claims,
MIN("Tot_Drug_Cst") AS min_cost,
MAX("Tot_Drug_Cst") AS max_cost,
MIN("Tot_Benes") AS min_beneficiaries,
MAX("Tot_Benes") AS max_beneficiaries
FROM commercial.prescribers_provider;

--Geography
SELECT
MIN("Tot_Clms"),
MAX("Tot_Clms"),
MIN("Tot_Drug_Cst"),
MAX("Tot_Drug_Cst")
FROM commercial.prescribers_geography;

--Spending
SELECT
MIN("Tot_Spndng_2024"),
MAX("Tot_Spndng_2024"),
MIN("Tot_Clms_2024"),
MAX("Tot_Clms_2024")
FROM commercial.drug_spending;

--Checking the State Codes
SELECT DISTINCT "Prscrbr_State_Abrvtn"
FROM commercial.prescribers_provider
ORDER BY 1;

---------------------------------------------------
--10th Removing the trailing spaces --For Providers Dataset
---------------------------------------------------

UPDATE commercial.prescribers_provider
SET
"Prscrbr_Last_Org_Name" = TRIM("Prscrbr_Last_Org_Name"),
"Prscrbr_First_Name" = TRIM("Prscrbr_First_Name"),
"Prscrbr_City" = TRIM("Prscrbr_City"),
"Prscrbr_State_Abrvtn" = TRIM("Prscrbr_State_Abrvtn"),
"Prscrbr_Type" = TRIM("Prscrbr_Type");

---------------------------------------------------
--11th Standardize text
---------------------------------------------------

UPDATE commercial.prescribers_provider
SET
"Prscrbr_Last_Org_Name" = INITCAP("Prscrbr_Last_Org_Name"),
"Prscrbr_First_Name" = INITCAP("Prscrbr_First_Name"),
"Prscrbr_City" = INITCAP("Prscrbr_City"),
"Prscrbr_Type" = INITCAP("Prscrbr_Type");

---------------------------------------------------
--12th Converting the  State Code to Uppercase
---------------------------------------------------

UPDATE commercial.prescribers_provider
SET "Prscrbr_State_Abrvtn" =
UPPER("Prscrbr_State_Abrvtn");

---------------------------------------------------
--13th Validating the NPI Length
---------------------------------------------------

SELECT *
FROM commercial.prescribers_provider
WHERE LENGTH("PRSCRBR_NPI") <> 10;

---------------------------------------------------
--14th Checking the impossible beneficiary counts
---------------------------------------------------

SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Benes" > "Tot_Clms";

---------------------------------------------------
--15th Checking the impossible day supply
---------------------------------------------------

SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Day_Suply" < "Tot_Clms";

---------------------------------------------------
--16th Removing the trailing spaces  --For Geography
---------------------------------------------------

UPDATE commercial.prescribers_geography
SET
"Prscrbr_Geo_Desc"=TRIM("Prscrbr_Geo_Desc"),
"Brnd_Name"=TRIM("Brnd_Name"),
"Gnrc_Name"=TRIM("Gnrc_Name");

---------------------------------------------------
--17th Standardize text
---------------------------------------------------

UPDATE commercial.prescribers_geography
SET
"Prscrbr_Geo_Desc"=INITCAP("Prscrbr_Geo_Desc"),
"Brnd_Name"=INITCAP("Brnd_Name"),
"Gnrc_Name"=INITCAP("Gnrc_Name");

SELECT DISTINCT "Prscrbr_Geo_Lvl"
FROM commercial.prescribers_geography;

---------------------------------------------------
--18th Finding whether Beneficiaries exceed claims
---------------------------------------------------

SELECT *
FROM commercial.prescribers_geography
WHERE "Tot_Benes" > "Tot_Clms";

-------------------------------------------------------------
--19th Removing the trailing spaces  --For Spending Dataset
-------------------------------------------------------------

UPDATE commercial.drug_spending
SET
"Brnd_Name"=TRIM("Brnd_Name"),
"Gnrc_Name"=TRIM("Gnrc_Name"),
"Mftr_Name"=TRIM("Mftr_Name");


---------------------------------------------------
--20 Standardize text
---------------------------------------------------

UPDATE commercial.drug_spending
SET
"Brnd_Name"=INITCAP("Brnd_Name"),
"Gnrc_Name"=INITCAP("Gnrc_Name"),
"Mftr_Name"=INITCAP("Mftr_Name");

---------------------------------------------------
--20 To Check Whether Spending Exists if claims are zero because 
--(Spending cannot exist if claims are zero)
---------------------------------------------------

SELECT *
FROM commercial.drug_spending
WHERE "Tot_Clms_2024"=0
AND "Tot_Spndng_2024">0;

---------------------------------------------------
--21 To Check Whether Beneficiaries exceeds claims because 
--(Beneficiaries cannot exceed claims)
---------------------------------------------------

SELECT *
FROM commercial.drug_spending
WHERE "Tot_Benes_2024" >
"Tot_Clms_2024";

---------------------------------------------------
--22 To check the CAGR
---------------------------------------------------

SELECT *
FROM commercial.drug_spending
WHERE "CAGR_Avg_Spnd_Per_Dsg_Unt_20_24" IS NULL;








