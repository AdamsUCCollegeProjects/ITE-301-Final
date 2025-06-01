-- Create roles
CREATE ROLE EventAdmin;
CREATE ROLE EventStaff;
CREATE ROLE EventViewer;

-- Create users
CREATE USER admin_user WITH PASSWORD = 'Admin@123';
CREATE USER staff_user WITH PASSWORD = 'Staff@123';
CREATE USER viewer_user WITH PASSWORD = 'Viewer@123';

-- Assign permissions to roles
-- EventAdmin gets full access
GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::dbo TO EventAdmin;

-- EventStaff gets limited access
GRANT SELECT, INSERT, UPDATE ON Participants TO EventStaff;
GRANT SELECT ON Events TO EventStaff;

-- EventViewer gets read-only access
GRANT SELECT ON SCHEMA::dbo TO EventViewer;

-- Assign users to roles
ALTER ROLE EventAdmin ADD MEMBER admin_user;
ALTER ROLE EventStaff ADD MEMBER staff_user;
ALTER ROLE EventViewer ADD MEMBER viewer_user;