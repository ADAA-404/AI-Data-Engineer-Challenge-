-- SQL Script for Marketing KPI Analysis

-- Project: ads_spend analysis
-- Description: This script calculates key marketing metrics (CAC and ROAS) and compares the last 30 days of data
--              against the prior 30 days.

-- To use this script, simply replace the placeholder date '2025-06-30' with the desired end date for your analysis.
-- Example: To analyze data ending on July 31, 2025, change '2025-06-30' to '2025-07-31'.

-- CTE 1: Calculates metrics for the last 30 days
WITH last_30_days AS (
    SELECT
        SUM(spend) AS total_spend,
        SUM(conversions) AS total_conversions
    FROM
        ads_spend_ingested
    WHERE
        date >= ('2025-06-30'::date - interval '30 days') AND date <= '2025-06-30'::date
),

-- CTE 2: Calculates metrics for the 30 days prior to that
prior_30_days AS (
    SELECT
        SUM(spend) AS total_spend,
        SUM(conversions) AS total_conversions
    FROM
        ads_spend_ingested
    WHERE
        date >= ('2025-06-30'::date - interval '60 days')
        AND date < ('2025-06-30'::date - interval '30 days')
)

-- Final SELECT statement to present the results
SELECT
    -- Last 30 Days Metrics
    l30.total_spend AS last_30_days_spend,
    l30.total_conversions AS last_30_days_conversions,
    l30.total_spend / l30.total_conversions AS cac_last_30_days,
    (l30.total_conversions * 100) / l30.total_spend AS roas_last_30_days,

    -- Prior 30 Days Metrics
    p30.total_spend AS prior_30_days_spend,
    p30.total_conversions AS prior_30_days_conversions,
    p30.total_spend / p30.total_conversions AS cac_prior_30_days,
    (p30.total_conversions * 100) / p30.total_spend AS roas_prior_30_days,

    -- Delta (Percentage Change)
    ((l30.total_spend / l30.total_conversions) - (p30.total_spend / p30.total_conversions)) / (p30.total_spend / p30.total_conversions) * 100 AS cac_delta_percentage,
    (((l30.total_conversions * 100) / l30.total_spend) - ((p30.total_conversions * 100) / p30.total_spend)) / ((p30.total_conversions * 100) / p30.total_spend) * 100 AS roas_delta_percentage
FROM
    last_30_days l30,
    prior_30_days p30;