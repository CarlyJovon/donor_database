-- Create donors table
CREATE TABLE donors (
    donor_id SERIAL PRIMARY KEY,
    donor_type VARCHAR(20) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    organization_name VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address_line1 VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(20),
    postal_code VARCHAR(20),
    preferred_contact_method VARCHAR(20),
    donor_notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create programs table
CREATE TABLE programs (
    program_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(10, 2),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create donations table
CREATE TABLE donations (
    donation_id SERIAL PRIMARY KEY,
    donor_id INTEGER REFERENCES donors(donor_id),
    program_id INTEGER REFERENCES programs(program_id),
    amount DECIMAL(10, 2) NOT NULL,
    donation_date DATE NOT NULL,
    payment_method VARCHAR(50),
    is_recurring BOOLEAN DEFAULT FALSE,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Donors
INSERT INTO donors (donor_type, first_name, last_name, email, phone, address_line1, city, state, postal_code, preferred_contact_method)
VALUES
('Individual', 'John', 'Doe', 'johndoe@example.com', '123-456-7890', '123 Main St', 'Springfield', 'IL', '62701', 'Email'),
('Individual', 'Jane', 'Smith', 'janesmith@example.com', '234-567-8901', '456 Oak St', 'Decatur', 'IL', '62521', 'Phone'),
('Organization', NULL, NULL, 'contact@techsolutions.com', '345-678-9012', '789 Pine St', 'Champaign', 'IL', '61820', 'Email'),
('Individual', 'Michael', 'Johnson', 'michaelj@example.com', '456-789-0123', '321 Elm St', 'Peoria', 'IL', '61602', 'Phone'),
('Individual', 'Sarah', 'Williams', 'sarahwilliams@example.com', '567-890-1234', '654 Maple St', 'Bloomington', 'IL', '61701', 'Email'),
('Organization', NULL, NULL, 'support@greenearth.org', '678-901-2345', '987 Birch St', 'Normal', 'IL', '61761', 'Email'),
('Individual', 'David', 'Brown', 'davidbrown@example.com', '789-012-3456', '111 Cedar St', 'Urbana', 'IL', '61801', 'Phone'),
('Individual', 'Emily', 'Davis', 'emilydavis@example.com', '890-123-4567', '222 Pine St', 'Champaign', 'IL', '61820', 'Email'),
('Organization', NULL, NULL, 'info@newhorizons.org', '901-234-5678', '333 Maple St', 'Decatur', 'IL', '62521', 'Phone'),
('Individual', 'Robert', 'Martinez', 'robertm@example.com', '012-345-6789', '444 Oak St', 'Springfield', 'IL', '62701', 'Email');

-- Insert Programs
INSERT INTO programs (name, description, start_date, end_date, budget, status)
VALUES
('Youth Development', 'Program to help at-risk youth develop life skills and leadership abilities.', '2025-06-01', '2026-06-01', 50000.00, 'Active'),
('Homeless Shelter', 'Provide temporary housing and food for homeless individuals and families.', '2025-05-15', '2026-05-15', 75000.00, 'Active'),
('Environmental Cleanup', 'A community initiative to clean local parks and waterways.', '2025-04-01', '2025-10-01', 25000.00, 'Pending'),
('Health and Wellness', 'Provide free health screenings and wellness programs in low-income neighborhoods.', '2025-07-01', '2026-01-01', 60000.00, 'Active'),
('Job Training', 'Program to provide job skills training and placement assistance for unemployed adults.', '2025-05-01', '2026-05-01', 40000.00, 'Active');

-- Insert Donations
INSERT INTO donations (donor_id, program_id, amount, donation_date, payment_method, is_recurring)
VALUES
(1, 1, 500.00, '2025-03-15', 'Credit Card', FALSE),
(2, 2, 1000.00, '2025-03-16', 'Check', TRUE),
(3, 3, 1500.00, '2025-03-17', 'Bank Transfer', FALSE),
(4, 1, 300.00, '2025-03-18', 'Credit Card', TRUE),
(5, 4, 750.00, '2025-03-19', 'Cash', FALSE),
(6, 2, 1200.00, '2025-03-20', 'Check', FALSE),
(7, 5, 2000.00, '2025-03-21', 'Credit Card', TRUE),
(8, 4, 650.00, '2025-03-22', 'Bank Transfer', FALSE),
(9, 1, 450.00, '2025-03-23', 'Credit Card', FALSE),
(10, 3, 350.00, '2025-03-24', 'Check', FALSE),
(1, 2, 600.00, '2025-03-25', 'Credit Card', TRUE),
(2, 5, 800.00, '2025-03-26', 'Bank Transfer', FALSE),
(3, 4, 950.00, '2025-03-27', 'Cash', TRUE),
(4, 5, 500.00, '2025-03-28', 'Check', FALSE),
(5, 2, 300.00, '2025-03-29', 'Credit Card', TRUE);
