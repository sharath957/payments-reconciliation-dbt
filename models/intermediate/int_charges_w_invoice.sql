WITH charges AS (
    SELECT * FROM {{ ref('stg_charges') }}
),
invoices AS (
    SELECT * FROM {{ ref('stg_invoices') }}
)

--final as (
    SELECT
        c.charge_id,
        c.invoice_id as charge_invoice_id,
        i.invoice_id as invoice_id,
        c.amount as charge_amount,
        c.card_brand,
        c.status as charge_status,
        c.processor_fee,
        i.clinic_id,
        i.patient_id,
        i.issued_at as invoice_issued_at,
        i.service as invoice_service,
        i.amount as invoice_amount,
        i.status as invoice_status,
        case when c.status = 'succeeded' and i.status = 'paid' then 'Success' else 'not_success' end as is_reconciled
    FROM
        charges c
LEFT JOIN
        invoices i
    ON
        c.invoice_id = i.invoice_id