-- SQL Server DDL for fictional dental-centre reporting system. All data is synthetic.
CREATE SCHEMA legacy;
GO
CREATE TABLE legacy.Centres (centre_id INT PRIMARY KEY, centre_name NVARCHAR(100), state CHAR(3), brand NVARCHAR(30), active_chairs INT);
CREATE TABLE legacy.Practitioners (practitioner_id INT PRIMARY KEY, centre_id INT REFERENCES legacy.Centres(centre_id), practitioner_code VARCHAR(20), specialty NVARCHAR(50));
CREATE TABLE legacy.ServiceCatalog (service_code VARCHAR(12) PRIMARY KEY, service_name NVARCHAR(80), standard_fee_aud DECIMAL(12,2));
CREATE TABLE legacy.Appointments (appointment_id INT PRIMARY KEY, centre_id INT REFERENCES legacy.Centres(centre_id), practitioner_id INT REFERENCES legacy.Practitioners(practitioner_id), appointment_date DATE, service_code VARCHAR(12) REFERENCES legacy.ServiceCatalog(service_code), status VARCHAR(20));
CREATE TABLE legacy.Invoices (invoice_id INT PRIMARY KEY, appointment_id INT UNIQUE REFERENCES legacy.Appointments(appointment_id), invoice_date DATE, gross_patient_fee_aud DECIMAL(12,2), facility_service_fee_aud DECIMAL(12,2), invoice_status VARCHAR(20));
CREATE TABLE legacy.Payments (payment_id INT PRIMARY KEY, invoice_id INT REFERENCES legacy.Invoices(invoice_id), payment_date DATE, amount_paid_aud DECIMAL(12,2), payment_method VARCHAR(30));
CREATE TABLE legacy.MonthlyTargets (centre_id INT REFERENCES legacy.Centres(centre_id), reporting_month CHAR(7), appointment_target INT, facility_fee_target_aud DECIMAL(12,2), PRIMARY KEY(centre_id,reporting_month));
CREATE TABLE legacy.MonthlyFinancialReport (centre_id INT, reporting_month CHAR(7), completed_appointments INT, facility_service_fee_aud DECIMAL(12,2), PRIMARY KEY(centre_id,reporting_month));
