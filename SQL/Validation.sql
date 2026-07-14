/*==========================================================
DATASET 1 : PROVIDER
==========================================================*/

------------------------------------------------------------
-- Rule 1 : NPI should be exactly 10 digits
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_provider
WHERE LENGTH("PRSCRBR_NPI") <> 10;


------------------------------------------------------------
-- Rule 2 : Claims cannot be negative
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Clms" < 0;


------------------------------------------------------------
-- Rule 3 : Drug Cost cannot be negative
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Drug_Cst" < 0;


------------------------------------------------------------
-- Rule 4 : Beneficiaries cannot be negative
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Benes" < 0;


------------------------------------------------------------
-- Rule 5 : Beneficiaries cannot exceed claims
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Benes" > "Tot_Clms";


------------------------------------------------------------
-- Rule 6 : Day Supply should not be less than Claims
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Day_Suply" < "Tot_Clms";


------------------------------------------------------------
-- Rule 7 : Cost should not exist if Claims are zero
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Clms" = 0
AND "Tot_Drug_Cst" > 0;


------------------------------------------------------------
-- Rule 8 : Beneficiaries should not exist if Claims are zero
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_provider
WHERE "Tot_Clms" = 0
AND "Tot_Benes" > 0;




/*==========================================================
DATASET 2 : GEOGRAPHY
==========================================================*/


------------------------------------------------------------
-- Rule 1 : Claims cannot be negative
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_geography
WHERE "Tot_Clms" < 0;


------------------------------------------------------------
-- Rule 2 : Drug Cost cannot be negative
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_geography
WHERE "Tot_Drug_Cst" < 0;


------------------------------------------------------------
-- Rule 3 : Prescribers cannot be negative
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_geography
WHERE "Tot_Prscrbrs" < 0;


------------------------------------------------------------
-- Rule 4 : Beneficiaries cannot exceed Claims
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_geography
WHERE "Tot_Benes" > "Tot_Clms";


------------------------------------------------------------
-- Rule 5 : Drug Cost should not exist if Claims are zero
------------------------------------------------------------
SELECT *
FROM commercial.prescribers_geography
WHERE "Tot_Clms" = 0
AND "Tot_Drug_Cst" > 0;


------------------------------------------------------------
-- Rule 6 : Geography Level should contain only valid values
------------------------------------------------------------
SELECT DISTINCT "Prscrbr_Geo_Lvl"
FROM commercial.prescribers_geography;


/*==========================================================
DATASET 3 : DRUG SPENDING
==========================================================*/

------------------------------------------------------------
-- Rule 1 : Spending cannot be negative
------------------------------------------------------------
SELECT *
FROM commercial.drug_spending
WHERE "Tot_Spndng_2024" < 0;


------------------------------------------------------------
-- Rule 2 : Claims cannot be negative
------------------------------------------------------------
SELECT *
FROM commercial.drug_spending
WHERE "Tot_Clms_2024" < 0;


------------------------------------------------------------
-- Rule 3 : Beneficiaries cannot be negative
------------------------------------------------------------
SELECT *
FROM commercial.drug_spending
WHERE "Tot_Benes_2024" < 0;


------------------------------------------------------------
-- Rule 4 : Beneficiaries cannot exceed Claims
------------------------------------------------------------
SELECT *
FROM commercial.drug_spending
WHERE "Tot_Benes_2024" > "Tot_Clms_2024";


------------------------------------------------------------
-- Rule 5 : Spending should not exist if Claims are zero
------------------------------------------------------------
SELECT *
FROM commercial.drug_spending
WHERE "Tot_Clms_2024" = 0
AND "Tot_Spndng_2024" > 0;


------------------------------------------------------------
-- Rule 6 : Manufacturer should not be NULL
------------------------------------------------------------
SELECT *
FROM commercial.drug_spending
WHERE "Mftr_Name" IS NULL;


------------------------------------------------------------
-- Rule 7 : Brand Name should not be NULL
------------------------------------------------------------
SELECT *
FROM commercial.drug_spending
WHERE "Brnd_Name" IS NULL;


------------------------------------------------------------
-- Rule 8 : Generic Name should not be NULL
------------------------------------------------------------
SELECT *
FROM commercial.drug_spending
WHERE "Gnrc_Name" IS NULL;


------------------------------------------------------------
-- Rule 9 : Check CAGR values
------------------------------------------------------------
SELECT *
FROM commercial.drug_spending
WHERE "CAGR_Avg_Spnd_Per_Dsg_Unt_20_24" IS NULL;