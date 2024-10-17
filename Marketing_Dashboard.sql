-- Selecting Database--

USE Personal_Project

--Checking the Table--

Select * from [Marketing Dashboard];

--Checking for Null Values-

Select * from [Marketing Dashboard]
Where Campaign_ID Is Null
OR Channel Is Null
OR Date Is Null
OR Impressions Is Null
OR Clicks Is Null
OR Conversions Is Null
OR Cost Is Null;

-- No NUll VALUES--

-- Checking For Duplicates--

Select  Campaign_ID, Channel, Date, Impressions, Clicks, Conversions, Cost, Count(*)
from [Marketing Dashboard]
Group By Campaign_ID, Channel, Date, Impressions, Clicks, Conversions, Cost
Having Count(*) > 1;

-- No Duplicate Values--

---Clicks, impression and conversion by Channel-

Select Channel, Sum(Clicks) as Total_Clicks, 
Sum(Impressions) as Total_Impression, 
Sum(Conversions) as Total_Conversion, 
Sum(Cost) as Total_Cost
from [Marketing Dashboard]
Group By Channel
Order By Total_Cost DESC;

---Clicks, impression and conversion by Date-

Select DAY(Date) as Order_Day,
Sum(Clicks) as Total_Clicks, 
Sum(Impressions) as Total_Impression, 
Sum(Conversions) as Total_Conversion, 
Sum(Cost) as Total_Cost
from [Marketing Dashboard]
Group By DAY(Date);

--Creating New Feature--Conversion_Ratio--

Select Campaign_ID, 
Ceiling ((sum(Conversions) / sum(Impressions))*100) as Conversion_Ratio
from [Marketing Dashboard]
Group By Campaign_ID;

--Similarly other features like Click Through ratio can be calculated-- which i have done in power Bi using DAX