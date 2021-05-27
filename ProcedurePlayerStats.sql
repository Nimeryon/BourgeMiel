GO
    USE BourgeMiel
GO

CREATE OR ALTER PROCEDURE PlayerStats(@PlayerID INT)
AS
BEGIN
	DECLARE @Health INT, @Armor INT, @Attack INT

	SELECT @Health = p.PlayerHealth + SUM(i.ItemHealthStat), @Armor = p.PlayerArmor + SUM(i.ItemArmorStat), @Attack = p.PlayerDamage + SUM(i.ItemDamageStat) FROM Players as p
	INNER JOIN Equipments as e ON e.PlayerId = p.PlayerId
	INNER JOIN Items as i ON i.ItemId = e.ItemId
	WHERE p.PlayerId = @PlayerID
	GROUP BY p.PlayerHealth, p.PlayerArmor, p.PlayerDamage

	PRINT CONCAT('Health: ', @Health, ' / Armor: ', @Armor, ' / Attack: ', @Attack)
END;