-- On check si la database existe

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'BourgeMiel')
  BEGIN
    CREATE DATABASE BourgeMiel
    END
    
GO
	USE BourgeMiel
GO

BEGIN TRAN

-- On check si les tables existes déjà

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Rarities' and xtype='U')
BEGIN
    CREATE TABLE "Rarities"
	(RaritityId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	RaritityName VARCHAR(50) NOT NULL,)
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Biomes' and xtype='U')
BEGIN
    CREATE TABLE "Biomes"
	(BiomeId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	BiomeName VARCHAR(50) NOT NULL,)
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Zones' and xtype='U')
BEGIN
    CREATE TABLE Zones
	(ZoneId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	ZoneName VARCHAR(50) NOT NULL,
	ZoneLevel INT NOT NULL,
	ZoneSize FLOAT NOT NULL,
	BiomeId INT NOT NULL,
	FOREIGN KEY(BiomeId) REFERENCES "Biomes"(BiomeId),)
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Monsters' and xtype='U')
BEGIN
    CREATE TABLE "Monsters"
	(MonsterId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	MonsterName VARCHAR(50) NOT NULL,
	MonsterLevel INT NOT NULL,
	MonsterZoneId INT NOT NULL,
	BiomeId INT NULL,
	FOREIGN KEY(BiomeId) REFERENCES "Biomes"(BiomeId),
	MonsterDrop INT NOT NULL,
	MonsterHealth FLOAT NOT NULL,
	MonsterDamage FLOAT NOT NULL,
	MonsterArmor FLOAT NULL)
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Players' and xtype='U')
BEGIN
    CREATE TABLE "Players"
	(PlayerId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	PlayerName VARCHAR(50) NOT NULL,
	PlayerLevel INT NOT NULL,
	PlayerHealth FLOAT NOT NULL,
	PlayerDamage FLOAT NOT NULL,
	PlayerArmor FLOAT NULL)
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Items' and xtype='U')
BEGIN
	CREATE TABLE "Items"
	(ItemId INT NOT NULL IDENTITY(1,10) PRIMARY KEY,
	ItemName VARCHAR(50) NOT NULL,
	ItemLevel INT NULL,
	RaritityId INT NOT NULL,
	FOREIGN KEY(RaritityId) REFERENCES "Rarities"(RaritityId),
	ItemHealthStat FLOAT NOT NULL,
	ItemDamageStat FLOAT NOT NULL,
	ItemArmorStat FLOAT NULL)
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Drop' and xtype='U')
BEGIN
	CREATE TABLE "Drop"
	(DropId INT NOT NULL IDENTITY(1,10) PRIMARY KEY,
	ItemId INT NULL,
	FOREIGN KEY(ItemId) REFERENCES "Items"(ItemId),
	MonsterId INT NOT NULL,
	FOREIGN KEY(MonsterId) REFERENCES "Monsters"(MonsterId))
END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Equipments' and xtype='U')
BEGIN
	CREATE TABLE "Equipments"
	(EquipmentId INT NOT NULL IDENTITY(10,100) PRIMARY KEY,
	PlayerId INT NOT NULL,
	FOREIGN KEY(PlayerId) REFERENCES "Players"(PlayerId),
	ItemId INT NOT NULL,
	FOREIGN KEY(ItemId) REFERENCES "Items"(ItemId))
END

COMMIT TRAN