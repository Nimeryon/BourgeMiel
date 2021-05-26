GO
	USE BourgeMiel
GO

/*CREATE OR ALTER PROCEDURE Fight(@player INT, @monster INT)
AS
    BEGIN
        p.PlayerHealth + p.PlayerArmor AS 'PlayerLife', p.PlayerDamage, m.MonsterHealth + m.MonsterArmor AS 'MonsterLife', m.MonsterDamage 
		FROM "Players" p INNER JOIN "Equipments" e ON p.PlayerId = e.PlayerId INNER JOIN Items i ON e.ItemId = i.ItemId INNER JOIN "Drop" d ON i.ItemId = d.ItemId	INNER JOIN "Monsters" m	ON d.MonsterId = m.MonsterId
		WHERE p.PlayerId = @player, m.MonsterId = @monster
        Group by ShippedDate, o.OrderID, o.OrderDate
    END

EXEC Fight @player = , @monster =*/