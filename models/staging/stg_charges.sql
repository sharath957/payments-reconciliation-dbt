WITH raw_charges AS (
    SELECT * FROM {{ source('payments_recon', 'charges') }}
)
    SELECT
        rc.charge_id,
        rc.invoice_id,
        rc.charged_at,
        rc.amount_cad as amount,
        rc.card_brand,
        rc.status,
        rc.processor_fee_cad as processor_fee
    FROM
        raw_charges rc
