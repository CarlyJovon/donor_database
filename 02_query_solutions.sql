-- QUERY SOLUTIONS

-- 1. Basic Queries:

-- Basic Query 1: List all donors and their email addresses
SELECT first_name, last_name, email
FROM donors;

-- Basic Query 2: List all programs with budgets over $10,000
SELECT name, budget
FROM programs
WHERE budget > 10000;

-- Basic Query 3: Show all donations in descending order by amount
SELECT donor_id, program_id, amount, donation_date
FROM donations
ORDER BY amount DESC;

-- 2. Filtering:

-- Filtering Query 4: Find all donors where the email contains "example.com"
SELECT first_name, last_name, email
FROM donors
WHERE email LIKE '%example.com%';

-- Filtering Query 5: Find all programs that have the word "Youth" in their name or description
SELECT name, description
FROM programs
WHERE name LIKE '%Youth%' OR description LIKE '%Youth%';

-- Filtering Query 6: Find all donations made in 2023
SELECT donor_id, program_id, amount, donation_date
FROM donations
WHERE donation_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 3. Advanced Queries:

-- Advanced Query 7: List the total amount donated by each donor
SELECT donor_id, SUM(amount) AS total_donated
FROM donations
GROUP BY donor_id;

-- Advanced Query 8:  Find the program that has received the most total donations
SELECT p.program_id,
       p.name AS program_name,
       SUM(d.amount) AS total_donations
FROM donations d
JOIN programs p ON d.program_id = p.program_id
GROUP BY p.program_id, p.name
ORDER BY total_donations DESC
LIMIT 1;

-- Query 9: List all donors who have made more than one donation
SELECT d.donor_id,
       d.first_name,
       d.last_name
FROM donations don
JOIN donors d ON don.donor_id = d.donor_id
GROUP BY d.donor_id, d.first_name, d.last_name
HAVING COUNT(donation_id) > 1;

-- 4. Challenge Query:

-- Query 10: Create a report showing each program, the total amount donated to that program,
-- and what percentage that represents of all donations
SELECT p.name AS program_name,
       SUM(d.amount) AS total_donated,
       (SUM(d.amount) / (SELECT SUM(amount) FROM donations) * 100) AS percentage_of_all_donations
FROM donations d
JOIN programs p ON d.program_id = p.program_id
GROUP BY p.name
ORDER BY total_donated DESC;