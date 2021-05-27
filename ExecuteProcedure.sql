DECLARE @ID INT;
SET @ID = 45;

EXEC PlayerStats @PlayerID=@ID

/*SELECT p.PlayerHealth as Health, p.PlayerArmor as Armor, p.PlayerDamage as Attack, p.PlayerHealth + SUM(i.ItemHealthStat) as 'Total Health', p.PlayerArmor + SUM(i.ItemArmorStat) as 'Total Armor', p.PlayerDamage + SUM(i.ItemDamageStat) as 'Total Attack'  FROM Players as p
INNER JOIN Equipments as e ON e.PlayerId = p.PlayerId
INNER JOIN Items as i ON i.ItemId = e.ItemId
WHERE p.PlayerId = @ID
GROUP BY p.PlayerHealth, p.PlayerArmor, p.PlayerDamage

SELECT p.PlayerName, p.PlayerLevel, i.ItemName, i.ItemLevel, r.RaritityName, i.ItemHealthStat, i.ItemArmorStat, i.ItemDamageStat FROM Equipments as e
INNER JOIN Items as i ON i.ItemId = e.ItemId
INNER JOIN Rarities as r ON r.RaritityId = i.RaritityId
INNER JOIN Players as p ON p.PlayerId = e.PlayerId
WHERE e.PlayerId = @ID*/