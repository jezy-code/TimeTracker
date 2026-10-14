-- Create Companies Table
CREATE TABLE companies (
    company_id INTEGER PRIMARY KEY,
    company_name TEXT UNIQUE
);

-- Create Company Personnel Table
CREATE TABLE company_personnel (
    id INTEGER PRIMARY KEY,
    company_name TEXT,
    status TEXT,
    staff_id TEXT,
    title TEXT,
    staff_name TEXT,
    post TEXT,
    start_date TEXT,
    resigned_date TEXT,
    trained_date TEXT,
    remarks TEXT
);

-- Create Fault Logs Table for Maintenance Form
CREATE TABLE IF NOT EXISTS fault_logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fault_log_id TEXT,
    agency TEXT,
    date TEXT,
    time TEXT,
    taken_by TEXT,
    reported_by_tech TEXT,
    reported_by_clerk TEXT,
    remarks TEXT
);

-- Insert Companies List
INSERT INTO companies (company_name) VALUES 
('ALPHA TRADING'),
('ASSUCESS SDN BHD'),
('AYU CANGGIH SDN BHD'),
('BBSB T1'),
('BBSB T2'),
('BESARMIRA SDN BHD'),
('BESSUMBER SDN BHD'),
('BEST BLOOM SDN BHD'),
('BEST PHEONIX SDN BHD'),
('BESTLINK TRADING'),
('BONUS GAIN SDN BHD'),
('CASH PELANGI SDN BHD'),
('CITY & MIDLAND ENTERPRISE S/B'),
('COURTLEA SDN BHD'),
('DAHLIA HEIGHTS SDN BHD'),
('DOPLUS SDN BHD'),
('EXPRESS DYNASTY SDN BHD'),
('EXPRESS SYNERGY SDN BHD'),
('FAME ACTIVITY SDN BHD'),
('FIRMNESS-MERGE SDN BHD'),
('GOLDEN REALM TRADING'),
('GRAND SLAM TRADING'),
('GREEN PETAL SDN BHD'),
('GREEN ROAD TRADING SDN BHD'),
('H. H. ENTERPRISE'),
('HAPUYA SDN BHD'),
('IMAGE PRIDE SDN BHD'),
('IMAGEZONE SDN BHD'),
('ISPROFIT SDN BHD'),
('KIM & CHENG ENTERPRISE SDN BHD'),
('KIMG & CHENG TRADING (SWAK) S/B'),
('LAWAS VISION SDN BHD'),
('LUCRE STAR TRADING'),
('MARKET STREET TRADING SDN BHD'),
('MBA MARKETING SDN BHD'),
('MEETUP SDN BHD'),
('MELODI ASTANA SDN BHD'),
('MELODI DELIMA SDN BHD'),
('MELODI RAYA SDN BHD'),
('MIN HIN BINTULU'),
('MIRI INDAH SDN BHD');

-- Insert Sample Personnel
INSERT INTO company_personnel (company_name, status, staff_id, title, staff_name, post, start_date, trained_date) VALUES 
('ALPHA TRADING', 'N', '965101', 'MDM', 'NGU LEH CHIOU', 'TC', '19/10/2012', '11/05/2000'),
('ALPHA TRADING', 'N', '965104', 'MDM', 'LING HUNG MING', 'TC', '01/10/2021', '01/10/2021');