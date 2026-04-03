# 🏠 Main Portfolio / 🔍 SQL Journey / Lesson-03-Review-Subqueries
 
📄 [View Raw SQL Script](./lekcja_3_SQL_Subqueries.sql)  
🗄️ [View Database](./baza_danych-1.csv)
 
---
 
## 📊 Lesson 3: Review & Subqueries (Nested SELECT)
 
Consolidation of previous material combined with the first steps into more advanced SQL — embedding multiple SELECT statements within a single query.
 
---
 
## 🛠️ What I learned:
 
### 🔁 Review — Lessons 1 & 2
Revision of all previously covered commands to reinforce understanding before moving to more complex topics:
 
- **Filtering:** `WHERE`, `IN`, `NOT IN`, `BETWEEN`, `NOT BETWEEN`, `LIKE`, `IS NULL`
- **Sorting & Grouping:** `ORDER BY ASC/DESC`, `GROUP BY`, `HAVING`
- **Aggregate Functions:** `COUNT`, `SUM`, `AVG`, `ROUND`, `MIN`, `MAX`
- **Other:** `DISTINCT`, `TRIM`, `ALTER TABLE RENAME COLUMN`
 
### 🔗 Subqueries — Nested SELECT (new material)
A subquery is a `SELECT` statement embedded inside another query. The **inner SELECT executes first**, and its result is used by the outer query.
 
- **Subquery in `WHERE`** — filtering based on the result of an aggregation (e.g. comparing to `AVG`, `MAX`).
- **Subquery in `FROM`** — treating a query result as a temporary table (inline view).
- **Subquery in `SELECT`** — adding a calculated column derived from another table.
- **Subquery with `IN` / `NOT IN`** — filtering rows based on a set of results from another query.
 
---
 
## 📸 Step-by-Step Implementation:
 
1. **Review of Lessons 1 & 2**
   Full revision of DDL, DML, DQL commands and aggregate functions practiced in previous lessons.
 
2. **Subquery in `WHERE`**
   Filtering employees earning above the company average using a nested `AVG()` calculation.
 
3. **Subquery in `FROM` (Inline View)**
   Using a subquery as a temporary data source — grouping and filtering in one step.
 
4. **Subquery in `SELECT` (Calculated Column)**
   Adding a column showing the number of orders per customer, calculated dynamically from a related table.
 
5. **Subquery with `IN` / `NOT IN`**
   Identifying customers who have — and have not — placed any orders.
 
---
 
Task Status: ✅ Completed  
