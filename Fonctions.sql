USE BourgeMiel

SELECT (p.PlayerHealth + p.PlayerArmor) AS 'Player Life', p.PlayerDamage, (m.MonsterHealth + m.MonsterArmor) AS 'Monster Life', m.MonsterDamage FROM "Players" p
INNER JOIN "Equipments" e
ON(p.PlayerId = e.PlayerId)
INNER JOIN Items i
ON (e.ItemId = i.ItemId)
INNER JOIN "Drop" d
ON (i.ItemId = d.ItemId)
INNER JOIN "Monsters" m
ON (d.MonsterId = m.MonsterId)