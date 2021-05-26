GO
	USE BourgeMiel
GO

SELECT dbo.FightWinner(p.PlayerHealth, p.PlayerArmor, p.PlayerDamage, m.MonsterHealth, m.MonsterArmor, m.MonsterDamage) AS 'Winner' FROM "Players" p
INNER JOIN "Equipments" e
ON(p.PlayerId = e.PlayerId)
INNER JOIN Items i
ON (e.ItemId = i.ItemId)
INNER JOIN "Drop" d
ON (i.ItemId = d.ItemId)
INNER JOIN "Monsters" m
ON (d.MonsterId = m.MonsterId)