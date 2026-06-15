-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.
select
  match_id,
  fixture,
  base_ticket_price
from
  matches
where
  tournament_category = 'Champions League'
  and match_status = 'Available';

-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).
SELECT
  user_id,
  full_name,
  email
FROM
  users
WHERE
  full_name ILIKE 'Tanvir%'
  OR full_name ILIKE '%Haque%';

-- Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.
SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(payment_status, 'Action Required') AS systematic_status
FROM bookings
  where payment_status is null;

--Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams.
SELECT
  b.booking_id,
  u.full_name,
  m.fixture,
  b.total_cost
FROM
  bookings b
  INNER JOIN users u ON b.user_id = u.user_id
  INNER JOIN matches m ON b.match_id = m.match_id;

--Query 5: Display a comprehensive list of all users and their booking IDs, ensuring that fans who have never bought a ticket are still listed.
select
  u.user_id,
  u.full_name,
  b.booking_id
from
  users u
  left join bookings b on u.user_id = b.user_id;

--Query 6: Find all ticket bookings where the total cost is strictly higher than the average cost of all ticket bookings.
select
  booking_id,
  match_id,
  total_cost
from
  bookings
where
  total_cost > (
    select
      avg(total_cost)
    from
      bookings
  );