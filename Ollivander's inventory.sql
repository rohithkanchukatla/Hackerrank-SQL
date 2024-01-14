SELECT
    id,
    age,
    coins_needed,
    power
FROM (
    SELECT
        w.id,
        wp.age,
        w.coins_needed,
        w.power,
        DENSE_RANK() OVER (PARTITION BY w.power, wp.age ORDER BY w.coins_needed) AS coin_ranking
    FROM
        Wands w
    JOIN
        Wands_Property wp ON w.code = wp.code
    WHERE
        wp.is_evil = 0
) AS ranked_wands
WHERE
    coin_ranking = 1
ORDER BY
    power DESC, age DESC, id DESC;
