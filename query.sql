-- Query 1. 
select
  match_id,
  fixture,
  base_ticket_price
from
  matches
where
  tournament_category = 'Champions League'
  and match_status = 'Available';