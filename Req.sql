GO
	USE BourgeMiel
GO

SELECT p.PlayerId, p.PlayerArmor, m.MonsterDamage, dbo.DamageCalc(p.PlayerArmor, m.MonsterDamage) AS 'True Damage'
FROM "Players" p 
INNER JOIN "Equipments" e ON p.PlayerId = e.PlayerId 
INNER JOIN Items i ON e.ItemId = i.ItemId 
INNER JOIN "Drops" d ON i.ItemId = d.ItemId	
INNER JOIN "Monsters" m	ON d.MonsterId = m.MonsterId
WHERE p.PlayerId = 1
ORDER BY p.PlayerId ASC


SELECT p.PlayerArmor, m.MonsterArmor, m.MonsterName
FROM "Players" p 
INNER JOIN "Equipments" e ON p.PlayerId = e.PlayerId 
INNER JOIN Items i ON e.ItemId = i.ItemId 
INNER JOIN "Drops" d ON i.ItemId = d.ItemId	
INNER JOIN "Monsters" m	ON d.MonsterId = m.MonsterId
ORDER BY m.MonsterArmor DESC