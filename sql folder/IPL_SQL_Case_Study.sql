--Q1 Find the total spending on players for each team : 

SELECT
    Team,
    SUM(Price_in_cr) AS Total_Spending_in_Cr
FROM IPLPlayers
GROUP BY Team
ORDER BY Total_Spending_in_Cr DESC;

--Q2 Find the top 3 highest-paid 'All-rounders' across all teams :

SELECT TOP 3
    Player,
    Price_in_cr,
    Team
FROM IPLPlayers
WHERE Role = 'All-rounder'
ORDER BY Price_in_cr DESC;

--Q3 Find the highest-priced player in each team :

SELECT Team, Player, Price_in_cr
FROM (
    SELECT Team, Player, Price_in_cr,
           RANK() OVER (PARTITION BY Team ORDER BY Price_in_cr DESC) AS rnk
    FROM dbo.IPLPlayers
) AS ranked
WHERE rnk = 1
ORDER BY Price_in_cr DESC;

--Q4 Rank players by their price within each team and list the top 2 for ecery team :

SELECT Team, Player, Price_in_cr, Price_Rank
FROM (
    SELECT Team, Player, Price_in_cr,
           ROW_NUMBER() OVER (PARTITION BY Team ORDER BY Price_in_cr DESC, Player) AS Price_Rank
    FROM dbo.IPLPlayers
) AS ranked
WHERE Price_Rank <= 2
ORDER BY Team, Price_Rank;

--Q5 Find the most expensive player from each team, along with the second-most expensive player's name and price:

WITH RankedPlayers AS (
    SELECT
        Player,
        Price_in_cr,
        Team,
        ROW_NUMBER() OVER (
            PARTITION BY Team
            ORDER BY Price_in_cr DESC
        ) AS PlayerRank
    FROM IPLPlayers
)
SELECT
    Team,
    MAX(CASE WHEN PlayerRank = 1 THEN Player END) AS Most_Expensive_Player,
    MAX(CASE WHEN PlayerRank = 1 THEN Price_in_cr END) AS Highest_Price,
    MAX(CASE WHEN PlayerRank = 2 THEN Player END) AS Second_Most_Expensive_Player,
    MAX(CASE WHEN PlayerRank = 2 THEN Price_in_cr END) AS Second_Highest_Price
FROM RankedPlayers
WHERE PlayerRank <= 2
GROUP BY Team
ORDER BY Team;

--Q6 Calculate the percentage contribution of each player's price to their team's total spending

SELECT Team,
       Player,
       CAST(Price_in_cr AS DECIMAL(10,2))                                                   AS Price_in_cr,
       CAST(SUM(Price_in_cr) OVER (PARTITION BY Team) AS DECIMAL(10,2))                     AS Team_Total_cr,
       CAST(100.0 * Price_in_cr / SUM(Price_in_cr) OVER (PARTITION BY Team) AS DECIMAL(5,2)) AS Pct_of_Team_Spending
FROM dbo.IPLPlayers
ORDER BY Team, Pct_of_Team_Spending DESC;

--Q7 Classify players as 'High', 'Medium', or 'Low' priced based on the following rules:
--High: Price > ₹15 crore
--Medium: Price between ₹5 crore and ₹15 crore
--Low: Price < ₹5 crore
--and find out the number of players in each bracket

WITH classified AS (
    SELECT Team,
           CASE
               WHEN Price_in_cr > 15 THEN 'High'
               WHEN Price_in_cr BETWEEN 5 AND 15 THEN 'Medium'
               ELSE 'Low'
           END AS PriceCategory
    FROM dbo.IPLPlayers
)
SELECT Team, PriceCategory, COUNT(*) AS NoOfPlayers
FROM classified
GROUP BY Team, PriceCategory
ORDER BY Team, PriceCategory;

--Q8 Find the average price of Indian players and compare it with overseas players using a subquery:

SELECT Player_Group,
       CAST(Avg_Price_cr AS DECIMAL(10,2)) AS Avg_Price_cr
FROM (
    SELECT CASE WHEN Type LIKE 'Indian%' THEN 'Indian' ELSE 'Overseas' END AS Player_Group,
           AVG(Price_in_cr) AS Avg_Price_cr
    FROM dbo.IPLPlayers
    GROUP BY CASE WHEN Type LIKE 'Indian%' THEN 'Indian' ELSE 'Overseas' END
) AS grouped;

--Q9 Identify players who earn more than the average price of their team:

SELECT p.Team,
       p.Player,
       p.Price_in_cr,
       CAST((SELECT AVG(p2.Price_in_cr)
             FROM dbo.IPLPlayers p2
             WHERE p2.Team = p.Team) AS DECIMAL(10,2)) AS Team_Avg_cr
FROM dbo.IPLPlayers p
WHERE p.Price_in_cr > (SELECT AVG(p2.Price_in_cr)
                       FROM dbo.IPLPlayers p2
                       WHERE p2.Team = p.Team)
ORDER BY p.Team, p.Price_in_cr DESC;

--Q10 For each role, find the most expensive player and their price using a correlated subquery

SELECT p.Role,
       p.Player,
       p.Team,
       p.Price_in_cr
FROM dbo.IPLPlayers p
WHERE p.Price_in_cr = (SELECT MAX(p2.Price_in_cr)
                       FROM dbo.IPLPlayers p2
                       WHERE p2.Role = p.Role)
ORDER BY p.Price_in_cr DESC;








