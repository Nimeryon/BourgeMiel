GO
	USE BourgeMiel
GO

-- Level up d'un joueur
DECLARE @ID INT;
SET @ID = 69;

SELECT * FROM Players WHERE PlayerId = @ID

UPDATE Players SET
PlayerLevel = PlayerLevel + 1
WHERE PlayerId = @ID AND PlayerLevel != 100

-- Les 10 monstres les plus forts
SELECT TOP(10) m.MonsterName, m.MonsterLevel
FROM Monsters m
ORDER BY MonsterLevel DESC