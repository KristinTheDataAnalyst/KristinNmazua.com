Select *
From PortfolioProject.dbo.ConsoleGames
     

Select *
From PortfolioProject.dbo.ConsoleDates


---Joined both tables using a common column platform

SELECT *
FROM PortfolioProject.dbo.ConsoleDates
JOIN   .ConsoleGames
    ON ConsoleDates.Platform = ConsoleGames.Platform
	

-- global sales for north america
Select SUM([NA_Sales]) as TotalNASales, SUM([NA_Sales] + [EU_Sales] + [JP_Sales] + [Other_Sales]) as TotalAllSales, SUM(NA_Sales)/SUM(NA_Sales + EU_Sales + JP_Sales + Other_Sales)*100 as NAPercentage
from PortfolioProject.dbo.Consolegames




/*extract a view of the console game titles ordered by platform name in ascending order and year of
release in descending order:*/
Create view Consolegame as 
Select gam.Name, gam.Platform, gam.Year
From PortfolioProject.dbo.ConsoleGames gam
--order BY [Platform],[Year] DESC

Select *
From  Consolegame



--for each game title extract the first four letters of the publishers name
Select SUBSTRING(Publisher,1,4)
From PortfolioProject.dbo.ConsoleGames



/* Display all console platforms which where released either just before blackfriday
or just before christmas in any year*/
SELECT [Platform], (cast([FirstRetailAvailability] as date)) as firstavailable, (CAST([Discontinued] as date)) as discontnuity, [UnitsSoldMillions]
FROM PortfolioProject.dbo.ConsoleDates
WHERE [FirstRetailAvailability] BETWEEN '%-11-01' AND '%-11-30'
OR [FirstRetailAvailability] BETWEEN '%-12-01' AND '%-12-25'



---order the platforms by their longevity in ascending order 
SELECT *
FROM PortfolioProject.dbo.ConsoleDates
JOIN  PortfolioProject.dbo.ConsoleGames
ON ConsoleDates.Platform = ConsoleGames.Platform
Order by 1,2 ASC

---- 
SELECT [Platform], (cast([FirstRetailAvailability] as date)) as firstavailable, (CAST([Discontinued] as date)) as discontnuity,
Datediff(day,[FirstRetailAvailability],[Discontinued]) as longevity
FROM PortfolioProject.dbo.ConsoleDates
Order by 4


--- gAME _yEAR COLUM to a different data type
Select * from PortfolioProject.dbo.ConsoleGames;
alter table PortfolioProject.dbo.ConsoleGames
alter column [Year] int