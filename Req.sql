GO
	USE BourgeMiel
GO

-- 1 Level up d'un joueur (avec un avant après le level up)
DECLARE @ID INT;
SET @ID = 45;

SELECT CONCAT('Joueur numéro ', @ID, ', qui se nomme : ', p.PlayerName, ', et est niveau : ' , p.PlayerLevel) AS 'Joueurs qui va gagner un niveau' FROM Players p WHERE PlayerId = @ID

UPDATE Players SET
PlayerLevel = PlayerLevel + 1
WHERE PlayerId = @ID AND PlayerLevel != 100

SELECT CONCAT('Joueur numéro ', @ID, ', qui se nomme : ', p.PlayerName, ', et est niveau : ' , p.PlayerLevel) AS 'Joueurs qui vient de gagner un niveau' FROM Players p WHERE PlayerId = @ID

-- 2 Les 10 monstres les plus forts
SELECT TOP(10) m.MonsterName AS 'Nom du monstre', m.MonsterLevel AS 'Niveau du monstre'
FROM Monsters m
ORDER BY MonsterLevel DESC

-- 3 Les monstres qui drop des items rare, et qui sont natif au zone 'camp' qui font partie des biomes 'land'

SELECT m.MonsterName AS 'Nom du monstre', i.ItemName AS "Nom de l'item que le monstre drop", 
REPLACE(i.RaritityId, i.RaritityId, r.RaritityName) AS 'Rareté', 
CONCAT('Zone : ', z.ZoneName, ' | Biome : ', b.BiomeName) AS 'Zone et biome' 
FROM Monsters m
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
ORDER BY m.MonsterName ASC

-- 4 tous les item avec ' de ' dans leur nom, leur numéro d'item et leur rareté

SELECT i.ItemName AS "Nom de l'item", SUM(i.ItemId)/10 AS "Numéro de l'item", REPLACE(i.RaritityId, i.RaritityId, r.RaritityName) AS 'Rareté'
FROM Items i
LEFT JOIN Rarities r
ON i.RaritityId = r.RaritityId
WHERE UPPER(i.ItemName) LIKE '% DE %'
GROUP BY i.ItemId, i.ItemName, i.RaritityId, r.RaritityName
ORDER BY "Rareté" DESC

-- 5 amélioration des stat de 3% des monstre de niveau supérieur à 100 (des boss ou mosntre élite)

DECLARE @BUFF FLOAT;
SET @BUFF = 1.03;

SELECT m.MonsterName AS 'Nom du monstre', m.MonsterHealth AS 'Vie avant buff', CONVERT(INT, (m.MonsterHealth*@BUFF)) AS 'Vie Après Buff', 
m.MonsterArmor AS 'Armure avant buff', CONVERT(INT, (m.MonsterArmor*@BUFF)) AS 'Armure Après Buff', 
m.MonsterDamage AS 'Dégâts avant buff',CONVERT(INT, (m.MonsterDamage*@BUFF)) AS 'Dégâts Après Buff'
FROM Monsters m
WHERE m.MonsterLevel > 100
GROUP BY m.MonsterName, m.MonsterHealth, m.MonsterArmor, m.MonsterDamage
ORDER BY m.MonsterHealth, m.MonsterArmor, m.MonsterDamage  DESC