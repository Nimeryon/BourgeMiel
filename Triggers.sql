GO 
	USE BourgeMiel
GO

-- level up
CREATE OR ALTER TRIGGER LevelUp
ON Players
AFTER UPDATE
AS
BEGIN
    UPDATE Players SET
        PlayerHealth = PlayerHealth + 20,
		PlayerArmor = PlayerArmor + 20,
		PlayerDamage = PlayerDamage +20
        WHERE PlayerLevel = (SELECT i.PlayerLevel FROM INSERTED i WHERE PlayerLevel < 100)
END