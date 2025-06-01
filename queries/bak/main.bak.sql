-- Backup command
BACKUP DATABASE EventManagementSystem
TO DISK = 'C:\Backups\EventManagementSystem.bak'
WITH COMPRESSION, STATS = 10;

-- Restore command
RESTORE DATABASE EventManagementSystem
FROM DISK = 'C:\Backups\EventManagementSystem.bak'
WITH RECOVERY, REPLACE;