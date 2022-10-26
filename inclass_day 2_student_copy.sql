-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------


# Q1. Find all the players who were present in the test match 1 as well as in the test match 2.
 select * from  cricket_1 
 union 
 select * from cricket_2;
# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50
select player_id,runs,player_name
from cricket_1 
where runs>50;
# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.
select * from cricket_1
where Player_Name like 'y%v';
# Q4. Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’.
 select * from cricket_1
where Player_Name not like '%t';
-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 
-- --------------------------------------------------------

# Q5. Write a MySQL query to add a column PC_Ratio to the table that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)
alter table cric_combined add PC_Ratio float;
update cric_combined set PC_Ratio =Popularity/Charisma;
select * from cric_combined;
# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio.
select player_id
from  cric_combined
order by PC_Ratio  desc
limit 5;
# Q7. Write a MySQL query to find the player_ID and the name of the player that contains the character “D” in it.

select player_id,player_name
from cric_combined
where Player_Name like '%D%';
# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.
select player_id, PC_Ratio
from cric_combined
where PC_Ratio between 0.12 and 0.25;
-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
-- --------------------------------------------------------
# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null.
 select player_id,player_name
 from new_cricket
 where Charisma is null;
# Q10. Write a MySQL query to display all the NULL values  in the column Charisma imputed with 0.
 select Charisma
 from new_cricket
 where ifnull(charisma,0);
# Q11. Separate all Player_Id into single numeric ids (example PL1 to be converted as 1, PL2 as 2 , ... PL12 as 12 ).
 
 select player_id
 from new_cricket
 where substr(player_id,3,2);
# Q12. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.
select player_id,player_name,charisma
from new_cricket
where Charisma>25;
-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------

# Q13. Write a query to display the rounding of lowest integer value of monthlyservicecharges and rounding of higher integer value of totalamount 
# for those paymentmethod is through Electronic check mode.
select floor('monthlyservicecharges');
select ceiling('total amount');
# Q14. Rename the table churn1 to “Churn_Details”.
alter table churn1 rename Churn_Details;
# Q15. Write a query to create a display a column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges.
update churn_details set new_amount= totalamount+monthlyservicecharges ;
alter table churn_details add new_amount float;
desc churn_details;
# Q16. Rename column new_Amount to Amount.
alter table Churn_Details rename  column new_amount  to Amount;
# Q17. Drop the column “Amount” from the table “Churn_Details”.
alter table Churn_Details drop column Amount;
# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.
select customerID,internetconnection,gender
from churn_details
where internetconnection like '%i%';
# Q19. Find the records where the tenure is 6x, where x is any number.
select * from churn_details
where tenure like '%6';
# Q20. Write a query to display the player names in capital letter and arrange in alphabatical order along with the charisma, display 0 for whom the charisma value is NULL.
select upper(player_name)  ,ifnull(charisma,0)
from new_cricket
order by player_name;