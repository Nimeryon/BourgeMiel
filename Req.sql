GO
	USE BourgeMiel
GO

-- 1 Level up d'un joueur
DECLARE @ID INT;
SET @ID = 45;

SELECT CONCAT('Joueur numéro ', @ID, ', qui se nomme : ', p.PlayerName, ', et est niveau : ' , p.PlayerLevel) AS 'Joueurs qui va gagner un niveau' FROM Players p WHERE PlayerId = @ID

UPDATE Players SET
PlayerLevel = PlayerLevel + 1
WHERE PlayerId = @ID AND PlayerLevel != 100

SELECT CONCAT('Joueur numéro ', @ID, ', qui se nomme : ', p.PlayerName, ', et est niveau : ' , p.PlayerLevel) AS 'Joueurs qui vient de gagner un niveau' FROM Players p WHERE PlayerId = @ID

-- 2 Les 10 monstres les plus forts
SELECT TOP(10) m.MonsterName, m.MonsterLevel
FROM Monsters m
ORDER BY MonsterLevel DESC

-- 3 Les monstres qui drop des items rare, et qui sont natif au zone 'camp' qui font partie des biomes 'land'

SELECT m.MonsterName AS 'Nom du monstre', i.ItemName AS "Nom de l'item que le monstre drop", REPLACE(CONVERT(varchar, i.RaritityId), CONVERT(varchar, i.RaritityId), r.RaritityName) AS 'Rareté', CONCAT('Zone : ', z.ZoneName, ' | Biome : ', b.BiomeName) AS 'Zone et biome' FROM Monsters m
INNER JOIN Zones z
ON m.ZoneId = z.ZoneId
INNER JOIN Biomes b
ON z.BiomeId = b.BiomeId
INNER JOIN Drops d
ON m.MonsterId= d.MonsterId
INNER JOIN Items i
ON d.ItemId = i.ItemId
INNER JOIN Rarities r
ON i.RaritityId = r.RaritityId
WHERE UPPER(z.ZoneName) LIKE '%CAMP%' 
AND UPPER(b.BiomeName) LIKE '%LAND%' 
AND i.RaritityId >= (SELECT r.RaritityId FROM Rarities r WHERE r.RaritityId = 2)
ORDER BY M.MonsterName ASC

-- 4


-- 5