-- Upcoming Events
SELECT e.EventName, v.VenueName, s.StartDateTime
FROM Events e
JOIN Schedules s ON e.EventID = s.EventID
JOIN Venues v ON s.VenueID = v.VenueID
WHERE s.StartDateTime > GETDATE()
ORDER BY s.StartDateTime;

-- Participant Count per Event
SELECT e.EventName, COUNT(ep.ParticipantID) AS ParticipantCount
FROM Events e
LEFT JOIN EventParticipants ep ON e.EventID = ep.EventID
GROUP BY e.EventName
ORDER BY ParticipantCount DESC;

-- Event Expenses Summary
SELECT e.EventName, SUM(ex.Amount) AS TotalExpenses
FROM Events e
LEFT JOIN Expenses ex ON e.EventID = ex.EventID
GROUP BY e.EventName
ORDER BY TotalExpenses DESC;