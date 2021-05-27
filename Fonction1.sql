GO
	USE BourgeMiel
GO

CREATE OR ALTER FUNCTION FightWinner (@pvP INT, @arP INT, @dmgP INT, @pvM INT, @arM INT, @dmgM INT)
RETURNS INT AS
BEGIN
    RETURN ((@arP - @dmgM) - @pvP) - ((@arM - @dmgP) - @pvM);
END;