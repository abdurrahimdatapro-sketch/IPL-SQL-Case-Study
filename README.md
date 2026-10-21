# IPL SQL Case Study

## Project Overview
This project uses SQL to analyze player prices across Indian Premier League (IPL) teams. It demonstrates how SQL can answer practical business questions about team spending, player price rankings, price distribution, and spending concentration.

**Database:** Microsoft SQL Server  
**Main table:** `IPLPlayers`  
**Currency unit:** Crores (`Price_in_cr`)  
**Tools:** SQL Server Management Studio (SSMS), T-SQL

## Business Questions
1. How much does each team spend on its players?
2. Who are the three highest-priced all-rounders?
3. Who is the most expensive player on each team?
4. Who are the top two highest-priced players on each team?
5. What are the highest and second-highest player prices for each team?
6. What percentage of a team's total spending does each player represent?
7. How many players fall into each price bracket?
8. What is the average price for Indian versus overseas players?
9. Which players cost more than their team's average player price?
10. Who is the most expensive player in each role?

## Repository Structure
```text
IPL_SQL_Case_Study/
├── README.md
├── data/
│   └── IPL_InsertData.sql
└── sql/
    ├── 01_create_and_load_data.sql
    ├── 01_team_spending.sql
    ├── 02_top_3_all_rounders.sql
    ├── 03_most_expensive_player_per_team.sql
    ├── 04_top_2_players_per_team.sql
    ├── 05_highest_and_second_highest_by_team.sql
    ├── 06_player_share_of_team_spending.sql
    ├── 07_player_price_brackets.sql
    ├── 08_average_price_indian_vs_overseas.sql
    ├── 09_players_above_team_average.sql
    └── 10_most_expensive_player_per_role.sql
```

## How to Run
1. Open SQL Server Management Studio and connect to your SQL Server instance.
2. Select or create a database for this case study.
3. Open and execute `sql/01_create_and_load_data.sql` to create `IPLPlayers` and load the data.
4. Execute each business-question script in the `sql/` folder.
5. Save result-grid screenshots or export selected results if you want to add evidence to the repository.

> Run the setup script only once in a fresh database, because it creates the `IPLPlayers` table.

## Table Schema
| Column | Type | Description |
|---|---|---|
| `Player` | `NVARCHAR(120)` | Player name |
| `Price_in_cr` | `DECIMAL(10,2)` | Listed player price in crores |
| `Type` | `NVARCHAR(50)` | Indian/overseas and capped/uncapped label |
| `Acquisition` | `NVARCHAR(50)` | Acquisition label, such as Retained, Auction, or RTM |
| `Role` | `NVARCHAR(50)` | Player role |
| `Team` | `NVARCHAR(100)` | IPL team |

## SQL Skills Demonstrated
- Aggregations with `SUM`, `AVG`, `MAX`, and `COUNT`
- Filtering with `WHERE`
- Grouping with `GROUP BY`
- Conditional logic with `CASE`
- Window functions: `ROW_NUMBER()` and `SUM() OVER (PARTITION BY ...)`
- Common Table Expressions (CTEs)
- Correlated subqueries
- Conditional aggregation with `MAX(CASE WHEN ...)`

## Notes and Limitations
- This analysis reflects the values in the provided SQL dataset; it does not independently verify the dataset against official IPL records.
- The analysis treats `Price_in_cr` as the player price value supplied in the data. It should not automatically be interpreted as total team payroll or a complete measure of team spending.
- The `Type` values in the source data use slightly different labels (for example, `Indian` and `India`). The Indian-versus-overseas query accounts for those variants.
- The ranking queries use `ROW_NUMBER()` with player name as a tie-breaker. The role-based maximum-price query returns all ties.
- The high price bracket is strictly greater than 15 Cr; medium is 5 Cr through 15 Cr inclusive; low is below 5 Cr.

## Suggested Portfolio Summary
**IPL SQL Case Study | SQL Server**

Analyzed IPL player price data using SQL Server to answer 10 business questions about team spending, player rankings, price brackets, and spending concentration. Applied aggregations, window functions, CTEs, conditional logic, and correlated subqueries to turn raw player records into business-oriented insights.

## Future Improvements
- Add a dashboard in Tableau or Power BI.
- Add screenshots of selected query results and a short findings section.
- Validate the source dataset and document its season and origin before making claims about official IPL values.
