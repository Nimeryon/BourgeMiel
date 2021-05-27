GO
	USE BourgeMiel
GO

-- Level up d'un joueur
DECLARE @ID INT;
SET @ID = 69;

SELECT CONCAT('Joueur numéro ', @ID, ', qui se nomme : ', p.PlayerName, ', et est niveau : ' , p.PlayerLevel) AS 'Joueurs qui va gagner un niveau' FROM Players p WHERE PlayerId = @ID

UPDATE Players SET
PlayerLevel = PlayerLevel + 1
WHERE PlayerId = @ID AND PlayerLevel != 100

SELECT CONCAT('Joueur numéro ', @ID, ', qui se nomme : ', p.PlayerName, ', et est niveau : ' , p.PlayerLevel) AS 'Joueurs qui vient de gagner un niveau' FROM Players p WHERE PlayerId = @ID

-- Les 10 monstres les plus forts
SELECT TOP(10) m.MonsterName, m.MonsterLevel
FROM Monsters m
ORDER BY MonsterLevel DESC