SELECT
    s.hacker_id,
    MAX(h.name) as hacker_name
FROM
    Submissions s
JOIN
    Hackers h ON s.hacker_id = h.hacker_id
JOIN
    Challenges c ON s.challenge_id = c.challenge_id
JOIN
    Difficulty d ON c.difficulty_level = d.difficulty_level
WHERE
    s.score = d.score
GROUP BY
    s.hacker_id
HAVING
    COUNT(DISTINCT s.challenge_id) > 1
ORDER BY
    COUNT(DISTINCT s.challenge_id) DESC, s.hacker_id;
