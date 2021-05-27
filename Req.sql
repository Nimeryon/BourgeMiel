GO
	USE BourgeMiel
GO

/*SELECT p.PlayerLevel, p.PlayerName,  p.PlayerHealth, (p.PlayerHealth - dbo.DamageCalc(p.PlayerArmor, m.MonsterDamage)) AS 'Vie restante au joueur', (m.MonsterHealth - dbo.DamageCalc(m.MonsterArmor, p.PlayerDamage)) AS 'Vie restante au monstre'
FROM "Players" p 
INNER JOIN "Equipments" e ON p.PlayerId = e.PlayerId 
INNER JOIN Items i ON e.ItemId = i.ItemId 
INNER JOIN "Drops" d ON i.ItemId = d.ItemId	
INNER JOIN "Monsters" m	ON d.MonsterId = m.MonsterId
ORDER BY p.PlayerLevel DESC*/

SELECT * FROM Players WHERE PlayerId = 45

UPDATE Players SET
PlayerLevel = PlayerLevel + 1
WHERE PlayerId = 45 AND PlayerLevel != 100
