<!-- Breadcrumb Navigation -->
[🏠 Home](../../README.md) / [📂 SQL Learning](../README.md) / **📊 Lesson 2**

[📄 View Raw SQL Script](./Lesson-02-queries.sql)

---

# 📊 Lesson 2: Advanced Filtering, Sorting & Aggregations

Deep dive into data manipulation and analytical queries. I focused on organizing results and calculating metrics directly in SQL.

🛠️ What I learned:

- **Sorting & Uniqueness:** 
    - `ORDER BY` (ASC/DESC) – organizing data flow.
    - `DISTINCT` – extracting unique values from columns.
- **Advanced Filtering:** 
    - Logical operators: `AND`, `OR`, `NOT`.
    - Range & Set: `BETWEEN` (inclusive ranges), `IN` (checking against a list).
    - Pattern Matching: `LIKE` with wildcards (`%`, `_`).
- **Data Aggregation:** 
    - Functions: `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()`.
    - Formatting: `ROUND()` for cleaner numerical outputs.
    - Group Filtering: `HAVING` – filtering results after aggregation.

📸 Step-by-Step Implementation:

<details>
  <summary><b>Click to expand screenshots (6 files)</b></summary>

  #### 1. Sorting & Unique Values
  Using `ORDER BY` and `DISTINCT` to clean up the output.
  <p align="center">
    <img src="./screenshots/ORDER_BY%20.png" width="550">
  </p>

  ---

  #### 2. Logical Filtering (AND, OR, IS)
  Combining multiple conditions for precise data extraction.
  <p align="center">
    <img src="./screenshots/AND_OR_IS.png" width="550">
  </p>

  ---

  #### 3. Range & List Selection (BETWEEN, AND)
  Efficiently selecting records within specific bounds or sets.
  <p align="center">
    <img src="./screenshots/BETWEEN.png" width="550">
  </p>

  ---

  #### 4. Pattern Matching (LIKE)
  Searching for specific string patterns using wildcards.
  <p align="center">
    <img src="./screenshots/LIKE.png" width="550">
  </p>

  ---

  #### 5. Basic Aggregations (COUNT)
  Calculating key metrics from the dataset.
  <p align="center">
    <img src="./screenshots/count.png" width="550">
  </p>

  ---

  #### 6. Group Filtering and Aggregations (AVG, HAVING, AS)
  Applying conditions to aggregated data groups.
  <p align="center">
    <img src="./screenshots/avg_HAVING_AS%20.png" width="550">
  </p>

</details>

---
Task Status: ✅ Completed
