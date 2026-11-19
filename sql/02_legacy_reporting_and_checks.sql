-- Legacy reporting definition: only Completed appointments; facility fee is NOT gross patient fee.
WITH NewReport AS (
 SELECT a.centre_id, CONVERT(char(7),a.appointment_date,120) AS reporting_month,
 COUNT_BIG(*) AS completed_appointments,
 SUM(i.facility_service_fee_aud) AS facility_service_fee_aud
 FROM legacy.Appointments a JOIN legacy.Invoices i ON i.appointment_id=a.appointment_id
 WHERE a.status='Completed'
 GROUP BY a.centre_id, CONVERT(char(7),a.appointment_date,120)
)
SELECT COALESCE(l.centre_id,n.centre_id) AS centre_id,
 COALESCE(l.reporting_month,n.reporting_month) AS reporting_month,
 l.completed_appointments AS legacy_count,n.completed_appointments AS recomputed_count,
 l.facility_service_fee_aud AS legacy_fee,n.facility_service_fee_aud AS recomputed_fee,
 CASE WHEN l.centre_id IS NULL OR n.centre_id IS NULL
 OR l.completed_appointments<>n.completed_appointments
 OR ABS(l.facility_service_fee_aud-n.facility_service_fee_aud)>0.01 THEN 'FAIL' ELSE 'PASS' END AS validation_result
FROM legacy.MonthlyFinancialReport l FULL OUTER JOIN NewReport n
 ON l.centre_id=n.centre_id AND l.reporting_month=n.reporting_month;

-- Data quality checks before migration
SELECT appointment_id,COUNT(*) AS duplicate_count FROM legacy.Appointments GROUP BY appointment_id HAVING COUNT(*)>1;
SELECT COUNT(*) AS orphan_invoices FROM legacy.Invoices i LEFT JOIN legacy.Appointments a ON a.appointment_id=i.appointment_id WHERE a.appointment_id IS NULL;
SELECT COUNT(*) AS invalid_fees FROM legacy.Invoices WHERE facility_service_fee_aud<0 OR gross_patient_fee_aud<facility_service_fee_aud;
