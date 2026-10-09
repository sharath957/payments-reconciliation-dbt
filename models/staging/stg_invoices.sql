WITH raw_invoices as (
    SELECT
        *
    FROM {{ source('payments_recon', 'invoices') }} 
)
SELECT
    ri.invoice_id,
    ri.clinic_id,
    ri.patient_id,
    ri.issued_at,
    ri.service,
    ri.amount_cad as amount,
    ri.status
FROM
    raw_invoices ri