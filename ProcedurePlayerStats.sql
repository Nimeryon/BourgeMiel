GO
    USE BourgeMiel
GO

CREATE OR ALTER PROCEDURE PlayerStats(@PlayerID INT)
AS
BEGIN
	SELECT p.PlayerHealth + SUM(i.ItemHealthStat) as Health, p.PlayerArmor + SUM(i.ItemArmorStat) as Armor, p.PlayerDamage + SUM(i.ItemDamageStat) as Attack  FROM Players as p
	INNER JOIN Equipments as e ON e.PlayerId = p.PlayerId
	INNER JOIN Items as i ON i.ItemId = e.ItemId
	WHERE p.PlayerId = @PlayerID
	GROUP BY p.PlayerHealth, p.PlayerArmor, p.PlayerDamage
END;