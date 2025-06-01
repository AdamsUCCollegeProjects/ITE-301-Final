-- Update Event
CREATE PROCEDURE sp_UpdateEvent
    @EventID INT,
    @EventName VARCHAR(100),
    @Description VARCHAR(500),
    @EventType VARCHAR(50),
    @Organizer VARCHAR(100)
AS
BEGIN
    UPDATE Events
    SET EventName = @EventName,
        Description = @Description,
        EventType = @EventType,
        Organizer = @Organizer
    WHERE EventID = @EventID
END;

-- Update Participant
CREATE PROCEDURE sp_UpdateParticipant
    @ParticipantID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(100),
    @Phone VARCHAR(20)
AS
BEGIN
    UPDATE Participants
    SET FirstName = @FirstName,
        LastName = @LastName,
        Email = @Email,
        Phone = @Phone
    WHERE ParticipantID = @ParticipantID
END;