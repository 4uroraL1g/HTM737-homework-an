select v.attending_md AS Provider,
count(DISTINCT v.visit_id) as N_visits, 
COUNT(DISTINCT m.Rx_name || m.Pid || m.Rx_date) as Drug_count,
COUNT(DISTINCT l.Lab_loinc || l.Pid || l.Lab_date) as Lab_count
FROM VISIT v
FULL OUTER JOIN MEDICATIONS m ON v.Attending_md = m.Prescribing_md
FULL OUTER JOIN LABS l ON v.Attending_md = l.Ordering_md
GROUP BY Provider;
