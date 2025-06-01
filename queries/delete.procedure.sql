-- Delete Event
CREATE PROCEDURE sp_DeleteEvent
    @EventID INT
AS
BEGIN
    DELETE FROM Events WHERE EventID = @EventID
END;

-- Delete Participant
CREATE PROCEDURE sp_DeleteParticipant
    @ParticipantID INT
AS
BEGIN
    DELETE FROM Participants WHERE ParticipantID = @ParticipantID
END;