with max_score as (
select 
       max(score) as mscore,
       challenge_id,
       hacker_id
      from submissions 
   group by challenge_id,hacker_id)
select h.hacker_id,
       h.name,
       sum(s.mscore)
from hackers h join max_score s
on h.hacker_id = s.hacker_id
group by h.hacker_id,h.name
having sum(s.mscore)>0
order by sum(s.mscore) desc,h.hacker_id asc;
