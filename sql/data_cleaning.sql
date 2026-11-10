SELECT * FROM telco_churn_clean;

/* Create clean table with standarize the column name */

CREATE TABLE telco_churn_clean AS 
SELECT 
	"customer_id" AS customer_id,
	"gender" AS gender,
	"SeniorCitizen" AS senior_citizen,
	"Partner" AS partner,
	"Dependents" AS dependents,
	"tenure" AS tenure,
	"PhoneService" AS phone_service,
	"MultipleLines" AS multiple_lines,
	"InternetService" AS internet_service,
	"OnlineSecurity" AS online_security,
	"OnlineBackup" AS online_backup,
	"DeviceProtection" AS device_protection,
	"TechSupport" AS tech_support,
	"StreamingTV" AS streaming_TV,
	"StreamingMovies" AS streaming_movies,
	"Contract" AS contract,
	"PaperlessBilling" AS paperless_billing,
	"PaymentMethod" AS payment_method,
	"MonthlyCharges" AS monthly_charges,
	"TotalCharges" AS total_charges,
	"Churn" AS churn
FROM telco_customer_churn;

SELECT COUNT(*) total_count FROM telco_churn_clean;
SELECT * FROM telco_churn_clean;



/* Convert the data types */

/* Check the current data types */
SELECT 
	column_name,
	data_type
FROM information_schema.columns
WHERE table_name = 'telco_churn_clean'
ORDER BY ordinal_position;



/* Check blank and invalid values in total_charges */
SELECT
    COUNT(*) FILTER (
        WHERE total_charges IS NULL
    ) AS null_values,

    COUNT(*) FILTER (
        WHERE TRIM(total_charges) = ''
    ) AS blank_values,

    COUNT(*) FILTER (
        WHERE TRIM(total_charges) <> ''
        AND total_charges !~ '^[0-9]+(\.[0-9]+)?$'
    ) AS invalid_values

FROM telco_churn_clean;


/* Convert datatype of total_charges (text -> numeric) */

ALTER TABLE telco_churn_clean
ALTER COLUMN total_charges
TYPE NUMERIC(12, 2)
USING NULLIF(TRIM(total_charges), '')::NUMERIC(12, 2);


/* Check total_charges data type */
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'telco_churn_clean'
AND column_name = 'total_charges';


/* Check missing values in all column */

SELECT 
	COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_missing,
	COUNT(*) FILTER (WHERE gender IS NULL) AS gender_missing,
	COUNT(*) FILTER (WHERE senior_citizen IS NULL) AS senior_citizen_missing,
	COUNT(*) FILTER (WHERE partner IS NULL) AS partner_missing,
	COUNT(*) FILTER (WHERE dependents IS NULL) AS dependents_missing,
	COUNT(*) FILTER (WHERE tenure IS NULL) AS tenure_missing,
	COUNT(*) FILTER (WHERE phone_service IS NULL) AS phone_service_missing,
	COUNT(*) FILTER (WHERE multiple_lines IS NULL) AS multiple_lines_missing,
	COUNT(*) FILTER (WHERE internet_service IS NULL) AS internet_service_missing,
	COUNT(*) FILTER (WHERE online_security IS NULL) AS online_security_missing,
	COUNT(*) FILTER (WHERE online_backup IS NULL) AS online_backup_missing,
	COUNT(*) FILTER (WHERE device_protection IS NULL) AS device_protection_missing,
	COUNT(*) FILTER (WHERE tech_support IS NULL) AS tech_support_missing,
	COUNT(*) FILTER (WHERE streaming_tv IS NULL) AS streaming_tv_missing,
	COUNT(*) FILTER (WHERE streaming_movies IS NULL) AS streaming_movies_missing,
	COUNT(*) FILTER (WHERE contract IS NULL) AS contract_missing,
	COUNT(*) FILTER (WHERE paperless_billing IS NULL) AS paperless_billing_missing,
	COUNT(*) FILTER (WHERE payment_method IS NULL) AS payment_method_missing,
	COUNT(*) FILTER (WHERE monthly_charges IS NULL) AS monthly_charges_missing,
	COUNT(*) FILTER (WHERE total_charges IS NULL) AS total_charges_missing,
	COUNT(*) FILTER (WHERE churn IS NULL) AS churn_missing
