create database Crimemanagement
use Crimemanagement

create table crime(
crime_id INT PRIMARY KEY,
incident_type VARCHAR(255),
incidentDate DATE,
location VARCHAR(255),
description TEXT,
status VARCHAR(20)
);
create table victim(
victim_id INT PRIMARY KEY,
crime_id INT,
name VARCHAR(255),
contact_info VARCHAR(255),
injuries VARCHAR(255),
FOREIGN KEY(crime_id) REFERENCES crime(crime_id)
);
create table suspect(
suspect_id INT PRIMARY KEY,
crime_id INT,
name VARCHAR(255),
description TEXT,
criminal_history TEXT,
FOREIGN KEY (crime_id) REFERENCES crime (crime_id)
);

insert into crime (crime_id, incident_type, incidentDate, location, description, status)
values
(1, 'Robbery', '2023-09-15', '123 Main St, Cityville', 'Armed robbery at a convenience store', 'Open'),
(2, 'Homicide', '2023-09-20', '456 Elm St, Townsville', 'Investigation into a murder case', 'Under
Investigation'),
(3, 'Theft', '2023-09-10', '789 Oak St, Villagetown', 'Shoplifting incident at a mall', 'Closed');
insert into victim (victim_id, crime_id, name, contact_info, injuries)
values
(1, 1, 'John Doe', 'johndoe@example.com', 'Minor injuries'),
(2, 2, 'Jane Smith', 'janesmith@example.com', 'Deceased'),
(3, 3, 'Alice Johnson', 'alicejohnson@example.com', 'None');
insert into suspect (suspect_id, crime_id, name, description, criminal_history)
values
(1, 1, 'Robber 1', 'Armed and masked robber', 'Previous robbery convictions'),
(2, 2, 'Unknown', 'Investigation ongoing', NULL),
(3, 3, 'Suspect 1', 'Shoplifting suspect', 'Prior shoplifting arrests');

select * from crime
select * from victim
select * from suspect
---As there is no age coloum we added it

ALTER TABLE Victim ADD Age INT;
ALTER TABLE Suspect ADD Age INT;
UPDATE Victim SET Age = 42 WHERE victim_id = 1; 
UPDATE Victim SET Age = 35 WHERE victim_id = 2; 
UPDATE Victim SET Age = 28 WHERE victim_id = 3; 

-- Update Suspects with Age
UPDATE Suspect SET Age = 27 WHERE suspect_id = 1; 
UPDATE Suspect SET Age = NULL WHERE suspect_id = 2; 
UPDATE Suspect SET Age = 30 WHERE suspect_id = 3;

--CODING QUESTIONS
--1. Select all open incidents.
select * from crime where status = 'Open'
--2. Find the total number of incidents.
select count(*) as totalcrime from crime 
--3. List all unique incident types.
select incident_type from crime 
group by incident_type
--4. Retrieve incidents that occurred between '2023-09-01' and '2023-09-10'.
select * from crime 
where incidentDate between '2023-09-01' and '2023-09-10'
--5. List persons involved in incidents in descending order of age.
select name, Age, 'Victim' as role from victim 
union select name ,Age,'Susopect' as role from suspect order by Age DESC
--6. Find the average age of persons involved in incidents. 
select AVG(Age) AS AvgAge from (select Age from victim union all
select Age from suspect) as Ages
--7. List incident types and their counts, only for open cases.
select incident_type, count(incident_type) as counts from crime where status ='Open' group by incident_type
--8. Find persons with names containing 'Doe'.
select * from victim where name like '%Doe%'
--9. Retrieve the names of persons involved in open cases and closed cases.
select v.name ,c.status from victim v join crime c on v.crime_id = c.crime_id where status in('Open','closed')
--10. List incident types where there are persons aged 30 or 35 involved.
select distinct c.incident_type from crime c join victim v on c.crime_id = v.crime_id
where v.Age in(30,35) union select distinct c.incident_type from crime c join suspect s
on c.crime_id = s.crime_id where s.Age in (30,35)
--11. Find persons involved in incidents of the same type as 'Robbery'.
select * from victim v join crime c on v.crime_id=c.crime_id where incident_type='Robbery'
--12. List incident types with more than one open case.
select incident_type, count(incident_type) as counts from crime where status ='Open' group by incident_type having count(*)>1
--13. List all incidents with suspects whose names also appear as victims in other incidents.
select c.* from crime c join suspect s on c.crime_id = s.crime_id where s.name in(select name from victim)
--14. Retrieve all incidents along with victim and suspect details.
select c.*, v.name as VictimName, s.name AS SuspectName from crime c
left join victim v on c.crime_id = v.crime_id left join suspect s on c.crime_id = s.crime_id
--15. Find incidents where the suspect is older than any victim.
select c.incident_type,c.incidentDate,c.location,c.status from crime c join suspect s on c.crime_id = s.crime_id where s.Age>
all(select Age from victim v where v.crime_id = c.crime_id)
--16. Find suspects involved in multiple incidents:
select name , count(*) AS IncidentCount from suspect group by name having count(*)>1
--17. List incidents with no suspects involved.
select * from crime where crime_id not in (select crime_id from suspect)
--18. List all cases where at least one incident is of type 'Homicide' and all other incidents are of type 'Robbery'.
select * from crime where exists (
select 1 from crime where incident_type = 'Homicide') and 
not exists (select 1 from crime where incident_type not in ('Homicide' ,'Robbery'))
--19. Retrieve a list of all incidents and the associated suspects, showing suspects for each incident, or 'No Suspect' if there are none.
select c.crime_id ,c.incident_type ,ISNULL(s.name,'No suspect') as suspectname from crime c 
left join suspect s on c.crime_id = s.crime_id
--20. List all suspects who have been involved in incidents with incident types 'Robbery' or 'Assault'
select s.* from suspect s join crime c on s.crime_id = c.crime_id where c.incident_type in('Robbery','Assault')
