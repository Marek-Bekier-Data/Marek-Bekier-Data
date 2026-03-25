-- ======================================================
-- Lesson 02: Advanced Filtering, Sorting & Aggregations
-- Author: Marek Bekier
-- Database: baza_danych1
-- Focus: Data manipulation and analytical queries
-- ======================================================

-- ======================================================
-- 0. Database Schema Setup (Required for CSV import)
-- ======================================================
/*
CREATE TABLE baza_danych1 (
    Lp INT,
    imie VARCHAR(255),
    nazwisko VARCHAR(255),
    ulica VARCHAR(255),
    numer_mieszkania INT,
    uczelnia VARCHAR(255),
    zawod VARCHAR(255),
    plec CHAR(1),
    wzrost INT,
    miasto VARCHAR(255),
    wojewodztwo VARCHAR(255),
    punkty INT
);
*/


-- 1. Range Selection (BETWEEN)
-- Goal: Retrieve records where names fall within a specific alphabetical range.
SELECT imie, nazwisko 
FROM baza_danych1
WHERE imie BETWEEN 'Barbara' AND 'Franciszek'
ORDER BY imie ASC;

-- 2. Pattern Matching (LIKE)
-- Goal: Find surnames ending with "ek" using wildcards.
-- % matches any sequence of characters.
SELECT imie, nazwisko 
FROM baza_danych1
WHERE nazwisko LIKE '%ek';

-- 3. Basic Aggregations (COUNT)
-- Goal: Calculate the total number of occurrences for a specific value.
-- Alias "michal_count" is used for better readability of the output table.
SELECT COUNT(*) AS michal_count 
FROM baza_danych1
WHERE imie = 'Michal';

-- 4. Advanced Logical Filtering (OR, IS NULL)
-- Goal: Select specific records based on multiple criteria including NULL values.
SELECT imie, nazwisko, miasto, punkty
FROM baza_danych1
WHERE (miasto = 'Warszawa' OR miasto = 'Zakopane')
  AND punkty IS NULL
ORDER BY nazwisko ASC;

-- 5. Summary Aggregations (Bonus)
-- Goal: Showcase understanding of basic statistics in SQL.
SELECT 
    COUNT(*) AS total_records,
    AVG(punkty) AS average_points,
    MAX(punkty) AS highest_score
FROM baza_danych1;
