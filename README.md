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

## Key Findings

### 1. Team Spending Is Relatively Even
Total player prices sum to ₹1,180.9 crore across 228 players. Nine of the ten teams spent between ₹116.55 crore and ₹119.9 crore. Lucknow Super Giants had the highest total at ₹119.9 crore, while Kolkata Knight Riders had the lowest at ₹107.95 crore.

### 2. High-Priced Players Account for a Large Share of Team Spending
Rishabh Pant was the most expensive player at ₹27 crore for Lucknow Super Giants, accounting for 22.5% of the team's total player prices. Shreyas Iyer (Punjab, ₹26.75 crore) and Venkatesh Iyer (Kolkata, ₹23.75 crore) each accounted for close to 22% of their respective teams' totals.

### 3. Highest-Priced All-Rounders
- Ravindra Jadeja — ₹18 crore
- Hardik Pandya — ₹16.35 crore
- Abhishek Sharma — ₹14 crore

### 4. Most Players Fall into the Low-Price Bracket
Of the 228 players analyzed:
- Low (under ₹5 crore): 151 players
- Medium (₹5–15 crore): 56 players
- High (over ₹15 crore): 21 players

### 5. Overseas Players Have a Higher Average Price
Overseas players averaged ₹5.64 crore across 72 players, compared with ₹4.97 crore across 156 Indian players—a difference of approximately ₹0.67 crore. Additionally, 28 overseas players were priced above the Indian-player average.

### 6. Fewer Than Half of Players Exceed Their Team's Average
Only 76 of 228 players (approximately 33.3%) had a price above their own team's average.

### 7. Highest-Priced Players by Role
- Batter/Wicketkeeper: Rishabh Pant — ₹27 crore
- Batter: Venkatesh Iyer — ₹23.75 crore
- All-rounder: Ravindra Jadeja — ₹18 crore
- Bowler: Rashid Khan, Jasprit Bumrah, Arshdeep Singh, Yuzvendra Chahal, and Pat Cummins — ₹18 crore each

## Business Takeaway

The analysis highlights differences in team spending, the influence of high-priced players on team totals, and the distribution of player prices across roles and nationality categories. SQL aggregations, window functions, conditional logic, and correlated subqueries were used to answer these business questions.


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
