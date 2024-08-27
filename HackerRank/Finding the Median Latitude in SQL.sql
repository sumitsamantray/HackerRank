WITH RankedLatitudes AS (
    SELECT
        LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM
        STATION
)
SELECT
    ROUND(LAT_N, 4) AS median_latitude
FROM
    RankedLatitudes
WHERE
    row_num = CEILING(total_rows / 2);