-- Insert Event
CREATE PROCEDURE sp_InsertEvent
    @EventName VARCHAR(100),
    @Description VARCHAR(500),
    @EventType VARCHAR(50),
    @Organizer VARCHAR(100)
AS
BEGIN
    INSERT INTO Events (EventName, Description, EventType, Organizer)
    VALUES (@EventName, @Description, @EventType, @Organizer)
    RETURN SCOPE_IDENTITY()
END;

-- Insert Participant
CREATE PROCEDURE sp_InsertParticipant
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Phone VARCHAR(20)
AS
BEGIN
    INSERT INTO Participants (FirstName, LastName, Email, Phone)
    VALUES (@FirstName, @LastName, @Email, @Phone)
    RETURN SCOPE_IDENTITY()
END;