USE MarketingFunnel;
GO

SELECT TOP 10 *
FROM marketing_qualified_leads;

SELECT TOP 10 *
FROM closed_deals;


SELECT
    COUNT(DISTINCT m.mql_id) AS total_mqls,
    COUNT(DISTINCT c.mql_id) AS closed_deals,
    COUNT(DISTINCT m.mql_id) - COUNT(DISTINCT c.mql_id) AS drop_offs,
    CAST(
        COUNT(DISTINCT c.mql_id) * 100.0
        / COUNT(DISTINCT m.mql_id)
        AS DECIMAL(10,2)
    ) AS conversion_rate
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c
    ON m.mql_id = c.mql_id;


SELECT
    m.origin,
    COUNT(DISTINCT m.mql_id) AS total_leads,
    COUNT(DISTINCT c.mql_id) AS converted_leads,
    CAST(
        COUNT(DISTINCT c.mql_id) * 100.0
        / COUNT(DISTINCT m.mql_id)
        AS DECIMAL(10,2)
    ) AS conversion_rate
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c
    ON m.mql_id = c.mql_id
GROUP BY m.origin


SELECT
    m.origin,
    COUNT(DISTINCT m.mql_id) AS total_leads,
    COUNT(DISTINCT c.mql_id) AS converted_leads,
    COUNT(DISTINCT m.mql_id) - COUNT(DISTINCT c.mql_id) AS drop_offs,
    CAST(
        COUNT(DISTINCT c.mql_id) * 100.0
        / NULLIF(COUNT(DISTINCT m.mql_id), 0)
        AS DECIMAL(10,2)
    ) AS conversion_rate
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c
    ON m.mql_id = c.mql_id
GROUP BY m.origin
ORDER BY conversion_rate DESC;


SELECT
    m.origin,
    COUNT(DISTINCT m.mql_id) AS total_leads,
    COUNT(DISTINCT c.mql_id) AS converted_leads
FROM marketing_qualified_leads m
LEFT JOIN closed_deals c
    ON m.mql_id = c.mql_id
GROUP BY m.origin
ORDER BY total_leads DESC;


SELECT
    lead_type,
    COUNT(DISTINCT mql_id) AS converted_leads,
    COUNT(DISTINCT mql_id) AS total_closed_deals,
    CAST(
        COUNT(DISTINCT mql_id) * 100.0
        / SUM(COUNT(DISTINCT mql_id)) OVER ()
        AS DECIMAL(10,2)
    ) AS share_of_closed_deals
FROM closed_deals
GROUP BY lead_type
ORDER BY converted_leads DESC;


SELECT
    business_segment,
    COUNT(DISTINCT mql_id) AS closed_deals,
    CAST(
        COUNT(DISTINCT mql_id) * 100.0
        / SUM(COUNT(DISTINCT mql_id)) OVER ()
        AS DECIMAL(10,2)
    ) AS share_of_closed_deals
FROM closed_deals
GROUP BY business_segment
ORDER BY closed_deals DESC;


SELECT
    YEAR(won_date) AS year,
    MONTH(won_date) AS month,
    COUNT(DISTINCT mql_id) AS closed_deals
FROM closed_deals
WHERE won_date IS NOT NULL
GROUP BY
    YEAR(won_date),
    MONTH(won_date)
ORDER BY
    year,
    month;


SELECT
    DATEFROMPARTS(YEAR(won_date), MONTH(won_date), 1) AS month,
    COUNT(DISTINCT mql_id) AS closed_deals
FROM closed_deals
WHERE won_date IS NOT NULL
GROUP BY
    DATEFROMPARTS(YEAR(won_date), MONTH(won_date), 1)
ORDER BY
    month;

