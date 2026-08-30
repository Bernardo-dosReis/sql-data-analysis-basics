# SQL Data Analysis: Practical Queries & Aggregations

A hands-on SQL repository covering essential data manipulation, relational joins, conditional logic, and ranking functions for transactional datasets.

---

## Concepts Covered

* **Filtering & Aggregations:** Using `WHERE`, `GROUP BY`, `SUM()`, `AVG()`, and `COUNT()`.
* **Table Relationships:** Combining datasets using `LEFT JOIN` and handling missing values with `COALESCE()`.
* **Conditional Bucketing:** Applying `CASE WHEN` statements to segment users by spend volume.
* **Window Functions & CTEs:** Ranking customer purchases using `DENSE_RANK() OVER (PARTITION BY ...)` inside Common Table Expressions (`WITH`).

---

## Repository Structure

* `init.sql`: Table creation (`customers`, `transactions`) and sample data insertion.
* `queries.sql`: Analytical queries from basic aggregation to window ranking.
* `README.md`: Project summary.

---

## How to Run

1. Clone the repository:
   git clone https://github.com/Bernardo-dosReis/sql-data-analysis-basics.git
   cd sql-data-analysis-basics

2. Run on PostgreSQL or any online SQL editor (e.g., SQLite / DB Fiddle):
   * Execute `init.sql` to build the database.
   * Run queries from `queries.sql` individually.
