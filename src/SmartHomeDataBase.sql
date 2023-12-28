
-- User Table
CREATE TABLE User (
    UserID INT(10) NOT NULL AUTO_INCREMENT,
    Mail VARCHAR(50) NOT NULL,
    Name VARCHAR(50),
    Surname VARCHAR(50),
    Password VARCHAR(50),
    Phone VARCHAR(10),
    NumberOfRooms INT(10),
    Active TINYINT(1),
    PRIMARY KEY (UserID)
);

-- Room Table
CREATE TABLE Room (
    RoomID INT(10) NOT NULL AUTO_INCREMENT,
    UserID INT(10),
    RoomName VARCHAR(50),
    OptimumTemperature FLOAT(10),
    OptimumHumidity FLOAT(10),
    OptimumGase FLOAT(10),
    RoomType VARCHAR(50),
    PRIMARY KEY (RoomID),
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

-- Pot Table
CREATE TABLE Pot (
    RoomID INT(10),
    PotID INT(10) NOT NULL AUTO_INCREMENT,
    PlantType VARCHAR(50),
    Time TIMESTAMP,
    PRIMARY KEY (PotID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);

-- Temp_Hum Table
CREATE TABLE Temp_Hum (
    RoomID INT(10),
    Temperature FLOAT(10),
    Humidity FLOAT(10),
    Time TIMESTAMP,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);

-- Gas Table
CREATE TABLE Gas (
    RoomID INT(10),
    Gas FLOAT(10),
    Time TIMESTAMP,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);

-- Fire Table
CREATE TABLE Fire (
    RoomID INT(10),
    Fire TINYINT(1),
    Time TIMESTAMP,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);

-- Move Table
CREATE TABLE Move (
    RoomID INT(10),
    Move INT(1),
    Time TIMESTAMP,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);

-- Pot_Humidity Table
CREATE TABLE Pot_Humidity (
    PotID INT(10),
    Humidity FLOAT(10),
    Time TIMESTAMP,
    RoomID INT(10),
    FOREIGN KEY (PotID) REFERENCES Pot(PotID) ON DELETE CASCADE,
	FOREIGN KEY (RoomID) REFERENCES Room(RoomID) ON DELETE CASCADE
);



-- Average Temperature and Humidity per Hour Table
CREATE TABLE AVG_Temp_Hum_Hr (
    RoomID INT(10),
    AvgTemperature FLOAT(10),
    AvgHumidity FLOAT(10),
    Time TIMESTAMP,
    PRIMARY KEY (RoomID, Time),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Average Gas per Hour Table
CREATE TABLE AVG_Gas_Hr (
    RoomID INT(10),
    AvgGas FLOAT(10),
    Time TIMESTAMP,
    PRIMARY KEY (RoomID, Time),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Average Pot Humidity per Hour Table
CREATE TABLE AVG_Pot_Humidity_Hr (
    PotID INT(10),
    AvgHumidity FLOAT(10),
    Time TIMESTAMP,
    PRIMARY KEY (PotID, Time),
    FOREIGN KEY (PotID) REFERENCES Pot(PotID)
);

-- Average Temperature and Humidity per Day Table
CREATE TABLE AVG_Temp_Hum_Day (
    RoomID INT(10),
    AvgTemperature FLOAT(10),
    AvgHumidity FLOAT(10),
    Date DATE,
    PRIMARY KEY (RoomID, Date),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Average Gas per Day Table
CREATE TABLE AVG_Gas_Day (
    RoomID INT(10),
    AvgGas FLOAT(10),
    Date DATE,
    PRIMARY KEY (RoomID, Date),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- Average Pot Humidity per Day Table
CREATE TABLE AVG_Pot_Humidity_Day (
    PotID INT(10),
    AvgHumidity FLOAT(10),
    Date DATE,
    PRIMARY KEY (PotID, Date),
    FOREIGN KEY (PotID) REFERENCES Pot(PotID)
);



