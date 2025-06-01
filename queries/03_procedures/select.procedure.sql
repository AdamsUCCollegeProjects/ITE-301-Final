-- Get Event Details
CREATE PROCEDURE sp_GetEventDetails
    @EventID INT
AS
BEGIN
    SELECT e.EventID, e.EventName, e.Description, e.EventType, e.Organizer,
           s.StartDateTime, s.EndDateTime, v.VenueName
    FROM Events e
    LEFT JOIN Schedules s ON e.EventID = s.EventID
    LEFT JOIN Venues v ON s.VenueID = v.VenueID
    WHERE e.EventID = @EventID
END;

-- Get Participants for Event
CREATE PROCEDURE sp_GetEventParticipants
    @EventID INT
AS
BEGIN
    SELECT p.ParticipantID, p.FirstName, p.LastName, p.Email, p.Phone
    FROM Participants p
    JOIN EventParticipants ep ON p.ParticipantID = ep.ParticipantID
    WHERE ep.EventID = @EventID
END;