-- Venues table
CREATE TABLE Venues (
    VenueID INT PRIMARY KEY IDENTITY(1,1),
    VenueName VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    Capacity INT,
    CostPerDay DECIMAL(10,2)
);

-- Events table
CREATE TABLE Events (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    EventType VARCHAR(50),
    Organizer VARCHAR(100)
);

-- Schedules table
CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    VenueID INT FOREIGN KEY REFERENCES Venues(VenueID),
    StartDateTime DATETIME NOT NULL,
    EndDateTime DATETIME NOT NULL,
    Status VARCHAR(20) DEFAULT 'Planned'
);

-- Participants table
CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    RegistrationDate DATE DEFAULT GETDATE()
);

-- EventParticipants (junction table)
CREATE TABLE EventParticipants (
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    ParticipantID INT FOREIGN KEY REFERENCES Participants(ParticipantID),
    RegistrationDate DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (EventID, ParticipantID)
);

-- Resources table
CREATE TABLE Resources (
    ResourceID INT PRIMARY KEY IDENTITY(1,1),
    ResourceName VARCHAR(100) NOT NULL,
    Description VARCHAR(200),
    QuantityAvailable INT DEFAULT 0
);

-- EventResources (junction table)
CREATE TABLE EventResources (
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    ResourceID INT FOREIGN KEY REFERENCES Resources(ResourceID),
    QuantityRequired INT NOT NULL,
    PRIMARY KEY (EventID, ResourceID)
);

-- Expenses table
CREATE TABLE Expenses (
    ExpenseID INT PRIMARY KEY IDENTITY(1,1),
    EventID INT FOREIGN KEY REFERENCES Events(EventID),
    Description VARCHAR(200) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    ExpenseDate DATE DEFAULT GETDATE(),
    Category VARCHAR(50)
);