GO
	USE BourgeMiel
GO

CREATE OR ALTER FUNCTION FightWinner (@pvP FLOAT, @arP FLOAT, @dmgP FLOAT, @pvM FLOAT, @arM FLOAT, @dmgM FLOAT)
RETURNS FLOAT AS
BEGIN
    RETURN ((@arP - @dmgM) - @pvP) - ((@arM - @dmgP) - @pvM);
END;