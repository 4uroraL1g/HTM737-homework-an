-- JOIN (inner join) is to combine 2 or more table, this will not take null data
-- LEFT/RIGHT JOIN is take all add null for right/left table
-- CASE WHEN is if else statement
-- COUNT count everything
-- COUNT(DISTINCT) count but unique
-- GROUP BY it… group by :) we also learnt min, max and avg on the go
select v.attending_md AS Provider, --select provider name using visit table
count(DISTINCT v.visit_id) as N_visits, -- count unique visit id from visit table
COUNT(DISTINCT m.Rx_name || m.Pid || m.Rx_date) as Drug_count, -- count the unique combination of rx_name + pid + rx_date (drug name + patient id + date)
COUNT(DISTINCT l.Lab_loinc || l.Pid || l.Lab_date) as Lab_count -- count the unique combination of lab_loinc + p_id + lab_date ( lab name + patient id + lab date)
FROM VISIT v
FULL OUTER JOIN MEDICATIONS m ON v.Attending_md = m.Prescribing_md -- join the medication table with visit table (left join did not change the result)
FULL OUTER JOIN LABS l ON v.Attending_md = l.Ordering_md -- join the labs table with visit table (left join did not change the result)
GROUP BY Provider; -- group by provider name