FROM telco_churn_clean;


/* Check for duplicate customers */

SELECT customer_id,
	COUNT(*) AS duplicate_count
FROM telco_churn_clean
GROUP BY customer_id
HAVING COUNT(*) > 1;


/* Check invalid values in numeric columns */

SELECT
	COUNT(*) FILTER (WHERE tenure < 0) AS invalid_tenure,
	COUNT(*) FILTER (WHERE monthly_charges < 0) AS invalid_monthly_charges,
	COUNT(*) FILTER (WHERE total_charges < 0) AS invalid_total_charges
FROM telco_churn_clean;


/* Check categorial values */


SELECT 'gender' AS column_name, gender AS category, COUNT(*) AS customer_count
FROM telco_churn_clean
GROUP BY gender

UNION ALL

SELECT 'partner', partner, COUNT(*) 
FROM telco_churn_clean
GROUP BY partner

UNION ALL

SELECT 'dependents', dependents, COUNT(*) 
FROM telco_churn_clean
GROUP BY dependents

UNION ALL

SELECT 'phone_service', phone_service, COUNT(*) 
FROM telco_churn_clean
GROUP BY phone_service

UNION ALL

SELECT 'multiple_lines', multiple_lines,  COUNT(*) 
FROM telco_churn_clean
GROUP BY multiple_lines

UNION ALL

SELECT 'internet_service', internet_service, COUNT(*) 
FROM telco_churn_clean
GROUP BY internet_service

UNION ALL

SELECT 'online_security', online_security, COUNT(*) 
FROM telco_churn_clean
GROUP BY online_security

UNION ALL

SELECT 'online_backup', online_backup, COUNT(*) 
FROM telco_churn_clean
GROUP BY online_backup

UNION ALL

SELECT 'device_protection', device_protection, COUNT(*) 
FROM telco_churn_clean
GROUP BY device_protection

UNION ALL

SELECT 'tech_support', tech_support, COUNT(*) 
FROM telco_churn_clean
GROUP BY tech_support

UNION ALL

SELECT 'streaming_tv', streaming_tv, COUNT(*) 
FROM telco_churn_clean
GROUP BY streaming_tv

UNION ALL

SELECT 'streaming_movies', streaming_movies, COUNT(*) AS customer_count
FROM telco_churn_clean
GROUP BY streaming_movies

UNION ALL

SELECT 'contract', contract, COUNT(*) AS customer_count
FROM telco_churn_clean
GROUP BY contract

UNION ALL

SELECT 'paperless_billing', paperless_billing, COUNT(*) AS customer_count
FROM telco_churn_clean
GROUP BY paperless_billing

UNION ALL

SELECT 'payment_method', payment_method, COUNT(*) AS customer_count
FROM telco_churn_clean
GROUP BY payment_method

UNION ALL

SELECT 'churn', churn, COUNT(*) AS customer_count
FROM telco_churn_clean
GROUP BY churn

ORDER BY column_name, category;

--Check senior_citizen column
SELECT senior_citizen, COUNT(*) AS customer_count
FROM telco_churn_clean
GROUP BY senior_citizen


/* Check tenure range, monthly and total charges */

-- tenure range
SELECT
	MIN(tenure) AS minimum_tenure,
	MAX(tenure) AS maximum_tenure,
	AVG(tenure) AS average_tenure
FROM telco_churn_clean;

--monthly and total charges
SELECT 
	MIN(monthly_charges) AS min_monthly_charges,
	MAX(monthly_charges) AS max_monthly_charges,
	AVG(monthly_charges) AS avg_monthly_charges,
	MIN(total_charges) AS min_total_charges,
	MAX(total_charges) AS max_total_charges,
	AVG(total_charges) AS avg_total_charges
FROM telco_churn_clean;


SELECT 
	(SELECT COUNT(*) FROM telco_customer_churn) AS raw_records,
	(SELECT COUNT(*) FROM telco_churn_clean) AS clean_records;


	